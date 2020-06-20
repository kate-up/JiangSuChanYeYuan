<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %> 
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %> 
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<aweto:basePath />
	<base href="${basePath}" />
	<weixin:sessionInfo debug="true"/>
	<weixin:jssdk/>
	<weixin:checkSubscribe/>
	<aweto:decoration version="2.0" mobile="true"/>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title><aweto:pageTile/></title>
	<!-- 图片滚动控件 -->
	<link rel="stylesheet" href="aweto/ui/plugins/owl-carousel/owl.carousel.min.css">
	<link rel="stylesheet" href="aweto/ui/plugins/owl-carousel/owl.theme.default.min.css">
	<script src="aweto/ui/plugins/owl-carousel/owl.carousel.min.js"></script>
	<script src="weixin/ui/js/index.js"></script>
	<script src="aweto/ui/plugins/jqueryGuide/enjoyhint/enjoyhint.min.js"></script>
	<link href="aweto/ui/plugins/jqueryGuide/enjoyhint/enjoyhint.css" rel="stylesheet">
	<style type="text/css">
	.slide-home {
	    margin-top: 0;
	    height: 220px;
	}
	.slide-home .slide-content {
	    height: 220px;
	}
	</style>
	<script type="text/javascript">
		$(function  () {
			$("#userName").html(userName+" 企业管理员");
			if(!subscribeState){
				$("#subscribe").removeClass("hidden");
				$("#subscribeUrl").attr("href",subscribeUrl);
			}
		});
		wx.config({
			debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			appId: appId, // 必填，公众号的唯一标识
		    timestamp:timestamp , // 必填，生成签名的时间戳
		    nonceStr: nonceStr, // 必填，生成签名的随机串
		    signature: signature,// 必填，签名
			jsApiList: ['updateTimelineShareData','updateAppMessageShareData'] // 必填，需要使用的JS接口列表
		});
		
		wx.ready(function(){
			var shareData = {
					title: '复工宝',
					desc: '企业复工与疫情防控高效管理平台',
					link: location.href,//basePath+'weixin/oms/index.jsp',
					imgUrl: basePath+'weixin/oms/images/logo108.png'
				};
			wx.updateAppMessageShareData(shareData);
			wx.updateTimelineShareData(shareData);
		});
		
		$(function(){
			aweto.ajax(basePath+"web/checkGuidence.ajax",{userId:userId,modId:"index_admin"},true,function(r){
				if(r.value=="0"){//未引导
					initGuidence();
				}else{
					//initDepartCreateGuidence();
				}
			});
		});
		
		function initGuidence(){
			var t = document.body.clientHeight;
			window.scroll({ top: t, left: 0, behavior: 'smooth' });
			var enjoyhint_instance = new EnjoyHint({});
			var enjoyhint_script_steps = [
			                			  {
			                			  	'next #editDepart' : "欢迎来到复工宝，首先您要在这里进入创建部门信息，这样员工加入公司的时候就可以选择部门了！",
			                			  	'showSkip' : false,
			                			  	'nextButton' : {className: "myNext", text: "知道了!"}
			                			  },{
			                				  	'next #companyQrCode' : "从这里进入生成企业邀请二维码，可以邀请员工扫码加入企业！",
			                				  	'showSkip' : false,
			                				  	'nextButton' : {className: "myNext", text: "知道了!"}
			                			   },{
			                				  	'next #empCentify' : "这里可以处理员工实名认证申请！",
			                				  	'showSkip' : false,
			                				  	'nextButton' : {className: "myNext", text: "知道了!"}
			                			   },{
			                				  	'next #roleList' : "这里可以设置区分使用者的角色！",
			                				  	'showSkip' : false,
			                				  	'nextButton' : {className: "myNext", text: "知道了!"}
			                			   },{
			                				  	'next #report' : "这里可以查看每天数据统计分析！",
			                				  	'showSkip' : false,
			                				  	'nextButton' : {className: "myNext", text: "知道了!"}
			                			   }
			                			];
			enjoyhint_instance.set(enjoyhint_script_steps);
			enjoyhint_instance.run();
		}
		
		function initDepartCreateGuidence(){
			aweto.ajax(basePath+"web/webDepart/findComDepNums.ajax",{comNo:comNo},true,function(r){
				if(r.value==0){//没有部门
					var t = document.body.clientHeight;
					window.scroll({ top: t, left: 0, behavior: 'smooth' });
					var enjoyhint_instance = new EnjoyHint({});
					var enjoyhint_script_steps = [
				                			  {
				                			  	'next #editDepart' : "您还没有创建部门，首先您要在这里进入创建部门信息，这样员工加入公司的时候就可以选择部门了！",
				                			  	'showSkip' : false,
				                			  	'nextButton' : {className: "myNext", text: "知道了!"}
				                			  },{
				                				  	'next #companyQrCode' : "然后从这里进入生成企业邀请二维码，可以邀请员工扫码加入企业！",
				                				  	'showSkip' : false,
				                				  	'nextButton' : {className: "myNext", text: "知道了!"}
				                			   }
				                			];
					enjoyhint_instance.set(enjoyhint_script_steps);
					enjoyhint_instance.run();
				}
			});
		}
	</script>
	<style type="text/css">
		.enjoy_hint_label{
			font-size: 11px;
		}
		.myNext{
			margin-top: 25px;
		}
	</style>
</head>
<body>
	<!-- preloader 
	<div class="preloader">
		<div class="spinner"></div>
	</div>-->
	<!-- end preloader -->
	<!-- slide -->
	<div class="slide slide-home">
		<div class="slide-show owl-carousel owl-theme">
			<div class="slide-content">
				<img src="weixin/ui/images/banner7.jpg" alt="">
				<div class="caption center">
				</div>
			</div>
			<div class="slide-content">
				<img src="weixin/ui/images/banner6.jpg" alt="">
				<div class="caption center">
				</div>
			</div>
		</div>
	</div>
	<!-- end slide -->
	<!-- services -->
	<div class="services segments bg-second" style="padding-top: 15px;">
		<div class="pages-title">
			<h3 id="userName"></h3>
			<div class="line"></div>
			<div id="subscribe" class="hidden">
				</br>
	        	<p class="weui-msg__desc" style="color: red">您还没有关注复工宝公众号将无法接收到疫情提醒消息</br>点击[<a id="subscribeUrl" href="" style="font-weight: bold;">关注公众号</a>]！</p>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col s6">
					<div id="createCompany" class="contents cyans" onclick="weixin.toRegistCom()">
						<i class="fa fa-building alizarin"></i>
						<h4>企业信息</h4>
						<p>企业信息修改</p>
					</div>
				</div>
				<div class="col s6">
					<div id="editDepart" class="contents indigos" onclick="weixin.toDepartList()">
						<i class="fa fa-users alizarin"></i>
						<h4>组织机构</h4>
						<p>企业组织机构管理</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col s6">
					<div class="contents emerald" onclick="weixin.toEmpList()">
						<i class="fa fa-user-circle emerald"></i>
						<h4>员工管理</h4>
						<p>企业人员管理</p>
					</div>
				</div>
				<div class="col s6">
					<div id="companyQrCode" class="contents oranges" onclick="weixin.toCompanyQrCode()">
						<i class="fa fa-qrcode alizarin"></i>
						<h4>邀请员工</h4>
						<p>二维码邀请员工</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col s6">
					<div id="empCentify" class="contents emerald" onclick="weixin.toEmpCentifyHand()">
						<i class="fa fa-star alizarin"></i>
						<h4>员工认证</h4>
						<p>员工认证审核</p>
					</div>
				</div>
				<div class="col s6">
					<div id="roleList" class="contents oranges" onclick="weixin.toRoleList()">
						<i class="fa fa-user-plus alizarin"></i>
						<h4>角色分配</h4>
						<p>设置不同使用角色</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col s6">
					<div id="report" class="contents oranges" onclick="weixin.toModuleList()">
						<i class="fa fa-qrcode alizarin"></i>
						<h4>二维码下载</h4>
						<p>下载常用功能二维码</p>
					</div>
				</div>
				<div class="col s6">
					<div  class="contents indigos about" onclick="weixin.toUserInfo()">
						<i class="fa fa-user alizarin"></i>
						<h4 id="box2">我的信息</h4>
						<p>个人中心</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col s12">
					<div class="contents oranges" onclick="toMore()">
						<i class="fa fa-ellipsis-h alizarin"></i>
						<h4>更多服务</h4>
						<p>更多功能应用</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end services -->
	
	<!-- persipura -->
	<div class="persipura">
		<div class="container">
			<div class="jayapura">
				<div class="col s6">
					<div class="content">
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end persipura -->
</body>
</html>
