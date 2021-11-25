/**
 * @Description:
 * @author Aerowang
 * @date 2021/5/29
 */
const Router = require('koa-router')
const router = new Router()

const menuController =require('../../controllers/admin/MenuController')

const routers=router
.post('/menu/list',menuController.getMenuList)
    .get('/menu/level/list',menuController.getLevelMenuList)

module.exports=routers
