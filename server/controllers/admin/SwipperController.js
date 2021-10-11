/**
 * @Description: 轮播图逻辑控制层
 * @author ZeroTower
 * @date 2021/10/08
 */

const SwiperService = require("../../services/admin/swiperService");

module.exports={
    findAllSwipers:async (ctx)=>{
        // console.log("request",ctx.query);
        const query = ctx.query;
        // console.log("params===>",params)
        const {
            count,
            rows
        }=await SwiperService.findAllSwipers(query);
        if(rows.length>0){
            ctx.body={
                status:200,
                msg:'查找所有的轮播图成功',
                data:{
                    list:rows,
                    total:count,
                    limit:parseInt(query.pagesize) || 10,
                }
            }
        }
    },
    findSwiperById:async ctx=>{
        const id=ctx.url.substring(21);
        console.log("id====>",id);
        if(id){
           const result=await SwiperService.findSwiperById(id);
           // console.log(result);
           if(result.dataValues){
               ctx.body={
                   status:200,
                   msg:'查找指定的轮播图成功',
                   data:result.dataValues
               }
           }
           else{
               ctx.body={
                   status:"error",
                   msg:'查找指定的轮播图失败',
                   data:null
               }
           }
        }
    },
    deleteSwiperById:async ctx=>{
        const id=ctx.url.substring(21);
        if(id) {
            const result =await SwiperService.deleteSwiperById(id);
            if(result===1){
                ctx.body={
                    status:200,
                    msg:'删除指定轮播图成功',
                    data:null
                }
            }
            else{
                ctx.body={
                    status:'error',
                    msg:'删除指定轮播图失败',
                    data:null
                }
            }
        }
        else{
            ctx.body={
                status:'error',
                msg:'删除时未指定id',
                data:null
            }
        }
    },
    //增加
    addOneSwiper:async ctx=>{
        const data=ctx.request.body;
        const {url}=data;
        if(url && typeof url ==='string'){
           const result=await SwiperService.addOneSwiper(url);
           console.log("增加轮播图一张===>",result);
           ctx.body={
               status:200,
               msg:'增加轮播图成功',
               data:null
           }
        }
        else{
            //todo:参数错误时
        }
},
    //增加一些
    addSomeSwipers:async ctx=>{
        const data=ctx.request.body;
        const {urlList}=data;
        if(urlList instanceof Array && urlList.length>0){
           const result=await SwiperService.addSomeSwiper(urlList);
            console.log("增加轮播图若干===>",result);
           ctx.body={
               status:200,
               msg:'增加数据成功',
               data:null
           }
        }
        else{
            //todo:
        }
    },
    updateSwiperById:async ctx=>{
        const data=ctx.request.body;
        const {url}=data;
        const id=ctx.url.substring(21);
        if(id && url){
            await SwiperService.updateSwiperById(id,url);
            ctx.body={
                status:200,
                msg:'更新数据成功',
                data:null
            }
        }
        else{
            //todo:
        }
    }

}
