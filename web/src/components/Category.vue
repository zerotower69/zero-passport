<template>
<div  class="category-wrapper">
<!--  title:产品推荐-->
  <div></div>
<!--  分类内容-->
  <div>
<!--    这部分还是改为flex布局好一点-->
    <div class="category-wrapper">
      <div class="category-container__left">
<!--        todo:是否可滚动-->
        <el-scrollbar>
          <div class="category-left">
            <div class="inner">
              <ul class="level-one">
                <li class="level-one-item" v-for="({title,children},index) in categoryTitle" :key="'level-1-'+(index+1)">
                  <div>
                  <span>{{title}}</span>
                  </div>
                  <ul class="level-two">
                    <li class="level-two-item" v-for="(child,index) in children" :key="'level-2-'+(index+1)">
                      {{child.title}}
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </el-scrollbar>
      </div>
      <div class="category-container__right">
          <div class="category-right">
            <div class="header">
              <p><strong>最新产品:</strong> <span>{{latestName}}</span></p>
            </div>
            <div class="product-exhibit__area">
              <el-scrollbar height="100px">
                <div class="product-exhibit__inner">
                 <el-card
                     v-for="(item) in productList"
                     :key="item.id"
                     class="product-container"
                     shadow="hover"
                 >
                  <img :src="item.image" alt=""/>
                   <div class="card-footer">
                     <p>{{item.name}}</p>
                     <p>{{item.desc}}</p>
                   </div>
                 </el-card>
                </div>
              </el-scrollbar>
            </div>
          </div>
      </div>
    </div>
  </div>
</div>
</template>

<script>
export default {
  name: 'Category',
  data: () => {
    return {
      // 产品分类是树型的数据
      categoryTitle: [
        {
          title: '产品分类一',
          children: [
            {
              title: '产品分类一类'
            },
            {
              title: '产品分类二类'
            },
            {
              title: '产品分类三类'
            },
            {
              title: '产品分类四类'
            }
          ]
        },
        {
          title: '产品分类二',
          children: [
            {
              title: '产品分类一类'
            },
            {
              title: '产品分类二类'
            },
            {
              title: '产品分类三类'
            },
            {
              title: '产品分类四类'
            }
          ]
        },
        {
          title: '产品分类三',
          children: [
            {
              title: '产品分类一类'
            },
            {
              title: '产品分类二类'
            },
            {
              title: '产品分类三类'
            },
            {
              title: '产品分类四类'
            }
          ]
        },
        {
          title: '产品分类四',
          children: [
            {
              title: '产品分类一类'
            },
            {
              title: '产品分类二类'
            },
            {
              title: '产品分类三类'
            },
            {
              title: '产品分类四类'
            }
          ]
        }],
      latestName: 'xx商城',
      productList: [
        {
          id: '1',
          image: 'https://th.wallhaven.cc/lg/y8/y8vlyk.jpg',
          url: 'https://www.zerotower.cn',
          name: 'xx商城',
          desc: '秋，为自己添加一份喜悦'
        },
        {
          id: '2',
          image: 'https://th.wallhaven.cc/lg/y8/y8vlyk.jpg',
          url: 'https://www.zerotower.cn',
          name: 'xx商城',
          desc: '秋，为自己添加一份喜悦'
        },
        {
          id: '3',
          image: 'https://th.wallhaven.cc/lg/y8/y8vlyk.jpg',
          url: 'https://www.zerotower.cn',
          name: 'xx商城',
          desc: '秋，为自己添加一份喜悦'
        }, {
          id: '4',
          image: 'https://th.wallhaven.cc/lg/y8/y8vlyk.jpg',
          url: 'https://www.zerotower.cn',
          name: 'xx商城',
          desc: '秋，为自己添加一份喜悦'
        }, {
          id: '5',
          image: 'https://th.wallhaven.cc/lg/y8/y8vlyk.jpg',
          url: 'https://www.zerotower.cn',
          name: 'xx商城',
          desc: '秋，为自己添加一份喜悦'
        }, {
          id: '6',
          image: 'https://th.wallhaven.cc/lg/y8/y8vlyk.jpg',
          url: 'https://www.zerotower.cn',
          name: 'xx商城',
          desc: '秋，为自己添加一份喜悦'
        }, {
          id: '7',
          image: 'https://th.wallhaven.cc/lg/y8/y8vlyk.jpg',
          url: 'https://www.zerotower.cn',
          name: 'xx商城',
          desc: '秋，为自己添加一份喜悦'
        }, {
          id: '8',
          image: 'https://th.wallhaven.cc/lg/y8/y8vlyk.jpg',
          url: 'https://www.zerotower.cn',
          name: 'xx商城',
          desc: '秋，为自己添加一份喜悦'
        }, {
          id: '9',
          image: 'https://th.wallhaven.cc/lg/y8/y8vlyk.jpg',
          url: 'https://www.zerotower.cn',
          name: 'xx商城',
          desc: '秋，为自己添加一份喜悦'
        }, {
          id: '10',
          image: 'https://th.wallhaven.cc/lg/y8/y8vlyk.jpg',
          url: 'https://www.zerotower.cn',
          name: 'xx商城',
          desc: '秋，为自己添加一份喜悦'
        }]
    }
  },
  computed: {
    rowCount () {
      return (Math.ceil(this.productList.length / 3))
    }
  },
  methods: {
    colCount (row) {
      const that = this
      const nums = row * 3
      if (nums <= that.productList.length) return 3
      else { return (that.productList.length - nums) }
    },
    getProduct (row, col) {
      const index = row * 3 + col
      if (index >= this.productList.length) {
        console.error('something error')
        return {}
      } else return this.productList[index]
    }
  }
}
</script>

<style lang="less" scoped>

.category-wrapper{
  /* css 适配 */
  margin: 60px 30px 0 30px;
  .category-wrapper{
    display: flex;
    .category-container__left{
      max-width: 20%;

    }
    .category-container__right{
      //width: 80%;
    }
  }
  .category-left{
    border: green solid 5px;
    background-color: green;
    height: fit-content;
    min-height: 550px;
  }
  .category-right{
    margin-left: 15px;
    .header{
      height: 65px;
      line-height: 65px;
      width: 100%;
      background-color: green;
      color: #FFFFFF;
      border-radius: 7px;
    }
    p{
      margin: 0;
      padding-left: 50px;
    }
  }
  .inner{
    border-radius: 5px;
    padding: 10px;
    height:auto;
    background-color: #FFFFFF;
    .level-one,.level-two{
      list-style: none;
    }
    .level-one-item{
      /* 一级分类的字体 */
      div{
        min-width: 150px;
        background-color: gray;
        span{
          color: #ffffff;
          margin:10px;
          font-size: 20px;
          font-weight: bolder;
        }
      }
    }
  }
  .product-exhibit__inner{
    display: grid;
    grid-template-columns: 33.33% 33.33% 33.33%;
    .product-container{
      margin:8px;
    }
  }
}

</style>
