/**
 * @Description:  网页信息： 关于我们,技术支持,联系我们......
 * @author ZeroTower
 * @date 2021/10/13
 */

import request from '@/utils/request'
import {easyGenerateUrl} from '@/utils/helps'

//获取页面的信息
export function getPageInfo(name){
  return request({
    url:easyGenerateUrl('/admin/page',{name:name}),
    get:'get'
    }
  )
}

//更新页面文章信息
export function updatePageInfo(data){
  return request({
    url:'/admin/page',
    method:'put',
    data
  })
}

//删除页面的信息
export function deletePageInfo(id){
  return request({
    url:'/admin/page',
    method:'delete',
    data:{
      deleteId:id
    }
  })
}

//增加页面信息
export function addPageInfo(data){
  return request({
    url:'/admin/page',
    method:'post',
    data
  })
}

