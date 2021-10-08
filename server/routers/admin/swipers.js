/**
 * @Description:  管理端接口 轮播图 路由层
 * @author ZeroTower
 * @date 2021/10/08
 */

const Router = require('koa-router')
const router = new Router()
const swiper = require("../../controllers/admin/SwipperController")
const routers=router
 .get("/swiper/:id",swiper.findSwiperById)
 .get("/swiper",swiper.findAllSwipers)
 .post("/swiper",swiper.addOneSwiper)
 .post("/swiper/many",swiper.addSomeSwipers)
 .delete("/swiper/:id",swiper.deleteSwiperById)
    .put("/swiper/:id",swiper.updateSwiperById)

module.exports=routers;
