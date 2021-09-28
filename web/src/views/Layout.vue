<template>
<div>
  <div class="app-header">
    <Header></Header>
  </div>
  <router-view/>
  <div class="app-footer">
    <Footer></Footer>
  </div>
</div>
</template>

<script>
import Header from '../components/public/Header'
import Footer from '../components/public/Footer'
export default {
  name: 'Layout',
  components: { Footer, Header }
}
</script>

<style scoped>

</style>
