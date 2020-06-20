<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %>
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %>
<% String voNo = (String)request.getParameter("voNo"); %>

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
    <script src="weixin/app/Intelli/component/ulList.js"></script>
    <script src="weixin/app/Intelli/component/msgList.js"></script>
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <style type="text/css">
        body {
            padding: 0 !important;
            margin: 0 !important;
            box-sizing: border-box !important;
        }
        .btn_nojoin, .btn_join {
            width: 80%;
            color: #fff;
            height: 40px;
            line-height: 40px;
            text-align: center;
            background: #a3d4b4;
            border-radius: 3px;
            margin: 20px auto;
        }
        .btn_join {
            background: #3daa62;
        }
        .posit {
            position: absolute;
            bottom: 0px;
            margin-left: 10%;
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
    </style>
</head>
<body>
<div id="meetMsgDet" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;padding-top: 1px;overflow: hidden;">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <div class="each_list">
        <div class="first_row">
            <div style="color: #333;">来访人：{{item.name}}</div>
            <div>{{item.type}}</div>
        </div>
        <div>身份证号：{{item.identity}}</div>
        <div>联系电话：{{item.tel}}</div>
        <div>来访人单位：{{item.unit}}</div>
        <div>预计来访时间：{{item.time}}</div>
        <div>入园方式：{{item.way}}</div>
        <div>车牌号：{{item.plate}}</div>
        <div>照片：<img style="width: 55px;" :src="item.phon" /></div>
    </div>
    <div class="each_list">
        <div>审核人：{{item.per}}</div>
        <div>审核结果：{{item.res}}</div>
        <div>审核意见：{{item.idea}}</div>
        <div>审核时间：{{item.auditime}}</div>
    </div>
    <div class="btn_join posit" onclick="tomeals()">就餐券发放</div>
</div>
</body>
<script>
	var item='';
	aweto.ajax(basePath + "/spm/spmOrderReview/findYYJLSHXQ.ajax", {vo_no:<%=voNo%>}, false, function (data) {
	    if (data.result == "fail") {
	        layer.msg(data.msg, {icon: 5});//不开心
	        res = false;
	    }else{
	    	item=data.item;
	    }
	});

    new Vue({
        el: "#meetMsgDet",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "详情",
            item:item
        }
    })
    function tomeals() {
        window.location = basePath + "weixin/app/Intelli/pages/Visitor/IssueMealVoucher.jsp?cmono="+item.ordercom;
    }
</script>
</html>