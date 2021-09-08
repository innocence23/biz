import request from '@/utils/request'

export function getSetConfig(query) {
  return request({
    url: '/api/v1/set-config',
    method: 'get'
  })
}

export function updateSetConfig(data) {
  return request({
    url: '/api/v1/set-config',
    method: 'put',
    data: data
  })
}
