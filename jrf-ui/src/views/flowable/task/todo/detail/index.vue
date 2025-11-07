<template>
  <div class="app-container">
    <el-card class="box-card">
      <template #header>
        <div class="clearfix">
          <span class="el-icon-document">待办任务</span>
          <el-tag style="margin-left:10px">发起人:{{ startUser }}</el-tag>
          <el-tag>任务节点:{{ taskName }}</el-tag>
          <el-button style="float: right;" type="danger" @click="goBack">关闭</el-button>
        </div>
      </template>

      <el-tabs tab-position="top" v-model="activeName" @tab-click="handleClick">
        <!--表单信息-->
        <el-tab-pane label="表单信息" name="1">
          <!-- 流程表单展示 -->
          <el-col :span="16" :offset="4" v-if="!isBusinessForm">
            <v-form-render ref="vFormRef"/>
            <div style="margin-left:10%;margin-bottom: 20px;font-size: 14px;">
              <el-button type="primary" @click="handleComplete">审 批</el-button>
              <el-button v-if="!isSecondNode" type="warning" @click="handleReturn" style="margin-left: 10px;">退 回
              </el-button>
              <el-button type="danger" @click="handleReject" style="margin-left: 10px;">驳 回</el-button>
            </div>
          </el-col>
          <!-- 业务表单展示 -->
          <div v-if="isBusinessForm" style="width: 100%; height: 600px;">
            <iframe
                ref="businessFormIframe"
                :src="businessFormUrl"
                style="width: 100%; border: none;"
                @load="handleIframeLoad"
            ></iframe>
            <div style="margin-left:40%;margin-bottom: 20px;font-size: 14px;">
              <el-button type="primary" @click="handleComplete">审 批</el-button>
              <el-button v-if="!isSecondNode" type="warning" @click="handleReturn" style="margin-left: 10px;">退 回
              </el-button>
              <el-button type="danger" @click="handleReject" style="margin-left: 10px;">驳 回</el-button>
            </div>
          </div>
        </el-tab-pane>

        <!--流程流转记录-->
        <el-tab-pane label="流转记录" name="2">
          <FlowRecord
              :proc-ins-id="taskForm.procInsId"
              :deploy-id="taskForm.deployId"
              @loaded="onFlowRecordLoaded"
              @error="onFlowRecordError"
          />
        </el-tab-pane>
        <!--流程图-->
        <el-tab-pane label="流程图" name="3">
          <bpmn-viewer :flowData="flowData" :procInsId="taskForm.procInsId"/>
        </el-tab-pane>
      </el-tabs>
      <!--审批任务-->
      <el-dialog :title="completeTitle" v-model="completeOpen" width="60%" append-to-body>
        <el-form ref="taskFormRef" :model="taskForm">
          <el-form-item prop="targetKey">
            <flow-user v-if="checkSendUser" :checkType="checkType" @handleUserSelect="handleUserSelect"></flow-user>
            <flow-role v-if="checkSendRole" @handleRoleSelect="handleRoleSelect"></flow-role>
          </el-form-item>
          <el-form-item label="处理意见" label-width="80px" prop="comment"
                        :rules="[{ required: true, message: '请输入处理意见', trigger: 'blur' }]">
            <el-input type="textarea" v-model="taskForm.comment" placeholder="请输入处理意见"/>
          </el-form-item>
        </el-form>
        <template #footer>
          <div class="dialog-footer">
            <el-button @click="completeOpen = false">取 消</el-button>
            <el-button type="primary" @click="taskComplete">确 定</el-button>
          </div>
        </template>

      </el-dialog>
      <!--退回流程-->
      <el-dialog :title="returnTitle" v-model="returnOpen" width="40%" append-to-body>
        <el-form ref="taskFormRef" :model="taskForm" label-width="80px">
          <el-form-item label="退回节点" prop="targetKey">
            <el-radio-group v-model="taskForm.targetKey">
              <el-radio-button v-for="item in returnTaskList" :key="item.id" :label="item.id">{{ item.name }}
              </el-radio-button>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="退回意见" prop="comment"
                        :rules="[{ required: true, message: '请输入意见', trigger: 'blur' }]">
            <el-input style="width: 50%" type="textarea" v-model="taskForm.comment" placeholder="请输入意见"/>
          </el-form-item>
        </el-form>
        <template #footer>
          <div class="dialog-footer">
            <el-button @click="returnOpen = false">取 消</el-button>
            <el-button type="primary" @click="taskReturn">确 定</el-button>
          </div>
        </template>

      </el-dialog>
      <!--驳回流程-->
      <el-dialog :title="rejectTitle" v-model="rejectOpen" width="40%" append-to-body>
        <el-form ref="taskFormRef" :model="taskForm" label-width="80px">
          <el-form-item label="驳回意见" prop="comment"
                        :rules="[{ required: true, message: '请输入意见', trigger: 'blur' }]">
            <el-input style="width: 50%" type="textarea" v-model="taskForm.comment" placeholder="请输入意见"/>
          </el-form-item>
        </el-form>
        <template #footer>
          <div class="dialog-footer">
            <el-button @click="rejectOpen = false">取 消</el-button>
            <el-button type="primary" @click="taskReject">确 定</el-button>
          </div>
        </template>

      </el-dialog>
    </el-card>
  </div>
</template>

<script setup name="TodoDetail">
import {ref, reactive, onMounted, onUnmounted, getCurrentInstance} from 'vue'
import {useRouter} from 'vue-router'
import {
  complete,
  rejectTask,
  returnList,
  returnTask,
  getNextFlowNode,
  delegate,
  flowTaskForm
} from '@/api/flowable/todo'
import {flowXmlAndNode} from '@/api/flowable/definition'
import BpmnViewer from '@/components/Process/viewer';
import FlowUser from '@/components/flow/User'
import FlowRole from '@/components/flow/Role'
import FlowRecord from '@/components/FlowRecord'


const router = useRouter()
const {proxy} = getCurrentInstance()

// 响应式状态
const activeName = ref('1')
const loading = ref(true)

const flowData = ref({})
// 是否为业务表单
const isBusinessForm = ref(false)
// 业务表单URL
const businessFormUrl = ref('')
// 业务表单数据
const businessFormData = ref(null)
const completeOpen = ref(false)
const returnOpen = ref(false)
const rejectOpen = ref(false)
const completeTitle = ref(null)
const returnTitle = ref(null)
const rejectTitle = ref(null)
const checkSendUser = ref(false)
const checkSendRole = ref(false)
const checkType = ref('single')
const multiInstanceVars = ref('')
const formJson = ref({})
const returnTaskList = ref([])
const taskFormRef = ref(null)
const isSecondNode = ref(false)
// 表单数据
const taskForm = reactive({
  deployId: '',
  taskId: '',
  procInsId: '',
  executionId: '',
  instanceId: '',
  procDefId: '',
  targetKey: '',
  comment: '',
  variables: {},
  defaultTaskShow: true,
  returnTaskShow: false,
  delegateTaskShow: false
})

// 查询参数
const startUser = ref('')
const taskName = ref('')

/** 初始化数据 */
function init() {
  const query = router.currentRoute.value.query
  if (query) {
    startUser.value = query.startUser
    taskName.value = query.taskName
    taskForm.deployId = query.deployId
    taskForm.taskId = query.taskId
    taskForm.procInsId = query.procInsId
    taskForm.executionId = query.executionId
    taskForm.instanceId = query.procInsId

    getFlowTaskForm(taskForm.taskId, taskForm.deployId)

  }
}

/** 获取流程表单信息 */
function getFlowTaskForm(taskId) {
  if (taskId) {
    let deployId = {
      taskId: taskId,
      deployId: taskForm.deployId
    }
    flowTaskForm(deployId).then(res => {
      if (res.data.form == null) {
        //流程表单
        isBusinessForm.value = false
        formJson.value = res.data.formJson
        proxy.$refs.vFormRef.setFormJson(res.data.formJson)
        proxy.$nextTick(() => {
          proxy.$refs.vFormRef.setFormData(res.data)
        })
      } else {
        //业务表单
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
      }
    })
  }
}

/** 处理iframe加载完成事件 */
function handleIframeLoad() {
  if (proxy.$refs.businessFormIframe && businessFormData.value) {
    try {
      // 深度克隆数据以确保可序列化
      const clonedData = JSON.parse(JSON.stringify(businessFormData.value))

      const message = {
        type: 'FORM_DATA_LOAD',
        data: clonedData,
        readonly: true,
        taskId: taskForm.taskId
      }

      proxy.$refs.businessFormIframe.contentWindow.postMessage(message, '*')
    } catch (error) {
      console.warn('业务表单数据克隆失败:', error)
    }
  }
}

/** 切换到流程图标签页时获取流程XML数据 */
function handleClick(tab) {
  if (tab.paneName === '3') {
    flowXmlAndNode({procInsId: taskForm.procInsId, deployId: taskForm.deployId}).then(res => {
      flowData.value = res.data
    })
  }
}

/**
 * 流转记录加载完成事件处理
 * @param {Array} flowList - 流转记录列表
 */
function onFlowRecordLoaded(flowList) {
  // 判断当前任务是否为第一个用户任务节点
  if (flowList && flowList.length > 0) {
    // 找到第一个用户任务节点（有taskId的节点）
    const firstUserTaskNode = flowList.find(item => item.taskId)
    if (firstUserTaskNode) {
      // 通过taskId进行精确匹配，判断当前任务是否为第一个用户任务节点
      isSecondNode.value = taskForm.taskId === firstUserTaskNode.taskId
    }
  }
}

/**
 * 流转记录加载错误事件处理
 * @param {Error} error - 错误信息
 */
function onFlowRecordError(error) {
  console.error('获取流转记录失败:', error)
  goBack()
}

/** 用户选择回调 */
function handleUserSelect(selection) {
  if (selection) {
    if (Array.isArray(selection)) {
      const selectVal = selection.map(item => item.userId.toString())
      if (multiInstanceVars.value) {
        taskForm.variables[multiInstanceVars.value] = selectVal
      } else {
        taskForm.variables.approval = selectVal.join(',')
      }
    } else {
      taskForm.variables.approval = selection.userId?.toString()
    }
  }
}

/** 角色选择回调 */
function handleRoleSelect(selection) {
  if (selection) {
    const selectVal = Array.isArray(selection) ? selection.map(i => i.roleId.toString()) : [selection]
    taskForm.variables.approval = selectVal.join(',')
  }
}

/** 返回上一页 */
function goBack() {
  proxy.$tab.closeOpenPage({path: '/task/todo', query: {t: Date.now()}})
}

/** 驳回按钮 */
function handleReject() {
  taskForm.comment = '' // 清空意见内容
  rejectOpen.value = true
  rejectTitle.value = '驳回流程'
}

/** 提交驳回 */
function taskReject() {
  if (!taskForm.comment) {
    proxy.$modal.msgError("请输入驳回意见!")
    return
  }
  // 设置操作类型为驳回
  taskForm.actionType = 'REJECT'
  rejectTask(taskForm).then(res => {
    proxy.$modal.msgSuccess(res.msg)
    goBack()
  })
}

/** 获取可退回节点列表 */
function handleReturn() {
  taskForm.comment = '' // 清空意见内容
  taskForm.targetKey = '' // 清空目标节点
  returnOpen.value = true
  returnTitle.value = '退回流程'
  returnList(taskForm).then(res => {
    returnTaskList.value = res.data
  })
}

/** 提交退回 */
function taskReturn() {
  if (!taskForm.targetKey) {
    proxy.$modal.msgError("请选择退回节点!")
    return
  }
  if (!taskForm.comment) {
    proxy.$modal.msgError("请输入退回意见!")
    return
  }
  // 设置操作类型为退回
  taskForm.actionType = 'REBACK'
  returnTask(taskForm).then(res => {
    proxy.$modal.msgSuccess(res.msg)
    goBack()
  })
}

/** 审批任务打开弹窗 */
function handleComplete() {
  taskForm.comment = '' // 清空意见内容
  completeOpen.value = true
  completeTitle.value = '流程审批'
  submitForm()
}

/** 提交审批任务 */
function taskComplete() {
  if (!taskForm.variables && checkSendUser.value) {
    proxy.$modal.msgError("请选择流程接收人员!")
    return
  }
  if (!taskForm.variables && checkSendRole.value) {
    proxy.$modal.msgError("请选择流程接收角色组!")
    return
  }
  if (!taskForm.comment) {
    proxy.$modal.msgError("请输入审批意见!")
    return
  }

  // 设置操作类型为通过
  taskForm.actionType = 'NORMAL'
  complete(taskForm).then(res => {
    proxy.$modal.msgSuccess(res.msg)
    goBack()
  })
}

/** 提交前获取下一步节点信息 */
function submitForm() {
  const params = {taskId: taskForm.taskId}
  getNextFlowNode(params).then(res => {
    if (isBusinessForm.value) {
      // 业务表单：使用业务表单数据
      if (businessFormData.value) {
        Object.assign(taskForm.variables, businessFormData.value)
      }
    } else {
      // 流程表单：从vFormRef获取数据
      proxy.$refs.vFormRef.getFormData().then(formData => {
        Object.assign(taskForm.variables, formData)
        taskForm.variables.formJson = formJson.value
      })
    }

    const data = res.data
    if (data) {
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
      }
    }
  })
}

// 页面加载钩子
onMounted(() => {
  init()

  // 添加消息监听器，接收来自业务表单iframe的数据
  window.addEventListener('message', (event) => {
    if (event.data && event.data.type === 'FORM_DATA_UPDATE') {
      // 更新业务表单数据
      businessFormData.value = event.data.formData
    }
  })
})

// 页面卸载时清理监听器
onUnmounted(() => {
  window.removeEventListener('message', () => {
  })
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

.el-tag + .el-tag {
  margin-left: 10px;
}

.my-label {
  background: #E1F3D8;
}
</style>
