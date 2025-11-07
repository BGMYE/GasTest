<template>
  <div class="app-container">
    <el-card class="box-card">
      <template #header>
        <div class="clearfix">
          <span class="el-icon-document">已办任务</span>
          <el-button style="float: right;" type="danger" @click="goBack">关闭</el-button>
        </div>
      </template>

      <el-tabs tab-position="top" v-model="activeName" @tab-click="handleClick">
        <!--表单信息-->
        <el-tab-pane label="表单信息" name="1">
          <!-- 流程表单展示 -->
          <el-col :span="16" :offset="4" v-if="!isBusinessForm">
            <v-form-render ref="vFormRef" />
          </el-col>
          <!-- 业务表单展示 -->
          <div v-if="isBusinessForm" style="width: 100%; height: 600px;">
            <iframe 
              ref="businessFormIframe"
              :src="businessFormUrl" 
              style="width: 100%; height: 100%; border: none;"
            ></iframe>
          </div>
        </el-tab-pane>
        <!--流程流转记录-->
        <el-tab-pane label="流转记录" name="2">
          <FlowRecord 
            :proc-ins-id="taskForm.procInsId" 
            :deploy-id="taskForm.deployId"
          />
        </el-tab-pane>
        <el-tab-pane label="流程图" name="3">
          <bpmn-viewer :flowData="flowData" :procInsId="taskForm.procInsId" />
        </el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>

<script setup name="FinishedDetail">
import { ref, reactive, onMounted, getCurrentInstance } from 'vue'
import { useRouter } from 'vue-router'
import BpmnViewer from '@/components/Process/viewer'
import FlowRecord from '@/components/FlowRecord'
import { getProcessVariables, flowXmlAndNode } from "@/api/flowable/definition"

const router = useRouter()
const { proxy } = getCurrentInstance()

// 响应式状态
const activeName = ref('1')
const loading = ref(true)

const flowData = ref({})
const formJson = ref({})
// 是否为业务表单
const isBusinessForm = ref(false)
// 业务表单URL
const businessFormUrl = ref('')
// 业务表单数据
const businessFormData = ref(null)

// 表单数据
const taskForm = reactive({
  deployId: '',
  taskId: '',
  procInsId: ''
})

/** 初始化数据 */
function init() {
  const query = router.currentRoute.value.query
  if (query) {
    taskForm.deployId = query.deployId
    taskForm.taskId = query.taskId
    taskForm.procInsId = query.procInsId

    processVariables(taskForm.taskId,taskForm.deployId)

  }
}



/** 获取流程变量内容 */
function processVariables(taskId,deployId) {
  if (taskId) {
    // 提交流程申请时填写的表单存入了流程变量中后续任务处理时需要展示
    getProcessVariables(taskId,deployId).then(res => {
      // 判断表单类型：如果包含form字段则为业务表单，否则为流程表单
      if (res.data.form !== undefined) {
        // 业务表单处理
        isBusinessForm.value = true
        businessFormData.value = res.data

        // 从form.formRouter获取业务表单路由
        if (res.data.form && res.data.form.formRouter) {
          // 构建业务表单URL，添加只读模式参数
          const baseUrl = res.data.form.formRouter
          const separator = baseUrl.includes('?') ? '&' : '?'
          businessFormUrl.value = `${baseUrl}${separator}readonly=true&taskId=${taskId}`
        } else {
          proxy.$modal.msgError('业务表单路由信息不完整')
        }
      } else {
        // 流程表单处理
        isBusinessForm.value = false
        proxy.$nextTick(() => {
          // 回显表单
          if (res.data.formJson.formContent !== undefined) {
            proxy.$refs.vFormRef.setFormJson(res.data.formJson.formContent)
          } else {
            let formJson = res.data.formJson
            //转成String
            formJson.formContent = JSON.stringify(res.data.formJson)
            proxy.$refs.vFormRef.setFormJson(formJson)
          }
          proxy.$nextTick(() => {
            // 加载表单填写的数据
            proxy.$refs.vFormRef.setFormData(res.data)
            proxy.$nextTick(() => {
              // 表单禁用
              proxy.$refs.vFormRef.disableForm()
            })
          })
        })
      }
    })
  }
}

/** 切换到流程图标签页时获取流程XML数据 */
function handleClick(tab) {
  if (tab.paneName === '3') {
    flowXmlAndNode({ procInsId: taskForm.procInsId, deployId: taskForm.deployId }).then(res => {
      flowData.value = res.data
    })
  }
}



/** 返回上一页 */
function goBack() {
  proxy.$tab.closeOpenPage({ path: '/task/finished', query: { t: Date.now() } })
}

// 页面加载钩子
onMounted(() => {
  init()
})
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
  clear: both
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
