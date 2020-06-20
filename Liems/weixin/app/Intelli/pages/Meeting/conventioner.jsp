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
    <script type="text/javascript">
        // var namespace='/spm/spmVisitorOrder';
        // $(function(){
        //     init({
        //         url:basePath+namespace+"/find.ajax",
        //         saveUrl:basePath+namespace+"/save.ajax?visitTyp=11",
        //         form:$("#detailForm"),
        //         floating:false,
        //         onLoad:function(pk,recorder){
        //
        //
        //         },beforeSubmit:function(data){
        //             return data;
        //         },afterSubmit:function(rtn){
        //             return true;
        //         }
        //     });
        // });

    </script>
    <style>
        label {
            font-size: 0.1rem !important;
        }
        .col-xs-3, .col-xs-4, .col-xs-12, .col-xs-9, .col-sm-12 {
            padding-right: 0px !important;
        }
        .row {
            margin: 0px !important;
        }
        .btn-primary {
            color: #fff;
            background-color: #3DAA62;
            border-color: #3DAA62;
            width: 80%;
            margin: 0 10%;
            font-size: 15px;
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
        .layout_bet {
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin: 15px 0;
            color: #9e9e9e;
            padding: 0 15px;
        }
        .switch-solid input:checked~span {
            background-color: #3DAA62 !important;
            border-color: #3DAA62;
        }
        .before_min {
            width: 40px;
            height: 40px;
            border: 1px solid #ddd;
            text-align: center;
            line-height: 40px;
            border-radius: 50%;
            color: #999;
            margin-right: 10px;
        }
    </style>
</head>
<body class="gray-bg" :style="{height: screenHeight + 'px'}" style="overflow: hidden;">
    <div id="app" style="margin-bottom: 10px; border-bottom: 1px solid #eee;">
        <head-menu :on-back="back()" :head-menu="title">{{title}}</head-menu>
        <div style="background: #fff;padding-top: 20px;" class="wrapper wrapper-content">
            <div>
                <div style="color: #999;font-size: 15px;"><img style="width: 7px;height: 7px;vertical-align: middle;margin-right: 7px;" src="weixin/app/Intelli/img/xinxin.png" />与会者（1）</div>
                <div style="display: flex;justify-content: space-between;">
                    <div style="color:#333;font-size:15px;display: flex;line-height: 40px;"><div class="before_min">我</div>张悦 15154896789</div>
                    <div style="display: flex;margin: auto 0;">
                        <img @click="addPers()" style="width: 30px; height: 21px;margin: 0 10px;" src="weixin/app/Intelli/img/add_per.png" />
                        <img @click="delPer()" style="width: 30px; height: 21px;margin: 0 10px;" src="weixin/app/Intelli/img/dele_per.png" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    new Vue({
        el: "#app",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "与会者"
        },
        methods: {
            addPers: function (){
                window.location = basePath + "weixin/app/Intelli/pages/Meeting/meetingAttendPeopleAdd.jsp";
            },
            delPer: function () {
                layer.confirm('确认删除此人吗？', {
                    btn: ['确定','取消'] //按钮
                }, function(index){
                    // var r=tableList.deleteRecorder(ids.join(","));
                    // if(r.state==SUCCESS){
                        layer.msg("删除成功", {icon: 1});//成功
                        // tableList.refresh();
                    // }else{
                    //     layer.msg("删除失败", {icon: 5});//不开心
                    // }
                }, function(index){
                    layer.close(index);
                });
            },
            back(){
                // alert("!1111")
                // window.location = basePath + "weixin/app/Intelli/pages/Meeting/meetingAppointDet.jsp";
            }
        }
    })
</script>
</html>

