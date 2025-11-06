import request from '@/utils/request'

// 查询qingjia列表
export function listQingjia(query) {
  return request({
    url: '/system/qingjia/list',
    method: 'get',
    params: query
  })
}

// 查询qingjia详细
export function getQingjia(id) {
  return request({
    url: '/system/qingjia/' + id,
    method: 'get'
  })
}

// 新增qingjia
export function addQingjia(data) {
  return request({
    url: '/system/qingjia',
    method: 'post',
    data: data
  })
}

// 修改qingjia
export function updateQingjia(data) {
  return request({
    url: '/system/qingjia',
    method: 'put',
    data: data
  })
}

// 删除qingjia
export function delQingjia(id) {
  return request({
    url: '/system/qingjia/' + id,
    method: 'delete'
  })
}
