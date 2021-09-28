import Vue from 'vue'
import axios from 'axios'

const service = axios.create({
  timeout: 8000,
  baseURL: '/api'
})

// 请求拦截
service.interceptors.request.use(config => {
  return config
},
error => {
  console.log(error.message)
}
)

// 响应拦截
service.interceptors.response.use(response => {
  return response
},
error => {
  console.log(error.message)
})

export default service
