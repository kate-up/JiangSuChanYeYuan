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
    <script src="weixin/app/Intelli/js/index.js"></script>
    <script src="weixin/app/Intelli/component/head.js"></script>
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

        .input-box {
            width: 60% !important;
            height: 30px;
            font-size: 14px;
            -webkit-appearance: none;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            padding: 0 18px !important;
            text-align: right;
            border: none !important;
            color: #9e9e9e !important;
        }
        input, textarea {
            outline: 0;
            -webkit-appearance: none;
        }
    </style>
</head>
<body class="gray-bg" :style="{height: screenHeight + 'px'}" style="overflow: hidden;">
    <div id="app" style="margin-bottom: 10px; border-bottom: 1px solid #eee;height: 100%">
        <head-menu :head-menu="title">{{title}}</head-menu>
        <div style="background: #fff;margin-top: 10px;padding: 10px 10px;height: calc(100% - 55px);overflow-y: scroll;" class="wrapper wrapper-content">
            <form class="form-horizontal" id="detailForm" novalidate="novalidate">
                <div class="row">
                    <div class="form-group col-xs-12 col-sm-12">
                        <label class="col-sm-3 col-xs-3 control-label is-required">会议主题</label>
                        <div class="col-sm-9 col-xs-9">
                            <input id="visitorNam0" name="visitorNam" class="form-control" >
                        </div>
                    </div>
<%--                    <div class="form-group col-xs-12  col-sm-12 col-md-6">--%>
<%--                        <label class="col-xs-3 col-sm-3 control-label">会议类型</label>--%>
<%--                        <div class="col-xs-9 col-sm-9">--%>
<%--                            <select id="travelMode" name="travelMode" class="form-control form-select2" required></select>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="form-group col-xs-12 col-sm-12">
                        <div style="padding-left: 15px;">
                            <div style="display: flex;justify-content: space-between;position:relative;">
                                <div style="font-size: 13px;color: #9e9e9e;line-height: 30px;width: fit-content;">会议类型</div>
                                <input @click="showProblemName" class="input-box" :value="problem_name" readonly="" type="text" placeholder="请选择会议类型">
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
                    </div>
<%--                    <div class="form-group col-xs-12 col-md-6">--%>
<%--                        <label class="col-sm-3 control-label is-required">开始日期</label>--%>
<%--                        <div class="col-sm-12">--%>
<%--                            <div class="input-group">--%>
<%--                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>--%>
<%--                                <input  type="text" id="visitTime" name="visitTime" placeholder="yyyy-MM-dd" class='form-control' fieldType="datetimeSS" onFocus="aweto.datePicker(this)" required/>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="layout_bet" >
                        <label class="control-label is-required">开始日期</label>
                        <span class="glyphicon glyphicon-menu-right"  aria-hidden="true" style="margin: auto 0"></span>
                    </div>
<%--                    <div class="form-group col-xs-12 col-md-6">--%>
<%--                        <label class="col-sm-3 control-label is-required">开始时间-结束时间</label>--%>
<%--                        <div class="col-sm-12">--%>
<%--                            <div class="input-group">--%>
<%--                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>--%>
<%--                                <input type="text" id="endTime" name="endTime" placeholder="HH" class='form-control'  fieldType="mydateMD" onFocus="aweto.datePicker(this)" required/>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="layout_bet" @click="toChoseTime()">
                        <label class="control-label is-required">开始时间-结束时间</label>
                        <span class="glyphicon glyphicon-menu-right"  aria-hidden="true" style="margin: auto 0"></span>
                    </div>
                    <div class="form-group col-xs-12 col-sm-12">
                        <label class="col-sm-3 col-xs-3 control-label">组织部门</label>
                        <div class="col-sm-8 col-xs-9">
                            <input id="visitorNam1" name="visitorNam" class="form-control" >
                        </div>
                    </div>
                    <div class="form-group col-xs-12 col-sm-12">
                        <label class="col-sm-3 col-xs-3 control-label">申请人</label>
                        <div class="col-sm-8 col-xs-9">
                            <input id="visitorNam2" name="visitorNam" class="form-control" >
                        </div>
                    </div>
                    <div class="layout_bet">
                        <div>允许会员上传文档</div>
                        <label class="toggle-switch switch-solid"><input  @click="ischecked()" id="authControl0" name="authControl" class="form-toggle-switch i-form-field i-form-checkbox inited" type="checkbox" checked="checked"><span></span></label>
                    </div>
                    <div class="layout_bet">
                        <div>会议录制</div>
                        <label class="toggle-switch switch-solid"><input  @click="ischeck()" id="authControl1" name="authControl" class="form-toggle-switch i-form-field i-form-checkbox inited" type="checkbox" checked="checked"><span></span></label>
                    </div>

                    <div class="layout_bet" style="display: grid;">
                        <label class="control-label is-required">与会者（1）</label>
                        <div style="display: flex;">
                            <div @click="toperslist()" style="width: 40px;height: 40px;line-height: 40px;text-align: center;font-size: 15px;border:2px solid rgba(221,221,221,1);border-radius: 50%;margin-right: 10px;">+</div>
                            <div style="width: 40px;height: 40px;line-height: 40px;text-align: center;font-size: 15px;border:2px solid rgba(221,221,221,1);border-radius: 50%;">我</div>
                        </div>
                    </div>

                    <div class="layout_bet" @click="toDevice()">
                        <div>设备控制</div>
                        <span class="glyphicon glyphicon-menu-right"  aria-hidden="true" style="margin: auto 0"></span>
                    </div>
                    <div class="layout_bet" @click="toHeightSet()">
                        <div>高级设置</div>
                        <span class="glyphicon glyphicon-menu-right"  aria-hidden="true" style="margin: auto 0"></span>
                    </div>
                    <button class="btn btn-primary" type="button" onclick="closeCurrentLayer()">预约会议</button>
                </div>
            </form>
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
            title: "预约会议",
            problem_name: '',
            problemVisible: false,
            problem_list: [{
                flex: 1,
                values: [{
                    "id": 11,
                    "name": "商务座谈"
                }, {
                    "id": 21,
                    "name": "研发研讨会"
                }, {
                    "id": 21,
                    "name": "部门总结"
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
            toDevice: function ( ){
                window.location = basePath + "weixin/app/Intelli/pages/Meeting/deviceControl.jsp";
            },
            toHeightSet: function(){
                window.location = basePath + "weixin/app/Intelli/pages/Meeting/heightSetting.jsp";
            },
            toperslist: function(){
                window.location = basePath + "weixin/app/Intelli/pages/Meeting/conventioner.jsp";
            },
            toChoseTime: function () {
                window.location = basePath + "weixin/app/Intelli/pages/Meeting/meetTimeChose.jsp";
            },
            ischecked: function () {
                var checked = document.getElementById("authControl0");
                if(checked.checked){
                    layer.msg("已开启会员上传功能", {icon: 1});
                }else{
                    layer.msg("已关闭会员上传功能", {icon: 4});
                }
            },
            ischeck: function () {
                var checked = document.getElementById("authControl1");
                if(checked.checked){
                    layer.msg("已开启会议录制", {icon: 1});
                }else{
                    layer.msg("已关闭会议录制", {icon: 4});
                }
            }
        }
    })
</script>
</html>

