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
    <aweto:basePath />
    <base href="${basePath}" />
    <weixin:sessionInfo debug="true"/>
    <aweto:decoration version="2.0" mobile="true"/>
    <aweto:entityInfo name="org.aweto.web.entity.WebEmpCertify"/>
    <script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js?v=20200217"></script>
    <script src="weixin/app/Intelli/js/vue.js"></script>
    <script src="weixin/app/Intelli/component/head.js"></script>
    <script src="weixin/app/Intelli/component/cardLsit.js"></script>
    <script src="weixin/app/Intelli/js/jquery-1.8.3.min.js"></script>
    <script src="weixin/app/Intelli/js/jquery.charfirst.pinyin.js"></script>
     <script src="weixin/app/Intelli/js/sort.js"></script>
    <link rel="stylesheet" href="weixin/app/Intelli/css/component.css">
    <link rel="stylesheet" href="weixin/app/Intelli/css/style.css">
    <style type="text/css">
        body {
            padding: 0 !important;
            margin: 0 !important;
            box-sizing: border-box !important;
        }
        .menu_dir{
            position: fixed;
            z-index: 1000;
            top: 0;
        }
        
        .body-content{
        margin: 2%;
	    height: 100%;
	    background-color: #fff;
        }
        .content{
        justify-content: space-between;
        font-size: 15px;
        display:flex;
        background-color: #fff;
        margin: 14% 2% 2% 2%;
        }
        .left-cont{
            width: 90%;
        }
        .initials{
          width: 10%;
        }
        .namephone{
        display: flex;
        width: 90%;
    }
        .namesty{
            margin: 4%;
            color: #333 !important;
            font-size: 15px;
        }
        .poststy{
            margin-left: 3%;
            font-size: 13px;
            color: #999;
        }
        .starsty{
         margin-left: -1%;
         margin-top: 26%;
        }
        .ulsty{
        text-align: center;
        }
    </style>
</head>
<body>
<div id="mmeetingAttendAP" :style="{height: screenHeight + 'px'}" style="background: #f7f7f8;">
    <head-menu :head-menu="title">{{title}}</head-menu>
   <div class="content" >
      <div id="letter" ></div>
	   <div class="sort_box">
	    	<div class="sort_list" v-for="(item,index) in attendpeoples" >
			   <div class="namephone" > 
					<div class="namesty num_name">{{item.name}}</div>
					<div class="namesty">{{item.phone}}</div> 
			  </div>		
					<div class="poststy">{{item.post}} </div>
					
			</div>
	   </div>
	   <div class="initials">
			<ul>
				<li><img src="weixin/app/Intelli/img/star.png" class="starsty"></li>
			</ul>
		</div>
	</div>	
 </div>
</body>
<script>
    new Vue({
        el: "#mmeetingAttendAP",
        data: {
            screenHeight:
                window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight,
            title: "添加与会者",
            attendpeoples: [
                {
                    name: "焦珍山1",
                    phone: "1515555555",
                    post: "秣陵街道工委书记"
                },
                {
                	 name: "焦珍山2",
                     phone: "1515555555",
                     post: "秣陵街道工委书记"
                },
                {
               	 name: "王珍山3",
                    phone: "1515555555",
                    post: "秣陵街道工委书记"
               },
               {
                 	 name: "阿珍山4",
                      phone: "1515555555",
                      post: "秣陵街道工委书记"
                 },
                 {
                   	 name: "佛珍山5",
                        phone: "1515555555",
                        post: "秣陵街道工委书记"
                   },
                   {
                     	 name: "杨珍山6",
                          phone: "1515555555",
                          post: "秣陵街道工委书记"
                     }
                   ,
                   {
                     	 name: "许珍山7",
                          phone: "1515555555",
                          post: "秣陵街道工委书记"
                     }
                   ,
                   {
                     	 name: "安珍山8",
                          phone: "1515555555",
                          post: "秣陵街道工委书记"
                     }
                   ,
                   {
                     	 name: "户珍山8",
                          phone: "1515555555",
                          post: "秣陵街道工委书记"
                     }
                   ,
                   {
                     	 name: "曹珍山8",
                          phone: "1515555555",
                          post: "秣陵街道工委书记"
                     }
                   ,
                   {
                     	 name: "靠珍山8",
                          phone: "1515555555",
                          post: "秣陵街道工委书记"
                     }
                
            ]
        }
    })
</script>
</html>