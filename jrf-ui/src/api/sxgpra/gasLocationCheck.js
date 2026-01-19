import request from '@/utils/request'

// 查询定位校验列表
export function listGasLocationCheck(query) {
  return request({
    url: '/sxgpra/gasLocationCheck/list',
    method: 'get',
    params: query
  })
}

// 查询定位校验列表
export function listAllGasLocationCheck(query) {
    return request({
        url: '/sxgpra/gasLocationCheck/listAll',
        method: 'get',
        params: query
    })
}

// 查询定位校验详细
export function getGasLocationCheck(locationCheckId) {
  return request({
    url: '/sxgpra/gasLocationCheck/getInfo/' + locationCheckId,
    method: 'get'
  })
}

// 新增定位校验
export function addGasLocationCheck(data) {
  return request({
    url: '/sxgpra/gasLocationCheck/insert',
    method: 'post',
    data: data
  })
}

// 修改定位校验
export function updateGasLocationCheck(data) {
  return request({
    url: '/sxgpra/gasLocationCheck/update',
    method: 'put',
    data: data
  })
}

// 删除定位校验
export function delGasLocationCheck(locationCheckId) {
  return request({
    url: '/sxgpra/gasLocationCheck/remove/' + locationCheckId,
    method: 'delete'
  })
}
