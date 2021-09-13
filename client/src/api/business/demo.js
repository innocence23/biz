import request from '@/utils/request'

// 查询Demo列表
export function listDemo(query) {
    return request({
        url: '/api/v1/demo',
        method: 'get',
        params: query
    })
}

// 查询Demo详细
export function getDemo (id) {
    return request({
        url: '/api/v1/demo/' + id,
        method: 'get'
    })
}

// 新增Demo
export function addDemo(data) {
    return request({
        url: '/api/v1/demo',
        method: 'post',
        data: data
    })
}

// 修改Demo
export function updateDemo(data) {
    return request({
        url: '/api/v1/demo/'+data.id,
        method: 'put',
        data: data
    })
}

// 删除Demo
export function delDemo(data) {
    return request({
        url: '/api/v1/demo',
        method: 'delete',
        data: data
    })
}

