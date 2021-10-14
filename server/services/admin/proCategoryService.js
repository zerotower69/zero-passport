/**
 * @Description:产品目录服务   分为一级和二级目录
 * @author ZeroTower
 * @date 2021/5/29
 */

const {
    proCategory
}  =require('../../models/index')
const consola=require('consola');
class ProCategoryService{
    //返回树型的数据
    async getTreeProCategory(){
        let treeData=[];
        const {
            count,
            rows
        }=await proCategory.findAndCountAll({
            attributes:{
                exclude:['create_time','update_time']
            }
        });
        // console.log("count===>"+count)
        // consola.info(rows);
        if(count>0){
            const allDataLevelOne=rows.filter(item=>item.dataValues.parent_id==null);
            consola.info(allDataLevelOne);
            const allDataLevelTwo =rows.filter(item=>item.dataValues.parent_id!==null);
            allDataLevelOne.forEach(one=>{
                let children=[];
                allDataLevelTwo.forEach(two=>{
                    if(two.parent_id===one.id){
                        children.push(two);
                    }
                })
                treeData.push({
                    data:one,
                    children
                })
            })
            return Promise.resolve(treeData)
        }
        //todo: setting wrong model!!
        else{
            return Promise.resolve({})
        }
    }
    //返回列表数据
    async getAllListData(){
        return proCategory.findAll({
            attributes:{
                exclude:['create_time','update_time']
            }
        })
    }
    //更新某条数据
    async updateDataById(id,data){
        return proCategory.update(data,{
            where:{
                id:id
            }
        })
    }
    // 插入某条数据
    async addOneData(data){
        return proCategory.create(data);
    }
    //返回一级的数据
    async getLevelOneData(){
        return proCategory.findAll({
            where:{
                parent_id:null
            }
        })
    }
    //返回二级的数据
    async geeLevelTowData(){
        return proCategory.findOne({
            where:{
            }
        })
    }
    //删除某条数据
    async deleteOneData(proId){
        return proCategory.destroy({
            where:{
                id:proId
            }
        })
    }
}

module.exports=new ProCategoryService();
