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
    </style>
</head>
<body>
<div id="meetMsgDet" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;padding-top: 1px;overflow: hidden;">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <msg-list :msg-list="msgList" ></msg-list>
    <div class="btn_nojoin" @click="notjoin()">不参与</div>
    <div class="btn_join" @click="join()">参与</div>
</div>
</body>
<script>
    new Vue({
        el: "#meetMsgDet",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "会议消息列表",
            msgList:{
                title: "三楼大会议室302房间-露演",
                info: [
                    {title: "会议主题", cont: "xxxxxx"},
                    {title: "会议类别", cont: "xxxxxx"},
                    {title: "会议开始时间", cont: "2020-05-20 12:00"},
                    {title: "会议结束时间", cont: "2020-05-20 12:00"},
                    {title: "会议室", cont: "3楼302会议室"},
                    {title: "组织部门", cont: "总裁办"},
                    {title: "召集人", cont: "张媛"},
                    {title: "主持人", cont: "张远"},
                    {title: "参与人员", cont: "总裁办3人 研发人员4人 不参与2人"},
                    {title: "会议名称", cont: "xxxxx"},
                    {title: "召集人", cont: "xxxxx"},
                ]
            }
        },
        methods: {
            notjoin: function( ){
                layer.confirm('确认不参加吗？', {
                    btn: ['确定','取消'] //按钮
                }, function(index){
                    var r=tableList.deleteRecorder(ids.join(","));
                    if(r.state==SUCCESS){
                        layer.msg(r.msgInfo, {icon: 1});//成功
                        tableList.refresh();
                    }else{
                        layer.msg(r.msgInfo, {icon: 5});//不开心
                    }
                }, function(index){
                    layer.close(index);
                });
            },
            join: function () {
                layer.msg("参与成功", {icon: 6});
            }
        }
    })
</script>
</html>