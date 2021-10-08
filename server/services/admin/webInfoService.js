/**
 * @Description: 网站信息服务层
 * @author ZeroTower
 * @date 2021/10/08
 */

const {WebInfo} =require('../../models')

class WebInfoService{
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
}

module.exports=new WebInfoService();
