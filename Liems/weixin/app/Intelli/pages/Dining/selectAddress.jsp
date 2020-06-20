<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %>
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %>
<%String identify= request.getParameter("identify") ; %>>
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
    <aweto:entityInfo name="org.aweto.web.entity.WebEmpCertify"/>
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
        .each_info {
            display: flex;
            padding: 10px 15px;
            font-size: 15px;
            color: #333;
            margin: 5px 0;
            background: #fff;
        }
        .each_info span {
            font-size: 13px;
            color: #999;
        }
        .bianji {
            width: 20%;
            color: #999;
            height: fit-content;
            margin: auto 0;
            text-align: right;
        }
        .bianji:before {
            content: " ";
            display: block;
            width: 2px;
            height: 20px;
            background: #eee;
            position: absolute;
            right: 60px;
        }
        .add_test {
            position: absolute;
            top: 0;
            right: 10px;
            line-height: 44px;
            font-size: 13px;
            color: #666;
        }
    </style>
</head>
<body>
<div id="parkingapply" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <div class="add_test" onclick="addaddress()">添加新地址</div>
    <div style="height: calc(100% - 45px); overflow-y: scroll" >
        <div class="each_info" v-for="(item, index) in lists" >
            <div style="width: 80%;" @click="backAddr(item.addrNo)">
                <div>{{item.usrNam}} <span> {{item.usrTel}}</span></div>
                <div>{{item.usrAddr}}</div>
            </div>
            <div class="bianji" @click="editaddres(item.addrNo)">编辑</div>
        </div>
    </div>
</div>
</body>
<script>

    var records=[];
    aweto.ajax(basePath + "/spm/spmGoodAddr/getGoodAddrInfo.ajax", {}, false, function (data) {
        if (data.result == "fail") {
            layer.msg(data.msg, {icon: 5});//不开心
            res = false;
        }else{
            records=data.data;
            console.log(JSON.stringify(records));
        }
    });

  var identify='<%=identify%>';
    new Vue({
        el: "#parkingapply",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "选择收货地址",
            lists:records
            // lists: [
            //     {name: "石丽丽", address: "6栋3单元201回升有限公司", phon: "15951265126"},
            //     {name: "石丽丽", address: "6栋3单元201回升有限公司", phon: "15951265126"}
            // ]
        },
        methods: {
            editaddres: function (addrNo) {
                window.location = basePath + "weixin/app/Intelli/pages/Dining/editAddress.jsp?pkValue=" + addrNo+"&action=edit";
            },
            backAddr: function(addrno){
            	
            	aweto.ajax(basePath + "/spm/spmGoodAddr/setSelectAddr.ajax", {addrno:addrno}, false, function (data) {
                    if (data.result == "success") {
                        window.location = basePath + "weixin/app/Intelli/pages/Dining/diNingConfirm.jsp?addrno=" + addrno+"&identify="+identify;

                    }
                });
            	
            }
 
        }
    })
    function addaddress() {
        window.location = basePath + "weixin/app/Intelli/pages/Dining/addAddress.jsp";
    }
    // function editaddres(addrNo) {
    //     window.location = basePath + "weixin/app/Intelli/pages/Dining/editAddress.jsp?addrNo =" + addrNo;
    // }
</script>
</html>