/**
 * @description: 产品目录的基本模型
 */

const { sequelize, DataTypes } = require("../config/connect") // 引入相关依赖以及数据库

const proCategory=sequelize.define("aw_proCategory",{
    id:{
        type: DataTypes.INTEGER(11), // 字段类型
        allowNull: false, // 是否允许为空
        autoIncrement: true,
        primaryKey: true, // 是否主键,
        comment:'产品分类id'
    },
    parent_id:{
        type:DataTypes.INTEGER(11),
        allowNull: true,
        default:null,
        comment: "父id"
    },
    content:{
        type:DataTypes.STRING,
        comment:'分类内容'
    }

},{
    timestamps:true,
    createdAt:'create_time',
    updatedAt:'update_time',
    comment:'产品分类',
})

module.exports=proCategory;
