<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %>
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %>
<%
    String applyNo = (String)request.getParameter("applyNo");
%>

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
    </style>
</head>
<body>
<div id="meetMsgDet" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;padding-top: 1px;overflow: hidden;">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <div class="each_list">
        <div>申请人：{{item.usrNam}}</div>
        <div>申请人联系方式：{{item.usrPhone}}</div>
        <div>身份证号：{{item.idCard}}</div>
        <div>所属公司：{{item.comName}}</div>
        <div>车牌号：{{item.carNumber}}</div>
        <div>有效期：{{item.appleTime}}</div>
        <div style="display: flex; justify-content: space-between;" @click="toParkSpace()">
            <div>分配车位</div>
            <span class="glyphicon glyphicon-menu-right"  aria-hidden="true" style="margin: auto 0"></span>
        </div>
    </div>

</div>
</body>
<script>
    var item='';
    var applyNo = '<%=applyNo%>';
    aweto.ajax(basePath + "/spm/spmApplyCar/getApplyCarXqInfo.ajax", {applyNo:applyNo}, false, function (data) {
        if (data.result == "fail") {
            layer.msg(data.msg, {icon: 5});//不开心
            res = false;
        }else{
            item=data.data;
        }
    });


    new Vue({
        el: "#meetMsgDet",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "车位审核",
            item:item
            // item:{
            //     name: "陈丽丽",
            //     phone: "1595959599",
            //     ident: "32015674684646546",
            //     conpy: "xxx",
            //     license: "苏A7k766",
            //     period: "一个月"
            // }
        },
        methods: {
            toParkSpace: function () {
                window.location = basePath + "weixin/app/Intelli/pages/Parking/parkingSpace.jsp?applyNo=" + applyNo;
            }
        }
    })
</script>
</html>