<template>
  <div class="about">
    <h1 v-on:click="click">{{title}}</h1>
  </div>
</template>
<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
// import HelloWorld from '@/components/HelloWorld.vue'; // @ is an alias to /src

@Component({
  components: {
    //HelloWorld,
  },
})
export default class Home extends Vue {
    private title="This is an about page";
    constructor() {
       super();
    }
    private click() {
      console.log('点击了');
      //this.title="哈哈哈";
       this.title.length>10? this.title="哈哈哈":this.title="This is an about page";
    
    }
}
</script>

