<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %> 
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %> 
<%@ page import="org.aweto.system.util.base.Charset"%>
<%
	String state=Charset.nullToString(request.getParameter("state"), "01");
%>
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
		var namespace='/web/webEmpCertify';
	    var tableList;
	    var pageNo=1;
	    var totalPages=0;
	    var state=weixin.getParam("state");
	    var dropload;
		$(function(){
			tableList=$("#listContainer");
			loadData();
			dropload = $('.list').dropload({
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
			findStateNums();
		})
		
		function findStateNums(){
			aweto.ajax(basePath+namespace+'/findStateNums.ajax',{comNo:comNo},true,function(r){
				if(r.state==SUCCESS){
					$("#01").html(r.param.state01);
					$("#99").html(r.param.state99);
					$("#100").html(r.param.state100);
				}
			})
		}
		
		function loadData(){
			aweto.ajax(basePath+namespace+"/tableList.ajax",{pageNo:pageNo,pageSize:5,comNo:comNo,state:state},true,function(r){
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
					if(row.comNo){
						tmp.push('	<p>'+row.comNo.desc+'</p>');
					}else{
						tmp.push('	<p>-</p>');
					}
					tmp.push('</div>');
					tmp.push('<br/>');
					tmp.push('<div class="row" style="margin-top: 5px;padding-left:20px;">');
					tmp.push('		<div class="col s5">');
					tmp.push('			<h6>所在部门：</h6>');
					tmp.push('		</div>');
					tmp.push('		<div class="col s7">');
					tmp.push('			<h7>'+row.depName+'</h7>');
					tmp.push('		</div>');
					tmp.push('</div>');
					tmp.push('<div class="row" style="margin-top: 5px;padding-left:20px;">');
					tmp.push('		<div class="col s5">');
					tmp.push('			<h6>申请时间：</h6>');
					tmp.push('		</div>');
					tmp.push('		<div class="col s7">');
					tmp.push('			<h7>'+row.applyTime+'</h7>');
					tmp.push('		</div>');
					tmp.push('</div>');
					if(row.state=="审核通过"){
						tmp.push('<div class="row" style="margin-top: 5px;padding-left:20px;">');
						tmp.push('		<div class="col s5">');
						tmp.push('			<h6>处理时间：</h6>');
						tmp.push('		</div>');
						tmp.push('		<div class="col s7">');
						tmp.push('			<h7>'+row.handTime+'</h7>');
						tmp.push('		</div>');
						tmp.push('</div>');
					}
					tmp.push('	<div class="row" style="margin-top: 5px;padding-left:0px;text-align: center;font-size: 18px;color: #D80027">');
					tmp.push('		<font> '+row.state+'</font>');
					tmp.push('	</div>');
					if(row.state=="审核中"){
						tmp.push('	<div class="row" style="margin-top: 5px;padding-left:20px;padding-right:20px;">');
						tmp.push('		<a class="btn btn-primary btn-rounded btn-block" href="javascript:passApply('+row.row_pkValue+')"><i class="fa fa-pencil-square-o"></i>通过认证</a>');
						tmp.push('	</div>');
						
						tmp.push('	<div class="row" style="margin-top: 5px;padding-left:20px;padding-right:20px;">');
						tmp.push('		<a class="btn btn-warning btn-rounded btn-block" href="javascript:refuseApplyOnclick('+row.row_pkValue+')"><i class="fa fa-remove"></i>拒绝申请</a>');
						tmp.push('	</div>');
					}
					tmp.push('</div>');
					tableList.append(tmp.join(""));
					
				}
			})
		}
		
		function passApply(id){
			layer.confirm('确认通过审核？', function(index){
				handleApply(id,"99");
				layer.close(index);
			});
		}
		
		function refuseApplyOnclick(id){
			layer.confirm('确认拒绝申请？', function(index){
				handleApply(id,"100");
				layer.close(index);
			});
		}
		
		function handleApply(id,state){
			aweto.ajax(basePath+namespace+"/handleApply.ajax",{id:id,state:state,handUser:userName},true,function(r){
				location.href="weixin/app/admin/empCertifyHandList.jsp?state=01";
			})
		}
		
		
		function tabOnclick(s){
			location.href="weixin/app/admin/empCertifyHandList.jsp?state="+s;
		}
	</script>
	<style type="text/css">
	.tabbar {
	    padding: 0px;
	    position: fixed;
	    width: 100%;
	    top: 52px;
	    left: 0;
	    right: 0;
	    z-index: 99;
	}
	.list-text{
		margin-top: 15px;
	}
		
	.tabs .tab a {
    	color: #535252;
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
						<a href="javascript:weixin.toIndex()"><h1><i class="fa fa-chevron-left"></i><span></span>员工认证记录</h1></a>
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
	<div class="tabbar" >
		<div class=" ">
			<div class="container">
				<div class="row">
					<div class="col s12">
						<ul class="tabs z-depth-1">
							<li class="tab col s3"><a class="<%if("01".equals(state)){ %>active<%} %>" href="#tabs1" onclick="tabOnclick('01')">审核中<font id="01"></font></a></li>
							<li class="tab col s3"><a class="<%if("99".equals(state)){ %>active<%} %>" href="#tabs2" onclick="tabOnclick('99')">已认证<font id="99"></font></a></li>
							<li class="tab col s3"><a class="<%if("100".equals(state)){ %>active<%} %>" href="#tabs3" onclick="tabOnclick('100')">未通过<font id="100"></font></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- list -->
	<div class="list segments-page" style="padding-top: 110px;"> <div id="listContainer" class="container"> </div> </div>
	<!-- end list -->
</body>
</html>
