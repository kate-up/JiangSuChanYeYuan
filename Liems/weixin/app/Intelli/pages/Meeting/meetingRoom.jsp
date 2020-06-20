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
    <script src="weixin/app/Intelli/component/head.js"></script>
    <script src="weixin/app/Intelli/component/cardLsit.js"></script>
    <script src="weixin/app/Intelli/component/cardLsit.js"></script>
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
<div id="meetingRoom" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;padding-top: 1px;overflow: hidden;">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <card-list v-for="(item, index) in meetinglists" :meetroom-list="item"></card-list>
</div>
</body>
<script>
    new Vue({
        el: "#meetingRoom",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "四楼圆桌会议室",
            meetinglists: [
                {
                    title: "主题",
                    info1: "研发中心月度例会",
                    info2: "会议地点：三楼大会议室",
                    info3: "会议时间： 2015-05-09 09:00-11:30",
                    btnblue: "会议记录",
                    btngreen: "资料下载"
                },
                {
                    title: "主题",
                    info1: "研发中心月度例会",
                    info2: "会议地点：三楼大会议室",
                    info3: "会议时间： 2015-05-09 09:00-11:30",
                    btnblue: "会议记录",
                    btngreen: "资料下载"
                }
            ]
        }
    })
</script>
</html>