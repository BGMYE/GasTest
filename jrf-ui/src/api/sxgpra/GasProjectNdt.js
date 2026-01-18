import request from '@/utils/request'

// 查询项目检测单位列表
export function listGasProjectNdt(query) {
  return request({
    url: '/sxgpra/GasProjectNdt/list',
    method: 'get',
    params: query
  })
}

// 查询项目检测单位列表
export function listAllGasProjectNdt(query) {
    return request({
        url: '/sxgpra/GasProjectNdt/listAll',
        method: 'get',
        params: query
    })
}

// 查询项目检测单位详细
export function getGasProjectNdt(projectNdtId) {
  return request({
    url: '/sxgpra/GasProjectNdt/getInfo/' + projectNdtId,
    method: 'get'
  })
}

// 新增项目检测单位
export function addGasProjectNdt(data) {
  return request({
    url: '/sxgpra/GasProjectNdt/insert',
    method: 'post',
    data: data
  })
}

// 修改项目检测单位
export function updateGasProjectNdt(data) {
  return request({
    url: '/sxgpra/GasProjectNdt/update',
    method: 'put',
    data: data
  })
}

// 删除项目检测单位
export function delGasProjectNdt(projectNdtId) {
  return request({
    url: '/sxgpra/GasProjectNdt/remove/' + projectNdtId,
    method: 'delete'
  })
}
