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
    <aweto:entityInfo name="org.aweto.spm.entity.SpmGoodAddr"/>
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
        label {
            font-size: 13px;
            color: #999;
            line-height: 34px;
        }
        .col-sm-3 ,.col-xs-3, .col-sm-9 ,.col-xs-9,.col-xs-12 ,.col-sm-12 {
            padding-right: 0 !important;
        }
        .row {
            margin-bottom: 0 !important;
        }
        .btn-primary {
            color: #fff;
            background-color: #3DAA62;
            border-color: #3DAA62;
            width: 80%;
            margin: 0 10%;
            font-size: 15px;
            position: absolute;
            bottom: 20px;
        }
        .add_test {
            position: absolute;
            top: 0;
            right: 10px;
            line-height: 44px;
            font-size: 13px;
            color: #F44242;
        }
    </style>

    <script type="text/javascript">
        var namespace='/spm/spmGoodAddr';
        $(function(){
            init({
                url:basePath+namespace+"/find.ajax",
                saveUrl:basePath+namespace+"/save.ajax",
                form:$("#detailForm"),
                floating:false,
                onLoad:function(pk,recorder){

                },beforeSubmit:function(data){
                    //alert(1);
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
<%--        <div class="add_test">删除</div>--%>
        <img style="width: 20px;height: 20px;position:absolute;top: 10px;right: 10px;" src="weixin/app/Intelli/img/rili.png" />
        <div style="background: #fff;padding-top: 20px;margin-top: 10px;" class="wrapper wrapper-content">
            <form class="form-horizontal" id="detailForm" novalidate="novalidate">
                <div class="row">
                    <div class="form-group col-xs-12 col-sm-12">
                        <label class="col-sm-3 col-xs-3 control-label">收货人：</label>
                        <div class="col-sm-9 col-xs-9">
                            <input id="usrNam" name="usrNam" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group col-xs-12 col-sm-12">
                        <label class="col-sm-3 col-xs-3 control-label">手机号码：</label>
                        <div class="col-sm-9 col-xs-9">
                            <input id="usrTel" name="usrTel" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group col-xs-12 col-sm-12">
                        <label class="col-sm-3 col-xs-3 control-label">详细地址：</label>
                        <div class="col-sm-9 col-xs-9">
                            <input id="usrAddr" name="usrAddr" class="form-control" required>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <button class="btn btn-primary" type="button" onclick="submitForm(this)">提交</button>
    </div>
</body>
<script>

    <%--var addrNo2 = '<%=addrNo1%>';--%>
    <%--aweto.ajax(basePath + "/spm/spmGoodAddr/getGoodAddrByNoInfo.ajax", {addrNo:addrNo2}, false, function (data) {--%>
        <%--if (data.result == "fail") {--%>
            <%--layer.msg(data.msg, {icon: 5});//不开心--%>
            <%--res = false;--%>
        <%--}else{--%>
            <%--records=data.data[0];--%>
            <%--console.log(JSON.stringify(records));--%>
            <%--$("#usrNam").attr("value",records.usrNam);--%>
            <%--$("#usrTel").attr("value",records.usrTel);--%>
            <%--$("#usrAddr").attr("value",records.usrAddr);--%>
            <%--alert(records.usrNam+ "" + records.usrTel + "" +records.usrAddr);--%>

        <%--}--%>
    <%--});--%>



    new Vue({
        el: "#parkingapply",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "修改地址"
        }
    })
</script>


</html>