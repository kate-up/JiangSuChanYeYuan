<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %> 
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %> 
<!DOCTYPE html>
<html lang="zxx">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title><aweto:pageTile/></title>
	<aweto:basePath />
	<base href="${basePath}" />
	<weixin:sessionInfo  debug="true"/>
	<aweto:decoration version="2.0" mobile="true"/>
	<aweto:entityInfo name="org.aweto.web.entity.WebUser"/>
	<script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js?v=20200217"></script>
	<script type="text/javascript">
		var namespace='/web/user';
		$(function(){
			initDepSelect();
			init({
				url:basePath+namespace+"/find.ajax",
	            saveUrl:basePath+namespace+"/save.ajax",
				form:$("#detailForm"),
				floating:false,
				onLoad:function(pk,recorder){
					
				},beforeSubmit:function(data){
					return data;
				},afterSubmit:function(rtn){
					if(rtn.state==SUCCESS){
						layer.msg("提交成功,请等待审核！", {icon: 1});//成功
						weixin.toEmpList();
					}else{
						layer.msg(rtn.msgInfo, {icon: 5});//不开心
					}
					return true;
				}
			});
		});
		
		function initDepSelect(){
			aweto.ajax(basePath+"web/webDepart/findDeparts.ajax",{comNo:comNo},false,function(r){
				$("#depNo").append("<option value=''>请选择</option>");
				for(var i=0;i<r.length;i++){
					var dep=r[i];
					if(dep){
						$("#depNo").append("<option value='"+dep.depNo+"'>"+dep.depName+"</option>");
					}
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
						<a href="javascript:weixin.toEmpList()"><h1><i class="fa fa-chevron-left"></i><span></span>员工信息修改</h1></a>
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
					<h3>员工信息</h3>
					<div class="line"></div>
				</div>
				<div class="wrapper wrapper-content">
					<form class="form-horizontal" id="detailForm" novalidate="novalidate">
						<div class="form-group">
						<label class="col-sm-4 control-label">姓名：</label>
						<div class="col-sm-8">
							<input class="form-control" type="text" name="userNam" id="userNam" required />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">部门：</label>
						<div class="col-sm-8">
							<select class="form-control form-select2" type="text" name="depNo" id="depNo" required >
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">昵称：</label>
						<div class="col-sm-8">
							<input id="nickname" name="nickname" class="form-control"  readonly=true >
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">注册时间：</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="firstDtm" name="firstDtm" readonly=true>
						</div>
					</div>
					 <div class="form-group">
		               <label class="col-sm-4 control-label font-noraml">照片：</label>
		               <div class="col-sm-8">
						  <input class="form-image-upload" id="avatar" name="avatar" >
		               </div>
		            </div>
						<div class="form-group">
								<input type="hidden" id="firstUser" name="firstUser">
								<input type="hidden" id="firstDtm" name="firstDtm" readonly=true placeholder="yyyy-MM-dd" class='form-control' onFocus="aweto.datePicker(this)" />
								<input type="hidden" id="lastUser" name="lastUser">
								<input type="hidden" id="lastDtm" name="lastDtm" readonly=true placeholder="yyyy-MM-dd" class='form-control' onFocus="aweto.datePicker(this)" />
						</div>
						<br/>
						<div class=" ">
					      <div class="col-sm-12 btn-container">
			                     <a class="btn btn-primary  btn-block" href="javascript:submitForm(this)"><i class="fa fa-check"></i> 提交</a>
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
