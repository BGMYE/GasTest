<template>
  <div class="flow-record">
    <el-col :span="16" :offset="4">
      <div class="block">
        <el-timeline>
          <el-timeline-item 
            v-for="(item, index) in flowRecordList" 
            :key="index" 
            :icon="setIcon(item.finishTime)"
            :color="setColor(item.finishTime)"
          >
            <p style="font-weight: 700">{{ item.taskName }}</p>
            <el-card :body-style="{ padding: '10px' }">
              <el-descriptions class="margin-top" :column="1" border>
                <el-descriptions-item v-if="item.assigneeName" label-class-name="my-label">
                  <template #label><i class="el-icon-user"></i>办理人</template>
                  {{ item.assigneeName }}
                  <el-tag type="info">{{ item.deptName }}</el-tag>
                </el-descriptions-item>
                <el-descriptions-item v-if="item.candidate" label-class-name="my-label">
                  <template #label><i class="el-icon-user"></i>候选办理</template>
                  {{ item.candidate }}
                </el-descriptions-item>
                <el-descriptions-item label-class-name="my-label">
                  <template #label><i class="el-icon-date"></i>接收时间</template>
                  {{ item.createTime }}
                </el-descriptions-item>
                <el-descriptions-item v-if="item.finishTime" label-class-name="my-label">
                  <template #label><i class="el-icon-date"></i>处理时间</template>
                  {{ item.finishTime }}
                </el-descriptions-item>
                <el-descriptions-item v-if="item.duration" label-class-name="my-label">
                  <template #label><i class="el-icon-time"></i>耗时</template>
                  {{ item.duration }}
                </el-descriptions-item>
                <el-descriptions-item v-if="item.comment && item.comment.type" label-class-name="my-label">
                  <template #label><i class="el-icon-tickets"></i>操作类型</template>
                  <el-tag :type="getActionTypeStyle(item.comment.type)">{{ getActionTypeName(item.comment.type) }}</el-tag>
                </el-descriptions-item>
                <el-descriptions-item v-if="item.comment && item.comment.comment" label-class-name="my-label">
                  <template #label><i class="el-icon-edit-outline"></i>处理意见</template>
                  {{ item.comment.comment }}
                </el-descriptions-item>
              </el-descriptions>
            </el-card>
          </el-timeline-item>
        </el-timeline>
      </div>
    </el-col>
  </div>
</template>

<script setup name="FlowRecord">
import { ref, watch } from 'vue'
import { flowRecord } from '@/api/flowable/finished'

// 定义组件属性
const props = defineProps({
  // 流程实例ID
  procInsId: {
    type: String,
    required: true
  },
  // 部署ID
  deployId: {
    type: String,
    default: ''
  },
  // 是否自动加载数据
  autoLoad: {
    type: Boolean,
    default: true
  }
})

// 定义事件
const emit = defineEmits(['loaded', 'error'])

// 响应式数据
const flowRecordList = ref([])
const loading = ref(false)

/**
 * 设置时间轴图标
 * @param {string} val - 完成时间
 * @returns {string} 图标类名
 */
function setIcon(val) {
  return val ? 'el-icon-check' : 'el-icon-time'
}

/**
 * 设置时间轴颜色
 * @param {string} val - 完成时间
 * @returns {string} 颜色值
 */
function setColor(val) {
  return val ? '#2bc418' : '#b3bdbb'
}

/**
 * 获取操作类型名称
 * @param {string} type - 操作类型编码
 * @returns {string} 操作类型名称
 */
function getActionTypeName(type) {
  const typeMap = {
    '1': '通过',
    '2': '退回',
    '3': '驳回',
    '4': '委派',
    '5': '转办',
    '6': '终止'
  }
  return typeMap[type] || '未知'
}

/**
 * 获取操作类型样式
 * @param {string} type - 操作类型编码
 * @returns {string} Element UI标签样式
 */
function getActionTypeStyle(type) {
  const styleMap = {
    '1': 'success',  // 通过 - 绿色
    '2': 'warning',  // 退回 - 橙色
    '3': 'danger',   // 驳回 - 红色
    '4': 'info',     // 委派 - 蓝色
    '5': 'info',     // 转办 - 蓝色
    '6': 'danger'    // 终止 - 红色
  }
  return styleMap[type] || 'info'
}

/**
 * 获取流程流转记录
 * @param {string} procInsId - 流程实例ID
 * @param {string} deployId - 部署ID
 */
function getFlowRecordList(procInsId, deployId = '') {
  if (!procInsId) {
    console.warn('FlowRecord组件: procInsId参数不能为空')
    return
  }
  
  loading.value = true
  flowRecord({ procInsId, deployId })
    .then(res => {
      flowRecordList.value = res.data.flowList || []
      emit('loaded', flowRecordList.value)
    })
    .catch(error => {
      console.error('获取流转记录失败:', error)
      emit('error', error)
    })
    .finally(() => {
      loading.value = false
    })
}

/**
 * 刷新流转记录数据
 */
function refresh() {
  getFlowRecordList(props.procInsId, props.deployId)
}

// 监听props变化，自动重新加载数据
watch(
  () => [props.procInsId, props.deployId],
  ([newProcInsId, newDeployId]) => {
    if (props.autoLoad && newProcInsId) {
      getFlowRecordList(newProcInsId, newDeployId)
    }
  },
  { immediate: true }
)

// 暴露方法给父组件
defineExpose({
  refresh,
  getFlowRecordList,
  flowRecordList,
  loading
})
</script>

<style lang="scss" scoped>
.flow-record {
  .my-label {
    background: #E1F3D8;
  }
  
  .el-tag + .el-tag {
    margin-left: 10px;
  }
  
  .margin-top {
    margin-top: 10px;
  }
  
  // 操作类型标签样式
  .el-descriptions-item__content .el-tag {
    font-weight: 600;
    border-radius: 4px;
  }
}
</style>