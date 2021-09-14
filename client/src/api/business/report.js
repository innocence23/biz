import request from '@/utils/request'

// 查询Report列表
export function listReport(query) {
    return request({
        url: '/api/v1/report',
        method: 'get',
        params: query
    })
}

// 查询Report详细
export function getReport (id) {
    return request({
        url: '/api/v1/report/' + id,
        method: 'get'
    })
}

// 新增Report
export function addReport(data) {
    return request({
        url: '/api/v1/report',
        method: 'post',
        data: data
    })
}

// 修改Report
export function updateReport(data) {
    return request({
        url: '/api/v1/report/'+data.id,
        method: 'put',
        data: data
    })
}

// 删除Report
export function delReport(data) {
    return request({
        url: '/api/v1/report',
        method: 'delete',
        data: data
    })
}

