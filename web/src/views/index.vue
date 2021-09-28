<template>
    <div>
     <!--      轮播图-->
      <swipper></swipper>
<!--     分类 -->
      <Category></Category>
    </div>
</template>

<script>

import Swipper from '../components/Swipper'
import Search from '../components/Search'
import Category from '../components/Category'
export default {
  name: 'index',
  components: {
    Category,
    Search,
    Swipper
  }
}
</script>
