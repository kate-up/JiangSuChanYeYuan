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
    <%--    <script src="../js/vue.js"></script>--%>
    <%--    <script src="../component/cardLsit.js"></script>--%>
    <%--    <link rel="stylesheet" href="../css/component.css">--%>
    <%--    <script src="weixin/app/Intelli/js/vue.js"></script>--%>
    <%--    <script src="weixin/app/Intelli/component/head.js"></script>--%>
    <%--    <script src="weixin/app/Intelli/component/cardLsit.js"></script>--%>
    <%--    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">--%>
    <script src="weixin/app/Intelli/js/vue.js"></script>
    <script src="weixin/app/Intelli/component/head.js"></script>
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js"></script>
    <style>
        .cont {
            height: 100%;
        }
        .each_list {
            background: url('weixin/app/Intelli/img/zhgl_bg.png') no-repeat;
            background-size: 100% 100%;
            height: 100px;
            display: flex;
        }
        .each_list img {
            width: 41px;
            height: 48px;
            margin: auto 30px;
        }
        .bold_tit {
            color: #333;
            font-size: 16px;
            line-height: 100px;
        }
        .img_size {
            width: 72px;
            height: 72px;
        }
        .word_333 {
            font-size: 15px;
            color: #333;
        }
        .out_kuang {
            box-shadow: -3px 0 10px 5px #eee;
            text-align: center;
            background: #fff;
            position: absolute;
            bottom: 0;
            padding: 30px 0;
            width: 100%;
            /*display: flex;*/
            justify-content: space-between;
        }
    </style>
</head>
<body class="gray-bg" :style="{height: screenHeight + 'px'}" >
    <div id="visitorhome" class="cont">
        <head-menu :head-menu="title">{{title}}</head-menu>
        <img style="height: 166px;width: 100%;" src="weixin/app/Intelli/img/zhfk_gl.png" />
        <div style="position:relative;top: -40px;">
            <div>
                <div class="each_list" onclick="outKuang()">
                    <img src="weixin/app/Intelli/img/fkyy.png" />
                    <div class="bold_tit">访客预约</div>
                </div>
                <div class="each_list" onclick="toreplapp()">
                    <img src="weixin/app/Intelli/img/dryy.png" />
                    <div class="bold_tit">代人预约</div>
                </div>
                <div class="each_list" onclick="toAppointAudit()">
                    <img src="weixin/app/Intelli/img/yysh.png" />
                    <div class="bold_tit">预约审核</div>
                </div>
                <div class="each_list" onclick="tovisitrecord()">
                    <img src="weixin/app/Intelli/img/fwjj.png" />
                    <div class="bold_tit">访问记录</div>
                </div>
            </div>
        </div>
<%--        访客预约 的 角色选择框--%>
        <div id="kuang" class="out_kuang" style="display: none">
            <div style="width: 50%;" onclick="tovisitAppo()">
                <img class="img_size" src="weixin/app/Intelli/img/swfk.png" />
                <div class="word_333">商务访客</div>
            </div>
            <div style="width: 50%;" onclick="tovisitAppo()">
                <img class="img_size" src="weixin/app/Intelli/img/grfk.png" />
                <div class="word_333">个人访客</div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    new Vue({
        el: "#visitorhome",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "智慧访客管理"
        }
    })
    function outKuang () {
        var isblock = document.getElementById("kuang").style.display
        if(isblock == "none"){
            document.getElementById("kuang").style.display = "flex"
        }else {
            document.getElementById("kuang").style.display = "none"
        }
    }
    function  toAppointAudit () {
        window.location = basePath + "weixin/app/Intelli/pages/Visitor/appointAudit.jsp";
    }
    function toreplapp() {
        window.location = basePath + "weixin/app/Intelli/pages/Visitor/replaceAppoint.jsp";
    }
    function tovisitrecord() {
        window.location = basePath + "weixin/app/Intelli/pages/Visitor/visitorRecord.jsp";
    }
    function tovisitAppo(type) {
        window.location = basePath + "weixin/app/Intelli/pages/Visitor/visitorAppoint.jsp?type="+type;
    }
</script>
</html>

