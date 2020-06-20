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
	<weixin:checkSubscribe/>
	<aweto:decoration version="2.0" mobile="true"/>
	<aweto:entityInfo name="org.aweto.web.entity.WebCompany"/>
	<script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js"></script>
	<script src="weixin/ui/js/city-picker.js"></script>
	<script type="text/javascript">
		var namespace='/web/webCompany';
		if(userId!==""){
			action="edit";
			pkValue=comNo;
		}
		var isNew="0";
		$(function(){
			if(!subscribeState){
				$("#subscribe").removeClass("hidden");
				$("#subscribeUrl").attr("href",subscribeUrl);
			}
			initCompanyAddr();
			init({
				url:basePath+namespace+"/find.ajax?userId="+userId,
	            saveUrl:basePath+namespace+"/save.ajax?userId="+userId,
				form:$("#detailForm"),
				floating:false,
				onLoad:function(pk,recorder){
					if(pk=="-1"){
						initCompanyAddr();
		        		var cdate=aweto.date.currentDateTime();
						$("#userName").val(userName);
						$("#userId").val(userId);
						isNew="1";
					}else{
						pkValue=pk;
						$("#employeeNum").val(recorder.employeeNum);
						$("#saftyMobile").val(recorder.saftyMobile);
						$("#bossMobile").val(recorder.bossMobile);
						var province=recorder.province;
		        		var city=recorder.city;
		        		var county=recorder.county;
		        		$("#comAddr").val(province+" "+city+" "+county);
					}
				},beforeSubmit:function(data){
					if(!subscribeState){
						layer.msg("请关注复工宝公众号后注册企业！", {icon: 5});//不开心
						return false;
					}
					return data;
				},afterSubmit:function(rtn){
					if(rtn.state==SUCCESS){
						layer.msg("提交成功！", {icon: 1});//成功
						weixin.toIndex();
					}else{
						layer.msg(rtn.msgInfo, {icon: 5});//不开心
					}
					return true;
				}
			});
		});
		
		function initCompanyAddr(){
			$("#comAddr").cityPicker({
		        title: "企业所在地",
		        onChange: function (picker, values, displayValues) {
		        	if(displayValues){
		        		var province=displayValues[0];
		        		var city=displayValues[1];
		        		var county=displayValues[2];
		        		$("#province").val(province);
		        		$("#city").val(city);
		        		$("#county").val(county);
		        	}
		          //console.log(values, displayValues);
		        }
		      });
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
						<a href="javascript:weixin.toIndex()"><h1><i class="fa fa-chevron-left"></i><span></span>企业信息登记</h1></a>
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
					<h3>为了快速通过认证请如实填写企业信息</h3>
					<div class="line"></div>
				</div>
				<div class="wrapper wrapper-content">
					<form class="form-horizontal" id="detailForm" novalidate="novalidate">
						<div class="form_title"> <span> 企业基本信息 </span> </div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-sm-4 control-label">企业名称：</label>
									<div class="col-sm-8">
										<input id="comName" name="comName" class="form-control"  required>
										<input id="comId" name="comId" class="form-control hidden" >
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-sm-4 control-label">统一社会信用代码：</label>
									<div class="col-sm-8">
										<input id="uscCode" name="uscCode" class="form-control" required>
									</div>
								</div>
							</div>
						</div>
						 <div class="row">
			             	<div class="col-sm-6">
			             		<div class="form-group">
			             			<label class="col-sm-4 control-label">企业所在地：</label>
									<div class="col-sm-8">
										<input class="form-control" type="text"  id="comAddr" value="" required/>
										<input class="form-control" type="hidden" name="province" id="province" placeholder="省" />
										<input class="form-control" type="hidden" name="city" id="city" placeholder="市"  />
										<input class="form-control" type="hidden" name="county" id="county" placeholder="区"  />
									</div>
			             		</div>
			             	</div>
			            </div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-sm-4 control-label">联系人：</label>
									<div class="col-sm-8">
										<input id="boss" name="boss" class="form-control" required >
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-sm-4 control-label">联系人电话：</label>
									<div class="col-sm-8">
										<input type="number" id="bossMobile" name="bossMobile" class="form-control" required>
									</div>
								</div>
							</div>
						</div>
						<div class="row hidden">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-sm-4 control-label">防疫负责人：</label>
									<div class="col-sm-8">
										<input id="saftyManager" name="saftyManager" class="form-control" >
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-sm-4 control-label">防疫负责人电话：</label>
									<div class="col-sm-8">
										<input type="number" id="saftyMobile" name="saftyMobile" class="form-control" >
									</div>
								</div>
							</div>
						</div>
						<div class="form_title hidden"> <span> 企业证明材料</span> </div>
						<span class="help-block hidden"><i class="fa fa-info-circle"></i> 请提供：企业营业执照清晰照片或扫描件截图</span>
						<div class="row hidden">
							<div class="col-sm-6">
								  <div class="form-group">
						               <label class="col-sm-3 control-label font-noraml">企业营业执照：</label>
						               <div class="col-sm-8">
										  <input class="form-image-upload" id="businessLic" name="businessLic" >
						               </div>
						          </div>
							</div>
						</div>
						<div class="form-group hidden">
							<input type="hidden" id="firstUser" name="firstUser">
							<input type="hidden" id="lastUser" name="lastUser">
							<input type="text" id="firstDtm" name="firstDtm" readonly=true placeholder="yyyy-MM-dd" class='form-control' onFocus="aweto.datePicker(this)" />
							<input type="text" id="firstDtm" name="firstDtm" readonly=true placeholder="yyyy-MM-dd" class='form-control' onFocus="aweto.datePicker(this)" />
						</div>
						<br/>
						<div class=" ">
					      <div class="col-sm-12 btn-container">
						 	<div id="subscribe" class="hidden">
							 	<p class="weui-msg__desc" style="color: red">您还没有关注复工宝公众号将无法接收到疫情提醒消息，点击[<a id="subscribeUrl" href="" style="font-weight: bold;">关注公众号</a>]！
					        	</p>
					        	</br>
						 	</div>
			                <a class="btn btn-primary  btn-block" href="javascript:submitForm(this)"><i class="fa fa-info-circle"></i> 提交</a>
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
