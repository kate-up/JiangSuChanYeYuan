<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %>
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title><aweto:pageTile/></title>
    <!-- 设置文档编码 -->
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <aweto:basePath />
    <base href="${basePath}" />
    <weixin:sessionInfo debug="true"/>
    <aweto:decoration version="2.0" mobile="true"/>
    <aweto:entityInfo name="org.aweto.web.entity.WebEmpCertify"/>
    <script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js?v=20200217"></script>
    <script src="weixin/app/Intelli/js/vue.js"></script>
    <script src="weixin/app/Intelli/js/index.js"></script>
    <script src="weixin/app/Intelli/component/head.js"></script>
    <script src="weixin/app/Intelli/component/ulList.js"></script>
    <script src="weixin/app/Intelli/component/formMenu.js"></script>
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <link rel="stylesheet" href="weixin/app/Intelli/css/index.css">
    <style type="text/css">
        body {
            padding: 0 !important;
            margin: 0 !important;
            box-sizing: border-box !important;
        }
        .green_tit{
            font-size: 17px;
            color: #3daa62;
            padding-left: 10px;
            border-left: 5px solid #3daa62;
            margin-bottom: 12px;
        }
        .chaxun, .chaxun_no {
            background: #3daa62;
            color: #fff;
            width: 70%;
            height: 35px;
            border-radius: 3px;
            line-height: 35px;
            text-align: center;
            margin: auto;
        }
        .chaxun_no {
            opacity: 0.3;
        }
        .inteslist_cont {
            height: calc(100% - 193px);
            overflow-y: scroll;
        }
        .inteslist_cont > div:nth-child(1) {
            margin-top: 0;
        }
        td, th {
            padding: 5px !important;
        }
        .layout_bet {
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin: 15px 0;
            color: #9e9e9e;
            padding: 0 15px;
        }
        .suggest-title {
            font-size: 14px;
            color: #656565;
            line-height: 30px;
            width: fit-content;
        }
        .input-box {
            width: 60% !important;
            height: 30px;
            font-size: 14px;
            padding: 0 .18rem;
            -webkit-appearance: none;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            border: 1px solid #E9ECF4 !important;
            padding: 0 10px !important;
        }
        input, textarea {
            outline: 0;
            -webkit-appearance: none;
        }

    </style>
</head>
<body>
<div id="meetInquire" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;padding-top: 1px;">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <div style="background: #fff;padding: 0 20px;">
        <div style="display: flex;justify-content: space-between;margin-bottom: 10px;">
            <div class="suggest-title">会议室</div>
            <input @click="showProblemName" class="input-box" :value="problem_name" readonly="" type="text" placeholder="请选择会议室">
        </div>
        <mt-popup v-model="problemVisible" position="bottom">
            <ul class="mint-popup-head">
                <li @click="selectProblem(0)">取消</li>
                <li @click="selectProblem(1)">确认</li>
            </ul>
            <mt-picker :slots="problem_list" @change="problemChange" value-key="name"> </mt-picker>
        </mt-popup>

        <div style="display: flex;justify-content: space-between;">
            <div class="suggest-title">预约时段</div>
            <input @click="showProblemName0" class="input-box" :value="problem_name0" readonly="" type="text" placeholder="请选择预约时段">
        </div>
        <mt-popup v-model="problemVisible0" position="bottom">
            <ul class="mint-popup-head">
                <li @click="selectProblem0(0)">取消</li>
                <li @click="selectProblem0(1)">确认</li>
            </ul>
            <mt-picker :slots="problem_list0" @change="problemChange0" value-key="name"> </mt-picker>
        </mt-popup>
    </div>
    <div style="background: #fff; width: 100%;padding: 10px 0 20px 0;margin-bottom: 10px;" @click="search()">
        <div :class="[is_can?'chaxun':'chaxun_no']" >查询</div>
    </div>
    <div class="inteslist_cont">
        <div class="shell" v-for="(item, index) in menulists">
            <form-menu :menu-list = "item"></form-menu>
        </div>
    </div>
</div>
</body>
<script>
    var records=[];
    // aweto.ajax(basePath + "/spm/spmRoomReservation/findMeetingRoomInfo.ajax", {}, false, function (data) {
    //     if (data.result == "fail") {
    //         layer.msg(data.msg, {icon: 5});//不开心
    //         res = false;
    //     }else{
    //         records=data.data;
    //     }
    // });
    new Vue({
        el: "#meetInquire",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "会议室查询",
            meetList: [
                {title: "会议室", cont: "xxxxx"},
                {title: "预约时段", cont: "张峰"}
            ],
            tableHead: [],
            tableBody: [
                {workCont: "xxx", resper: "张峰", date: "2020-05-12", isFinish: "否"},
                {workCont: "xxx", resper: "晚霞", date: "2020-05-12", isFinish: "是"},
                {workCont: "xxx", resper: "朝阳", date: "2020-05-12", isFinish: "是"}
            ],
            menulist: [
                {tit: "预约部门", cont: "销售部"},
                {tit: "预约会议室", cont: "一号厅"},
                {tit: "预约日期", cont: "2015-11-25"},
                {tit: "会议主题", cont: "销售大会"},
                {tit: "会议具体事由", cont: "各地区销售总监参加"},
                {tit: "预约时段", cont: "9:00-10:00"},
                {tit: "预约人", cont: "小鱼儿"}
            ],
            menulists:"",
            problem_name: '',
            problem_name0: '',
            problemVisible: false,
            problemVisible0: false,
            problem_list: [{
                flex: 1,
                values: [{
                    "id": 11,
                    "name": "会议室一"
                }, {
                    "id": 21,
                    "name": "会议室二"
                }, {
                    "id": 21,
                    "name": "会议室三"
                }, {
                    "id": 41,
                    "name": "会议室四"
                }, {
                    "id": 51,
                    "name": "会议室五"
                }],
                textAlign: 'center'
            }],
            problem_list0: [{
                flex: 1,
                values: [{
                    "id": 11,
                    "name": "09:00 - 09:30"
                }, {
                    "id": 21,
                    "name": "09:30 - 10:00"
                }, {
                    "id": 21,
                    "name": "10:00 - 11: 00"
                }, {
                    "id": 41,
                    "name": "14:00 - 15:00"
                }, {
                    "id": 51,
                    "name": "15:00 - 16:00"
                }],
                textAlign: 'center'
            }],
        },
        computed: {
            is_can: function() { //控制查询按钮
                return (this.problem_name && this.problem_name0)
            }
        },
        created () {
            var that = this
            aweto.ajax(basePath + "/spm/spmRoomReservation/findMeetingRoomInfo.ajax", {}, false, function (data) {
                if (data.result == "fail") {
                    layer.msg(data.msg, {icon: 5});//不开心
                    res = false;
                }else{
                    that.menulists=data.data;
                }
            });
        },
        methods:{
            // 类型弹窗
            showProblemName: function() {
                this.problemVisible = true;
                if (!this.problem_temp) {
                    this.problem_temp = this.problem_list[0].values[0].name;
                }
            },
            showProblemName0: function() {
                this.problemVisible0 = true;
                if (!this.problem_temp0) {
                    this.problem_temp0 = this.problem_list0[0].values[0].name;
                }
            },
            problemChange: function(picker, values) {
                if (picker.getSlotValue(0)) {
                    this.problem_temp = picker.getSlotValue(0).name
                }
            },
            selectProblem: function(bool) {
                // bool 判断 触发的是取消还是确认按钮
                this.problem_name = bool ? this.problem_temp : this.problem_name;
                this.problemVisible = false
            },
            problemChange0: function(picker, values) {
                if (picker.getSlotValue(0)) {
                    this.problem_temp0 = picker.getSlotValue(0).name
                }
            },
            selectProblem0: function(bool) {
                // bool 判断 触发的是取消还是确认按钮
                this.problem_name0 = bool ? this.problem_temp0 : this.problem_name0;
                this.problemVisible0 = false
            },
            search: function (){
                var that = this;
                if(this.is_can == ''){
                    layer.msg("请输入查询条件", {icon: 3});//不开心
                    // 1 绿色对勾 2 红色叉叉 3 黄色感叹号 4 灰色 锁住了 5 红色哭脸 6 绿色笑脸
                    return
                }else {
                    aweto.ajax(basePath + "/spm/spmRoomReservation/findMeetingRoomInfo.ajax", {smrNo: "5", srrPeriods: "09:00 - 10:00"}, false, function (data) {
                        if (data.result == "fail") {
                            layer.msg(data.msg, {icon: 5});//不开心
                            res = false;
                        }else{
                            that.menulists=data.data;
                        }
                    });
                    layer.msg("查询成功", {icon: 1});
                }
            }
        }
    })
</script>
</html>