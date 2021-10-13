/**
 * @Description:  网站信息
 * @author ZeroTower
 * @date 2021/10/13
 */

import request from '@/utils/request'

const api={
    GetLatest:'/admin',
    Update:'/admin'
}

export default api;

//  获取最新的网站信息
export function  getLatestWebInfo(){
  return request({
    url:api.GetLatest,
    method:'get'
  })
}

//网站信息更新
export function updateWebInfo(data){
  return request({
    url:api.Update,
    method:'post',
    data
  })
}
