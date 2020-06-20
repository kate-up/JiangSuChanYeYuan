Vue.component('form-menu',{
    template:`<table class="table_bg">
                <tr class="table_between" v-for="(item, index) in menuList">
                    <td>{{item.tit}}</td>
                    <td>{{item.cont}}</td>
                </tr>
            </table>`,
    data:function(){
        return {
        }
    },
    props: {
        menuList: Array,
    }
});