import request from '@/utils/request'

export function selectByTaskId(query) {
    return request({
        url: '/flowable/qingjia/selectByTaskId',
        method: 'get',
        params: query
    })
}