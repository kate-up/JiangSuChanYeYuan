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
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <link rel="stylesheet" href="weixin/app/Intelli/css/index.css">
    <script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js"></script>
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
        .wrapper-content {
            padding: 0 15px !important;
        }
        .layout_bet {
            color: #000;
        }

        .suggest-title {
            font-size: 14px;
            color: #656565;
            line-height: 30px;
            width: fit-content;
        }
        .input-box {
            width: 60% !important;
            height: 30px;
            font-size: 14px;
            padding: 0 .18rem;
            -webkit-appearance: none;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            border: 1px solid #E9ECF4 !important;
            padding: 0 18px !important;
            text-align: right;
            border: none !important;
        }
        input, textarea {
            outline: 0;
            -webkit-appearance: none;
        }
    </style>
</head>
<body :style="{height: screenHeight + 'px'}" style="overflow: hidden;">
<div id="heightSet">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <div style="background: #fff;font-size: 13px;" class="wrapper wrapper-content">
        <div style="padding: 0 15px;">
            <div style="display: flex;justify-content: space-between;position:relative;">
                <div style="font-size: 13px;color: #000;line-height: 30px;width: fit-content;">允许入会</div>
                <input @click="showProblemName" class="input-box" :value="problem_name" readonly="" type="text" placeholder="请选择参会人员">
                <img style="width: 10px;height: 15px;position: absolute;right: 0px;top: 8px;" src="weixin/app/Intelli/img/rignt_jiantou.png" />
            </div>
            <mt-popup v-model="problemVisible" position="bottom">
                <ul class="mint-popup-head">
                    <li @click="selectProblem(0)">取消</li>
                    <li @click="selectProblem(1)">确认</li>
                </ul>
                <mt-picker :slots="problem_list" @change="problemChange" value-key="name"> </mt-picker>
            </mt-popup>
        </div>
        <form class="form-horizontal" id="detailForm" novalidate="novalidate">
            <div class="row">
<%--                <div class="layout_bet">--%>
<%--                    <div>允许入会：</div>--%>
<%--                    <span class="glyphicon glyphicon-menu-right"  aria-hidden="true" style="margin: auto 0"></span>--%>
<%--                </div>--%>
                <div class="layout_bet">
                    <div>消息通知</div>
                    <label class="toggle-switch switch-solid"><input @click="ischecked()" id="authControl1" name="authControl" class="form-toggle-switch i-form-field i-form-checkbox inited" type="checkbox" checked="checked"><span></span></label>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script type="text/javascript">
    new Vue({
        el: "#heightSet",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "高级设置",
            problem_name: '',
            problemVisible: false,
            problem_list: [{
                flex: 1,
                values: [{
                    "id": 11,
                    "name": "所有人"
                }, {
                    "id": 21,
                    "name": "部门成员"
                }, {
                    "id": 21,
                    "name": "小组成员"
                }],
                textAlign: 'center'
            }],
        },
        methods: {
            // 类型弹窗
            showProblemName: function() {
                this.problemVisible = true;
                if (!this.problem_temp) {
                    this.problem_temp = this.problem_list[0].values[0].name;
                }
            },
            problemChange: function(picker, values) {
                if (picker.getSlotValue(0)) {
                    this.problem_temp = picker.getSlotValue(0).name
                }
            },
            selectProblem: function(bool) {
                // bool 判断 触发的是取消还是确认按钮
                this.problem_name = bool ? this.problem_temp : this.problem_name;
                this.problemVisible = false
            },
            ischecked: function () {
                var checked = document.getElementById("authControl1");
                if(checked.checked){
                    layer.msg("已开启消息通知", {icon: 1});
                }else{
                    layer.msg("已关闭消息通知", {icon: 4});
                }
            }
        }
    })
</script>
</html>

