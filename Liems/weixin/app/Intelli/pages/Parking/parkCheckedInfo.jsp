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
        <div>申请人：{{item.usrNam}}</div>
        <div>申请人联系方式：{{item.usrPhone}}</div>
        <div>身份证号：{{item.idCard}}</div>
        <div>所属公司：{{item.comName}}</div>
        <div>车牌号：{{item.carNumber}}</div>
        <div>有效期：{{item.appleTime}}</div>
        <div>申请日期：{{item.applyDtm}}</div>
    </div>
    <div class="each_list">
        <div style="color: #3daa62;border-bottom: 1px solid #ddd; font-size: 16px; padding-bottom: 5px; margin-bottom: 5px;"> 审核信息 </div>
        <div>有效期：{{item.validity}}</div>
        <div>车位号：{{item.parkingNo}}</div>
        <div>审核人：{{item.auditor}}</div>
        <div>审核日期：{{item.moddate}}</div>
    </div>
</div>
</body>
<script>
    var item='';
    var applyNo = '<%=applyNo%>';
    aweto.ajax(basePath + "/spm/spmApplyCar/getApplyPassInfo.ajax", {applyNo:applyNo}, false, function (data) {
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
            title: "详情",
            item:item
            // item: {
            //     name: "陈丽丽",
            //     phone: "1595959599",
            //     ident: "32015674684646546",
            //     conpy: "xxx",
            //     license: "苏A7k766",
            //     period: "一个月",
            //     time: "2020-05-25",
            //     validity: "2020-06-25",
            //     parkingno: "201",
            //     auditor: "xxxx",
            //     moddate: "2020-05-26"
            // }
        }
    })
</script>
</html>