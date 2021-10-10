/**
 * @Description:
 * @author ZeroTower
 * @date 2021/10/10
 */

import request from '@/utils/request'

//获取所有的
export function getSwiperList(query){
  return request({
    url:'/admin/swiper',
    method:'get',
    params:query
  })
}

//根据指定的id获取
export function getSwiperById(id){
  return request({
    url:`/admin/swiper`,
    method:'get'
  })
}

//添加一张轮播图
export function addOneSwiper(data){
  return request({
    url:'/admin/swiper',
    method:'post',
    data
  })
}
// 通过id更新轮播图
export function updateSwiperById(id,data){
  return request({
    url:`/admin/swiper/${id}`,
    method:'put',
    data
  })
}

//删除轮播图
export function deleteSwiperById(id){
  return request({
    url:`/admin/swiper/${id}`,
    method:'delete',
  })
}
