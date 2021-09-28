<template>
    <div class="swipper-wrapper">
        <!-- 轮播图  大图 PC显示-->
        <el-carousel height="450px" :interval="6000">
          <el-carousel-item v-for="(ii,index) in images" :key="'swiper-image-'+index">
             <div :style="{background:`url(${ii}) 50%/cover no-repeat`,width:'100vw',height:'inherit'}" class="swiper-image-item"></div>
          </el-carousel-item>
        </el-carousel>
    </div>
</template>

<script>
export default {
  name: 'Swipper',
  data: () => {
    return {
      images: [
        'https://th.wallhaven.cc/lg/72/72rd8e.jpg',
        'https://img0.baidu.com/it/u=2794087313,1680445589&fm=26&fmt=auto',
        'https://img1.baidu.com/it/u=3550210899,1255484598&fm=26&fmt=auto'
      ]
    }
  }
}
</script>
