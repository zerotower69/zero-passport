<template>
    <div>
        <el-menu mode="horizontal" class=""
                 :default-active="defaultActive"
                 :router="true"
                 text-color="#ffffff"
                 active-text-color="#ffffff"
                 background-color="#32CD32">
            <el-menu-item index="/" :class="{'default-bg-color':defaultActive==='/index'}">网站简介</el-menu-item>
            <el-menu-item index="/about" :class="{'default-bg-color':defaultActive==='/about'}">关于我们</el-menu-item>
            <el-menu-item index="/product" :class="{'default-bg-color':defaultActive==='/product'}">产品中心</el-menu-item>
            <el-menu-item index="/skills" :class="{'default-bg-color':defaultActive==='/skills'}">技术支持</el-menu-item>
            <el-menu-item index="/contract" :class="{'default-bg-color':defaultActive==='/contract'}">联系我们</el-menu-item>
        </el-menu>
    </div>
</template>
<script>
export default {
  name: 'Header',
  data: () => {
    return {
      defaultActive: '/'
    }
  },
  mounted () {
    this.watchRouter()
  },
  watch: {
    $route: {
      handler: function (val) {
        // console.log(val)
        this.defaultActive = val.fullPath
      },
      immediate: true
    }
  },
  methods: {
    watchRouter () {
      this.$watch('$router', function (val) {
        console.log(val)
      })
    }
  }
}
</script>

<style scoped>
.test{
  color:limegreen;
}
.default-bg-color{
  background-color: orange!important;
  border-bottom-color:orange!important;
  font-weight: bolder!important;
}
</style>
