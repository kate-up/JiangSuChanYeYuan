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
    <aweto:entityInfo name="org.aweto.spm.entity.SpmApplyCar"/>
    <script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js?v=20200217"></script>
    <script src="weixin/app/Intelli/js/vue.js"></script>
    <script src="weixin/app/Intelli/component/head.js"></script>
    <script src="weixin/app/Intelli/component/cardLsit.js"></script>
    <script src="weixin/app/Intelli/component/ulList.js"></script>
    <script src="weixin/app/Intelli/component/msgList.js"></script>
    <script src="weixin/app/Intelli/js/index.js"></script>
    <link rel="stylesheet" href="weixin/app/Intelli/css/index.css">
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <style type="text/css">
        body {
            padding: 0 !important;
            margin: 0 !important;
            box-sizing: border-box !important;
        }
        label {
            font-size: 13px;
            color: #999;
            line-height: 34px;
        }
        .col-sm-3 ,.col-xs-3, .col-sm-4 ,.col-xs-4 ,.col-sm-8,.col-xs-8 ,.col-sm-9 ,.col-xs-9,.col-xs-12 ,.col-sm-12 {
            padding-right: 0 !important;
        }
        .row {
            margin-bottom: 0 !important;
        }
        .btn-primary, .chaxun_no {
            color: #fff;
            background-color: #3DAA62;
            border-color: #3DAA62;
            width: 80%;
            margin: 0 10%;
            font-size: 15px;
            position: absolute;
            bottom: 20px;
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
    <script type="text/javascript">
        var namespace='/spm/spmApplyCar';
        $(function(){
            init({
                url:basePath+namespace+"/find.ajax",
                saveUrl:basePath+namespace+"/save.ajax",
                form:$("#detailForm"),
                floating:false,
                onLoad:function(pk,recorder){

                },beforeSubmit:function(data){
                    return data;
                },afterSubmit:function(rtn){
                    layer.msg("提交成功", {icon: 1});//不开心
                    location.reload();
                    return true;
                }
            });
        });

    </script>
</head>
<body>
<div id="parkingapply" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <img style="width: 20px;height: 20px;position:absolute;top: 10px;right: 10px;" src="weixin/app/Intelli/img/rili.png" />
    <div style="background: #fff;padding-top: 20px;" class="wrapper wrapper-content">
        <form class="form-horizontal" id="detailForm" novalidate="novalidate">
            <div class="row">
                <div class="form-group col-xs-12 col-sm-12">
                    <label class="col-sm-3 col-xs-3 control-label is-required">您的姓名</label>
                    <div class="col-sm-9 col-xs-9">
                        <input id="usrNam" name="usrNam" class="form-control" >
                    </div>
                </div>
                <div class="form-group col-xs-12 col-sm-12">
                    <label class="col-sm-3 col-xs-3 control-label is-required">手机号</label>
                    <div class="col-sm-9 col-xs-9">
                        <input id="usrPhone" name="usrPhone" class="form-control" >
                    </div>
                </div>
                <div class="form-group col-xs-12 col-sm-12">
                    <label class="col-sm-3 col-xs-3 control-label ">身份证号</label>
                    <div class="col-sm-9 col-xs-9">
                        <input id="idCard" name="idCard" class="form-control" >
                    </div>
                </div>
                <div class="form-group col-xs-12 col-sm-12">
                    <label class="col-sm-3 col-xs-3 control-label is-required">车牌号</label>
                    <div class="col-sm-9 col-xs-9">
                        <input id="carNumber" name="carNumber" class="form-control" >
                    </div>
                </div>

                <div class="form-group col-xs-12  col-sm-12 col-md-6">
                    <div style="padding-left: 15px;">
                        <div style="display: flex;justify-content: space-between;position:relative;">
                            <div style="font-size: 13px;color: #9f9f9f;line-height: 30px;width: fit-content;">所属公司</div>
                            <input @click="showProblemName" class="input-box" :value="problem_name" readonly="" type="text" placeholder="请选择所属公司">
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
                <%--<div class="form-group col-xs-12  col-sm-12 col-md-6">--%>
                    <%--<div style="padding-left: 15px;">--%>
                        <%--<div style="display: flex;justify-content: space-between;position:relative;">--%>
                            <%--<div style="font-size: 13px;color: #9f9f9f;line-height: 30px;width: fit-content;">申请时长</div>--%>
                            <%--<input @click="showProblemName0" class="input-box" :value="problem_name0" readonly="" type="text" placeholder="请选择申请时长">--%>
                            <%--<img style="width: 10px;height: 15px;position: absolute;right: 0px;top: 8px;" src="weixin/app/Intelli/img/rignt_jiantou.png" />--%>
                        <%--</div>--%>
                        <%--<mt-popup v-model="problemVisible0" position="bottom">--%>
                            <%--<ul class="mint-popup-head">--%>
                                <%--<li @click="selectProblem0(0)">取消</li>--%>
                                <%--<li @click="selectProblem0(1)">确认</li>--%>
                            <%--</ul>--%>
                            <%--<mt-picker :slots="problem_list0" @change="problemChange0" value-key="name"> </mt-picker>--%>
                        <%--</mt-popup>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <div class="form-group col-xs-12 col-sm-1">
                    <label class="col-sm-3 col-xs-3 control-label ">申请时长：</label>
                    <div class="col-sm-9 col-xs-9">
                        <select id="appleTime" name="appleTime" class="form-control form-select2" ></select>
                    </div>
                </div>

                <div class="form-group hidden">

                    <input type="hidden" id="firstUser" name="firstUser">
                    <input type="hidden" id="lastUser" name="lastUser">
                    <input type="text" id="firstDtm" name="firstDtm" readonly=true placeholder="yyyy-MM-dd" class='form-control' onFocus="aweto.datePicker(this)" />
                    <input type="text" id="lastDtm" name="lastDtm" readonly=true placeholder="yyyy-MM-dd" class='form-control' onFocus="aweto.datePicker(this)" />
                </div>

            </div>
        </form>
    </div>
    <button class="btn btn-primary" type="button" onclick="submitForm(this)">确定</button>
</div>
</body>
<script>
    new Vue({
        el: "#parkingapply",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "车位申请",
            problem_name: '',
            problemVisible: false,
            problem_list: [{
                flex: 1,
                values: [{
                    "id": 11,
                    "name": "公司一"
                }, {
                    "id": 21,
                    "name": "公司二"
                }, {
                    "id": 21,
                    "name": "公司三"
                }],
                textAlign: 'center'
            }],
            problem_name0: '',
            problemVisible0: false,
            problem_list0: [{
                flex: 1,
                values: [{
                    "id": 11,
                    "name": "一个月"
                }, {
                    "id": 21,
                    "name": "一个季度"
                }, {
                    "id": 21,
                    "name": "半年"
                }, {
                    "id": 21,
                    "name": "一年"
                }],
                textAlign: 'center'
            }],
        },
        computed: {
            is_can: function() { //控制查询按钮
                return (this.problem_name && this.problem_name0 )
            }
        },
        methods: {
            closeCurrentLayer:function () {
                var that = this;
                if(!this.is_can){
                    // layer.msg("请选择场景类型", {icon: 3});
                    // 1 绿色对勾 2 红色叉叉 3 黄色感叹号 4 灰色 锁住了 5 红色哭脸 6 绿色笑脸
                    return
                }else {
                    layer.msg("已成功提交车位申请", {icon: 1});
                }
            },
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
            showProblemName0: function() {
                this.problemVisible0 = true;
                if (!this.problem_temp0) {
                    this.problem_temp0 = this.problem_list0[0].values[0].name;
                }
            },
            problemChange0: function(picker, values) {
                if (picker.getSlotValue(0)) {
                    this.problem_temp0 = picker.getSlotValue(0).name
                }
            },
            selectProblem0: function(bool) {
                // bool 判断 触发的是取消还是确认按钮
                this.problem_name0 = bool ? this.problem_temp0 : this.problem_name0;
                this.problemVisible0 = false
            }
        }
    })
</script>
</html>