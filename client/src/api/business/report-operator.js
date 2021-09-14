import request from '@/utils/request'

// 查询ReportOperator列表
export function listReportOperator(query) {
    return request({
        url: '/api/v1/report-operator',
        method: 'get',
        params: query
    })
}

// 查询ReportOperator详细
export function getReportOperator (id) {
    return request({
        url: '/api/v1/report-operator/' + id,
        method: 'get'
    })
}

// 新增ReportOperator
export function addReportOperator(data) {
    return request({
        url: '/api/v1/report-operator',
        method: 'post',
        data: data
    })
}

// 修改ReportOperator
export function updateReportOperator(data) {
    return request({
        url: '/api/v1/report-operator/'+data.id,
        method: 'put',
        data: data
    })
}

// 删除ReportOperator
export function delReportOperator(data) {
    return request({
        url: '/api/v1/report-operator',
        method: 'delete',
        data: data
    })
}

