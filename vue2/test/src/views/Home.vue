<template>
<el-row>
  <el-col :span="12" v-for="i in ListData"  :key="i">
    <el-card :body-style="{ padding: '0px' }">
      <img v-bind:src="i.商品主图"  class="image">
      <div style="padding: 14px;">
        <span class="name">{{i.商品名称}}</span>
        <p class="myp">优惠券:{{i.优惠券面额}}</p>
        <div class="bottom clearfix">
          <!-- <time class="time">{{ currentDate }}</time> -->
          <el-button type="text" class="button">一键复制优惠券淘口令</el-button>
        </div>
      </div>
    </el-card>
  </el-col>
</el-row>

</template>

<style>
  .time {
    font-size: 13px;
    color: #999;
  }
  el-col{
    margin-bottom: 5px;
  }
  .bottom {
    margin-top: 13px;
    line-height: 12px;
  }
  .name{
    font-size: 12px;
  }

  .button {
    padding: 0;
    float: right;
  }

  .image {
    width: 100%;
    display: block;
  }
  .el-card__body{
    height: 160px;
  }
  .myp{
    color: red;
    font-size: 12px;
  }

  .clearfix:before,
  .clearfix:after {
      display: table;
      content: "";
  }
  
  .clearfix:after {
      clear: both
  }
</style>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import { DATA } from '../data';

import HelloWorld from '@/components/HelloWorld.vue'; // @ is an alias to /src

@Component({
  components: {
    HelloWorld,
  },
})
export default class Home extends Vue {
  private currentDate : any;
  private ListData:any;
  constructor(){
    super ();
    this.ListData=DATA;
  }
  created() {
    this.currentDate = new Date();
    console.log(DATA);
  } 

  
}
</script>
