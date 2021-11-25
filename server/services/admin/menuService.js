/**
 * @Description:菜单服务   菜单分为一级和二级
 * @author ZeroTower
 * @date 2021/5/29
 */

const {
    MenuList,
    RoleMenuList,
    Role
}  =require('../../models/index')
const {Op} = require("sequelize");
const {generateWrongDataPlus} = require("../../utils/helps");

class MenuService{
    /**
     * @description 获取菜单列表，分页获取
     * @param  params
     */
    async getMenuList(params){
        params=params ||{};
        // console.log("params===>",params);
        let ops={};
        if('pageBean' in params){
            const pageBean=params.pageBean;
            ops.limit= pageBean.pagesize || 10;
            ops.offset=((pageBean.pagenum - 1) * parseInt(pageBean.pagesize));
        }
        if('level' in params){
            ops.where={
                parent_id:params.level==='01'?null:{[Op.gte]:1}
            }
        }
        console.log(ops);
        return MenuList.findAndCountAll(ops);
    }
    //获取一级菜单数据
    async getLevelOneMenuList(){
        return MenuList.findAndCountAll({
            where:{
                parent_id:null
            }
        })
    }
    //获取二级菜单数据
    async getLevelTowMenuList(){
        return MenuList.findAndCountAll({
            where:{
                parent_id:{
                    [Op.gte]:1
                }
            }
        })
    }
    //插入菜单数据
    async addOneMenu(data){
        const menuData={
            parent_id:data.parent_id ||null,
            name:data.name || null,
            icon:data.icon ||null,
            path:data.path || null,
            title:data.title || null
        }
        return MenuList.create(menuData)
    }
    //更新菜单数据
    async updateMenu(id,data){
        return MenuList.update(data,{
            where:{
                id:id
            }
        })
    }
    //删除某个菜单
    async deleteOneMenu(id){
        return MenuList.restore({
            where:{
                id:id
            }
        })
    }
    //批量授权
    async addBatchAuth(role,menuIdList){
        if(menuIdList instanceof Array){
            const roleId=await Role.findOne({
                attributes:{
                    include:['id']
                },
                where:{
                    name:role
                }
            })
            const roleMenuListData=menuIdList.map(item=>{
                return {
                    aw_menu_list_id:item.id,
                    aw_role_id:roleId
                }
            })
            return RoleMenuList.bulkCreate(roleMenuListData);
        }
        else{
            return Promise.reject(generateWrongDataPlus("授权数据错误")
            )
        }
    }
    //批量取消权限
    async removeBatchAuth(role,menuIdList){
        if(menuIdList instanceof Array){
            const roleId=await Role.findOne({
                attributes:{
                    include:['id']
                },
                where:{
                    name:role
                }
            })
            console.log('role_id===>',roleId);
            return Promise.all(menuIdList.map(item=>RoleMenuList.destroy({
                where:{
                    aw_role_id:roleId,
                    aw_menu_list_id:item
                }
            })))
        }
        else{
            return Promise.reject(generateWrongDataPlus("授权数据错误"))
        }
    }
}


module.exports=new MenuService();
