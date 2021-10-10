<template>
<el-card>
  <el-table
  :data="tableData"
  height="500"
  stripe
  :row-style="{height:50+'px'}"
  :cell-style="{padding:0+'px'}"
  style="width: 100%"
  >
    <el-table-column
      type="index"
      label="序号"
      width="50"
      header-align="center"
      align="center"
    />
    <el-table-column
      prop="url"
      label="轮播图地址"
      width="260"
      show-overflow-tooltip
      header-align="center"
      align="center"
    />
    <el-table-column
      v-slot="scope"
      label="操作"
      width="220"
      header-align="center"
      align="center"
      >
      <el-button  type="primary" round plain size="small" @click="editClick(scope.row.id)">编辑</el-button>
    </el-table-column>
  </el-table>
  <el-pagination
    class="pagination"
    :current-page.sync="pageInfo.pagenum"
    :page-size="pageInfo.pagesize"
    layout="prev, pager, next, jumper"
    :total="total"
    @current-change="handleCurrentChange"
  ></el-pagination>
</el-card>
</template>

<script>

import {getSwiperList} from "@/api/swiper"
export default {
  name: "listSwiper",
  components:{},
  data:()=>{
    return{
      tableData:[],
      // 查询参数
      pageInfo: {
        // 当前页码
        pagenum: 1,
        // 当前每页显示多少条数据
        pagesize: 10
      },
      // 总页数
      total: 0
    }
  },
  // 每次进入路有前，重新获取数据
  beforeRouteEnter(to, from, next) {
    next(vm => {
      vm.getSwiperList();
    })
  },
  methods:{
    getSwiperList(){
      //todo:
      getSwiperList(this.pageInfo).then(response=>{
        const res=response.data;
        if(res.status===200){
          this.tableData = res.data.list
          // this.$message.success('获取职位列表成功')
        }
        else{
          this.$message.error("获取轮播图信息失败")
        }
      })
    },
    handleCurrentChange(val) {
      // console.log(`当前页: ${val}`)
      // this.getJobList()
      //todo: change page do something!!
      this.getSwiperList();
    },
    editClick(value){
      this.$router.push(`edit/${value}`)
    }
  }
}
</script>

<style scoped>

</style>
