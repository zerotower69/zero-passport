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
        confirm-button-text="确定添加"
        cancel-button-text="不用了"
        icon="el-icon-info"
        icon-color="red"
        title="确认添加该轮播图吗？"
        @onConfirm="addSwiper"
        >
        <el-button slot="reference" type="primary" round plain>添加</el-button>
      </el-popconfirm>
    </el-form-item>
  </el-form>
</el-card>
</template>

<script>
import Markdown from '@/components/MavonEditor'
import {updateSwiperById,addOneSwiper} from '@/api/swiper'
export default {
  name: "createSwiper",
  components:{Markdown},
  data:()=>{
    return{
      isUpdate:false,
      updateId:'',
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
  beforeRouteEnter(to, from, next) {
    next(vm => {
      //todo:
    })
  },
  mounted() {

  },
  methods:{
    addSwiper(){
      const that=this;
      this.swiperForm.info=this.$refs.infoMd.content;
      console.log("添加的轮播图的信息");
      this.$refs.swiperForm.validate((valid)=>{
        if(valid){
          if(that.isUpdate){

          }
          else{
            addOneSwiper(this.swiperForm)
            .then(response=>{
              const res=response.data;
              if(res.status===200){
                that.$message.success("增加成功");
                that.$router.push('list')
              }
              else{
                that.$message.error("增加轮播图失败")
              }
            })
          }
        }
        else{
          this.$message.error("添加失败，请仔细检查填写是否复合规范");
          return false;
        }
      })
    }
  }

}
</script>

<style lang="scss" scoped>
.el-card {
  margin: 20px;
}

.el-form {
  width: 100%;
}

::v-deep {
  .el-form-item:nth-child(1) .el-form-item__content,
  .el-form-item:nth-child(3) .el-form-item__content,
  .el-form-item:nth-child(4) .el-form-item__content {
    margin-left: 28px;
  }

  .el-form-item:nth-child(5) {
    margin-left: 105px;
  }

  .el-input__inner {
    width: 200px;
  }

}
.markdown {
  height: 30%;
  width: 1100px;
}
</style>
