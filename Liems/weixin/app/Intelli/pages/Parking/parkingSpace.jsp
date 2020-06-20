<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %>
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %>
<% String voNo = (String)request.getParameter("voNo"); %>

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
    <style type="text/css">
        body {
            padding: 0 !important;
            margin: 0 !important;
            box-sizing: border-box !important;
        }
        .each_quan {
            display: flex;width: fit-content;
        }
        .yuanquan {
            width: 10px;
            height: 10px;
            background: #0193F8;
            border-radius: 50%;
            margin: auto 4px;
        }
        .toptip {
            display: flex;
            justify-content: space-around;
            line-height: 30px;
            background: #fff;
            margin-top: 10px;
        }
        .bottom_msg {
            position: absolute;
            bottom: 0;
            width: 100%;
            background: rgba(51,51,51,1);
            color: #fff;
            display: flex;
            height: 45px;
            line-height: 45px;
            font-size: 15px;
        }
        .bottom_msg > div:nth-child(1) {
            width: 70%;
        }
        .bottom_msg > div:nth-child(2) {
            background: rgba(61,170,98,1);
            width: 30%;
            text-align: center;
        }
        .space{
            display: flex;
            justify-content: space-around;
            line-height: 30px;
            background: #fff;
            text-align: center;
           
        }
        .selectedSpace{
        width: 25%;
		background:rgba(247,245,246,1);
        }
        .allwid{
        width: 25%;
        }
        .carparking{
        display: flex;
	    height: 100%;
	    width: 100%;
	    padding: 4%;
        flex-wrap: wrap;
        }
        .carparking > div {
        width: 12.5%;
        }
        .carimg{
       width: 27px;
       height: 52px;
        }
        .greencar, .bluecar, .graycar {
        	width: 25px;
        	height:40px;
        	text-align:center;
        	line-height:40px;
        	margin-bottom: 13px;
        	color:#000;
        }
    
        .greencar{
        background:url(/Liems/weixin/app/Intelli/img/green_car.png) no-repeat ;
        background-size: 50% 100%;
        background-position: center center;
        }
        .bluecar{
        background:url(/Liems/weixin/app/Intelli/img/blue_car.png) no-repeat ;
        background-size: 50% 100%;
        background-position: center center;
        }
        .graycar{
        background:url(/Liems/weixin/app/Intelli/img/gray_car.png) no-repeat ;
        background-size: 50% 100%;
        background-position: center center;
        }
    </style>
</head>
<body>
<div id="meetMsgDet" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;">
    <head-menu :head-menu="title">{{title}}</head-menu>
    <div class="toptip" style="rgba(102,102,102,1);">
        <div class="each_quan" ><div class="yuanquan"></div>已分配车位</div>
        <div class="each_quan" ><div class="yuanquan" style="background: #7ACF94"></div>可分配车位</div>
        <div class="each_quan" ><div class="yuanquan" style="background: #E0EBEF"></div>不可选车位</div>
    </div>
    <div class="carspace">
        <div class="space">
           <div :class="{'allwid': true, 'selectedSpace': space == index}" v-for="(item, index) in spaceList" :key="index" @click="selectSpace(index, item.key)">{{ item.name }}</div>
        </div>
        <div class="carparking">
	         <div :class="item.carStatus=='00' ? 'greencar' : item.carStatus=='01' ? 'bluecar' : 'graycar' " v-for="(item,index) in carpositions" @click="selectPs(item.carno)">
	           {{item.carpos}}
	         </div>
        </div>
    </div>
    <div class="bottom_msg">
        <div><span style="padding: 0 10px;">已分配车位</span><span style="color: #3DAA62;">A区域012</span></div>
        <div>确认</div>
    </div>
</div>
</body>
<script>
    new Vue({
        el: "#meetMsgDet",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "车位分配",
            spaceList: [{name:'A区',key:'01'}, {name:'B区',key:'02'}, {name:'C区',key:'03'}, {name:'D区',key:'04'}],
            carpositions:[{carno:'1',carpos:'1',areapos:'01',carStatus:'00'},{carno:'2',carpos:'6',areapos:'02',carStatus:'01'},
                          {carno:'3',carpos:'2',areapos:'02',carStatus:'02'},{carno:'4',carpos:'7',areapos:'03',carStatus:'01'},
                          {carno:'5',carpos:'3',areapos:'03',carStatus:'02'},{carno:'6',carpos:'8',areapos:'04',carStatus:'00'},
                          {carno:'7',carpos:'4',areapos:'04',carStatus:'00'},{carno:'8',carpos:'9',areapos:'01',carStatus:'01'},
                          {carno:'9',carpos:'5',areapos:'01',carStatus:'02'},{carno:'10',carpos:'10',areapos:'02',carStatus:'00'}],
            space: 0,
            path:''
        },
        created: function() {
            this.path = basePath;
          
        },
        methods: {
        	selectSpace: function(index, key) {
        		this.space = index;
        		
        	},
        	//分配车位
        	selectPs: function(){
        		alert("111");
        	}
        }
    });
</script>
</html>