<template>
  <div class="app-container">
    <h2>流转记录组件测试</h2>
    <p>此页面用于测试FlowRecord组件的操作类型显示功能</p>
    
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>操作类型说明</span>
      </div>
      <el-row :gutter="20">
        <el-col :span="8">
          <el-tag type="success">通过</el-tag>
          <span style="margin-left: 10px;">正常审批通过</span>
        </el-col>
        <el-col :span="8">
          <el-tag type="warning">退回</el-tag>
          <span style="margin-left: 10px;">退回到上一节点</span>
        </el-col>
        <el-col :span="8">
          <el-tag type="danger">驳回</el-tag>
          <span style="margin-left: 10px;">驳回到发起人</span>
        </el-col>
      </el-row>
      <el-row :gutter="20" style="margin-top: 10px;">
        <el-col :span="8">
          <el-tag type="info">委派</el-tag>
          <span style="margin-left: 10px;">委派给其他人处理</span>
        </el-col>
        <el-col :span="8">
          <el-tag type="info">转办</el-tag>
          <span style="margin-left: 10px;">转办给其他人处理</span>
        </el-col>
        <el-col :span="8">
          <el-tag type="danger">终止</el-tag>
          <span style="margin-left: 10px;">终止流程</span>
        </el-col>
      </el-row>
    </el-card>
    
    <div style="margin-top: 20px;">
      <el-input 
        v-model="testProcInsId" 
        placeholder="请输入流程实例ID进行测试" 
        style="width: 300px; margin-right: 10px;"
      />
      <el-button type="primary" @click="loadTestData">加载测试数据</el-button>
    </div>
    
    <div style="margin-top: 20px;" v-if="testProcInsId">
      <FlowRecord 
        :proc-ins-id="testProcInsId" 
        :auto-load="false"
        @loaded="onFlowRecordLoaded"
        @error="onFlowRecordError"
        ref="flowRecordRef"
      />
    </div>
  </div>
</template>

<script setup name="FlowRecordTest">
import { ref } from 'vue'
import FlowRecord from '@/components/FlowRecord/index.vue'
import { ElMessage } from 'element-plus'

// 响应式数据
const testProcInsId = ref('')
const flowRecordRef = ref(null)

/**
 * 加载测试数据
 */
function loadTestData() {
  if (!testProcInsId.value) {
    ElMessage.warning('请输入流程实例ID')
    return
  }
  
  if (flowRecordRef.value) {
    flowRecordRef.value.refresh()
  }
}

/**
 * 流转记录加载完成事件处理
 * @param {Array} data - 流转记录数据
 */
function onFlowRecordLoaded(data) {
  ElMessage.success(`成功加载 ${data.length} 条流转记录`)
  console.log('流转记录数据:', data)
}

/**
 * 流转记录加载错误事件处理
 * @param {Error} error - 错误信息
 */
function onFlowRecordError(error) {
  ElMessage.error('加载流转记录失败')
  console.error('加载流转记录失败:', error)
}
</script>

<style lang="scss" scoped>
.app-container {
  padding: 20px;
}

.box-card {
  margin-bottom: 20px;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both;
}
</style>