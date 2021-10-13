/**
 * @Description:  网站信息
 * @author ZeroTower
 * @date 2021/10/13
 */

import request from '@/utils/request'

//  获取最新的网站信息
export function  getLatestWebInfo(){
  return request({
    url:'/admin',
    method:'get'
  })
}

//网站信息更新
export function updateWebInfo(data){
  return request({
    url:'/admin',
    method:'post',
    data
  })
}
