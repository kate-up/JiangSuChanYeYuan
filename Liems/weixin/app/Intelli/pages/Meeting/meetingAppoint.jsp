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
<%--    <script src="../js/vue.js"></script>--%>
<%--    <script src="../component/cardLsit.js"></script>--%>
<%--    <link rel="stylesheet" href="../css/component.css">--%>
    <script src="weixin/app/Intelli/js/vue.js"></script>
    <script src="weixin/app/Intelli/component/head.js"></script>
    <script src="weixin/app/Intelli/component/cardLsit.js"></script>
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <style type="text/css">
        body {
            padding: 0 !important;
            margin: 0 !important;
            box-sizing: border-box !important;
        }
        .top_right {
            display: flex;
            position: absolute;
            top: 5px;
            right: 0;
        }
        .top_right img {
            margin: 7px 10px;
        }
        .msglist_cont {
            height: calc(100% - 45px);
            overflow-y: scroll;
        }
    </style>
</head>
<body>
<div id="app" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;padding-top: 1px;overflow: hidden;">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <div class="top_right">
        <img style="width: 25px;height: 22px;" src="weixin/app/Intelli/img/msgList.png" onclick="tomsgList()" />
        <img style="width: 22px;height: 22px;" src="weixin/app/Intelli/img/msgSearch.png" onclick="tomsgSearch()"/>
    </div>
    <div class="msglist_cont">
        <div class="shell" v-for="(item, index) in meetroomList">
            <div class="meet_room_tit">{{item.title}}</div>
            <div class="row_list">
                <img :src="item.img"/>
                <div class="row_list_test" >
<%--                    <div v-for="(item1, index) in item.infos">{{item1}}</div>--%>
                    <div>容纳：{{item.smrCapacity}}人</div>
                    <div>地址： {{item.smrAddress}}</div>
                    <div style="display: flex">
                        <div style="white-space: nowrap;">当日已预约：</div>
                        <div>{{item.time}}</div>
                    </div>
                </div>
            </div>
            <div class="meet_room_but">
                <table></table>
                <div class="dis_flex">
                    <div class="green_btn" onclick="next()">预约</div>
                    <%--                <div v-if="meetroomList.btngreen" class="blue_btn">{{meetroomList.btngreen}}</div>--%>
                </div>
            </div>
        </div>
    </div>
<%--    <card-list v-for="(item, index) in meetinglists" :meetroom-list="item"></card-list>--%>
</div>
</body>
<script>

    var records=[];
    aweto.ajax(basePath + "/spm/spmMeettingRoom/findMeetingAppointInfo.ajax", {}, false, function (data) {
        if (data.result == "fail") {
            layer.msg(data.msg, {icon: 5});//不开心
            res = false;
        }else{
            records=data.data;
        }
    });

    new Vue({
        el: "#app",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "会议室预约",
            meetroomList:records
        }
    })
    function next () {
        window.location = basePath + "weixin/app/Intelli/pages/Meeting/meetingAppointDet.jsp";
    }
    function tomsgList () {
        window.location = basePath + "weixin/app/Intelli/pages/Meeting/meetMsgList.jsp";
    }
    function tomsgSearch () {
        window.location = basePath + "weixin/app/Intelli/pages/Meeting/meetInquire.jsp";
    }
</script>
</html>