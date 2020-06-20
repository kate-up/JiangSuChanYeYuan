<%@ taglib prefix="aweto"  uri="http://wwww.aweto-framework.org/taglibs/AwetoTag" %> 
<%@ taglib prefix="weixin"  uri="http://wwww.aweto-framework.org/taglibs/weixinTag" %> 
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    	<meta charset="UTF-8">
        <title>复工宝</title>
        <aweto:basePath />
		<base href="${basePath}" />
		<weixin:sessionInfo debug="true"/>
		<weixin:jssdk/>
        <link rel="stylesheet" href="weixin/web/index.css?v=1">
        <link rel="stylesheet" href="weixin/web/css/materialize.css">
         <link rel="stylesheet" href="weixin/web/js/layer/theme/default/layer.css">
        <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
         <script src="weixin/web/js/layer/layer.min.js"></script>
        <script src="weixin/web/js/materialize.js"></script>
        <script type="text/javascript">
        $(function(){
        	$('.collapsible').collapsible();
        });
        wx.config({
			debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			appId: appId, // 必填，公众号的唯一标识
		    timestamp:timestamp , // 必填，生成签名的时间戳
		    nonceStr: nonceStr, // 必填，生成签名的随机串
		    signature: signature,// 必填，签名
			jsApiList: ['updateTimelineShareData','updateAppMessageShareData'] // 必填，需要使用的JS接口列表
		});
		
		wx.ready(function(){
			var shareData = {
					title: '复工宝操作教程',
					desc: '企业复工与疫情防控高效管理平台',
					link: location.href,
					imgUrl: 'http://wx.luculent.net/weixin/oms/images/logo108.png'
				};
			wx.updateAppMessageShareData(shareData);
			wx.updateTimelineShareData(shareData);
		});
		 var layerId;
		function playVideo(vurl){
        	var url="weixin/web/js/video-js/videoView.jsp?videoUrl="+vurl;
        	layerId=layer.open({
      		  content: url,
      		  title:"视频播放",
      		  shade:false,
      		  moveOut:true,//是否允许拖拽到窗口外
      		  btnAlign:"c",// 按钮右对齐。默认值 l 按钮左对齐   c 按钮居中对齐
      		  type:2,//1:dom元素，2:iframe
      		  area: ["950px", "800px"],
      		  maxmin:true,
      		  btn:false,
      		  zIndex: layer.zIndex, //选择弹出框时置顶设置
      		  success: function(layero, index){
      			 layer.setTop(layero); //选择弹出框时置顶
      			 layer.full(index);
                },
      		  yes: function(index, layero){
      			layer.close(index);
      		  },
      		  cancel: function(){ 
      		    //右上角关闭回调
      		  }
      		});
		}
		
		function closelayer(){
			layer.close(layerId);
		}
		
		function toOmsIndex(){
			location.href=basePath+"weixin/oms/index.jsp";
		}
        </script>
        <style type="text/css">
        	.guidence_text{
        		padding-left: 20px; font-size: 30px;font-weight:bold;margin-bottom: 20px;
        	}
        	.guidence_image{
        		width:650px;
        	}
        	
        	.sm-tit{
        		font-size: 28px;
        	}
        	
        	.intro0{
        		font-size: 30px;
        	}
        	
        	.li_two p{
        		font-size: 33px;
        	}
        	
        	.mb10{
        		font-size: 38px;
        	}
        	.introDesc{
        		padding-top: 10px;padding-bottom: 30px; color: #666A75;
        		text-align: left;
        	}
        	
        	.ques-detail p{
        		font-size: 32px;
        	}
        </style>
    </head>
    <body>
        <div id="body">
            <div class="info" style="margin-top: 0px;">
                <p style="padding-top: 49px; font-size: 58px;">&nbsp;&nbsp;<span class="red-word"></span></p>
                </br>
                 <span onclick="toOmsIndex()" style="background-color: #C7000C; color: #fff; padding: 20px 70px; width: fit-content;font-size: 28px;">立即注册免费使用</span>
            </div>
            <div class="hd">
                <div class="clearfix" id="clearfix">
                    <a id="introduction_" href="#introduction" class="transi on">开通步骤</a>
                    <a id="feature_" href="#feature" class="transi">产品优势</a>
                    <a id="videos_" href="#videos" class="transi">视频教程</a>
                    <a id="material_" href="#material" class="transi">常见问题</a>
                </div>
            </div>
            <div class="mt20">
                <div class="bd">
                    <div id="introduction" class="details order-module">
                        <div class="mb10">复工宝开通步骤</div>
                        <div class="sm-tit">轻松<span class="red-word">4步</span>完成开通与设置</div>
                        <div>
                            <ul class="collapsible" data-collapsible="accordion">
								<li>
									<div class="collapsible-header text-bold welink-row ">
										<img class="num-img" src="weixin/web/img/NN01.png" alt="">
                                        <div class="li_tit">关注“复工宝 由你飞”微信公众号</div>
                                        <img class="down-img" src="weixin/web/img/down.png" alt="">
									</div>
									<div class="collapsible-body" style="text-align: center;">
										 <img class="guidence_image" src="weixin/web/img/qrcode_fgb.jpg" alt="">
										 <div class="guidence_text" >长按识别二维码</div>
										  <img class="guidence_image" src="weixin/web/img/gzgzh.jpg" alt="">
										 <div class="guidence_text" >选择“关注公众号”</div>
										  <img class="guidence_image" src="weixin/web/img/index_gzh.jpg" alt="">
										 <div class="guidence_text" >选择“复工宝”进入</div>
									</div>
								</li>
								<li>
									<div class="collapsible-header text-bold welink-row">
										<img class="num-img" src="weixin/web/img/NN02.png" alt="">
                                        <div style="padding-top: 44px;">
                                            <p>注册企业</p>
                                            <p style="padding-top: 10px; color: #666A75;">开启高效复工与防疫高效管理之旅</p>
                                        </div>
                                        <img class="down-img" src="weixin/web/img/down.png" alt="">
									</div>
									<div class="collapsible-body" style="text-align: center;">
										<img class="guidence_image" src="weixin/web/img/fgb_index_default.jpg" alt="">
										 <div class="guidence_text" >进入“注册企业”界面</div>
										 <img  class="guidence_image" src="weixin/web/img/company_edit.jpg" alt="">
										 <div class="guidence_text" >填写企业信息点击“提交”</div>
									</div>
								</li>
								<li>
									<div class="collapsible-header text-bold welink-row">
										<img class="num-img" src="weixin/web/img/NN03.png" alt="">
                                        <div style="padding-top: 44px;">
                                            <p>创建部门组织</p>
                                            <p style="padding-top: 10px; color: #666A75;">建立企业组织机构</p>
                                        </div>
                                        <img class="down-img" src="weixin/web/img/down.png" alt="">
									</div>
									<div class="collapsible-body" style="text-align: center;">
										 <img class="guidence_image" src="weixin/web/img/index_admin_toDepart.jpg" alt="">
										 <div class="guidence_text" >点击“组织机构”进入管理界面</div>
										 <img class="guidence_image" src="weixin/web/img/toDepartAdd.jpg" alt="">
										 <div class="guidence_text" >点击“添加”进入部门创建界面</div>
										 <img class="guidence_image" src="weixin/web/img/departAdd.jpg" alt="">
										 <div class="guidence_text" >填写部门信息，点击“保存”完成创建</div>
									</div>
								</li>
								<li>
									<div class="collapsible-header text-bold welink-row">
										<img class="num-img" src="weixin/web/img/NN04.png" alt="">
                                        <div style="padding-top: 44px;">
                                            <p>邀请员工加入</p>
                                            <p style="padding-top: 10px; color: #666A75;">轻松邀请员工加入企业</p>
                                        </div>
                                        <img class="down-img" src="weixin/web/img/down.png" alt="">
									</div>
									<div class="collapsible-body" style="text-align: center;">
										 <img class="guidence_image" src="weixin/web/img/toAddEmp.jpg" alt="">
										 <div class="guidence_text" >点击“邀请员工”进入邀请二维码界面</div>
									</div>
									<div class="collapsible-body" style="text-align: center;">
										 <img class="guidence_image" src="weixin/web/img/companyQRCode.jpg" alt="">
										 <img class="guidence_image" src="weixin/web/img/sendQRCodeToEmp1.jpg" alt="">
										 <div class="guidence_text" >点右上角按钮可以发送邀请链接给员工</div>
										  <img class="guidence_image" src="weixin/web/img/empReceiveLink.jpg" alt="">
										 <div class="guidence_text" >员工点击链接即可进入加入企业确认界面</div>
									</div>
								</li>
							</ul>
                        </div>
                    </div>
                    <div id="feature" class="details order-module">
                        <div class="mb10">产品优势</div>
                        <div class="sm-tit">复工宝助力企业高效复工复产</div>
                         <ul class="collapsible" data-collapsible="accordion">
								<li class="li_two" style="padding: 0">
									<div class="collapsible-header text-bold ">
										<img class="num-img" src="weixin/web/img/icon1.png" alt="">
                                        <div style="padding-top: 44px;">
                                            <p>免安装，30秒注册账号</p>
                                            <p style="padding-top: 10px; color: #666A75;">展开查看详情</p>
                                        </div>
                                         <img class="down-img" src="weixin/web/img/down.png" alt="">
									</div>
									<div class="collapsible-body" style="text-align: center;">
										<p class="introDesc">免下载，免安装，易上手，30秒完成企业账号注册</p>
									</div>
								</li>
								<li class="li_two" style="padding: 0">
									<div class="collapsible-header text-bold">
										<img class="num-img" src="weixin/web/img/icon2.png" alt="">
                                        <div style="padding-top: 44px;">
                                            <p>大数据分析，防疫、复工可视化</p>
                                            <p style="padding-top: 10px; color: #666A75;">展开查看详情</p>
                                         </div>
                                          <img class="down-img" src="weixin/web/img/down.png" alt="">
									</div>
									<div class="collapsible-body" style="text-align: center;">
										<p class="introDesc">
											公司领导及防疫工作小组成员可实时查看本公司的防疫及复工动态，同时也可了解员工健康情况、一周到访分析、各部门人员流动分析等趋势动态。相关数据通过图表形式可视化呈现。
										</p>
										<img class="guidence_image" src="weixin/web/img/dkfx.jpg" alt="">
										<div class="guidence_text" >健康打卡统计分析</div>
										<img class="guidence_image" src="weixin/web/img/yzdffx.jpg" alt="">
										<div class="guidence_text" >一周到访分析</div>
										<img class="guidence_image" src="weixin/web/img/bmrydt.jpg" alt="">
										<div class="guidence_text" >部门人员动态</div>
										<img class="guidence_image" src="weixin/web/img/dkycmx.jpg" alt="">
										<div class="guidence_text" >健康打卡异常查看</div>
										<img class="guidence_image" src="weixin/web/img/dkycxq.jpg" alt="">
										<div class="guidence_text" >员工健康异常信息查看</div>
										<img class="guidence_image" src="weixin/web/img/ycbjtx.jpg" alt="">
										<div class="guidence_text" >异常预警信息提醒</div>
									</div>
								</li>
								<li class="li_two" style="padding: 0">
									<div class="collapsible-header text-bold ">
										<img class="num-img" src="weixin/web/img/icon3.png" alt="">
                                        <div style="padding-top: 44px;">
                                            <p>分级管理，四种角色权限</p>
                                            <p style="padding-top: 10px; color: #666A75;">展开查看详情</p>
                                        </div>
                                         <img class="down-img" src="weixin/web/img/down.png" alt="">
									</div>
									<div class="collapsible-body" style="text-align: center;">
										 <p class="introDesc">
                                            	括公司领导、防疫工作小组、防疫人员、管理员等四种角色。除日常健康打卡及生成通行二维码的通用权限外，每种角色分别匹配不同的管理权限。
										</p>
										<img class="guidence_image" src="weixin/web/img/jsfp.jpg" alt="">
										<div class="guidence_text" >多种角色快速分配</div>
									</div>
								</li>
								<li class="li_two" style="padding: 0">
									<div class="collapsible-header text-bold ">
										<img class="num-img" src="weixin/web/img/icon4.png" alt="">
                                        <div style="padding-top: 44px;">
                                            <p>通行二维码，保障出入安全</p>
                                            <p style="padding-top: 10px; color: #666A75;">展开查看详情</p>
                                        </div>
                                         <img class="down-img" src="weixin/web/img/down.png" alt="">
									</div>
									<div class="collapsible-body" style="text-align: center;">
										 <p class="introDesc">
											 根据员工填报的出行及健康信息，结合每日健康打卡数据，生成员工通行二维码，用于防疫安保人员审核出入许可的凭证。
										</p>
										<img class="guidence_image" src="weixin/web/img/userQRCode.jpg" alt="">
										<div class="guidence_text" >员工健康通行码</div>
										<img class="guidence_image" src="weixin/web/img/bajc.jpg" alt="">
										<div class="guidence_text" >防疫人员扫码检查</div>
									</div>
								</li>
						</ul>
                    </div>
                </div>
            </div>
            <div id="videos" class="details order-module" style="padding: 0 40px 60px 40px; background: #fff;">
                <div class="mb10">视频教程</div>
                <div class="sm-tit">高效复工，安全防疫</div>
                <div class="video-div" onclick="playVideo('http://yzglq.luculent.net/weixin/oms/videos/video1.mp4')" style="background: url('weixin/web/img/adv_01.png') no-repeat;background-size: 100%;">
                    <p class="video-tit"><span>复工宝企业“秒”注册</span></p>
                    <p class="video-duration">02:25</p>
                    <i class="video-play-btn"></i>
                </div>
                <div class="video-div" onclick="playVideo('http://yzglq.luculent.net/weixin/oms/videos/video2.mp4')" style="background: url('weixin/web/img/adv_03.png') no-repeat;background-size: 100%;">
                    <p class="video-tit"><span>公司领导使用教程</span></p>
                    <p class="video-duration">02:03</p>
                    <i class="video-play-btn"></i>
                </div>
                <div class="video-div" onclick="playVideo('http://yzglq.luculent.net/weixin/oms/videos/video3.mp4')" style="background: url('weixin/web/img/adv_02.png') no-repeat;background-size: 100%;">
                    <p class="video-tit"><span>企业员工使用教程</span></p>
                    <p class="video-duration">00:50</p>
                    <i class="video-play-btn"></i>
                </div>
                <div class="video-div" onclick="playVideo('http://yzglq.luculent.net/weixin/oms/videos/video4.mp4')" style="background: url('weixin/web/img/adv_04.png') no-repeat;background-size: 100%;">
                    <p class="video-tit"><span>防疫工作小组使用教程</span></p>
                    <p class="video-duration">01:04</p>
                    <i class="video-play-btn"></i>
                </div>
                <div class="video-div" onclick="playVideo('http://yzglq.luculent.net/weixin/oms/videos/video5.mp4')" style="background: url('weixin/web/img/adv_04.png') no-repeat;background-size: 100%;">
                    <p class="video-tit"><span>防疫安保人员使用教程</span></p>
                    <p class="video-duration">00:32</p>
                    <i class="video-play-btn"></i>
                </div>
            </div>
            <div id="material" class="details order-module" style="background: #fff;padding:0 60px">
                <div class="mb10"><img class="cjwt-img" src="weixin/web/img/download.png"/>常见问题<img  class="cjwt-img" src="weixin/web/img/download.png"/></div>
                <div class="sm-tit">
                    <span class="blue-word">更多使用问题请拨打13675180791（徐经理）咨询</span>
                </div>
                <div style="font-size: 12px;color: #575D6C;line-height: 30px;">
                    <div>
                        <p style="font-weight: 600;color: #252B3A;font-size: 38px;"><img class="wenhao" src="weixin/web/img/download-20.png" alt="">如何快速找到复工宝入口</p>
                        <div class="ques-detail">
                            <p class="introDesc">1、关注“复工宝 由你飞”微信公众号</p>
                            </br>
                            <p class="introDesc">2、点击右上角进入公众号信息查看页、再次点击右上角按钮，在底部菜单栏出选择“置顶公众号”，下次就可以在聊天界面方便找到了</p>
                             </br>
                            <p class="introDesc">详情如下图所示</p>
			                <img class="guidence_image" src="weixin/web/img/gzhsz1.jpg" alt="">
							<div class="guidence_text" >进入公众号后点击右上角</div>
							<img class="guidence_image" src="weixin/web/img/gzhsz2.jpg" alt="">
							<div class="guidence_text" >在公众号信息页面再次后点击右上角</div>
							<img class="guidence_image" src="weixin/web/img/gzhsz3.jpg" alt="">
							<div class="guidence_text" >选择置顶公众号</div>
							<img class="guidence_image" src="weixin/web/img/gzhsz4.jpg" alt="">
							<div class="guidence_text" >设置完成</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer">
                <div class="bottom-info">
                    <p>版权所有 © 朗坤智慧科技股份有限公司</p>
                </div>
                <div class="fixed_div">
                    <div class="fixed_img"></div>
                </div>
            </div>
        </div>
    </body>
    <script>
        function siblings(currentNode) {
            var siblingss = [];
            var elseA = currentNode.parentNode.children;
            for (var i = 0, elseAs = elseA.length; i < elseAs; i++) {
                if(elseA[i] !== currentNode) {
                    siblingss.push(elseA[i]);
                }
            }
            return siblingss;
        }
        
        var as = document.querySelectorAll(".clearfix a");
        for(var i = 0; i < as.length; i++) {
            as[i].onclick = function () {
                this.classList.add("on");
                var list = siblings(this);
                for(var j =0; j < list.length; j++) {
                    list[j].classList.remove('on');
                }
            }
        }
        window.onscroll = function () {
            var scolltop = document.documentElement.scrollTop || document.body.scrollTop;
            var as = document.querySelectorAll(".clearfix a");
             var titleHeight=200;
        	 var eles = $(".order-module");
        	 var scrollTop = $(window).scrollTop();
             $.each(eles, function (index, ele) {
            	 var id=$(ele).attr("id");
            	 console.log(id+"--"+ele.offsetTop+":"+scrollTop)
            	// 判断是否置顶
                 if (ele.offsetTop < scrollTop + titleHeight) {
                 	// 置顶后的逻辑处理
                    $(".on").removeClass("on");
                    $("#"+id+"_").addClass("on");
                 }
             });
        }
        window.setInterval(() => {
            var as = document.querySelectorAll(".clearfix a");
            // 滚动条距离顶部的距离
            var scolltop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
            // console.log(scolltop)
            var top = document.getElementById("clearfix");
            // 滚动条确定标题是否固定
            if(scolltop >= 486) {
              //  top.style.cssText = 'position: fixed;top: 124px'
            	top.style.cssText = 'position: fixed;top: 0px';
            }else if (scolltop < 486) {
                top.style.cssText = 'position: relative;top: 0px';
            }
            
        }, 100);
    </script>
</html>