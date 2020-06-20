<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %>
<%@ taglib prefix="wf"  uri="http://wwww.aweto-framework.org/taglibs/workflowTag" %>
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %>
<aweto:docType/>
<html>
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
    <script src="weixin/app/Intelli/js/index.js"></script>
    <link rel="stylesheet" href="weixin/app/Intelli/css/index.css">
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js"></script>
    <style>
        label {
            font-size: 0.1rem !important;
        }
        label {
            line-height: 34px;
            margin-bottom: 0;
        }
        .toggle-switch input:checked~span:after {
            left: calc(100% - 18px) !important;
        }
        .toggle-switch span:after {
            left:  -1px !important;
        }
        .switch-solid input:checked~span {
            background-color: #3DAA62 !important;
            border-color: #3DAA62;
        }
        input, textarea {
            outline: 0;
            -webkit-appearance: none;
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
<body class="gray-bg" :style="{height: screenHeight + 'px'}" style="overflow: hidden;">
<div id="app">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <img class="recor_img" src="weixin/app/Intelli/img/search.png" />
    <div style="background: #fff;margin: 10px 0;">
        <div style="width: 100%;display: flex;flex-wrap: wrap;padding: 0 15px;">
            <div  @click="toMusicPlay()" v-for="(item, index) in parameters" style="width: 50%;text-align: center;padding: 12px 0;">
                <div style="margin: auto;width: 90%;height: 100px;">
                    <img style="width: 100%;height: 100%;" :src="item.areaImg" />
                </div>
                <div style="font-size: 17px;font-family:PingFang;font-weight:500;color:rgba(51,51,51,1);line-height:40px;">{{item.areaNam}}</div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var records=[];
    aweto.ajax(basePath + "/spm/spmAreaBroadmst/getAreaBoardList.ajax", {}, false, function (data) {
        if (data.result == "fail") {
            layer.msg(data.msg, {icon: 5});//不开心
            res = false;
        }else{
            records=data.data;
        }
    });

    new Vue({
        el: "#app",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "云上音乐厅",
            parameters:records,
            // parameters: [
            //     {img: "weixin/app/Intelli/img/Ayyt.png", cont: "A共享音乐厅"},
            //     {img: "weixin/app/Intelli/img/Byyt.png", cont: "B区域"},
            //     {img: "weixin/app/Intelli/img/Cyyt.png", cont: "C区域"},
            //     {img: "weixin/app/Intelli/img/Dyyt.png", cont: "D区域"}
            // ],
        },
        methods: {
            toMusicPlay:function () {
                window.location = basePath + "weixin/app/Intelli/pages/ConcertHall/musicPlay.jsp";
            }
        }
    })
</script>
</html>

