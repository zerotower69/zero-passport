/**
 * @Description: 网站信息服务层
 * @author ZeroTower
 * @date 2021/10/08
 */

const {WebInfo} =require('../../models')

class WebInfoService{
    // 获取最新的网站信息
    async getLatestWebInfo(){
        const result=await WebInfo.findAll({
            order:[['create_time','DESC']]
        })
        if(result.length && result.length>0){
           return Promise.resolve(result[0])
        }
        else{
            return Promise.reject("结果错误")
        }
    }
    //管理端时查看所有的版本网站信息
    async getAll(){
        return WebInfo.findAll();
    }
    //按id删除
    async deleteWebInfoById(id){
        return WebInfo.destroy({
            where:{
                id:id
            }
        })
    }
    //按版本号删除
    async deleteWebInfoByVersion(version){
        return WebInfo.destroy({
            where:{
                version:version
            }
        })
    }
    //增加新的网站信息，版本号+1
    async addNewWebInfo(data){
        const oVersion=WebInfo.count;
        const nVersion=oVersion+1;
        if(typeof data ==='object'){
            data.version=nVersion;
            return WebInfo.create(data);
        }
        else{
            return Promise.reject("the data must be an object!!")
        }
    }
    //修改原来的网站信息,通过id或者版本号
    async updateByIdOrVersion(updateKey,updateVal,nData){
        if(['id','version'].includes(updateKey)){
            if(updateKey==='id'){
                return WebInfo.update(nData,{
                    where:{
                        id:updateVal
                    }
                })
            }
            // the updateKey is 'version'
            else {
                return WebInfo.update(nData,{
                    where:{
                        version:updateVal
                    }
                })
            }
        }
        else{
            return Promise.reject("The update key must be id or version")
        }
    }
}

module.exports=new WebInfoService();
