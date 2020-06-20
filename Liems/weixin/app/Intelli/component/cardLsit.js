Vue.component('card-list',{
    template:`<div class="shell">
        <div class="meet_room_tit" v-if="meetroomList.title != ''">{{meetroomList.title}}</div>
        <div class="row_list">
<!--            <img :src="meetroomList.img"/>-->
            <img src="../img/meetRoomImg.png"/>
            <div class="row_list_test">
                <div>{{meetroomList.info1}}</div>
                <div>{{meetroomList.info2}}</div>
                <div>{{meetroomList.info3}}</div>
            </div>
        </div>
        <div class="meet_room_but">
            <table></table>
            <div class="dis_flex">
                <div v-if="meetroomList.btnblue" class="blue_btn">{{meetroomList.btnblue}}</div>
                <div v-if="meetroomList.btngreen" class="green_btn">{{meetroomList.btngreen}}</div>
            </div>
        </div>
    </div>`,
    data:function(){
        return {
        }
    },
    props: {
        // title 选填，不展示就返回空值 ；
        // btnblue ，btngreen 是选择展示按钮，根据颜色选填，不展示的都返回空值
        meetroomList: Object
    }
});