/**
 * @Description: 网站信息控制层
 * @author ZeroTower
 * @date 2021/10/08
 */

const webInfoService=require("../services/admin/webInfoService")

module.exports={
    getLatestInfo:async ctx=>{
        const result=await webInfoService.getLatestWebInfo();
        console.log(result)
        if(typeof result ==='object' && 'info' in result){
            ctx.body={
                status:200,
                msg:'获取网站信息成功',
                data:JSON.parse(result.info) ||{}
            }
        }
        else{
            //todo:
            ctx.body={
                status: 'error',
                msg:'获取信息错误',
                data:null
            }
        }
    }
}

