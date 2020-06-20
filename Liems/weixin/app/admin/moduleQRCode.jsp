<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %> 
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
	<title><aweto:pageTile/></title>
	<aweto:basePath />
	<base href="${basePath}" />
	<weixin:sessionInfo debug="true"/>
	<aweto:decoration version="2.0" mobile="true"/>
	<aweto:entityInfo name="org.aweto.weixin.entity.WxModule"/>
	<script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js"></script>
	<script type="text/javascript">
		var namespace='/weixin/wxModule';
		action="view";
		$(function(){
			$("#comName").html(comName);
			init({
				url:basePath+namespace+"/find.ajax",
	            saveUrl:basePath+namespace+"/save.ajax?submit=true",
				form:$("#detailForm"),
				floating:false,
				onLoad:function(pk,recorder){
					if(pk=="-1"){//没有健康档案
						layer.msg('未找到模块记录，无法生成二维码！');
					}else{
						$("#wmodName").html(recorder.wmodName);
						$("#wmodDesc").html(recorder.wmodDesc);
						createQrCode(basePath+recorder.wmodUrl+"?from=QRCode&comNo="+comNo);
					}
				},beforeSubmit:function(data){
					return data;
				},afterSubmit:function(rtn){
					return true;
				}
			});
		});
		
		function createQrCode(qrurl){
			if(qrurl!=""){
				var option={
		                render: "canvas",
		                text: qrurl,
		                width : "150",               //二维码的宽度
		                height : "150",              //二维码的高度
		                background : "#ffffff",       //二维码的后景色
		                foreground : "#000000"//,        //二维码的前景色
		            };
	    		$("#qrcode").qrcode(option);
	    	}
		}
		
		
	</script>
</head>
<body>
	<!-- navbar -->
	<div class="navbar">
		<div class="container">
			<div class="row">
				<div class="col s9">
					<div class="content-left">
						<a href="javascript:history.go(-1)"><h1><i class="fa fa-chevron-left"></i><span></span>模块二维码</h1></a>
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
					<h3>该二维码可以作为功能的入口</h3>
					<div class="line"></div>
					<span class="help-block"><i class="fa fa-info-circle"></i>以下是<label id="comName"></label>专属二维码</span>
				</div>
				<div class="wrapper wrapper-content">
					<form class="form-horizontal" id="detailForm" novalidate="novalidate">
						<div class="form_title"> <span> 基本信息 </span> </div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-sm-4 control-label">名称：<font id="wmodName"></font></label>
									</br>
									<label class="col-sm-4 control-label">说明：<font id="wmodDesc"></font></label>
								</div>
							</div>
						</div>
						<div class="form_title"> <span> 二维码信息 </span> </div>
						<div class="row">
							<div class="form-group">
				               <div class="col-sm-8">
								  <div class="col-sm-8 fileinput">
								  	<div class="thumbnail" style="width: 180px; height: 200px;">
								  		<br/>
								  		<div id="qrcode" class="qrcode"></div>
					              	 </div>
						           </div>
					            </div>
							</div>
						</div>
						<br/>
						<div class=" ">
					      <div class="col-sm-12 btn-container hidden">
			                     <a class="btn btn-primary  btn-block" href="javascript:closeCurrentLayer()"><i class="fa fa-check"></i>返回</a>
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
