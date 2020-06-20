<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %> 
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %> 
<%@ page import="org.aweto.system.util.base.Charset"%>
<%
	String num=Charset.nullTo0(request.getParameter("num"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title><aweto:pageTile/></title>
	<aweto:basePath />
	<base href="${basePath}" />
	<weixin:sessionInfo debug="true"/>
	<aweto:decoration version="2.0" mobile="true"/>
	<aweto:entityInfo name="org.aweto.web.entity.WebDepart"/>
	<script type="text/javascript" src="aweto/ui/core/template/detailTemplate-2.0.js?v=20200217"></script>
	<script type="text/javascript">
		var namespace='/web/webDepart';
		var num='<%=num%>';
		$(function(){
			init({
				url:basePath+namespace+"/find.ajax",
	            saveUrl:basePath+namespace+"/save.ajax?submit=true",
				form:$("#detailForm"),
				floating:false,
				onLoad:function(pk,recorder){
					if(pk=="-1"){
						$("#userId").val(userId);
						$("#comName").val(comName);
						$("#comNo").val(comNo);
						$("#seqNo").val(num);
					}else{
						$("#seqNo").val(recorder.seqNo);
						$("#deleteDepartBtn").removeClass("hidden");
					}
				},beforeSubmit:function(data){
					return data;
				},afterSubmit:function(rtn){
					if(rtn.state==SUCCESS){
						layer.msg("提交成功,请等待审核！", {icon: 1});//成功
						weixin.toDepartList();
					}else{
						layer.msg(rtn.msgInfo, {icon: 5});//不开心
					}
					return true;
				}
			});
		});
		
		function deleteDepart(){
			layer.confirm("确认删除部门？", {
				  btn: ['确认', '取消'] //按钮
				}, function(){
					aweto.ajax(basePath+namespace+'/delete.ajax',{pkValue:pkValue},true,function(r){
						if(r.state==SUCCESS){
							layer.msg(r.msgInfo, {icon: 1});//成功
							location.href=basePath+"weixin/oms/admin/departList.jsp";
						}else{
							layer.msg(r.msgInfo, {icon: 5});//不开心
						}
					})
				}, function(){
					
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
						<a href="javascript:weixin.toDepartList()"><h1><i class="fa fa-chevron-left"></i><span></span>部门信息</h1></a>
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
					<h3>请填写部门信息</h3>
					<div class="line"></div>
				</div>
				<div class="wrapper wrapper-content">
					<form class="form-horizontal" id="detailForm" novalidate="novalidate">
						<div class="form-group hidden">
							<label class="col-sm-3 control-label">编号：</label>
							<div class="col-sm-8">
								<input id="depId" name="depId" defaultValue="自动编码" readonly=true  class="form-control">
								<span class="help-block"><i class="fa fa-info-circle"></i> 编号是自动生成的格式为自定义</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">名称：</label>
							<div class="col-sm-8">
								<input id="depName" name="depName" class="form-control" required>
							</div>
						</div>
						<div class="form-group hidden">
			                <label class="col-sm-3 control-label">公司：</label>
							<div class="col-sm-8">
								<div class="input-group">
								   <input type="hidden" name="comNo" id="comNo" >
			                       <input name="comName"  id="comName" type="text" readonly=true placeholder="请选择" class="form-control" >
			                       <span class="input-group-addon"  
			                       		 title="公司选择" 
										 entityName="org.aweto.web.entity.WebCompany"
										 renderFields="comName"
										 idObj="comNo" 
										 descObj="comName" 
										 callback="" 
									 	 onclick="aweto.tableSeletor(this)">
									 	 <i class="fa fa-search"></i>
									</span>
			                    </div>
							</div>
			            </div>
						
						<div class="form-group hidden">
							<label class="col-sm-3 control-label">所有者：</label>
							<div class="col-sm-8">
								<input id="userId" name="userId" class="form-control" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">部门人数：</label>
							<div class="col-sm-8">
								<input id="empNumbers" name="empNumbers" class="form-control" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">排序：</label>
							<div class="col-sm-8">
								<input id="seqNo" name="seqNo" class="form-control" type="number">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">启用状态：</label>
							<div class="col-sm-8">
								<input id="state" name="state"  class="form-toggle-switch" type="checkbox" defaultValue="on" required/>
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
			                     <a class="btn btn-primary  btn-block" href="javascript:submitForm(this)"><i class="fa fa-check"></i> 保存</a>
			                     </br> </br>
			                      <a id="deleteDepartBtn" class="btn btn-danger  btn-block hidden" href="javascript:deleteDepart(this)"><i class="fa fa-remove"></i> 删除部门</a>
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
