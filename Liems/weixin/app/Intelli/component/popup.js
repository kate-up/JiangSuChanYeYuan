Vue.component('pop-up',{
    template:`<div @click="openPopup">打开弹窗</div>`,
    data:function(){
        return {
        }
    },
    methods: {
        openPopup(){
            alert("打开弹窗")
        }
    },
    props: {
    }
});