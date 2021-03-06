const Router = require('koa-router')
const router = new Router()
// const auth = require('../../controllers/auth')
const news = require('../../controllers/articleController')
const product = require('../../controllers/productController')
const job = require('../../controllers/jobController')
const swiper =require('../../controllers/SwipperController')
const webinfo=require('../../controllers/webInfoController')
const proCategory =require('../../controllers/admin/proCategoryController')
const routers = router
  // 新闻
  .get('/newslist', news.newsList)
  .get('/recomNews', news.recommendNews)
  .get('/hotnews', news.hotNews)
  .get('/searchnews/:keyword', news.searchNews)
  .get('/article/:path', news.newsDetail)
  // 产品
  .get('/products', product.productList)

  .get('/job-filters', job.jobFilter)
  .post('/job', job.jobList)
  .get('/job/:id', job.getJobDetail)
  //轮播图
  .get('/swiper',swiper.findAllSwipers)
//网站基本信息
    .get('/',webinfo.getLatestInfo)
  //获取商品分类数据
    .get('/pro/category/tree',proCategory.getTreeData)
module.exports = routers
