/**
 * @Description:
 * @author ZeroTower
 * @date 2021/10/14
 */

const consola = require('consola');  //测试打印数据时使用
const proCategoryService=require('../../services/admin/proCategoryService');
const {generateRightModel, generateWrongModel} =require('../../utils/helps')
module.exports={
    //获取树型数据
     getTreeData:async (ctx)=>{
        const data=await proCategoryService.getTreeProCategory();
        if(data.length){
            ctx.body={
                status:200,
                msg:'获取数据成功',
                data
            }
        }
        else{
            ctx.body={
                status: 'error',
                msg:'获取数据失败',
                data:null
            }
        }
    },
    //更新数据
    updateProCate:async (ctx)=>{
         const {proId,data}=ctx.request.body;
         const result=await proCategoryService.updateDataById(proId,data);
         if(result[0]===1){
             ctx.body=generateRightModel("修改数据成功",null);
         }
         else{
             ctx.body=generateWrongModel('修改数据失败',5000)
         }
    },
    //增加数据
    addOneData:async (ctx)=>{
         //get data
        const data=ctx.request.body;
        //add data
        const result=await proCategoryService.addOneData(data)
        if(result[0]===1){
            ctx.body=generateRightModel('增加数据成功');
        }
    },
    //删除数据
    deleteOneData:async (ctx)=>{
        //get data
        const {proId}=ctx.request.body;
        //delete data
        const result =await proCategoryService.deleteOneData(proId);
        if(result[0]===1){
            ctx.body=generateRightModel("删除数据成功");
        }
        else{
            ctx.body=generateWrongModel("删除数据失败")
        }
    },

}
