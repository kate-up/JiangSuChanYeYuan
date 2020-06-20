<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %> 
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %> 
<!DOCTYPE html>
<html lang="zxx">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<aweto:basePath />
	<base href="${basePath}" />
	<title><aweto:pageTile/></title>
	<weixin:sessionInfo debug="true"/>
	<aweto:decoration version="2.0" mobile="true"/>
	<script type="text/javascript"> 
		var namespace='/web/webEmpCertify';
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
		});
		
		function loadData(){
			aweto.ajax(basePath+namespace+"/tableList.ajax",{pageNo:pageNo,pageSize:5,userId:userId},true,function(r){
				pageNo=r.pageNo+1;
				totalPages=r.totalPages;
				var rows=r.rows;
				for (var i = 0; i < rows.length; i++) {
					var row=rows[i];
					var img=row.photo;
					if(img==''){
						img='aweto/ui/images/head-default.png';
					}
					var tmp=new Array();
					tmp.push('<div class="contents">');
					tmp.push('<div class="list-img">');
					tmp.push('	<img src="'+img+'" alt="" style="max-width:60px;max-height: 60px;">');
					tmp.push('</div>');
					tmp.push('<div class="list-text">');
					tmp.push('	<h6>'+row.userName+'&nbsp;</h6>');
					tmp.push('	<p>'+row.depName+'</p>');
					tmp.push('</div>');
					tmp.push('<br/>');
					tmp.push('<div class="row" style="margin-top: 5px;padding-left:20px;">');
					tmp.push('		<div class="col s5">');
					tmp.push('			<h6>状态：</h6><p>'+row.state+'</p>');
					tmp.push('		</div>');
					tmp.push('		<div class="col s5">');
					tmp.push('			<h6>申请时间：</h6><p>'+row.applyTime+'</p>');
					tmp.push('		</div>');
					tmp.push('		<div class="col s5">');
					tmp.push('			<h6>处理人：</h6><p>'+row.handUser+'</p>');
					tmp.push('		</div>');
					tmp.push('		<div class="col s5">');
					tmp.push('			<h6>处理时间：</h6><p>'+row.handTime+'</p>');
					tmp.push('		</div>');
					tmp.push('	</div>');
					tmp.push('</div>');
					tableList.append(tmp.join(""));
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
						<a href="javascript:history.go(-1)"><h1><i class="fa fa-chevron-left"></i><span>我的</span>员工认证记录</h1></a>
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
		 <div class="col-sm-12 btn-container">
			 <a class="btn btn-primary  btn-block" href="weixin/app/user/empCertify.jsp"><i class="fa fa-star"></i>我要认证</a>
		</div>
		<div id="listContainer" class="container">
		</div>
	</div>
	<!-- end list -->
</body>
</html>
