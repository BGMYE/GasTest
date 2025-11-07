<template>
  <div>
    <bpmn-model v-if="dataExit && showView" :xml="xml" :is-view="false" @save="save" @showXML="showXML"
      @goBack="emit('close')" />
    <!-- 在线查看 XML -->
    <el-drawer :title="xmlTitle" :modal="false" direction="rtl" v-model="xmlOpen" size="60%">
      <el-scrollbar>
        <highlightjs language="xml" :code="xmlData"></highlightjs>
      </el-scrollbar>
    </el-drawer>
  </div>
</template>

<script setup>
import { ref, onMounted, getCurrentInstance } from 'vue'
import { readXml, roleList, saveXml, userList, expList } from '@/api/flowable/definition.js'
import { saveFlowInitiatorConfig } from '@/api/flowable/initiatorConfig.js'
import BpmnModel from '@/components/Process/index.vue'
import useModelerStore from '@/components/Process/common/global.js'

const props = defineProps({
  deployId: {
    type: String
  }
})

const { proxy } = getCurrentInstance();
// 数据定义
const xml = ref('')
const modeler = ref('')
const dataExit = ref(false)
const xmlOpen = ref(false)
const xmlTitle = ref('')
const xmlData = ref('')
const showView = ref(true)

// 获取流程 XML 数据
const getXmlData = (deployId) => {
  showView.value = false
  readXml(deployId).then(res => {
    xml.value = res.data
    showView.value = true
  })
}

// 保存 XML
const save = (data) => {
  const params = {
    name: data.process.name,
    category: data.process.category,
    xml: data.xml
  }
  saveXml(params).then(res => {
    // 保存成功后，从返回数据中获取流程定义ID并保存发起人配置
    if (res.data && res.data.procDefId) {
      saveInitiatorConfig(res.data)
    }
    proxy.$modal.msgSuccess(res.msg)
    emit('close')
  })
}

/**
 * 保存发起人配置
 * @param {Object} deployInfo 部署信息，包含procDefId、procDefKey、deployId
 */
const saveInitiatorConfig = async (deployInfo) => {
  try {
    // 从BPMN模型中提取发起人配置
    const initiatorConfigs = extractInitiatorConfigs()
    
    if (initiatorConfigs.length > 0) {
      // 构造保存请求数据
      const saveRequest = {
        procDefId: deployInfo.procDefId,
        procDefKey: deployInfo.procDefKey,
        deployId: deployInfo.deployId,
        configList: initiatorConfigs
      }
      
      // 调用保存发起人配置的接口
      await saveFlowInitiatorConfig(saveRequest)
      proxy.$modal.msgSuccess('发起人配置保存成功')
    }
  } catch (error) {
    console.error('保存发起人配置失败:', error)
    proxy.$modal.msgError('保存发起人配置失败: ' + error.message)
  }
}

/**
 * 从BPMN模型中提取发起人配置
 * @returns {Array} 发起人配置列表
 */
const extractInitiatorConfigs = () => {
  const configs = []
  
  try {
    // 获取BPMN模型实例
    const bpmnModeler = window.bpmnModeler
    if (!bpmnModeler) {
      console.warn('BPMN模型未初始化')
      return configs
    }
    
    const definitions = bpmnModeler.getDefinitions()
    const rootElements = definitions.rootElements
    console.log('BPMN根元素:', rootElements)
    
    // 查找流程元素
    for (let i = 0; i < rootElements.length; i++) {
      if (rootElements[i].$type === 'bpmn:Process') {
        const process = rootElements[i]
        console.log('找到流程元素:', process)
        
        // 查找开始事件
        const flowElements = process.flowElements || []
        console.log('流程元素列表:', flowElements)
        
        for (let j = 0; j < flowElements.length; j++) {
          const element = flowElements[j]
          if (element.$type === 'bpmn:StartEvent') {
            console.log('找到开始事件:', element)
            
            // 从开始事件的扩展属性中提取发起人配置
            const extensionElements = element.extensionElements
            console.log('扩展元素:', extensionElements)
            
            if (extensionElements && extensionElements.values) {
              console.log('扩展元素值:', extensionElements.values)
              
              const properties = extensionElements.values.find(ex => ex.$type === 'flowable:Properties')
              console.log('Properties对象:', properties)
              
              if (properties && properties.values) {
                console.log('Properties值:', properties.values)
                
                const initiatorProps = properties.values.filter(prop => 
                  prop.name && prop.name.startsWith('initiator_')
                )
                console.log('发起人属性:', initiatorProps)
                
                // 解析发起人配置
                const configMap = new Map()
                initiatorProps.forEach(prop => {
                  const [prefix, type, id] = prop.name.split('_')
                  const key = type + '_' + id
                  if (!configMap.has(key)) {
                    configMap.set(key, {
                      initiatorType: parseInt(type),
                      initiatorId: id,
                      initiatorName: prop.value
                    })
                  }
                })
                
                configs.push(...Array.from(configMap.values()))
                console.log('提取到的发起人配置:', configs)
              }
            }
            break // 只处理第一个开始事件
          }
        }
        break // 只处理第一个流程
      }
    }
  } catch (error) {
    console.error('提取发起人配置时出错:', error)
  }
  
  console.log('最终提取到的发起人配置:', configs)
  return configs
}
const modelerStore = useModelerStore()
// 获取用户、角色、表达式数据
const getDataList = () => {

  userList().then(res => {
    modelerStore.setUserList(res.data)
  })
  roleList().then(res => {
    modelerStore.setRoleList(res.data)
  })
  expList().then(res => {
    modelerStore.setExpList(res.data)
    dataExit.value = true
  })
}

// 展示 XML
const showXML = (xml) => {
  xmlTitle.value = 'XML 查看'
  xmlOpen.value = true
  console.log(xmlData);
  xmlData.value = xml
}

// 页面加载钩子
onMounted(() => {
  if (props.deployId) {
    getXmlData(props.deployId)
  }
  getDataList()
})

const emit = defineEmits(['close'])
</script>
