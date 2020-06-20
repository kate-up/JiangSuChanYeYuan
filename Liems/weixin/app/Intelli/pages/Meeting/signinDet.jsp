<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %>
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %>
<% String srrno = request.getParameter("srrno"); %>
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
    <script src="weixin/app/Intelli/component/table.js"></script>
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
<div id="signinDet" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;padding-top: 1px;">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <div style="background-image: url('weixin/app/Intelli/img/intebg.png');background-size: 100% 100%; color: #fff;height: calc(100% - 55px);">
       <div style="display: flex;justify-content: space-around;height: 41%;">
           <div style="display: flex;flex-direction: column;justify-content: space-around;width: 50%;height: 100%;text-align: center;padding: 15% 0;font-size: 14px;">
               <div>
                   <div id="yqd"><span style="font-size: 18px;">80</span>次</div>
                   <div>已签到</div>
               </div>
               <div>
                   <div id="wqd"><span style="font-size: 18px;">8</span>次</div>
                   <div>未签到</div>
               </div>
           </div>
           <div style="text-align: center;background: url('weixin/app/Intelli/img/yuanquan.png') no-repeat;background-size: 80% ;background-position: center center;width: 50%;height: 100%;">
               <div style="color: #3DAA62;margin-top: 57%;font-weight: bold;font-size: 16px;">
                   <div>签到率</div>
                   <div id="persent">80%</div>
               </div>
           </div>
       </div>
        <div style="padding: 0 23px;">
            <table-list :table-head="tableHead" :table-body="tableBody"></table-list>
        </div>
    </div>
</div>
</body>
<script>
   var tableBody=[];
	//查询签到详情数据
	aweto.ajax(basePath + "/spm/spmMeettingSign/findSignDet.ajax", {srrno:<%=srrno%>}, false, function (data) {
		if (data.result=="success") {	
			tableBody=data.tableBody;
			var cont='';
			cont="<span style='font-size: 18px;'>"+data.yqd+"</span>次";
			//document.getElementById("yqd")
			$("#yqd").html(cont);
			cont="<span style='font-size: 18px;'>"+data.wqd+"</span>次";
			$("#wqd").html(cont);
			$("#persent").html(data.persent);
	   }
	 });

    new Vue({
        el: "#signinDet",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "签到详情",
            tableHead: ["姓名", "签到时间", "是否迟到", "是否范围内签到"],
            tableBody:tableBody
        },
        methods: {
            toSignDet: function(){
                // window.location = basePath + "weixin/app/Intelli/pages/Meeting/meetingAppointDet.jsp";
            }
        }
    })
</script>
</html>