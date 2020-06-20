<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %>
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %>
<% String cmono= request.getParameter("cmono"); %>
<!DOCTYPE html>
<html lang="en">
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
    
     <link rel="stylesheet" href="weixin/app/Intelli/css/style.css">
    <style type="text/css">
        body {
            padding: 0 !important;
            margin: 0 !important;
            box-sizing: border-box !important;
        }
        .content{
            height: calc(100% - 57px );
		    margin-top: 10px;
		    padding-top: 10px;
		    background: #fff;
        }
	     .row{
             display:flex;
             margin: 5% 4% 4% 4%;
             box-shadow: 0 0 5px -1px;
             background: #fff;
             height: 17%;
	     }
	     .row-left-w{
             width:70%;
             text-align: center;
             color: white;
             background-color: #67C741;
          }
           .row-left-y{
             width:70%;
             text-align: center;
             color: white;
             background-color: #ddd;
          }
	     .row-right{
             text-align: center;
             width: 30%;
             padding: 2%;
	     }
	     .eVoucherIdsty{
             font-size: 13px;
             padding-top: 9px;
	     }
	     .row-right-firstdiv{
             color: #333;
             font-weight: bolder;
	     }
	     .row-right-sestdiv{
	        margin:3%;
             color: #999;
	     }
	     .row-right-hr{
	        height: 1px;
             width: 98%;
             margin-top: -11%;
	     }
	     .row-right-ff{
             margin-top: 4%;
             font-size: 13px;
             color:#AF375B;
            cursor: pointer;
	     }
	     .row-right-yff{
	         margin-top: 4%;
             font-size: 13px;
             color:#ddd;
	     }
    </style>
</head>
<body>
<div id="mmeetingAttendAP" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;">
    <head-menu :head-menu="title">{{title}}</head-menu>
   <div class="content" >
     <div style="display:flex;background: #fff;margin: 13px;box-shadow: 0 0 5px 5px #eee;" v-for="(item,index) in issueMealVs"> 
        <div :class="item.issuesta==1 ?'row-left-w':'row-left-y'"  >
           <div class="eVoucherIdsty" >电子就餐券编号{{(item.eVoucherId)}}</div>
           <div style="margin-top: 7%;"> <span style="font-size: 40px;" >￥{{item.money.substring(0,item.money.indexOf("."))}}</span>
           <span style="font-size: 18px;margin-left: 6px;">就餐券</span>
           </div>
        </div>
        <div class="row-right" >
            <div class="row-right-firstdiv">有效期:</div>
            <div class="row-right-sestdiv" >{{item.satdate}}</div>
            <div class="row-right-sestdiv" >{{item.enddate}}</div>
            <div class="row-right-hr"><hr/></div>
            <div v-if="item.issuesta==1">
               <div class="row-right-ff"  @click="Immediaterelease(item.no)">立即发放 ></div>
            </div>
            <div v-else>
              <div class="row-right-yff"  >已发放 </div>
            </div>
        </div>
      
     </div>
	</div>
 </div>
</body>
<script>
var issueMealVs=[];
aweto.ajax(basePath + "/spm/spmEvoucher/sendIMVouchers.ajax", {com_no:<%=cmono%>}, false, function (data) {
    if (data.result == "fail") {
        layer.msg(data.msg, {icon: 5});//不开心
        res = false;
    }else{
    	issueMealVs=data.IMVouchers;
    }
});

    new Vue({
        el: "#mmeetingAttendAP",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "发放就餐券",
            issueMealVs:issueMealVs
        },
        methods:{
        	Immediaterelease: function(no){
        		aweto.ajax(basePath + "/spm/spmEvoucher/IMDsend.ajax", {re_no:no}, false, function (data) {
        		    if (data.result == "fail") {
        		        layer.msg(data.msg, {icon: 5});//不开心
        		        res = false;
        		    }else{
        		    	layer.msg(data.msg, {icon: 6})//开心
        		    	window.location.reload();
        		    }
        		});
        		
        		
        	}
        }
    })
    
 
</script>
</html>