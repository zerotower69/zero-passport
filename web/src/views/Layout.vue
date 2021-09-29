<template>
<div class="app-wrapper">
  <div :style="{minHeight:mainMinHeight+'px'}">
    <div class="app-header">
    <Header></Header>
    </div>
      <router-view/>
  </div>
  <div class="app-footer">
    <Footer ref="footer"></Footer>
  </div>
</div>
</template>

<script>
import Header from '../components/public/Header'
import Footer from '../components/public/Footer'
export default {
  name: 'Layout',
  components: { Footer, Header },
  computed: {
    mainMinHeight () {
      return window.innerHeight - this.$refs.footer.$el.offsetHeight
    }
  }

}
</script>

<style lang="less" scoped>
.app-wrapper{
  width: 100%;
  min-height: 100%;
  //position: relative;
  .app-footer{
    bottom: 0;
    width: 100%;
  }
}
</style>
