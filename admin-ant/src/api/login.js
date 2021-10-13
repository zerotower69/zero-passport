import request from '@/utils/request'

const userApi = {
  Login: '/admin/login',
  Logout: '/admin/logout',
  ForgePassword: '/admin/forge-password',
  Register: '/admin/register',
  twoStepCode: '/admin/2step-code',
  SendSms: '/admin/account/sms',
  SendSmsErr: '/admin/account/sms_err',
  // get my info
  UserInfo: '/admin/info',
  UserMenu: '/admin/user/nav',
  //获取路由
  Routes:'/admin/routes'
}

/**
 * login func
 * parameter: {
 *     username: '',
 *     password: '',
 *     remember_me: true,
 *     captcha: '12345'
 * }
 * @param parameter
 * @returns {*}
 */
export function login (parameter) {
  return request({
    url: userApi.Login,
    method: 'post',
    data: parameter
  })
}

export function getSmsCaptcha (parameter) {
  return request({
    url: userApi.SendSms,
    method: 'post',
    data: parameter
  })
}

export function getInfo () {
  return request({
    url: userApi.UserInfo,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}

export function getRoutes(){
  return request({
    url:userApi.getRoutes,
    method:'get',
  })
}

export function getCurrentUserNav () {
  return request({
    url: userApi.UserMenu,
    method: 'get'
  })
}

export function logout () {
  return request({
    url: userApi.Logout,
    method: 'post',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}

/**
 * get user 2step code open?
 * @param parameter {*}
 */
export function get2step (parameter) {
  return request({
    url: userApi.twoStepCode,
    method: 'post',
    data: parameter
  })
}
