<template>
<el-card>
  <el-form
  :model="swiperForm"
  :rules="ruleSwiperForm"
  ref="swiperForm"
  >
    <el-form-item label="轮播图地址" prop="url">
      <el-input v-model="swiperForm.url" label="轮播图地址">
        ></el-input>
      <!--      todo: upload image to aliyun oss-->
      <el-image
        v-if="swiperForm.url!==''"
        style="display: block" :src="swiperForm.url"></el-image>
    </el-form-item>
    <el-form-item prop="info" label="备注信息">
      <markdown ref="infoMd" v-model="swiperForm.info" class="markdown"></markdown>
    </el-form-item>
    <el-form-item>
      <el-popconfirm
        confirm-button-text="确定修改"
        cancel-button-text="不用了"
        icon="el-icon-info"
        icon-color="red"
        title="确认更新该轮播图吗？"
        @onConfirm="updateSwiper"
      >
        <el-button slot="reference" type="primary" round plain>更新</el-button>
      </el-popconfirm>
    </el-form-item>
  </el-form>
</el-card>
</template>

<script>
import Markdown from '@/components/MavonEditor'
import {getSwiperById,updateSwiperById} from '@/api/swiper'
export default {
  name: "editSwiper",
  components:{Markdown},
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
          // console.log(data);
          this.swiperForm=data;
        }
        else{
          this.$message.error("获取轮播图详情失败")
        }
      })
    },
    updateSwiper(){
      this.swiperForm.info=this.$refs.infoMd.content;
      if(this.swiperForm!=={}){
        this.$refs.swiperForm.validate((valid)=>{
          if(valid){
            updateSwiperById(this.swiperId,this.swiperForm).then(response=>{
              const res=response.data;
              if(res.status===200){
                this.$message.success("更新成功");
              }
              else{
                this.$message.error("更新数据失败");
              }
            })
          }
          else{
            this.$message.error("输入校验失败");
          }
        })
      }
    }
  }
}
</script>

<style scoped>

</style>
