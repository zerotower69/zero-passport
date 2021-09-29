<template>
<div>
  <div class="app-wrapper" :style="dStyle">
      <div class="app-header">
         <Header></Header>
      </div>
    <router-view/>
  </div>
  <div ref="footer" class="app-footer">
    <Footer></Footer>
  </div>
</div>
</template>

<script>
import Header from '../components/public/Header'
import Footer from '../components/public/Footer'
export default {
  name: 'Layout',
  components: { Footer, Header },
  data: () => {
    return {
      dStyle: ''
    }
  },
  computed: {
    mainMinHeight () {
      if (this.$refs.footer) {
        return window.innerHeight - this.$refs.footer.$el.offsetHeight
      } else {
        return 500
      }
      // return (window.innerHeight - this.$refs.footer.$el.offsetHeight)
    }
  },
  methods: {
    dymaticStyle () {
      if (this.$refs.footer) { this.dStyle = { minHeight: `${window.innerHeight - this.$refs.footer.offsetHeight - 1}px` } } else {
        this.dStyle = ''
      }
    }
  },
  mounted () {
    this.dymaticStyle()
    window.addEventListener('resize', () => {
      this.dymaticStyle()
    })
  },
  beforeDestroy () {
    window.addEventListener('resize', () => {
      this.dymaticStyle()
    })
  }
}
</script>

<style scoped>

</style>
