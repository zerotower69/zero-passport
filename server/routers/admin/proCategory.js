/**
 * @Description:
 * @author ZeroTower
 * @date 2021/5/29
 */

const Router = require('koa-router')
const router = new Router()

const proCategory=require('../../controllers/admin/proCategoryController');

const routers=router
    .get('/pro/category/tree/data',proCategory.getTreeData)

module.exports=routers;

