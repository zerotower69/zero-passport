import Vue from 'vue'
import router from './router'
import service from './request'
import store from './store'

import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import 'element-ui/lib/theme-chalk/display.css'

import './assets/style/common.css'
import './assets/font/iconfont'

import App from './App.vue'

Vue.prototype.$http = service

Vue.use(ElementUI)
new Vue({
  store,
  router,
  render: h => h(App)
}).$mount('#app')
