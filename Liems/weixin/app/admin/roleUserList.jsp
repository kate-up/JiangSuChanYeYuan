<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %> 
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<aweto:basePath />
	<base href="${basePath}" />
	<weixin:sessionInfo debug="true"/>
	<aweto:decoration version="2.0" mobile="true"/>
	<script type="text/javascript"> 
		var namespace='/web/webUserRole';
		var roleNo=weixin.getParam("roleNo");
	    var tableList;
	    var pageNo=1;
	    var totalPages=0;
		$(function(){
			tableList=$("#listContainer");
			loadData();
			 // dropload
		    var dropload = $('.list').dropload({
		        scrollArea: window,
		        domDown: {
		            domClass: 'dropload-down',
		            domRefresh: '<div class="dropload-refresh">上拉加载更多</div>',
		            domLoad: '<div class="dropload-load"><span class="loading"></span>加载中...</div>',
		            domNoData: '<div class="dropload-noData">已无数据</div>'
		        },
		        loadDownFn: function (me) {
		        	 setTimeout(function () {
		        		 if (totalPages<=pageNo-1) {
			                    me.resetload();
			                    me.lock();
			                    me.noData();
			                    me.resetload();
			                    return;
			                }
				        	loadData();
				        	me.resetload();
		        		 
		        	 },500);
		        	
		        }
		    });
		})	
		function loadData(){
			aweto.ajax(basePath+namespace+"/tableList.ajax",{pageNo:pageNo,pageSize:5,comNo:comNo,parentId:roleNo},true,function(r){
				pageNo=r.pageNo+1;
				totalPages=r.totalPages;
				$("#num").html(r.totalRows);
				var rows=r.rows;
				for (var i = 0; i < rows.length; i++) {
					var row=rows[i];
					var img=row.avatar;
					if(img==''){
						img='aweto/ui/images/head-default.png';
					}
					var tmp=new Array();
					tmp.push('<div class="contents">');
					tmp.push('<div class="list-img">');
					tmp.push('	<img src="'+img+'" alt="" style="max-width:60px;max-height: 60px;">');
					tmp.push('</div>');
					tmp.push('<div class="list-text">');
					tmp.push('	<h6>'+row.userNam+'&nbsp;</h6>');
					tmp.push('	<p>'+row.roleName+'</p>');
					tmp.push('</div>');
					tmp.push('<br/>');
					//tmp.push('<div class="row" style="margin-top: 5px;padding-left:20px;">');
					//tmp.push('		<div class="col s5">');
					//tmp.push('			<h6>所在部门：</h6><p>'+row.depName+'</p>');
					//tmp.push('		</div>');
					//tmp.push('		<div class="col s5">');
					//tmp.push('			<h6>授权时间：</h6><p>'+row.firstDtm+'</p>');
					//tmp.push('		</div>');
					//tmp.push('	</div>');
					tmp.push('	<div class="row" style="margin-top: 5px;padding-left:20px;padding-right:20px;">');
					tmp.push('		<a class="btn btn-warning btn-rounded btn-block" href="javascript:reMoveRoleUser('+row.row_pkValue+')"><i class="fa fa-pencil-square-o"></i>解除授权</a>');
					tmp.push('	</div>');
					tmp.push('</div>');
					tableList.append(tmp.join(""));
				}
			})
		}
		
		function reMoveRoleUser(pk){
			layer.confirm("确认解除用户角色 ？", {
				  btn: ['确认', '取消'] //按钮
				}, function(){
					aweto.ajax(basePath+namespace+'/delete.ajax',{pkValue:pk},true,function(r){
						if(r.state==SUCCESS){
							layer.msg(r.msgInfo, {icon: 1});//成功
							location.href=location.href;
						}else{
							layer.msg(r.msgInfo, {icon: 5});//不开心
						}
					})
				}, function(){
					
				});
		}
		
		function toRoleUserAdd(){
			weixin.toRoleUserAdd(roleNo);
		}
	</script>
	<style type="text/css">
		.list-text{
			margin-top: 15px;
		}
	</style>
</head>
<body>
	<!-- navbar -->
	<div class="navbar">
		<div class="container">
			<div class="row">
				<div class="col s9">
					<div class="content-left">
						<a href="javascript:weixin.toRoleList()"><h1><i class="fa fa-chevron-left"></i><span></span>角色成员管理</h1></a>
					</div>
				</div>
				<div class="col s3" >
					<div class="content-right">
						<a href="javascript:toRoleUserAdd()"><i class="fa fa-plus"></i>添加</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end navbar -->
	<!-- list -->
	<div class="list segments-page">
		<div  class="container">
			<div id="listContainer" class="pricing-table">
				<div class="pages-title">
					<h3>成员清单（<span id="num"></span>人）</h3>
					<div class="line"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- end list -->
</body>
</html>
