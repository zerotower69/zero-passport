/**
 * @description: 网站基本信息模型
 */

const { sequelize, DataTypes } = require("../config/connect") // 引入相关依赖以及数据库

const WebInfo=sequelize.define("aw_webinfo",{
    id:{
        type: DataTypes.INTEGER(11), // 字段类型
        allowNull: false, // 是否允许为空
        autoIncrement: true,
        primaryKey: true, // 是否主键
    },
    //info json
    info:{
        type:DataTypes.STRING,
        allowNull:false,
        comment:'网站信息的json字符串'
        /**
         * {
         *     website_name:
         *     email:
         *     phone:
         *     city:
         *     swiper_way:hover,
         *     com_name:'前端小分队',
         *     use_ICP:false,  //备案号
         *     police_number:''  //公安网备案号
         *     ICP_number:'' //ICP备案号
         *
         * }
         */
    },
    //版本号
    version:{
        type:DataTypes.INTEGER(5),
        allowNull: false,
        default:1,
        comment: '版本号自增'
    },
    notes:{
        type:DataTypes.TEXT,
        allowNull:true,
        comment:'补充说明'
    }
    },
    {
        timestamps:true,
        createdAt:'create_time',
        updatedAt:'update_time'
    })

module.exports=WebInfo;
