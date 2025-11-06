<template>
  <div class="app-container">
    <el-card class="box-card">
      <template #header>
        <div class="clearfix">
          <span class="el-icon-document">发起任务</span>
          <el-button style="float: right" type="danger" @click="goBack">关闭</el-button>
        </div>
      </template>

      <el-tabs tab-position="top" v-model="activeName" @tab-click="handleClick">
        <!-- 表单信息 -->
        <el-tab-pane label="表单信息" name="1">
          <!-- 当有formContent时显示v-form-render -->
          <el-col v-if="hasFormContent" :span="16" :offset="4">
            <v-form-render :form-data="formRenderData" ref="vFormRef" />
            <div style="margin-left:15%;margin-bottom: 20px;font-size: 14px;">
              <el-button type="primary" @click="submitForm">提 交</el-button>
              <el-button @click="resetForm">重 置</el-button>
              <el-button @click="goBack">返 回</el-button>
            </div>
          </el-col>
          <!-- 当没有formContent时使用iframe显示表单 -->
           <el-col v-else :span="16" :offset="4">
             <iframe 
               ref="formIframe"
               v-if="formRouter" 
               :src="formRouter" 
               width="100%" 
               :height="iframeHeight" 
               frameborder="0"
               style="border: 1px solid #ddd; border-radius: 4px; overflow: hidden;"
               @load="adjustIframeHeight">
             </iframe>
             <div style="margin-left:15%;margin-bottom: 20px;font-size: 14px;">
               <el-button type="primary" @click="submitForm">提 交</el-button>
               <el-button @click="resetForm">重 置</el-button>
               <el-button @click="goBack">返 回</el-button>
             </div>
           </el-col>
        </el-tab-pane>

        <!-- 流程图 -->
        <el-tab-pane label="流程图" name="2">
          <bpmn-viewer :flowData="flowData" />
        </el-tab-pane>
      </el-tabs>

      <!-- 选择流程接收人 -->
      <el-dialog :title="taskTitle" v-model="taskOpen" width="65%" append-to-body>
        <flow-user v-if="checkSendUser" :checkType="checkType" @handleUserSelect="handleUserSelect" />
        <flow-role v-if="checkSendRole" @handleRoleSelect="handleRoleSelect" />
        <template #footer>
          <div class="dialog-footer">
            <el-button @click="taskOpen = false">取 消</el-button>
            <el-button type="primary" @click="submitTask">提 交</el-button>
          </div>
        </template>
      </el-dialog>
    </el-card>
  </div>
</template>

<script setup name="FlowStart">
import {getCurrentInstance, onMounted, ref} from 'vue'

import {definitionStart, flowXmlAndNode} from "@/api/flowable/definition";
import BpmnViewer from '@/components/Process/viewer';
import {flowFormData} from "@/api/flowable/process";
import {getNextFlowNodeByStart} from "@/api/flowable/todo";
import FlowUser from '@/components/flow/User'
import FlowRole from '@/components/flow/Role'
import {checkUserCanStartProcess} from "@/api/flowable/initiatorConfig";
import {ElMessage} from 'element-plus'

const { proxy } = getCurrentInstance()

// 响应式数据
const activeName = ref('1') // 切换tab标签
const loading = ref(true)
const deployId = ref('')
const procDefId = ref('')
const formRenderData = ref({})
const variables = ref([])
const taskTitle = ref(null)
const taskOpen = ref(false)
const checkSendUser = ref(false) // 是否展示人员选择模块
const checkSendRole = ref(false) // 是否展示角色选择模块
const checkType = ref('')
const checkValues = ref(null) // 选中任务接收人员数据
const formData = ref({}) // 填写的表单数据
const multiInstanceVars = ref('') // 会签节点
const formJson = ref({}) // 表单json
const flowData = ref({})
const hasFormContent = ref(true) // 是否有表单内容
const formRouter = ref('') // 表单路由
const formRouterData = ref({}) // 从iframe表单接收的数据
const iframeHeight = ref('400px') // iframe动态高度
const formIframe = ref(null) // iframe引用

/** 初始化获取参数 */
onMounted(() => {
  deployId.value = proxy.$route.query?.deployId
  procDefId.value = proxy.$route.query?.procDefId
  
  // 检查用户是否有权限发起该流程
  checkUserCanStartProcess(procDefId.value).then(res => {
    if (res.data) {
      getFlowFormData(deployId.value)
    } else {
      ElMessage.error('您没有权限发起此流程')
      // 返回上一页
      proxy.$router.go(-1)
    }
  }).catch(() => {
    ElMessage.error('权限检查失败，请稍后重试')
    // 返回上一页
    proxy.$router.go(-1)
  })
  
  // 监听iframe发送的消息
  window.addEventListener('message', handleIframeMessage)
})

/**
 * 处理iframe发送的消息
 */
function handleIframeMessage(event) {
  // 验证消息来源（可根据实际需求调整）
  if (event.data && event.data.type === 'FORM_SUBMIT') {
    // 接收iframe表单提交数据
    formRouterData.value = event.data.data
    console.log('接收到iframe表单提交数据:', formRouterData.value)
    proxy.$modal.msgSuccess('表单数据已接收')
  }
  
  // 处理表单数据变化（实时保存）
  if (event.data && event.data.type === 'formData') {
    formRouterData.value = event.data.data
    console.log('表单数据已更新:', formRouterData.value)
  }
}

/** 流程表单数据 */
function getFlowFormData(deployId) {
  const params = { deployId }
  flowFormData(params).then(res => {

    // 判断是否有formContent内容
    if (res.data && res.data.formContent && res.data.formContent.trim() !== '') {
      // 有formContent，使用v-form-render渲染
      hasFormContent.value = true
      proxy.$nextTick(() => {
        proxy.$refs.vFormRef.setFormJson(res.data.formContent)
        formJson.value = res.data
      })
    } else if (res.data && res.data.formRouter && res.data.formRouter.trim() !== '') {
      // 没有formContent但有formRouter，在当前页面使用iframe显示
      hasFormContent.value = false
      // 构建带taskId的路由地址
      formRouter.value = `${res.data.formRouter}`
    } else {
      // 既没有formContent也没有formRouter
      proxy.$modal.msgError('该流程暂无可用的表单配置')
      goBack()
    }
  }).catch(res => {
    goBack()
  })
}

/**
 * 生成或获取taskId
 */
function generateTaskId() {
  // 这里可以根据实际需求生成taskId，比如使用时间戳+随机数
  return Date.now() + '_' + Math.random().toString(36).substr(2, 9)
}

/**
 * 根据表单类型构建参数
 * @param {Object} formDataRes 表单数据
 * @returns {Object} 构建后的参数对象
 */
function buildFormParams(formDataRes) {
  const param = {}
  
  if (hasFormContent.value) {
    // 流程表单：包含formJson参数
    param.formJson = formJson.value
    Object.assign(param, formDataRes)
    console.log('构建流程表单参数:', param)
  } else {
    // 业务表单：直接使用表单数据，不包含formJson
    formDataRes.value.deployId = deployId.value;
    Object.assign(param, formDataRes.value)
    console.log('构建业务表单参数:', param)
  }
  
  return param
}

/** 返回页面 */
function goBack() {
  const obj = { path: "/task/process", query: { t: Date.now() } }
  proxy.$tab.closeOpenPage(obj)
}

/** Tab切换时加载流程图 */
function handleClick(tab /* , event */) {
  if (tab.paneName === '2') {
    flowXmlAndNode({ deployId: deployId.value }).then(res => {
      flowData.value = res.data
    })
  }
}

/** 申请流程表单数据提交 */
function submitForm() {
  // 判断是使用v-form-render还是iframe表单
  if (hasFormContent.value) {
    // 使用v-form-render表单
    proxy.$refs.vFormRef.getFormData().then(formDataRes => {
      processFormSubmission(formDataRes)
    })
  } else {
    // 使用iframe表单数据
    if (!formRouterData.value || Object.keys(formRouterData.value).length === 0) {
      proxy.$modal.msgError('请先在表单中填写并提交数据')
      return
    }
    processFormSubmission(formRouterData)
  }
}

/**
 * 处理表单提交逻辑
 */
function processFormSubmission(formDataRes) {
  // 获取下一步节点
  getNextFlowNodeByStart({ deploymentId: deployId.value, variables: formDataRes }).then(res => {
    const data = res.data
    if (data) {
      formData.value = formDataRes
      if (data.dataType === 'dynamic') {
        if (data.type === 'assignee') {
          checkSendUser.value = true
          checkType.value = "single"
        } else if (data.type === 'candidateUsers') {
          checkSendUser.value = true
          checkType.value = "multiple"
        } else if (data.type === 'candidateGroups') {
          checkSendRole.value = true
        } else {
          multiInstanceVars.value = data.vars
          checkSendUser.value = true
          checkType.value = "multiple"
        }
        taskOpen.value = true
        taskTitle.value = "选择任务接收"
      } else {
        if (procDefId.value) {
          // 根据表单类型构建不同的参数
          const param = buildFormParams(formDataRes)
          definitionStart(procDefId.value, param).then(res => {
            proxy.$modal.msgSuccess(res.msg)
            goBack()
          })
        }
      }
    }
  }).catch(error => {
    // proxy.$modal.msgError(error)
  })
}

/** 重置表单 */
function resetForm() {
  if (hasFormContent.value) {
    // 重置v-form-render表单
    proxy.$refs.vFormRef.resetForm()
  } else {
    // 重置iframe表单数据
    formRouterData.value = {}
    // 向iframe发送重置消息
    const iframe = document.querySelector('iframe')
    if (iframe && iframe.contentWindow) {
      iframe.contentWindow.postMessage({
        type: 'FORM_RESET'
      }, '*')
    }
    proxy.$modal.msgSuccess('表单已重置')
  }
}

/** 调整iframe高度 */
function adjustIframeHeight() {
  // 延迟执行，确保iframe内容完全加载
  setTimeout(() => {
    try {
      if (formIframe.value && formIframe.value.contentDocument) {
        const iframeDoc = formIframe.value.contentDocument
        const body = iframeDoc.body
        const html = iframeDoc.documentElement
        
        // 获取内容的实际高度
        const height = Math.max(
          body.scrollHeight,
          body.offsetHeight,
          html.clientHeight,
          html.scrollHeight,
          html.offsetHeight
        )
        
        // 设置最小高度为200px，最大高度为600px，添加20px的缓冲
        const finalHeight = Math.max(200, Math.min(height + 20, 600))
        iframeHeight.value = finalHeight + 'px'
        console.log('iframe高度已调整为:', finalHeight + 'px')
      }
    } catch (error) {
      console.log('无法访问iframe内容，可能存在跨域限制')
      // 如果无法访问iframe内容，使用默认高度
      iframeHeight.value = '400px'
    }
  }, 500) // 延迟500ms执行
}

/** 提交流程 */
function submitTask() {
  if (!checkValues.value && checkSendUser.value) {
    proxy.$modal.msgError("请选择任务接收!")
    return
  }
  if (!checkValues.value && checkSendRole.value) {
    proxy.$modal.msgError("请选择流程接收角色组!")
    return
  }

  if (formData.value) {
    // 根据表单类型构建不同的参数
    const param = buildFormParams(formData.value)

    if (multiInstanceVars.value) {
      param[multiInstanceVars.value] = checkValues.value
    } else {
      param["approval"] = checkValues.value
    }

    definitionStart(procDefId.value, param).then(res => {
      proxy.$modal.msgSuccess(res.msg)
      goBack()
    })
  }
}

/** 用户信息选中数据 */
function handleUserSelect(selection) {
  if (selection) {
    if (Array.isArray(selection)) {
      const selectVal = selection.map(item => item.userId)
      if (multiInstanceVars.value) {
        checkValues.value = selectVal
      } else {
        checkValues.value = selectVal.join(',')
      }
    } else {
      checkValues.value = selection.userId
    }
  }
}

/** 角色信息选中数据 */
function handleRoleSelect(selection) {
  if (selection) {
    if (Array.isArray(selection)) {
      const selectVal = selection.map(item => item.roleId)
      checkValues.value = selectVal.join(',')
    } else {
      checkValues.value = selection
    }
  }
}
</script>

<style lang="scss" scoped>
.test-form {
  margin: 15px auto;
  width: 800px;
  padding: 15px;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both;
}

.box-card {
  width: 100%;
  margin-bottom: 20px;
}

.el-tag+.el-tag {
  margin-left: 10px;
}

.my-label {
  background: #E1F3D8;
}
</style>