Vue.component('head-menu',{
    template:`<div class="menu_dir">
        <span @click="back()" class="glyphicon glyphicon-menu-left back_icon" aria-hidden="true"></span>
        <div class="menu_tit">{{headMenu}}</div>
    </div>`,
    data:function(){
        return {
        }
    },
    methods: {
        back(){
            history.go(-1);
        }
    },
    props: {
        headMenu: String
    }
});