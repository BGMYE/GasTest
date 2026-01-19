import request from '@/utils/request'

// 查询学生信息管理列表
export function listGasStudent(query) {
  return request({
    url: '/sxgpra/GasStudent/list',
    method: 'get',
    params: query
  })
}

// 查询学生信息管理列表
export function listAllGasStudent(query) {
    return request({
        url: '/sxgpra/GasStudent/listAll',
        method: 'get',
        params: query
    })
}

// 查询学生信息管理详细
export function getGasStudent(id) {
  return request({
    url: '/sxgpra/GasStudent/getInfo/' + id,
    method: 'get'
  })
}

// 新增学生信息管理
export function addGasStudent(data) {
  return request({
    url: '/sxgpra/GasStudent/insert',
    method: 'post',
    data: data
  })
}

// 修改学生信息管理
export function updateGasStudent(data) {
  return request({
    url: '/sxgpra/GasStudent/update',
    method: 'put',
    data: data
  })
}

// 删除学生信息管理
export function delGasStudent(id) {
  return request({
    url: '/sxgpra/GasStudent/remove/' + id,
    method: 'delete'
  })
}
