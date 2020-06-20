var ERROR="-1";
var WARN="-2";
var SUCCESS="0";
var basePath;
var curl=aweto.getRequestUrl();
var urlParam=aweto.parseUrlParam(curl);
weixin={
	wxPath:'weixin/',
	faceData:[],
	refreshPage:function(){
		location.href=location.href;
	},message:function(text,type){//消息提示
		
	},error:function(text){
		
	},warning:function(text, title){
		
	},confirm:function(content,callback){
		
	},getParam:function(paramName){
		if(urlParam[paramName]){
			return urlParam[paramName];
		}
		return "";
	},toIndex:function(){
		location.href="weixin/app/admin/index.jsp";
	},toRegistCom:function(){//企业注册   
		location.href="weixin/app/admin/companyRegist.jsp";    
	},toCompanyQrCode:function(){//企业二维码
		location.href="weixin/app/admin/companyQrCode.jsp?comNo="+comNo+"&shareUser="+userId; 
	},toDepartList:function(){//部门管理
		location.href="weixin/app/admin/departList.jsp";
	},toAddDepart:function(num){//部门添加
		location.href="weixin/app/admin/departEdit.jsp?num="+num;
	},toDepartDetail:function(depNo){//部门查看
		location.href="weixin/app/admin/departEdit.jsp?action=edit&pkValue="+depNo;
	},toDepartEmps:function(depNo){//查看部门员工
		location.href="weixin/app/admin/departEmpList.jsp?depNo="+depNo;
	},toEmpList:function(){//员工管理
		location.href="weixin/app/admin/empList.jsp";
	},toEmpEdit:function(pkValue){//员工信息修改
		location.href="weixin/app/admin/empEdit.jsp?action=edit&pkValue="+pkValue;
	},toRoleList:function(){//角色管理
		location.href="weixin/app/admin/roleList.jsp";
	},toRoleUserList:function(roleNo){//角色用户管理
		location.href="weixin/app/admin/roleUserList.jsp?roleNo="+roleNo;
	},toRoleUserAdd:function(roleNo){//角色添加用户
		location.href="weixin/app/admin/roleUserAdd.jsp?roleNo="+roleNo; 
	},toEmpCentifyHand:function(){//员工认证审核
		location.href="weixin/app/admin/empCertifyHandList.jsp";
	},toModuleList:function(){//常用功能
		location.href="weixin/app/admin/moduleList.jsp";
	},toModuleDetail:function(pkValue){
		location.href="weixin/app/admin/moduleQRCode.jsp?pkValue="+pkValue;
	},toUserInfo:function(){//用户中心
		location.href="weixin/app/user/user.jsp";
	},toUserInfoEdit:function(){//用户信息修改
		location.href="weixin/app/user/userInfoEdit.jsp";
	},toUserCompanyInfo:function(){//查看用户公司信息
		location.href="weixin/app/user/userCompanyInfo.jsp";
	}
};


