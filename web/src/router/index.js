import Vue from 'vue'
import VueRouter from 'vue-router'
import Layout from '../views/Layout'

Vue.use(VueRouter)

const routes = [{
  path: '/index',
  component: Layout,
  children: [{
    path: '/',
    name: 'Index',
    component: () => import('@/views/index.vue')
  }]
},
{
  path: '/',
  redirect: 'index'
},
{
  path: '/skills',
  component: Layout,
  children: [{
    path: '/',
    name: 'Skill',
    component: () => import('@/views/Skills.vue')
  }]
},
{
  path: '/about',
  component: Layout,
  children: [{
    path: '/',
    name: 'About',
    component: () => import('@/views/About.vue')
  }]
}, {
  path: '/news',
  component: Layout,
  children: [{
    path: '/',
    name: 'News',
    component: () => import('@/views/News.vue')
  }, {
    path: ':id',
    name: 'NewsDetail',
    component: () => import('@/views/newsDetail.vue')
  }]
}, {
  path: '/product',
  component: Layout,
  children: [
    {
      path: '/',
      name: 'Product',
      component: () => import('@/views/Product.vue')
    }
  ]
}]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
