/**
 * @Description: 轮播图逻辑控制层
 * @author ZeroTower
 * @date 2021/10/08
 */

const SwiperService = require("../services/admin/swiperService");

module.exports={
    findAllSwipers:async ctx=>{
        let result=await SwiperService.findAllSwipers();
        console.log(result);
        if(result.length>0){
            result=result.map(item=>{
                return {
                    id:item.id,
                    url:item.url
                }
            })
            ctx.body={
                status:200,
                msg:'查找所有的轮播图成功',
                data:result
            }
        }
    }
}
