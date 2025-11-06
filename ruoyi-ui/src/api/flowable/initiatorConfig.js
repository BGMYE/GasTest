import request from '@/utils/request'

// 查询流程发起人配置列表
export function listFlowInitiatorConfig(query) {
  return request({
    url: '/flowable/initiatorConfig/list',
    method: 'get',
    params: query
  })
}

// 查询流程发起人配置详细
export function getFlowInitiatorConfig(id) {
  return request({
    url: '/flowable/initiatorConfig/' + id,
    method: 'get'
  })
}

// 根据流程定义ID获取发起人配置
export function getFlowInitiatorConfigByProcDefId(procDefId) {
  return request({
    url: '/flowable/initiatorConfig/procDef/' + procDefId,
    method: 'get'
  })
}

// 根据流程定义Key获取发起人配置
export function getFlowInitiatorConfigByProcDefKey(procDefKey) {
  return request({
    url: '/flowable/initiatorConfig/procDefKey/' + procDefKey,
    method: 'get'
  })
}

// 新增流程发起人配置
export function addFlowInitiatorConfig(data) {
  return request({
    url: '/flowable/initiatorConfig',
    method: 'post',
    data: data
  })
}

// 修改流程发起人配置
export function updateFlowInitiatorConfig(data) {
  return request({
    url: '/flowable/initiatorConfig',
    method: 'put',
    data: data
  })
}

// 删除流程发起人配置
export function delFlowInitiatorConfig(ids) {
  return request({
    url: '/flowable/initiatorConfig/' + ids,
    method: 'delete'
  })
}

// 保存流程发起人配置（批量保存）
export function saveFlowInitiatorConfig(data) {
  return request({
    url: '/flowable/initiatorConfig/save',
    method: 'post',
    data: data
  })
}

// 检查用户是否有权限发起指定流程
export function checkUserCanStartProcess(procDefId) {
  return request({
    url: '/flowable/initiatorConfig/checkPermission/' + procDefId,
    method: 'get'
  })
}