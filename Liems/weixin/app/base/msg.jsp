<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.aweto.weixin.util.WxUtil"%>
<%@ page import="org.aweto.system.util.base.Charset"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String openid=Charset.nullToEmpty(request.getSession().getAttribute("openid"));
	String url=WxUtil.checkSubscribe("ZHYQ", openid,request, response);
%>
<!DOCTYPE html>
<html>
  <head>
    <title>操作提醒</title>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link rel="stylesheet" href="<%=basePath %>weixin/ui/lib/weui.min.css">
	<link rel="stylesheet" href="<%=basePath %>weixin/ui/css/jquery-weui.css">
	<link rel="stylesheet" href="<%=basePath %>weixin/ui/demos/css/demos.css">
	<script src="<%=basePath %>weixin/ui/lib/jquery-2.1.4.js"></script>
	<script src="<%=basePath %>aweto/ui/plugins/qrcode/qrcode.js"></script>
    <script src="<%=basePath %>aweto/ui/plugins/qrcode/utf.js"></script>
    <script type="text/javascript" src="<%=basePath %>aweto/ui/plugins/qrcode/jquery.qrcode.js" ></script>
	<script type="text/javascript">
	 var basePath='<%=basePath %>';
	 var url='<%=url %>';
	 $(function(){
	    	if(url!=""){
	    		$("#qrcode").qrcode({
	                render: "canvas",
	                text: url,
	                width : "150",               //二维码的宽度
	                height : "150",              //二维码的高度
	                background : "#ffffff",       //二维码的后景色
	                foreground : "#000000"//,        //二维码的前景色
	                //src: basePath+r.logo             //二维码中间的图片  'images/logo.png'
	            });
	    	}
	    })
	</script>
  </head>
  <body ontouchstart>
    <div class="weui-msg">
      <div class="weui-msg__icon-area"><i class="weui-icon-success weui-icon_msg"></i></div>
      <div class="weui-msg__text-area">
        <h2 class="weui-msg__title">操作成功</h2>
         <br/>
        <%if(!"1".equals(url)){ %>
        	<div class="weui-msg__icon-area">
		       <div class="bd">
			      <div class="page__bd" >
			        <div id="qrcode" class="qrcode"></div>
			      </div>
			    </div>
		      </div>
        	<p class="weui-msg__desc">扫二维码或点击[<a href="<%=url%>">关注公众号</a>]，可以接收更多消息！
        	</p>
        <%} %>
        
      </div>
      <div class="weui-msg__opr-area">
        <p class="weui-btn-area">
          <a href="<%=basePath %>weixin/oms/index.jsp" class="weui-btn weui-btn_default">返回首页</a>
        </p>
      </div>
      <div class="weui-msg__extra-area">
        <div class="weui-footer">
          <p class="weui-footer__links" style="display: none">
            <a href="javascript:void(0);" class="weui-footer__link">底部链接文本</a>
          </p>
          <p class="weui-footer__text">Copyright © 2008-2020 luculent</p>
        </div>
      </div>
    </div>
<script>
  $(function() {
    FastClick.attach(document.body);
  });
  function toList(){
	  location.href=basePath+"weixin/zhyq/visitor/list.jsp";
  }
  function toIndex(){
  	location.href=basePath+'weixin/zhyq/visitor/index.jsp';
  }
</script>
  </body>
</html>
