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
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js"></script>
    <style>
        .cont {
            height: 100%;
        }
        .toolbar {
            display: flex;
            width: 100%;
            background: #fff;
            border-bottom: 1px solid #ddd;
            margin-bottom: 10px;
            height: 39px;
            line-height: 39px;
        }
        .toolbar div{
            width: 50%;
            text-align: center;
            color: #666;
            font-size: 14px;
        }
        .each_list {
            background: #fff;
            margin-bottom: 10px;
            padding: 20px;
            line-height: 24px;
            font-size: 14px;
        }
        .first_row {
            display: flex;
            justify-content: space-between;
            color: #666;
            border-bottom: 1px solid #e5e5e5;
            margin-bottom: 6px;
        }
        .chosed {
            color: #333 !important;
        }
        .chosed:after {
            content: " ";
            width: 30px;
            height: 3px;
            background: #3DAA62;
            display: block;
            margin-left: calc(50% - 15px);
            position: relative;
            top: -3px;
        }
    </style>
</head>
<body class="gray-bg" :style="{height: screenHeight + 'px'}" >
    <div id="visitorhome" class="cont">
        <head-menu :head-menu="title">{{title}}</head-menu>
        <div class="toolbar" id="arrLi">
            <div class="chosed">待审核</div>
            <div>已审核</div>
        </div>
        <div style="height: calc(100% - 94px);overflow-y: scroll;">
            <div class="each_list" v-for="(item, index) in lists" @click="toDet(item.voNo)">
                <div class="first_row" >
                    <div style="color: #333;">来访人：{{item.visitorNam}}</div>
                    <div>{{item.visitorTyp}}</div>
                </div>
                <div>来访时间：{{item.visitTime}}</div>
                <div>联系电话{{item.cellPhone}}</div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">

    var records=[];

    new Vue({
        el: "#visitorhome",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "预约审核",
            lists: "",
            index: 0
        },
        methods: {
            toDet (voNo) {
                if(this.index == 0){
                    window.location = basePath + "weixin/app/Intelli/pages/Visitor/ToAuditDet.jsp?voNo=" + voNo;
                }else if(this.index == 1){
                    window.location = basePath + "weixin/app/Intelli/pages/Visitor/passAuditDet.jsp?voNo=" + voNo;
                }

            }
        },
        created(){
            that = this
            aweto.ajax(basePath + "/spm/spmOrderReview/getAppointmentReview.ajax", {type:0}, false, function (data) {
                if (data.result == "fail") {
                    layer.msg(data.msg, {icon: 5});//不开心
                    res = false;
                }else{
                    that.lists=data.data;
                }
            });
        }
    })
    var arrLi = document.getElementById("arrLi").children
    for(var i=0; i< arrLi.length; i++) {
        cut(arrLi[i])
    }
    function cut (obj) {
        obj.onclick = function () {
            for(var j=0; j<arrLi.length; j++) {
                if(obj == arrLi[j]) {
                    obj.className = "chosed";
                    aweto.ajax(basePath + "/spm/spmOrderReview/getAppointmentReview.ajax", {type:j}, false, function (data) {
                        if (data.result == "fail") {
                            layer.msg(data.msg, {icon: 5});//不开心
                            res = false;
                        }else{
                            that.lists = data.data
                            that.index = j
                        }
                    });
                }else{
                    arrLi[j].className = ''
                }
            }
        }
    }
</script>
</html>

