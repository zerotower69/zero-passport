<template>
<el-card>
<!--  技术支持-->
  <div class="title">技术支持页面</div>
  <markdown ref="md" v-model="content"></markdown>
</el-card>
</template>

<script>
import Markdown from "@/components/MavonEditor";
export default {
  name: "Support",
  components: {Markdown},
  content:''
}
</script>

<style scoped>

</style>
