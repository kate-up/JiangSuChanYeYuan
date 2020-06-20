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
		var namespace='/web/user';
		var roleNo=weixin.getParam("roleNo");
	    var tableList;
	    var pageNo=1;
	    var totalPages=0;
	    var condition=weixin.getParam("condition");
	    condition=decodeURIComponent(condition);
		$(function(){
			$("#condition").val(condition);
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
			aweto.ajax(basePath+"web/webUserRole/userListForSelector.ajax",{pageNo:pageNo,pageSize:5,comNo:comNo,noRoleNo:roleNo,searchCondition:condition},true,function(r){
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
					tmp.push('	<p>'+row.comNo.desc+'</p>');
					tmp.push('</div>');
					tmp.push('<br/>');
					//tmp.push('<div class="row" style="margin-top: 5px;padding-left:20px;">');
					//tmp.push('		<div class="col s5">');
					//tmp.push('			<h6>认证状态：</h6><p>'+row.comJoinState+'</p>');
					//tmp.push('		</div>');
					//tmp.push('		<div class="col s5">');
					//tmp.push('			<h6>注册时间：</h6><p>'+row.firstDtm+'</p>');
					//tmp.push('		</div>');
					//tmp.push('	</div>');
					if(row.depNo){
						tmp.push('	<div class="row" style="margin-top: 5px;padding-left:0px;text-align: center;font-size: 18px;color: #D80027">');
						tmp.push('		<font> '+row.depNo.desc+'</font>');
						tmp.push('	</div>');
					}else{
						tmp.push('	<div class="row" style="margin-top: 5px;padding-left:0px;text-align: center;font-size: 18px;color: #D80027">');
						tmp.push('		<font> 无部门组织</font>');
						tmp.push('	</div>');
					}
					tmp.push('	<div class="row" style="margin-top: 5px;padding-left:20px;padding-right:20px;">');
					tmp.push('		<a class="btn btn-primary btn-rounded btn-block" href="javascript:addRoleUser(\''+row.userId+'\')"><i class="fa fa-user-plus"></i>添加</a>');
					tmp.push('	</div>');
					tmp.push('</div>');
					
					tableList.append(tmp.join(""));
				}
			})
		}
		
		function addRoleUser(userId){
			layer.confirm("确认添加用户到角色 ？", {
				  btn: ['确认', '取消'] //按钮
				}, function(){
					aweto.ajax(basePath+"web/webUserRole/add.ajax",{userId:userId,roleNo:roleNo},true,function(r){
						 if(r.state==SUCCESS){
							  layer.msg(r.msgInfo, {icon: 1});//成功
							  weixin.toRoleUserList(roleNo);
						  }else{
							  layer.msg(r.msgInfo, {icon: 5});//不开心
						  }
						 tableList.refresh();
					})
				}, function(){
					
				});
			
		}
		
		function search(){
			var con=$("#condition").val();
			con=encodeURIComponent(con);
			location.href="weixin/app/admin/roleUserAdd.jsp?roleNo="+roleNo+"&condition="+con;
			
		}
		
		function toRoleUserList(){
			 weixin.toRoleUserList(roleNo);
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
						<a href="javascript:toRoleUserList()"><h1><i class="fa fa-chevron-left"></i><span></span>角色成员添加</h1></a>
					</div>
				</div>
				<div class="col s3" >
					<div class="content-right">
						<a href="javascript:weixin.toIndex()" class='backBar'><i class="fa fa-home"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end navbar -->
	<!-- list -->
	<div class="list segments-page">
		<div class="pages-title">
			<h3>请选择要添加的用户（<span id="num"></span>人）</h3>
			<div class="line"></div>
		</div>
		<div class="breadcome-heading container" style="margin-bottom: 20px;">
           <form role="search" class="sr-input-func" style="width:100%">
	            <input id="condition" type="text" placeholder="Search..." class="search-int form-control"  style="width: 100%;border-radius:30px;">
	             <a href="javascript:search()" style="padding-right: 20px;"><i class="fa fa-search"></i></a>
			 </form>
	    </div>
		<div id="listContainer" class="container">
			
		</div>
	</div>
	<!-- end list -->
</body>
</html>
