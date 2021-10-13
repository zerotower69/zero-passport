/**
 * @Description:
 * @author Aerowang
 * @date 2021/5/29
 */
import request from '@/utils/request'
import {easyGenerateUrl} from '@/utils/helps'
export function addProduct(data) {
  return request({
    url:'/admin/product',
    method: 'post',
    data
  })
}
export function updateProduct(id, data) {
  return request({
    url: `/admin/product/${id}`,
    method: 'put',
    data
  })
}
export function deleteProduct(id) {
  return request({
    url: `/admin/product/${id}`,
    method: 'delete'
  })
}
export function getProductList(pageBean) {
  return request({
    url: easyGenerateUrl('/admin/product',pageBean),
    method: 'get'
  })
}
export function getProductDetail(id) {
  return request({
    url: `/admin/product/${id}`,
    method: 'get'
  })
}
