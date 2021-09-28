<template>
<div class="product-list-wrapper">
  <el-card v-for="({name,url,github,id}) in productList" :key="id">
   {{name}}+{{url}}+{{github}}
  </el-card>
</div>
</template>

<script>
export default {
  name: 'ProductList',
  data: () => {
    return {
      productList: []
    }
  }
}
</script>

<style scoped>

</style>
