<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %>
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
    <aweto:entityInfo name="org.aweto.spm.entity.SpmVisitorOrder"/>
    <script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js?v=20200217"></script>
    <script src="weixin/app/Intelli/js/vue.js"></script>
    <script src="weixin/app/Intelli/component/head.js"></script>
    <script src="weixin/app/Intelli/js/index.js"></script>
    <link rel="stylesheet" href="weixin/app/Intelli/css/index.css">
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js"></script>
    <script type="text/javascript">
        var namespace='/spm/spmVisitorOrder';
        $(function(){
            init({
                url:basePath+namespace+"/find.ajax",
                saveUrl:basePath+namespace+"/save.ajax?visitTyp=11",
                form:$("#detailForm"),
                floating:false,
                onLoad:function(pk,recorder){


                },beforeSubmit:function(data){
                    // alert("提交之前");
                    console.log(data);
                    return data;
                },afterSubmit:function(rtn){
                    // alert("提交之后");
                    layer.msg("提交成功", {icon:6});
                    window.location = basePath + "/weixin/app/Intelli/pages/Visitor/appointAudit.jsp";
                    return true;
                }
            });
        });



    </script>
    <style>
        label {
            font-size: 0.1rem !important;
            padding-left: 0 !important;
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

        label.error {
            top: 0px !important;
        }
    </style>
</head>
<body class="gray-bg" :style="{height: screenHeight + 'px'}" style="overflow: hidden">
<div id="app" style="margin-bottom: 10px; border-bottom: 1px solid #eee;" :style="{height: screenHeight + 'px'}">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <div style="background: #fff;padding-top: 20px;height: calc(100% - 45px);overflow-y: scroll;margin-top: 10px;" class="wrapper wrapper-content">
        <form class="form-horizontal" id="detailForm" novalidate="novalidate">
            <div class="row">
                <div class="form-group col-xs-12  col-sm-12 col-md-6">
                    <label class="col-xs-3 col-sm-3 control-label">来访目的</label>
                    <div class="col-xs-9 col-sm-9">
                        <select id="visitorTyp" name="visitorTyp" class="form-control form-select2" required></select>
                    </div>
                </div>
                <div class="form-group col-xs-12 col-sm-12">
                    <label class="col-sm-3 col-xs-3 control-label">来访企业</label>
                    <div class="col-sm-9 col-xs-9">
                        <input id="sourcePlace" name="sourcePlace" class="form-control" required>
                    </div>
                </div>
                <div class="form-group col-xs-12 col-sm-12">
                    <label class="col-sm-3 col-xs-3 control-label">来访者姓名</label>
                    <div class="col-sm-9 col-xs-9">
                        <input id="visitorNam" name="visitorNam" class="form-control" required>
                    </div>
                </div>
                <div class="form-group col-xs-12 col-sm-12">
                    <label class="col-sm-3 col-xs-3 control-label" style="white-space: nowrap !important;">来访者手机号</label>
                    <div class="col-sm-9 col-xs-9">
                        <input id="cellPhone" name="cellPhone" class="form-control" required>
                    </div>
                </div>
                <div class="form-group col-xs-12 col-sm-12">
                    <label class="col-sm-3 col-xs-3 control-label">身份证号</label>
                    <div class="col-sm-9 col-xs-9">
                        <input id="idCard" name="idCard" class="form-control" >
                    </div>
                </div>
                <div class="form-group col-xs-12  col-sm-12 col-md-6">
                    <label class="col-xs-3 col-sm-3 control-label">入园方式</label>
                    <div class="col-xs-9 col-sm-9">
                        <select id="travelMode" name="travelMode" class="form-control form-select2" required></select>
                    </div>
                </div>
                <div class="form-group col-xs-12 col-sm-12">
                    <label class="col-sm-3 col-xs-3 control-label">车牌号</label>
                    <div class="col-sm-9 col-xs-9">
                        <input id="carNumber" name="carNumber" class="form-control" required>
                    </div>
                </div>

                <div class="form-group col-xs-12 col-md-6">
                    <div >
                        <div style="display: flex;justify-content: space-between;position:relative;">
                            <label class="control-label is-required">拜访公司</label>
                            <%--                                <div style="font-size: 13px;color: #9e9e9e;line-height: 30px;width: fit-content;">拜访公司</div>--%>
                            <input @click="showProblemName" class="input-box" :value="problem_name" readonly="" type="text" placeholder="请选择拜访公司">
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
                <div class="form-group col-xs-12 col-md-6">
                    <label class="col-sm-3 control-label">计划来访时间</label>
                    <div class="col-sm-12">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                            <input  type="text" id="visitTime" name="visitTime" placeholder="yyyy-MM-dd" class='form-control' fieldType="datetimeSS" onFocus="aweto.datePicker(this)" required/>
                        </div>
                    </div>
                </div>

                <div class="form-group col-xs-12 col-sm-12">
                    <label class="col-sm-3 control-label">照片：</label>
                    <div class="col-sm-8">
                        <input id="vistorPhoto" name="vistorPhoto"  class="form-image-upload" required/>
                    </div>
                </div>
                <%--<div class="form-group">--%>
                    <%--<label class="col-sm-3 control-label">照片：</label>--%>
                    <%--<div class="col-sm-8 fileinput">--%>
                        <%--<div class="fileinput-new thumbnail" style="width: 180px; height: 160px;"><img id="demoImagePreview" src="images/noImage.png"></div><div class="file-input file-input-new">--%>
                        <%--<div class="kv-upload-progress kv-hidden" style="display: none;"><div class="progress">--%>
                            <%--<div class="progress-bar bg-success progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%;">--%>
                                <%--0%--%>
                            <%--</div>--%>
                        <%--</div></div>--%>
                        <%--<div class="clearfix"></div>--%>

                        <%--<button type="button" tabindex="500" title="取消进行中的上传" class="btn btn-default btn-secondary kv-hidden fileinput-cancel fileinput-cancel-button"><i class="glyphicon glyphicon-ban-circle"></i>  <span class="hidden-xs">取消</span></button>--%>
                        <%--<a href="http://localhost:8088/Liems//pub/uploadFile.ajax" tabindex="500" title="上传选中文件" class="btn btn-info btn-image-upload fileinput-upload fileinput-upload-button"><i class="glyphicon glyphicon-upload"></i>   <span class="hidden-xs">上传</span></a>--%>
                        <%--<div tabindex="500" class="btn btn-success btn-image-upload btn-file"><i class="glyphicon glyphicon-picture"></i>   <span class="hidden-xs">选择</span><input type="file" fieldname="demoImage" name="fileupload" accept="image/*" id="1591760379758_39"></div>--%>
                    <%--</div><input id="demoImage" name="demoImage" class="form-image-upload i-form-field inited" style="display: none;">--%>
                    <%--</div>--%>
                <%--</div>--%>


                <button class="btn btn-primary" type="button" onclick="submitForm(this)">提交</button>
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
            title: "代人预约",
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
        }
    })
</script>
</html>

