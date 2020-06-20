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
    <div id="meetMsgDet" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;">
        <head-menu :head-menu="title">{{title}}</head-menu>
        <div class="each_list">
            <div class="first_row">
                <div style="color: #333;">来访人：{{item.visitorNam}} </div>
                <div>{{item.visitorTyp}}</div>
            </div>
            <div>身份证号：{{item.idCard}}</div>
            <div>联系电话：{{item.cellPhone}}</div>
            <div>来访人单位：{{item.sourcePlace}}</div>
            <div>预计来访时间：{{item.visitTime}}</div>
            <div>入园方式：{{item.travelMode}}</div>
            <div>车牌号：{{item.carNumber}}</div>
            <div>照片：<img style="width: 55px;" :src="item.phon" /></div>
        </div>
        <div class="btn_nojoin" @click="nopass()">不通过</div>
        <div class="btn_join" @click="pass()">通过</div>
    </div>
</body>
<script>
    var records=[];
    aweto.ajax(basePath + "/spm/spmOrderReview/getAppointmentReviewInfo.ajax", {voNo: <%=voNo%> }, false, function (data) {
        if (data.result == "fail") {
            layer.msg(data.msg, {icon: 5});//不开心
            res = false;
        }else{
            records=data.data;
            console.log(data.data)
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
            item: records
        },
        methods: {
            nopass(){
                aweto.ajax(basePath + "/spm/spmOrderReview/changeAppointmentReviewSta.ajax", {voNo: <%=voNo%>,sta:13 }, false, function (data) {
                    if (data.result == "fail") {
                        layer.msg(data.msg, {icon: 5});//不开心
                        res = false;
                    }else{
                        layer.msg("已拒绝此访客来访", {icon: 4});//开心
                    }
                    window.location = basePath + "weixin/app/Intelli/pages/Visitor/appointAudit.jsp";

                });
            },
            pass(){
                aweto.ajax(basePath + "/spm/spmOrderReview/changeAppointmentReviewSta.ajax", {voNo: <%=voNo%>,sta:12 }, false, function (data) {
                    if (data.result == "fail") {
                        layer.msg(data.msg, {icon: 5});//不开心
                        res = false;
                    }else{
                        layer.msg("已通过此访客来访", {icon:1});//开心
                    }
                    window.location = basePath + "weixin/app/Intelli/pages/Visitor/appointAudit.jsp";
                });
            }
        }
    })
</script>
</html>