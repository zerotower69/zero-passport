const {
  sequelize,
  DataTypes
} = require('../config/connect')
const Products = sequelize.define(
  'aw_products',
  {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false, // 是否允许为空
      autoIncrement: true,
      primaryKey: true, // 是否主键
    },
    cover_img: {
      type: DataTypes.STRING,
      allowNull: false,
      comment: '产品图片'
    },
    product_logo: {
      type: DataTypes.STRING,
      allowNull: false,
      comment: '产品logo'
    },
    product_name: {
      type: DataTypes.STRING,
      // allowNull: false,
      comment: '产品英文名称'
    },
    product_title: {
      type: DataTypes.STRING,
      allowNull: false,
      comment: '产品中文名称'
    },
    product_desc: {
      type: DataTypes.STRING,
      allowNull: false,
      comment: '产品描述'
    },
    product_sub_desc: {
      type: DataTypes.STRING,
      // allowNull: false,
      comment: '产品详细描述'
    },
    product_link: {
      type: DataTypes.STRING,
      comment: '产品详情链接'
    },
      use_git:{
        type:DataTypes.BOOLEAN,
          allowNull:false,//不允许为空
          comment:'是否使用git'
      },
      github_addr:{
        type:DataTypes.STRING,
          comment:'github链接'
      },
      gitee_addr:{
        type:DataTypes.STRING,
          comment:'gitee链接'
      },
      category_id:{
        type:DataTypes.INTEGER(11),
        allowNull:true,  //todo:change to false
        comment:'分类id(二级)'
      }
  }, {
    timestamps: true,

    // 不想要 createdAt
    createdAt: 'create_time',

    // 想要 updatedAt 但是希望名称叫做 updateTimestamp
    updatedAt: 'update_time'
  }
)
// News.sync({force:true}) // 是否自动创建表

module.exports = Products
