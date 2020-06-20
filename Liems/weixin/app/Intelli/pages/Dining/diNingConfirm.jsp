<%--
  Created by IntelliJ IDEA.
  User: liushiqiang
  Date: 2020/6/11
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %>
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %>
<% String identify= request.getParameter("identify") ;
   //选择收货页面回溯主键
   String addrno= request.getParameter("addrno");
%>
<aweto:docType/>
<html>
<head>
    <title><aweto:pageTile/></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <aweto:basePath />
    <base href="${basePath}" />
    <weixin:sessionInfo debug="true"/>
    <aweto:decoration version="2.0" mobile="true"/>
    <script src="weixin/app/Intelli/js/vue.js"></script>
    <script src="weixin/app/Intelli/component/head.js"></script>
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <style type="text/css">
        #diDanConfirm {
            width: 100%;
            height: 100%;
            background-color: #F7F7F7;
        }
        .diDanAddress {
            width: 92%;
            height: 18%;
            margin: 12px auto;
            background-color: #ffffff;
            border-radius: 4px;
            box-shadow: 1px 7px 10px -2px #BEBEBE;
        }
        .addressInfo {
            width: 92%;
            height: 65%;
            margin: 0 auto;
            border-bottom: 1px solid #DDDDDD;
            display: flex;
        }
        .addressInfo-left {
            width: 90%;
            height: 100%;
        }
        .addressInfo-right {
            height: 18px;
            margin-top: 40px;
            margin-left: 20px;
        }
        .addressInfo-right img {
            width: 10px;
            height: 18px;
        }
        .addressInfo-left-top {
            width: 100%;
            height: 50px;
            line-height: 50px;
            display: flex;
        }
        .addressLabel {
            width: 26%;
            height: 24px;
            margin: auto 0;
            line-height: 24px;
            text-align: center;
            color: #3DAA62;
            font-size: 15px;
            border: 1px solid rgba(61,170,98,0.6);
            background-color: rgba(61,170,98,0.1);
        }
        .addressText {
            font-size: 16px;
            color: #000000;
            margin-left: 8px;
        }
        .addressInfo-left-bottom {
            font-size: 14px;
            display: flex;
        }
        .infoName {
            width: 27%;
            text-align: center;
        }
        .infoTime {
            width: 92%;
            height: 35%;
            line-height: 40px;
            font-size: 14px;
            margin: 0 auto;
            display: flex;
        }
        .infoTimeLabel {
            width: 50%;
            color: #000000;
        }
        .infoTimeArrive {
            width: 40%;
            color: #3DAA62;
            text-align: right;
        }
        .infoTimeArrow {
            width: 9%;
            text-align: right;
        }
        .infoTimeArrow img {
            width: 10px;
            height: 18px;
        }
        .diDanDetails {
            width: 92%;
            height: 63.8%;
            margin: 0 auto;
            overflow: scroll;
            background-color: #ffffff;
            border-radius: 4px;
            box-shadow: 0px 4px 8px 0px #BEBEBE;
        }
        .diDanDetails::-webkit-scrollbar {
            display:none
        }
        .dingCan_bar {
            width: 100%;
            height: 8%;
            display: flex;
        }
        .dingCanTotal {
            width: 70%;
            height: 100%;
            display: flex;
            background-color: #333333;
            text-align: center;
        }
        .totalInfo {
            width: 30%;
            display: flex;
        }
        .totalInfoImg {
            line-height: 50px;
            margin-left: 15px;
        }
        .totalInfoImg img {
            width: 28px;
            height: 23px;
        }
        .totalNumber {
            width: 18px;
            height: 18px;
            margin-top: 7px;
            margin-left: -3px;
            text-align: center;
            line-height: 18px;
            font-size: 12px;
            color: #ffffff;
            border-radius: 50%;
            background-color: #3DAA62;
        }
        .totalMoney {
            line-height: 55px;
            font-size: 15px;
            color: #FFFFFF;
        }
        .dingCanConfirm {
            width: 30%;
            height: 100%;
            line-height: 50px;
            text-align: center;
            font-size: 15px;
            color: #ffffff;
            background-color: #3DAA62;
        }
        .menuPart {
            width: 90%;
            height: 35px;
            line-height: 35px;
            margin: 20px auto;
            display: flex;
            font-size: 15px;
            color: #000000;
        }
        .menuImg {
            width: 22%;
        }
        .menuImg img {
            width: 50px;
            height: 34px;
        }
        .menuName {
            width: 40%;
        }
        .menuOprea {
            width: 18%;
        }
        .menuPrice {
            width: 20%;
            text-align: right;
        }
    </style>
</head>
<body :style="{height: screenHeight + 'px'}">
    <div id="diDanConfirm">
        <div class="dingCanHead">
            <head-menu :head-menu="title">{{ title }}</head-menu>
        </div>
        <div class="diDanAddress">
            <div class="addressInfo">
                <div class="addressInfo-left">
                    <div class="addressInfo-left-top">
                        <div class="addressLabel">送餐地址</div>
                        <div class="addressText">{{ address }}</div>
                    </div>
                    <div class="addressInfo-left-bottom">
                        <div class="infoName">{{ name }}</div>
                        <div>{{ tel }}</div>
                    </div>
                </div>
                <div class="addressInfo-right">
                    <img :src= "path + '/Liems/weixin/app/Intelli/img/arrowRight.png'"  @click="seleAddr"/>
                </div>
            </div>
            <div class="infoTime">
                <div class="infoTimeLabel">立即送出</div>
                <div class="infoTimeArrive">约{{ time }}送达</div>
                <div class="infoTimeArrow">
                    <img :src= "path + '/Liems/weixin/app/Intelli/img/arrowRight.png'" />
                </div>
            </div>
        </div>
        <div class="diDanDetails">
            <div class="menuList">
                <div class="menuPart" v-for="(item, index) in menuList">
                    <div class="menuImg">
                        <img :src="path + item.img"/>
                    </div>
                    <div class="menuName">{{ item.name }}</div>
                    <div class="menuOprea">x{{ item.opria }}</div>
                    <div class="menuPrice">￥{{ item.prices }}</div>
                </div>
            </div>
            <div></div>
            <div></div>
        </div>
        <div class="dingCan_bar">
            <div class="dingCanTotal">
                <div class="totalInfo">
                    <div class="totalInfoImg">
                        <img :src="path + '/Liems/weixin/app/Intelli/img/readySelected.png'"/>
                    </div>
                    <div class="totalNumber">{{ totalNumber }}</div>
                </div>
                <div class="totalMoney">应付 ￥{{ totalMoney }}</div>
            </div>
            <div class="dingCanConfirm" @click="dingCanConfirm">确定支付</div>
        </div>
    </div>
</body>
<script type="text/javascript">
var identify = '<%=identify%>'; 
var menuList=[];
var totalNumber='';
var totalMoney='';
var address='';
var name='';
var tel='';
var time='';
aweto.ajax(basePath + "/spm/spmFoodArchives/FindPurchaseFood.ajax", {identify: identify,addrno:<%=addrno%>}, false, function (data) {
	if (data.result=="success") {	
      menuList=data.menuList;
      totalNumber=data.totalNumber;
      totalMoney=data.totalMoney;
      address=data.address;
      name=data.name;
      tel=data.tel;
      time=data.time;
      
   }
 });
    new Vue({
        el: "#diDanConfirm",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            path: '',
            title: '订餐',
            address: address,
            name: name,
            tel: tel,
            time: time,
            menuList:menuList,
            totalNumber: totalNumber,
            totalMoney:totalMoney
        },
        create: function() {
            this.path = basePath;
           
        },
        methods: {
        	dingCanConfirm:function(){
        		if(address==""){
        			alert("请选择送餐地址！");
        			return false;
        		}else{
        			alert("请偷偷转给我呀");
        		}
        		
        	},
        	seleAddr:function(){
        		 window.location = basePath + "/weixin/app/Intelli/pages/Dining/selectAddress.jsp?identify="+identify;
                 
        	}
        }
    })
</script>
</html>
