const { sequelize, DataTypes } = require("../config/connect") // 引入相关依赖以及数据库

const Image = sequelize.define("aw_images",{
    id:{//表字段信息配置
        type: DataTypes.INTEGER(11), // 字段类型
        allowNull: false, // 是否允许为空
        autoIncrement: true,
        primaryKey: true, // 是否主键
    },
    //todo:为oss链接
    url:{
        type:DataTypes.STRING,
        allowNull: false,
        default:'',
        comment:'url链接，图片后期存放在oss'
    },
    type:{
        type:DataTypes.STRING,
        allowNull:false,
        default: 'swiper',
        comment: '类型:swiper--轮播图图片,background--背景图图片,product--产品图片'
    },
    info:{
        type:DataTypes.STRING,
        comment:'补充信息'
    }
},{
    timestamps: true,

        // 不想要 createdAt
        createdAt: 'create_time',

        // 想要 updatedAt 但是希望名称叫做 updateTimestamp
        updatedAt: 'update_time'
})

module.exports=Image;
