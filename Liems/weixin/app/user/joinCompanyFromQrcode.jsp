<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %>
<%@ page import="org.aweto.system.util.base.Charset"%>
<%@ page import="org.aweto.weixin.util.WxUtil"%>
<%@ page import="org.aweto.web.util.base.WebTools"%>
<%@ page import="org.aweto.web.entity.WebUser"%>
<%@ page import="org.aweto.web.entity.WebCompany"%>
<%
	WxUtil.checkAuth("ZHYQ",request, response,true);
	String openid=Charset.nullToEmpty(request.getSession().getAttribute("openid"));
	System.out.println("openId:"+openid);
	WebUser u=null;
	String userName="";
	String userId="";
	String comNo="";
	String comName="";
	String uscCode="";
	WebCompany com=null;
	if(!"".equals(openid)){
		u=WebTools.getUserByOpenid(openid);
		if(u!=null){
			userName=Charset.nullToEmpty(u.getUserNam());
			userId=Charset.nullToEmpty(u.getUserId());
			comNo=Charset.nullToEmpty(u.getComNo());
			com=WebTools.findUserCompany(u);
			if(com!=null){
				comName=com.getComName();
				uscCode=com.getUscCode();
			}
		}
	}
	String url=WxUtil.checkSubscribe("ZHYQ", openid,request, response);
	String shareUser=Charset.nullToEmpty(request.getParameter("shareUser"));
	String shareUserName=WebTools.getUserNameById(shareUser);
%>
<!DOCTYPE html>
<html lang="zxx">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title><aweto:pageTile/></title>
	<aweto:basePath />
	<base href="${basePath}" />
	<aweto:decoration version="2.0" mobile="true"/>
	<aweto:entityInfo name="org.aweto.web.entity.WebCompany"/>
	<script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js?v=20200217"></script>
	<script type="text/javascript">
		var namespace='/web/webCompany';
		var uuscCode="<%=uscCode%>";
		var url="<%=url%>";
		var uscCode;
		$(function(){
			action="view";
			init({
				url:basePath+namespace+"/find.ajax",
	            saveUrl:basePath+namespace+"/save.ajax?submit=true",
				form:$("#detailForm"),
				floating:false,
				onLoad:function(pk,recorder){
					if(pk=="-1"){
						layer.msg("未找到企业信息！", {icon: 5});//不开心
					}else{
						$("#comName").html(recorder.comName);
						$("#uscCode").html(recorder.uscCode);
						$("#boss").html(recorder.boss);
						$("#comCentifyState").html(recorder.comCentifyState.selectedText);
						uscCode=recorder.uscCode;
					}
				},beforeSubmit:function(data){
					return data;
				},afterSubmit:function(rtn){
					return true;
				}
			});
		});

		function joinCom(){
			if(url!="1"){
				layer.msg("请关注复工宝公众号再加入企业！", {icon: 5});//不开心
				return false;
			}
			if(uuscCode==uscCode){
				layer.msg("您已加入该企业，不可重复加入！", {icon: 5});//不开心
				return;
			}
			if(comNo!=""){
				layer.confirm("您已经加入企业："+comName+",确认切换企业？", {
					  btn: ['确认', '取消'] //按钮
					}, function(){
						doJoin();
					}, function(){

					});
			}else{
				doJoin();
			}
		}

		function doJoin(){
			obj=$("#submitBtn");
			layer.load();
			if(obj){
				$(obj).html("数据提交中...");
				$(obj).attr("disabled","disabled");
			}
			aweto.ajax(basePath+"web/user/joinCompany.ajax",{userId:userId,uscCode:uscCode,fromQrCode:"true"},true,function(r){
				layer.closeAll("loading");
				if(r.state==SUCCESS){
					layer.msg(r.msgInfo+",进入员工认证！", {icon: 1});//成功
					location.href="weixin/oms/empCertify.jsp";
				}else{
					layer.closeAll("loading");
					if(obj){
						$(obj).html("提交");
						$(obj).removeAttr("disabled");
					}
					layer.msg(r.msgInfo, {icon: 5});//不开心
				}
			})
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
						<a href="weixin/oms/index.jsp"><h1><i class="fa fa-chevron-left"></i><span></span>
						<%if(!"".equals(shareUserName)){ %>
						<%=shareUserName %>邀请您加入企业
						<%}else{ %>
						扫码加入企业
						<%} %>

						</h1></a>
					</div>
				</div>
				<div class="col s3">
					<div class="content-right">
						<a href="weixin/oms/index.jsp" class='backBar'><i class="fa fa-home"></i></a>
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
					<h3>请仔细核实企业信息</h3>
					<div class="line"></div>
				</div>
				<div class="wrapper wrapper-content">
					<form class="form-horizontal" id="detailForm" novalidate="novalidate">
						<div class="form_title"> <span> 企业基本信息 </span></div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-sm-4 control-label" >企业名称：<font id="comName"></font></label>
								</div>
							</div>
							<div class="col-sm-6 hidden">
								<div class="form-group">
									<label class="col-sm-4 control-label" >统一社会信用代码：<font id="uscCode"></font></label>
								</div>
							</div>
							<div class="col-sm-6 ">
								<div class="form-group">
									<label class="col-sm-4 control-label" >联系人：<font id="boss"></font></label>
								</div>
							</div>
							<div class="col-sm-6 hidden">
								<div class="form-group">
									<label class="col-sm-4 control-label" >认证状态：<font id="comCentifyState"></font></label>
								</div>
							</div>
						</div>
						<div class=" ">
					      <div class="col-sm-12 btn-container">
			                    <a id="submitBtn" class="btn btn-primary  btn-block" href="javascript:joinCom(this)"><i class="fa fa-check"></i> 确认加入企业</a>
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
