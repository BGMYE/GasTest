<template>
   <div class="app-container">
      <el-form
        ref="leaveFormRef"
        :model="leaveForm"
        :rules="formRules"
        :disabled="formDisabled"
        label-width="120px"
        class="leave-form"
        style="max-width: 800px; margin: 0 auto; padding: 10px;"
      >
        <el-row>
          <el-col span="12">
            <!-- 请假人 -->
            <el-form-item label="请假人" prop="applicantName">
              <el-input
                  v-model="leaveForm.applicantName"
                  placeholder="请输入请假人姓名"
                  :prefix-icon="User"
                  :readonly="isReadonly"
                  :disabled="formDisabled"
                  clearable
              />
            </el-form-item>
          </el-col>
          <el-col span="12">
            <!-- 请假类型 -->
            <el-form-item label="请假类型" prop="leaveType">
              <el-select
                  v-model="leaveForm.leaveType"
                  placeholder="请选择请假类型"
                  :disabled="formDisabled"
                  style="width: 100%"
                  clearable
              >
                <el-option label="事假" value="personal" />
                <el-option label="病假" value="sick" />
                <el-option label="年假" value="annual" />
                <el-option label="调休" value="compensatory" />
                <el-option label="婚假" value="marriage" />
                <el-option label="产假" value="maternity" />
                <el-option label="其他" value="other" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted, watch } from 'vue'
import { useRoute } from 'vue-router'
import { ElMessage, } from 'element-plus'
import { User } from '@element-plus/icons-vue'
import { selectByTaskId} from "@/api/flowable/qingjia.js";

// 获取路由实例
const route = useRoute()

// 获取路由传递的taskId参数
const taskId = ref(route.params.taskId || route.query.taskId || '')

// 表单引用
const leaveFormRef = ref()

// 表单数据
const leaveForm = reactive({
  applicantName: '',
  leaveType: '',
})

// 表单状态
const isReadonly = ref(false)
const formDisabled = ref(false)

// 表单验证规则
const formRules = {
  applicantName: [
    { required: true, message: '请输入请假人姓名', trigger: 'blur' },
    { min: 2, max: 20, message: '姓名长度在 2 到 20 个字符', trigger: 'blur' }
  ],
  leaveType: [
    { required: true, message: '请选择请假类型', trigger: 'change' }
  ],
}

/**
 * 组件挂载时执行
 */
onMounted(() => {
  // 打印接收到的taskId
  if (taskId.value) {
    console.log('接收到的taskId:', taskId.value)
    getData(taskId.value)
  } else {
    console.log('未接收到taskId参数')
  }
  
  // 监听父页面发送的消息
  window.addEventListener('message', handleParentMessage)

  // 监听表单数据变化，自动发送到父页面
  watch(leaveForm, (newVal) => {
    try {
      // 构建要传递的数据
      const formData = {
        ...newVal,
        taskId: taskId.value
      }
      
      // 深度克隆数据，确保可序列化
      let clonedData
      try {
        clonedData = JSON.parse(JSON.stringify(formData))
      } catch (cloneError) {
        console.warn('数据克隆失败，使用原始数据:', cloneError)
        clonedData = formData
      }
      
      // 通过postMessage将数据发送给父页面
      if (window.parent && window.parent !== window) {
        window.parent.postMessage({
          type: 'formData',
          data: clonedData
        }, '*')
      }
    } catch (error) {
      console.error('发送表单数据到父页面失败:', error)
    }
  }, { deep: true, immediate: true })
})


/**
 * 处理父页面发送的消息
 */
function handleParentMessage(event) {
  try {
    const type = event.data
    
    if (type === 'FORM_RESET') {
      // 收到重置消息，执行表单重置
      resetForm()
    }
  } catch (error) {
    console.error('处理父页面消息失败:', error)
  }
}

/**
 * 重置表单
 */
function resetForm() {
  leaveFormRef.value.resetFields()
  ElMessage.info('表单已重置')
}

/**
 * 禁用所有表单控件
 */
function disableAllFormControls() {
  // 通过CSS类控制只读状态
  document.body.classList.add('form-readonly')
  
  // 禁用表单元素
  setTimeout(() => {
    const formElements = document.querySelectorAll('.leave-form input, .leave-form select, .leave-form textarea, .leave-form button')
    formElements.forEach(element => {
      element.disabled = true
      element.readOnly = true
    })
  }, 100)
}

/**
 * 获取任务数据
 */
function getData(taskId){
  let params = {
    taskId: taskId
  }
  //替换成自己查询数据的api，要求必须是根据taskId查询唯一数据
  selectByTaskId(params).then(res =>{
    // 正确的赋值方式：leaveForm是reactive对象，不需要.value
    Object.assign(leaveForm, res.data);
    isReadonly.value = true;
    formDisabled.value = true;
    console.log('表单数据已加载:', leaveForm);
  }).catch(error => {
    console.error('获取任务数据失败:', error);
  })
}

</script>

<style scoped>
.app-container {
  padding: 0;
  margin: 0;
  width: 100%;
  box-sizing: border-box;
  min-height: auto;
}

.leave-form {
  width: 100%;
  box-sizing: border-box;
  min-height: auto;
}

.el-form-item {
  margin-bottom: 15px;
}

.el-input, .el-select {
  width: 100%;
}

/* 只读模式样式 */
.form-readonly .el-input__inner,
.form-readonly .el-select .el-input__inner,
.form-readonly .el-textarea__inner {
  background-color: #f5f7fa !important;
  border-color: #e4e7ed !important;
  color: #606266 !important;
  cursor: not-allowed !important;
}

.form-readonly .el-input.is-disabled .el-input__inner,
.form-readonly .el-select.is-disabled .el-input__inner {
  background-color: #f5f7fa !important;
  border-color: #e4e7ed !important;
  color: #c0c4cc !important;
}

/* 响应式设计 */
@media (max-width: 768px) {
  .leave-form {
    max-width: 100% !important;
    padding: 10px !important;
  }
  
  .el-col {
    width: 100% !important;
    flex: 0 0 100% !important;
    max-width: 100% !important;
  }
}
</style>
