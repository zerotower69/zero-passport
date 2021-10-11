/**
 * @Description: 轮播图API
 * @author ZeroTower
 * @date 2021/10/08
 */

const {Image} =require("../../models/index")

class SwiperService {
    //查找所有的轮播图,
    async findAllSwipers(params){
        // console.log(params);
        return Image.findAndCountAll({
            where:{
                type:'swiper'
            },
            limit: parseInt(params.pagesize),
            // 跳过实例数目
            offset: (params.pagenum - 1) * parseInt(params.pagesize),
        });
    }
    //查找指定id的轮播图
    async findSwiperById(id){
        return Image.findOne({
            where:{
                id:id
            },
            attributes: { exclude: ['create_time', 'update_time'] },
        })
    }
    //删除指定id的轮播图
    async deleteSwiperById(id){
        return Image.destroy({
            where:{
                id:id
            }
        })
    }
    //增加一张轮播图
    async addOneSwiper(url) {
        return Image.create({url: url, type: 'swiper'})
    }
    //批量增加轮播图
    async addSomeSwiper(urlList){
        if(!(urlList instanceof Array)){
        return Promise.reject("urlList isn't array!")
        }
        let array=[];
        for(let i=0,j=urlList.length;i<j;i++){
            array.push({url:urlList[i],type:'swiper'})
        }
        return Image.bulkCreate(array)
    }
    //根据id修改轮播图地址
    async updateSwiperById(id,url){
        return Image.update({url:url},{
            where:{
                id:id
            }
        })
    }
}

module.exports=new SwiperService();
