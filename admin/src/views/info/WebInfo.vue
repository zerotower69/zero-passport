<template>
<el-card class="web-info">

</el-card>
</template>

<script>
export default {
  name: "WebInfo",
  data:()=>{
    return{
      infoForm:{

      }
    }
  },
  created() {

  },
  methods:{
    getWebInfo(){
      this.$http.get('/')
    }
  }
}
</script>

<style scoped>

</style>
