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
	<weixin:sessionInfo debug="true"/>
	<aweto:decoration version="2.0" mobile="true"/>
	<script type="text/javascript"> 
		var namespace='/weixin/wxModule';
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
			aweto.ajax(basePath+namespace+"/tableList.ajax",{pageNo:pageNo,pageSize:5,state:"1"},true,function(r){
				pageNo=r.pageNo+1;
				totalPages=r.totalPages;
				//$("#num").html(r.totalRows);
				var rows=r.rows;
				for (var i = 0; i < rows.length; i++) {
					var row=rows[i];
					var tmp=new Array();
					tmp.push('<div class="row">');
					tmp.push('<div class="col s12">');
					tmp.push('	<div class="contents z-depth-1 center">');
					tmp.push('		<h5>'+row.wmodName+'</h5>');
					tmp.push('		<ul>');
					tmp.push('			<li>'+row.wmodDesc+'</li>');
					tmp.push('		</ul>');
					tmp.push('		<button class="button z-depth-1" onclick="toModuleDetail('+row.row_pkValue+')">查看二维码</button>');
					tmp.push('	</div>');
					tmp.push('</div>');
					tmp.push('</div>');
					tableList.append(tmp.join(""));
				}
			})
		}
		function toModuleDetail(pk){
			weixin.toModuleDetail(pk);
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
						<a href="javascript:weixin.toIndex()"><h1><i class="fa fa-chevron-left"></i><span></span>常用二维码</h1></a>
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
		<div  class="container">
			<div id="listContainer" class="pricing-table">
				<div class="pages-title">
					<h3>所有支持二维码扫码进入的功能</h3>
					<div class="line"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- end list -->
</body>
</html>
