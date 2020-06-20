Vue.component('table-list',{
    template:`<table class="tableWidth">
                <thead v-if="tableHead">
                    <tr>
                        <td v-for="(item, index) in tableHead">{{item}}</td>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(item, index) in tableBody">
                        <td>{{item.workCont}}</td>
                        <td>{{item.resper}}</td>
                        <td>{{item.date}}</td>
                        <td>{{item.isFinish}}</td>
                    </tr>
                </tbody>
            </table>`,
    data:function(){
        return {
        }
    },
    props: {
        tableHead: Array,
        tableBody: Array
    }
});