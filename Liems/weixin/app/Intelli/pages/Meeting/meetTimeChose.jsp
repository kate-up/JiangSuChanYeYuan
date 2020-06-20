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
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <!--    <link rel="stylesheet" href="../css/bootstrap.min.css">-->
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <!--    <script src="../js/jquery.min.js"></script>-->
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <!--    <script src="../js/bootstrap.min.js"></script>-->

    <aweto:basePath />
    <base href="${basePath}" />
    <weixin:sessionInfo debug="true"/>
    <aweto:decoration version="2.0" mobile="true"/>
    <aweto:entityInfo name="org.aweto.web.entity.WebEmpCertify"/>
    <script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js?v=20200217"></script>
    <script src="weixin/app/Intelli/js/vue.js"></script>
    <script src="weixin/app/Intelli/component/msgList.js"></script>
    <script src="weixin/app/Intelli/component/head.js"></script>
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <style type="text/css">
        body {
            padding: 0 !important;
            margin: 0 !important;
            box-sizing: border-box !important;
        }
        .rulibox {
            background: #fff;
            margin-top: 10px;
            padding: 5px 0;
        }
        .rili_list, .rili_list0 {
            display: flex;
            justify-content: space-between;
            padding: 5px 15px;
            color: #333;
            font-size: 15px
        }
        .infobox {
            margin-top: 10px;
            background: #fff;
            padding: 10px 15px;
            line-height: 23px;
            border-bottom: 1px solid #eee;
        }
        .today_time{
            display: flex;
            color: #999;
            font-size: 15px;
            border-bottom: 1px solid #ddd;
        }
        .today_time img {
            margin: 2px 5px 2px 0;
            width: 15px;
            height: 15px;
        }
        .huiyibox {
            display: flex;
            justify-content: space-between;
        }
        .address {
            color: #333;
            font-size: 16px;
        }
        .persnum {
            display: flex;
            color: #999;
            font-size: 16px;
        }
        .persnum img {
            margin: 2px 5px 2px 0;
            width: 17px;
            height: 16px;
        }
        .chosetime {
            border: 1px solid #dadada;
            background: #f7f7f7;
            font-size: 15px;
            color: #333;
            display: flex;
            padding: 3px 8px;
        }
        .chosetime img {
            margin: auto 0 auto 8px;
            width: 10px;
            height: 6px;
        }
        .huiyitu {
            width: 64px;
            height: 60px;
            margin: auto 20px;
        }
        .ischecked {
            width: 21px;
            height: 21px;
            margin: 8px 8px 8px 15px;
        }
        .norclass {
            display: flex;
            font-size: 15px;
            color: #2b2b2b;
        }
        .unnorclass {
            display: flex;
            font-size: 15px;
            color: #2b2b2b;
            background: rgba(0,0,0,0.1);
        }
        .rili_list0 > div, .rili_list > div {
            width: 26px;
            height: 26px;
            text-align: center;
            line-height: 26px;
        }
        /*.rili_list0 > div:nth-child(1) {*/
        /*    background: #3DAA62;*/
        /*    color: #fff;*/
        /*    border-radius: 50%;*/
        /*}*/
        .choseIndex {
            background: #3DAA62;
            color: #fff;
            border-radius: 50%;
        }

        .chaxun, .chaxun_no {
            position: absolute;
            bottom: 25px;
            width: calc(86% - 20px);
            background: #3DAA62;
            color: #fff;
            font-size: 15px;
            height: 39px;
            line-height: 39px;
            text-align: center;
            margin-left: 7%;
            border-radius: 4px;
        }
        .chaxun_no {
            opacity: 0.3;
        }
    </style>
</head>
<body>
<div id="meetTimeChose" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;padding-top: 1px;">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <div class="rulibox">
        <div class="rili_list" style="">
            <div v-for="(item, index) in riliLists.week">{{item}}</div>
        </div>
        <div class="rili_list0" style="color: #999;font-size: 14px">
            <div :class="choseIndex == index ? 'choseIndex' : ''" v-for="(item, index) in riliLists.data" @click="choseChecked(item, index)">{{item}}</div>
        </div>
    </div>
    <div class="infobox" id="intro">
        <div class="today_time"><img src="weixin/app/Intelli/img/shizhong.png" />{{today}}</div>
        <div class="huiyibox">
            <div>
                <div class="address">三楼智能会议室</div>
                <div class="persnum"><img src="weixin/app/Intelli/img/renxiang.png"/>8</div>
                <div class="chosetime" onclick="openTimeQuan()">选择时间段<img style="" src="weixin/app/Intelli/img/downjiantou.png" /></div>
            </div>
            <img class="huiyitu" src="weixin/app/Intelli/img/huiyitu.png" />
        </div>
    </div>

    <div  class="infobox" id="timequan" style="display: none;padding-top: 10px;height: calc(100% - 146px);">
        <div class="address" style="padding-left: 15px;">三楼智能会议室</div>
        <div class="persnum" style="padding-left: 15px;"><img src="weixin/app/Intelli/img/renxiang.png"/>8</div>
        <div id="timeDuanList" style="line-height: 25px;">
            <div  :class="item.type == 3 ? 'unnorclass' : 'norclass'"  v-for="(item, index) in timeLists">
                <img id="img" @click="chosethis(item.type, index)" class="ischecked" :src="item.type == 2 || item.type == 3  ? 'weixin/app/Intelli/img/kongyuan.png':'weixin/app/Intelli/img/nook1.png'" />
                <div style="line-height: 36px;width: 100%;padding-right: 15px;display: flex;justify-content: space-between;border-bottom: 1px solid #eee;">
                    <div>{{item.time}}</div>
                    <div style="color: #999;">{{item.type == 0 ? "已过期": item.type == 1 ? "已预约" : ""}}</div>
                </div>
            </div>
        </div>
        <div :class="[is_can?'chaxun':'chaxun_no']" @click="ischeck()">立即预订</div>
    </div>
</div>
</body>
<script>
    new Vue({
        el: "#meetTimeChose",
        data: {
            today: "",
            choseIndex: 0,
            isChosed: false,
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "时间选择",
            week: ["日","一","二","三","四","五","六"],
            riliLists: {
                week: [],
                data: []
            },
            showChoseDateList: [],
            timeLists: [
                {time: "14:00 - 14:30" , type: "0"},
                {time: "14:00 - 14:30" , type: "0"},
                {time: "14:00 - 14:30" , type: "2"},
                {time: "14:00 - 14:30" , type: "3"},
                {time: "14:00 - 14:30" , type: "1"}
            ]
        },
        computed: {
            is_can: function() { //控制查询按钮
                return (this.isChosed )
            }
        },
        created(){
            var benyue = new Date().getMonth() + 1
            var benri = new Date().getDate()
            this.today = (benyue < 10 ? '0' + benyue : benyue) + "月" + ( benri < 10 ? '0' + benri : benri) + '日 周' + this.week[new Date().getDay()]
            console.log(new Date().getFullYear()) // 本年
            var data1 = new Date()
            for(var i = 0; i < 7; i++){
                var date = data1.getDate() < 10 ? '0' + data1.getDate() : data1.getDate()
                var yue = (data1.getMonth()+1) < 10 ? '0' + (data1.getMonth() + 1) : (data1.getMonth() + 1)
                var week = this.week[data1.getDay()]
                showDate = data1.getFullYear() + '/' + yue + '/' + date + '/' + '星期' + week;
                showChoseDate = yue + '月' + date + '日 周' + week
                data1.setDate(data1.getDate()+1)
                console.log(showDate)
                this.riliLists.week.push(week)
                this.riliLists.data.push(date)
                this.showChoseDateList.push(showChoseDate)
            }
        },
        methods: {
            chosethis: function (type,index) {
                var WhichImg=document.getElementById('timeDuanList').getElementsByTagName("img");
                if(type == 2) {
                    var chosedimg = WhichImg[index].src
                    console.log(chosedimg)
                    if(chosedimg == basePath+"weixin/app/Intelli/img/ok0.png"){
                        WhichImg[index].src = 'weixin/app/Intelli/img/kongyuan.png'
                        this.isChosed = false
                    }else{
                        WhichImg[index].src = "weixin/app/Intelli/img/ok0.png"
                        this.isChosed = true
                    }
                }
            },
            choseChecked: function(item, index){
                this.choseIndex = index
                this.today = this.showChoseDateList[index]
            },
            ischeck: function () {
                var that = this;
                if(this.is_can){
                    layer.msg("预订成功", {icon: 1});
                    // 1 绿色对勾 2 红色叉叉 3 黄色感叹号 4 灰色 锁住了 5 红色哭脸 6 绿色笑脸
                }else {
                    return
                }
            }
        }
    })
    function openTimeQuan () {
        document.getElementById("intro").style.display = "none"
        document.getElementById("timequan").style.display = "block"
    }
</script>
</html>