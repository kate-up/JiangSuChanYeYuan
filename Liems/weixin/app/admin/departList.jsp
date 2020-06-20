<%@page import="org.aweto.system.entity.SysoprTemplate"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.aweto.web.util.base.WebTools"%>
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
		<aweto:decoration version="2.0" mobile="true"/>
	   <script>
			var namespace='/web/webDepart';
		    var tableList;
			$(function(){
				$("#comName").html(comName);
				tableList=$("#tableList").simplecardList({
	    			id:"tableList",
	    			scrollLoad:true,
	    			pageSize:5,
	    			url: basePath+namespace+"/tableList.ajax",
	    			cardFormat:function(row){
	    				var depName = row.depName;
						var depManager = row.depManager;
						var firstDtm = row.firstDtm;
						var depNo = row.depNo;
						var seqNo = row.seqNo;
						var empNumbers=row.empNumbers;
						if(empNumbers==""){
							empNumbers="-";
						}else{
							empNumbers=empNumbers+"人"
						}
						var state = row.state == 'on' ? '启用' : '停用';
						var img='';//row.avatar;
						if(img==''){
							img='weixin/ui/images/building.png';
						}
	    				var tmp=new Array();
						tmp.push('<div  class="contents">');
						tmp.push('	<div class="list-img">');
						tmp.push('		<img src="'+img+'" alt="">');
						tmp.push('	</div>');
						tmp.push('	<div class="list-text">');
						tmp.push('		<h6>'+depName+'<a href="javascript:toDetail('+depNo+')" style="float: right">修改</a></h6>');
						tmp.push('		<p>[人数：'+empNumbers+']已加入：<a href="javascript:toDepartEmps('+depNo+')">'+row.members+'</a>人  </p>');
						tmp.push('	</div>');
						tmp.push('</div>');
						return tmp.join("");
	    			}
	    		});
			});
			
			function toDetail(depNo){
				weixin.toDepartDetail(depNo);
			}
			
			function toDepartEmps(depNo){
				weixin.toDepartEmps(depNo);
			}
			
			function toAddDepart(){
				var num=totalRows+1;
				weixin.toAddDepart(num);
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
							<a href="javascript:weixin.toIndex()"><h1><i class="fa fa-chevron-left"></i><span></span>部门组织管理</h1></a>
						</div>
					</div>
					<div class="col s3">
						<div class="content-right">
							<a href="javascript:toAddDepart();" ><i class="fa fa-plus"></i>添加</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end navbar -->
		<div class="list segments-page">
			<div class="pages-title">
				<h3 id="comName"></h3>
				<div class="line"></div>
			</div>
			<div id="tableList" class="col-sm-12 select-table table-striped" style="top:100px;">
	     	
	     	</div>
		</div>
	</body>
	
	</html>