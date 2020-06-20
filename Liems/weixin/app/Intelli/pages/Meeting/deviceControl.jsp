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
        }
        .form-group {
            margin: 15px 0;
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

        .chaxun, .chaxun_no {
            /*background: #3daa62;*/
            /*color: #fff;*/
            /*width: 70%;*/
            /*height: 35px;*/
            /*border-radius: 3px;*/
            /*line-height: 35px;*/
            /*text-align: center;*/
            /*margin: auto;*/

            position: absolute;
            bottom: 25px;
            width: 86%;
            background: #3DAA62;
            color: #fff;
            font-size: 15px;
            height: 39px;
            line-height: 39px;
            text-align: center;
            margin-left: 7%;
            border-radius: 4px;
        }
        .chaxun_no {
            opacity: 0.3;
        }
    </style>
</head>
<body class="gray-bg" :style="{height: screenHeight + 'px'}" style="overflow: hidden;">
    <div id="app" style="margin-bottom: 10px; border-bottom: 1px solid #eee;">
        <head-menu :head-menu="title">{{title}}</head-menu>
        <div style="background: #fff;margin: 10px 0;">
            <div style="color: #999; font-size: 15px;padding: 15px 0 0 20px;">参数监测</div>
            <div style="width: 100%;display: flex;flex-wrap: wrap;">
                <div v-for="(item, index) in parameters" style="width: 25%;text-align: center;padding: 12px 0;">
                    <div style="margin: auto;width: 50px;height: 50px;border-radius: 50%;background: #3DAA62;color:#fff;font-size: 15px;line-height: 50px;">{{item.num}}</div>
                    <div style="color: #333;font-size: 14px;">{{item.cont}}</div>
                </div>
            </div>
        </div>
<%--        <div class="row" style="background: #fff;">--%>
<%--            <div class="form-group col-xs-12  col-sm-12 col-md-6">--%>
<%--                <label class="col-xs-7 col-sm-7 control-label">场景分类</label>--%>
<%--                <div class="col-xs-5 col-sm-5">--%>
<%--                    <select id="travelMode" name="travelMode" class="form-control form-select2" required></select>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
        <div style="padding: 10px 15px;background: #fff;">
            <div style="display: flex;justify-content: space-between;position:relative;">
                <div style="font-size: 13px;color: #000;line-height: 30px;width: fit-content;">场景分类</div>
                <input @click="showProblemName" class="input-box" :value="problem_name" readonly="" type="text" placeholder="请选择场景">
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
<%--        <div style="background: #fff;display: flex;justify-content: space-between;">--%>
<%--            <div style="color: #999; font-size: 15px;padding: 15px 0 0 20px;">场景分类</div>--%>
<%--            <select style="width: 50%;" id="travelMode" name="travelMode" class="form-control form-select2" required></select>--%>
<%--        </div>--%>
        <div :class="[is_can?'chaxun':'chaxun_no']"  @click="ischeck()">确认</div>
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
            title: "设备控制",
            parameters: [
                {num: "22", cont: "温度℃"},
                {num: "65", cont: "湿度％"},
                {num: "200", cont: "光照度lus"},
                {num: "150", cont: "CO2ppm"},
                {num: "22", cont: "甲醛mg/m3"},
                {num: "65", cont: "TVCCmg/m3"},
                {num: "202", cont: "PM2.5ug/m3"}
            ],
            problem_name: '',
            problemVisible: false,
            problem_list: [{
                flex: 1,
                values: [{
                    "id": 11,
                    "name": "场景一"
                }, {
                    "id": 21,
                    "name": "场景二"
                }, {
                    "id": 21,
                    "name": "场景三"
                }],
                textAlign: 'center'
            }],
        },
        computed: {
            is_can: function() { //控制查询按钮
                return (this.problem_name )
            }
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
            ischeck: function () {
                var that = this;
                if(this.is_can == ''){
                    // layer.msg("请选择场景类型", {icon: 3});
                    // 1 绿色对勾 2 红色叉叉 3 黄色感叹号 4 灰色 锁住了 5 红色哭脸 6 绿色笑脸
                    return
                }else {
                    layer.msg("设备设置成功", {icon: 1});
                }
            }
        }
    })
</script>
</html>

