<template>
    <div>
       <div class="header-top__wrapper">
         <div class="header-top__left">
<!--           logo 预留-->
           <div class="website-logo">

           </div>
<!--           网站名-->
           <div class="website-info">
             <h1 class="website-info__name">{{websiteName}}</h1>
<!--             todo:小字说明-->
             <span></span>
           </div>
         </div>
<!--         todo:电话号码-->
         <div class="header-top__right">
         </div>
       </div>
      <Nav></Nav>
    </div>
</template>
<script>
import Nav from './Nav'
import Triangle from '../Triangle'
export default {
  name: 'Header',
  components: { Triangle, Nav },
  data: () => {
    return {
      websiteName: '北京xxx公司'
    }
  },
  methods: {
  }
}
</script>

<style lang="less" scoped>
.header-top__wrapper{
  display: inline-flex;
  .header-top__left{
    margin-left:300px;
    display: inline;
  }
  .header-top__right{
    display: inline;
    background-color: green;
    border-radius: 8px;
    width: 300px;
    height: 80%;
    min-height: 70px;
    margin-left: 20vw;
    justify-self: center;
  }
}
.test{
  color:limegreen;
}
.default-bg-color{
  background-color: orange!important;
  border-bottom-color:orange!important;
  font-weight: bolder!important;
}
</style>
