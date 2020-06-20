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
    <script src="weixin/app/Intelli/component/head.js"></script>
    <script src="weixin/app/Intelli/component/msgList.js"></script>
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <style type="text/css">
        body {
            padding: 0 !important;
            margin: 0 !important;
            box-sizing: border-box !important;
        }
    </style>
</head>
<body>
<div id="meetMsgList" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;padding-top: 1px;overflow-y: scroll;">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <div class="msglist_cont">
        <div v-for="(item, index) in msgList" @click="toMeetListDet()">
            <div class="each_meet_msg">
                <div class="green_title">{{item.title}}</div>
                <div class="shell">
                    <div class="lists" v-for="(item0, index) in item.info">
                        <div>{{item0.title}}</div>
                        <div>{{item0.cont}}</div>
                    </div>
                </div>
            </div>
            <%--        <msg-list :msg-list="item" v-for="(item, index) in msgList"></msg-list>--%>
        </div>
    </div>
</div>
</body>
<script>
    new Vue({
        el: "#meetMsgList",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "会议消息列表",
            msgList: [
                {
                    title: "会议主题：xxx",
                    info: [
                        {title: "会议类别", cont: "xxxxxx"},
                        {title: "会议室", cont: "3楼302会议室"},
                        {title: "组织部门", cont: "总裁办"},
                        {title: "会议开始时间", cont: "2020-05-20 12:00"},
                        {title: "会议结束时间", cont: "2020-05-20 12:00"}
                    ]
                },
                {
                    title: "会议主题：xxxxxxxx",
                    info: [
                        {title: "会议类别", cont: "xxxxxx"},
                        {title: "会议室", cont: "3楼302会议室"},
                        {title: "组织部门", cont: "总裁办"},
                        {title: "会议开始时间", cont: "2020-05-20 12:00"},
                        {title: "会议结束时间", cont: "2020-05-20 12:00"}
                    ]
                },
                {
                    title: "会议主题：xxxxxxxx",
                    info: [
                        {title: "会议类别", cont: "xxxxxx"},
                        {title: "会议室", cont: "3楼302会议室"},
                        {title: "组织部门", cont: "总裁办"},
                        {title: "会议开始时间", cont: "2020-05-20 12:00"},
                        {title: "会议结束时间", cont: "2020-05-20 12:00"}
                    ]
                }
                ,
                {
                    title: "会议主题：xxxxxxxx",
                    info: [
                        {title: "会议类别", cont: "xxxxxx"},
                        {title: "会议室", cont: "3楼302会议室"},
                        {title: "组织部门", cont: "总裁办"},
                        {title: "会议开始时间", cont: "2020-05-20 12:00"},
                        {title: "会议结束时间", cont: "2020-05-20 12:00"}
                    ]
                }
            ]
        },
        methods: {
            toMeetListDet: function () {
                window.location = basePath + "weixin/app/Intelli/pages/Meeting/meetMsgDet.jsp";
            }
        }
    })
</script>
</html>