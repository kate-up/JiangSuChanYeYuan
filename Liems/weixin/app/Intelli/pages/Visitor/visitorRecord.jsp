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
    <script src="weixin/app/Intelli/component/cardLsit.js"></script>
    <script src="weixin/app/Intelli/component/ulList.js"></script>
    <script src="weixin/app/Intelli/component/msgList.js"></script>
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <style type="text/css">
        body {
            padding: 0 !important;
            margin: 0 !important;
            box-sizing: border-box !important;
        }
        .each_list {
            background: #fff;
            margin-bottom: 10px;
            padding: 20px;
            line-height: 24px;
            font-size: 14px;
            margin-top: 10px;
        }
        .first_row {
            display: flex;
            justify-content: space-between;
            color: #666;
            border-bottom: 1px solid #e5e5e5;
            margin-bottom: 6px;
        }
        .recor_img {
            width: 20px;
            height: 20px;
            position:absolute;
            top: 10px;
            right: 10px;
        }
    </style>
</head>
<body>
<div id="meetMsgDet" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <img class="recor_img" src="weixin/app/Intelli/img/rili.png" />
    <div>
        <div class="each_list" v-for="(item,index) in records">
            <div class="first_row">
                <div style="color: #333;">来访人：{{item.name}}</div>
            </div>
            <div>预计来访时间：{{item.time}}</div>
            <div>联系电话：{{item.tel}}</div>
        </div>
    </div>
</div>
</body>
<script>
var records=[];
aweto.ajax(basePath + "/spm/spmAccessRecord/findFKJL.ajax", {}, false, function (data) {
    if (data.result == "fail") {
        layer.msg(data.msg, {icon: 5});//不开心
        res = false;
    }else{
    	records=data.visitors;
    }
});

    new Vue({
        el: "#meetMsgDet",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "访客记录",
            records: records
        }
    })
    
    
</script>
</html>