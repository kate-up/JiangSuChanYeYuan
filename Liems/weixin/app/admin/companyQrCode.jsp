<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %> 
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title><aweto:pageTile/></title>
	<aweto:basePath />
	<base href="${basePath}" />
	<weixin:sessionInfo debug="true"/>
	<weixin:jssdk/>
	<aweto:decoration version="2.0" mobile="true"/>
	<aweto:entityInfo name="org.aweto.web.entity.WebCompany"/>
	<script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js?v=20200217"></script>
	<script type="text/javascript">
		var namespace='/web/webCompany';
		var shareUser=weixin.getParam("shareUser");
		if(userId!=""&&shareUser!=""){
			if(userId!=shareUser){
				location.href="weixin/app/user/joinCompanyFromQrcode.jsp?pkValue="+comNo+"&shareUser="+shareUser;
			}
		}
		$(function(){
			pkValue=comNo;
			init({
				url:basePath+namespace+"/find.ajax",
	            saveUrl:basePath+namespace+"/save.ajax?userId="+userId,
				form:$("#detailForm"),
				floating:false,
				onLoad:function(pk,recorder){
					if(pk=="-1"){
						layer.msg("未找到您的企业信息！", {icon: 5});//不开心
					}else{
						$("#comName").html(recorder.comName);
						$("#uscCode").html(recorder.uscCode);
						$("#boss").html(recorder.boss);
						$("#comCentifyState").html(recorder.comCentifyState.selectedText);
						pkValue=pk;
						createQrCode(basePath+"weixin/oms/joinCompanyFromQrcode.jsp?pkValue="+pkValue);
					}
				},beforeSubmit:function(data){
					return data;
				},afterSubmit:function(rtn){
					if(rtn.state==SUCCESS){
						layer.msg("提交成功！", {icon: 1});//成功
						//location.href="weixin/oms/index.jsp";
					}else{
						layer.msg(rtn.msgInfo, {icon: 5});//不开心
					}
					return true;
				}
			});
		});
		
		function createQrCode(qrurl){
			if(qrurl!=""){
	    		$("#qrcode").qrcode({
	                render: "canvas",
	                text: qrurl,
	                width : "150",               //二维码的宽度
	                height : "150",              //二维码的高度
	                background : "#ffffff",       //二维码的后景色
	                foreground : "#000000"//,        //二维码的前景色
	                //src: basePath+r.logo             //二维码中间的图片  'images/logo.png'
	            });
	    	}
		}
		
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
					title: userName+'邀请您加入',
					desc: comName,
					link: location.href,
					imgUrl: 'http://wx.luculent.net/weixin/oms/images/logo108.png'
				};
			wx.updateAppMessageShareData(shareData);
			wx.updateTimelineShareData(shareData);
		});
		
	</script>
</head>
<body>
	<!-- navbar -->
	<div class="navbar">
		<div class="container">
			<div class="row">
				<div class="col s9">
					<div class="content-left">
						<a href="javascript:weixin.toIndex()"><h1><i class="fa fa-chevron-left"></i><span></span>企业二维码</h1></a>
					</div>
				</div>
				<div class="col s3">
					<div class="content-right">
						<a href="javascript:weixin.toIndex()" class='backBar'><i class="fa fa-home"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end navbar -->
	
	<!-- sidebar -->
	<!-- end sidebar -->

	<!-- contact -->
	<div class="contact segments-page">
		<div class="content-container">
			<div class="contact-contents">
				<div class="pages-title">
					<h3>企业二维码信息</h3>
					<div class="line"></div>
				</div>
				<div class="wrapper wrapper-content">
					<form class="form-horizontal" id="detailForm" novalidate="novalidate">
						<div class="row">
							<div class="col-sm-8">
								<div class="form-group">
									<label class="col-sm-3 control-label">企业名称： <font id="comName"></font></label>
									<label class="col-sm-3 control-label">信用代码：<font id="uscCode"></font></label>
									<label class="col-sm-3 control-label hidden">企业负责人：<font id="boss"></font></label><br/>
									<label class="col-sm-3 control-label hidden">认证状态：<font id="comCentifyState"></font></label>
								</div>
							</div>
						</div>
						<div class="form_title"> <span> 请将此二维码分享给员工扫码 </span> </div>
						<div class="row">
							<div class="col-sm-8">
								<div class="form-group">
					               <div class="col-sm-8">
									  <div class="col-sm-8 fileinput">
									  	<div class="thumbnail" style="width: 180px; height: 200px;margin-left: 50px;">
									  		<br/>
									  		<div id="qrcode" class="qrcode"></div>
									  		<div class="">
									  			<br/>
									  			 <button class="btn btn-white" type="button" style="width: 150px; height:40px;border-width:0px;" readonly=true><i class="fa fa-barcode"></i>二维码</button>
						               		</div>
						              	 </div>
							           </div>
						            </div>
								</div>
								<div class="form-group">
					               <div class="col-sm-10" style="text-align: center;">
					               		<span  id="rqCodeName" style="padding-right:5px;">扫一扫加入企业后进行员工认证</span>
					               </div>
					            </div>
							</div>
						</div>
						<br/>
						<div class=" ">
					      <div class="col-sm-12 btn-container">
						  </div>
					   </div>
						<br/>
					</form>
				</div>     
			</div>
		</div>
	</div>
	<!-- end contact -->
</body>
</html>
