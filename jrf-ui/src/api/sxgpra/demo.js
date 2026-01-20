import request from '@/utils/request'

// 查询示例树列表
export function listDemo(query) {
  return request({
    url: '/sxgpra/demo/list',
    method: 'get',
    params: query
  })
}

// 查询示例树列表
export function listAllDemo(query) {
    return request({
        url: '/sxgpra/demo/listAll',
        method: 'get',
        params: query
    })
}

// 查询示例树详细
export function getDemo(demoId) {
  return request({
    url: '/sxgpra/demo/getInfo/' + demoId,
    method: 'get'
  })
}

// 新增示例树
export function addDemo(data) {
  return request({
    url: '/sxgpra/demo/insert',
    method: 'post',
    data: data
  })
}

// 修改示例树
export function updateDemo(data) {
  return request({
    url: '/sxgpra/demo/update',
    method: 'put',
    data: data
  })
}

// 删除示例树
export function delDemo(demoId) {
  return request({
    url: '/sxgpra/demo/remove/' + demoId,
    method: 'delete'
  })
}
