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
        .green_title_sign {
            font-size: 17px;
            color: #3daa62;
            padding: 10px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
<div id="signinList" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;padding-top: 1px;overflow-y: scroll;">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <div class="each_meet_msg" v-for="(item, index) in msgList">
        <div class="green_title_sign" @click="toSignDet(item.srrno)">
            <div>{{item.title}}</div>
            <span class="glyphicon glyphicon-menu-right"  aria-hidden="true" style="margin: auto 0"></span>
        </div>
        <div class="shell">
            <div class="lists" v-for="(item1, index) in item.info">
                {{item1.title}}：{{item1.cont}}
            </div>
        </div>
    </div>
</div>
</body>
<script>
 var msgList=[];
    //查询签到列表数据
	aweto.ajax(basePath + "/spm/spmMeettingSign/findMeetingSign.ajax", {}, false, function (data) {
		if (data.result=="success") {	
			msgList=data.msgList;
	   }
	 });
    new Vue({
        el: "#signinList",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "签到列表",
            msgList: msgList
        },
        methods: {
        	toSignDet(srrno){
   
        	window.location = basePath + "weixin/app/Intelli/pages/Meeting/signinDet.jsp?srrno="+srrno;	
        	}
        }
    })
 
</script>
</html>