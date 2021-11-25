/**
 * @Description: 菜单逻辑控制层
 * @author ZeroTower
 * @date 2021/10/08
 */

const menuService =require('../../services/admin/menuService');
const {generateRightModel, generateWrongModel} = require("../../utils/helps");

module.exports={
    getMenuList:async (ctx)=>{
        const params =ctx.request.body;
        const {count,rows}=await menuService.getMenuList(params);
        console.log(count,rows);
        if(count>0){
            let data=rows.map(item=>item.dataValues);
            ctx.body=generateRightModel("获取菜单成功",{
                list:data,
                count
            });
        }
        else{
            ctx.body=generateWrongModel("获取菜单列表失败");
        }
    },
    getLevelMenuList:async (ctx)=>{
        const query=ctx.request.query;
        if('level' in query){
            if(['01','02'].includes(query.level)) {
                let countF,rowsF;
                if(query.level=='01'){
                 const {count,rows}= await  menuService.getLevelOneMenuList()
                    countF=count;
                 rowsF=rows;
                }
                else{
                    const {count,rows}= await  menuService.getLevelTowMenuList();
                    countF=count;
                    rowsF=rows;
                }
                if(countF>0){
                   const dataList=rowsF.map(item=>item.dataValues);
                   ctx.body=generateRightModel('获取数据成功',dataList);
                }
                else{
                    ctx.body=generateWrongModel("获取数据失败");
                }
            }

            else{
                ctx.body=generateWrongModel("要素参数传入错误")
            }
        }
        else{
            ctx.body=generateWrongModel("要素参数传入错误")
        }
    },
    updateMenu:async (ctx)=>{

    },
    deleteMenu:async (ctx)=>{

    }
}
