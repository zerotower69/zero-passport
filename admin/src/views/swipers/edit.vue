<template>
<el-card>
  <el-form
  :model="swiperForm"
  :rules="ruleSwiperForm"
  ref="swiperForm"
  >

  </el-form>
</el-card>
</template>

<script>
import MarkDown from '@/components/MavonEditor'
import {getSwiperById,updateSwiperById} from '@/api/swiper'
export default {
  name: "editSwiper",
  components:{MarkDown},
  data:()=>{
    return{
      swiperForm:{
        url:'',
        info:''
      },
      ruleSwiperForm:{
        url:[{
          required:true,
          message:'轮播图的路径地址',
          trigger:['blur','change']
        }]
      }
    }
  },
  computed:{
    swiperId(){
      return this.$route.params && this.$route.params.id;
    }
  },
  mounted() {
    this.getSwiperDetail();
  },
  methods:{
    getSwiperDetail(){
      getSwiperById(this.swiperId).then(response=>{
        const res=response.data;
        if(res.status===200){
          const data=res.data;
          console.log(data);
        }
        else{
          this.$message.error("获取轮播图详情失败")
        }
      })
    },
    editSwiper(){

    }
  }
}
</script>

<style scoped>

</style>
