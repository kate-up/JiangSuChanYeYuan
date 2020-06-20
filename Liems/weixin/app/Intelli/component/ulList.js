Vue.component('ul-lists',{
    template:`<div class="shell">
                <div class="lists" v-for="(item, index) in meetList">
                    <div>{{item.title}}</div>
                    <div>{{item.cont}}</div>
                </div>
              </div>`,
    data:function(){
        return {
        }
    },
    props: {
        meetList: Array
    }
});