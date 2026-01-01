import request from '@/utils/request'

// 查询监检区域分配列表
export function listGasAreaManage(query) {
  return request({
    url: '/sxgpra/gasAreaManage/list',
    method: 'get',
    params: query
  })
}

// 查询监检区域分配列表
export function listAllGasAreaManage(query) {
    return request({
        url: '/sxgpra/gasAreaManage/listAll',
        method: 'get',
        params: query
    })
}

// 查询监检区域分配详细
export function getGasAreaManage(areaManageId) {
  return request({
    url: '/sxgpra/gasAreaManage/getInfo/' + areaManageId,
    method: 'get'
  })
}

// 新增监检区域分配
export function addGasAreaManage(data) {
  return request({
    url: '/sxgpra/gasAreaManage/insert',
    method: 'post',
    data: data
  })
}

// 修改监检区域分配
export function updateGasAreaManage(data) {
  return request({
    url: '/sxgpra/gasAreaManage/update',
    method: 'put',
    data: data
  })
}

// 删除监检区域分配
export function delGasAreaManage(areaManageId) {
  return request({
    url: '/sxgpra/gasAreaManage/remove/' + areaManageId,
    method: 'delete'
  })
}

// 查询部门下拉树结构
export function deptTreeSelect() {
  return request({
    url: '/system/user/deptTree',
    method: 'get'
  })
}
