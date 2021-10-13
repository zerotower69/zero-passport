const TokenKey = 'Access-Token'

export function getToken() {
  return window.localStorage.getItem(TokenKey)
}

export function setToken(token) {
  // 1、保存 token 到 sessionStorage 中
  return window.localStorage.setItem(TokenKey, token)
}

export function removeToken() {
  return window.localStorage.removeItem(TokenKey)
}
