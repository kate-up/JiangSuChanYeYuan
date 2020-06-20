Vue.component('msg-list',{
    template:`<div class="each_meet_msg">
                <div class="green_title">{{msgList.title}}</div>
                    <div class="shell">
                        <div class="lists" v-for="(item, index) in msgList.info">
                            <div>{{item.title}}</div>
                            <div>{{item.cont}}</div>
                        </div>
                  </div>
            </div>`,
    data:function(){
        return {
        }
    },
    props: {
        msgList: Object
    }
});