/**
 * imageList 对象
 * Copyright (c) 2016
 * @author xumian
 * Dual licensed under the GPL (http://www.gnu.org/licenses/gpl.html)
 * and MIT (http://www.opensource.org/licenses/mit-license.php) licenses.
 */
$.fn.imageList = function(opt){
	return this.each(function(){
		var LIST=this;
		LIST.option={
				url:"",
				container:$(this),
				height:100,
				width:700,
				onupload:function(d){
					alert(JSON.encode(d))
				},
				delOnclick:function(id,obj){
					alert(id)
				},
				data:[
				      //{id:'1',title:'',imgPath:'http://localhost:8081/Liems/uploadfiles/picture/2016-10-04/thumb_2016100417453677323.jpg'},
				      //{id:'2',title:'',imgPath:'http://localhost:8081/Liems/uploadfiles/picture/2016-10-04/thumb_2016100417453616349.jpg'},
				      //{id:'3',title:'',imgPath:'http://localhost:8081/Liems/uploadfiles/picture/2016-10-04/thumb_2016100417453728478.jpg'} 
				     ]
			};
		LIST.option = $.extend(LIST.option,opt);
		var container=LIST.option.container;
		var unid=1;
		var fileSizeLimit = 1024;
   	 	var total = 4;
   	 	var data=LIST.option.data;
   	 	LIST.setData=function(d){
   	 		data=d;
   	 	};
   	 	LIST.reload=function(d){
   	 		LIST.setData(d);
   	 		$(".img-list-item",container).remove();
	   	 	for(var i=0;i<data.length;i++){
	   	 		$('#btn',container).before($('<li id="li_'+data.id+'"  imgPath="'+data[i].imgPath+'"  class="img-list-item" ><img src="'+basePath+data[i].imgPath+'" width="80" height="80" /><a><span nid="'+data[i].id+'" class="img-list-del">删除</span></a></li>').fadeIn('slow'));
			}
	   	 LIST.initEvent();
   	 	};
   	 	LIST.initEvent=function(){
   	 		$(".img-list-del",container).click(function(){
   	 			var id=$(this).attr("nid");
   	 			var obj=$(this);
   	 			if(typeof LIST.option.delOnclick=='function'){
   	 				LIST.option.delOnclick(id,obj);
   	 			}
   	 		})
   	 		$(".img-list-item",container).dblclick(function(){
   	 			var imgPath=$(this).attr("imgPath");
   	 			var div=$("<div></div>").dialog({title:'图片预览',width:480,height:450});
   	 			$("<div style='width:480px;height:420px; overflow: auto;'><img src='"+imgPath+"'/></div>").appendTo(div);
   	 		});
   	 	};
		LIST.init=function(){
			container.empty();
			var height=LIST.option.height;
			var width=LIST.option.width;
			var builder=new Array();
			builder.push("<div class='img-list-container' style='height:"+height+"px;width:"+width+"px;'>");
			builder.push("		<div style='padding: 10px;'>");
			builder.push("			<div class='img-list clearfix'>");
			builder.push("				<ul id='ul_1' style='-webkit-padding-start: 0px;'>	");
			for(var i=0;i<data.length;i++){
				builder.push("					<li class='img-list-item' imgPath='"+data[i].imgPath+"' style='display: list-item;'><img src='"+basePath+data[i].imgPath+"' width='80' height='80'><a><span nid='"+data[i].id+"' class='img-list-del'>删除</span></a></li>");
			}
			builder.push("					<li id='btn'>");
			builder.push("						<input style='display:none' id='fileupload' name='file' type='file' />");
			builder.push("					</li>");
			builder.push("				</ul>");
			builder.push("			</div>");
			builder.push("		</div>");
			builder.push("</div>");
			container.append(builder.join(" "));
			LIST.initEvent();
			$('#fileupload',container).uploadify({
                formData: {
                    attach_type: 'feed_image',
                    upload_type: 'image',
                    thumb: 1,
                    width: 100,
                    height: 100,
                    cut: 1
                },
                fileSizeLimit: fileSizeLimit,
                fileTypeDesc: 'Image Files',
                fileTypeExts:  '*.jpg; *.png; *.gif;',
                swf: basePath+'aweto/ui/plugins/uploadify/uploadify.swf',
                uploader: basePath+"/attachment/uploadImage.ajax",
                fileObjName:'file',
                width: 80,
                height: 80,
                buttonImage: basePath+'aweto/ui/plugins/uploadify/images/add-photo-multi.png',
                queueSizeLimit: 9,
                queueID: true,
                overrideEvents: ['onSelectError', 'onDialogClose'],
                onUploadSuccess : function(file, data, response) {
                    // 解析JSON数据
                    var jsondata =aweto.JSON.decode(data);
                    if (jsondata.state ==='0') {
                        LIST.removeLoading();
                        // 设置附件的值
                        if(typeof LIST.option.onupload=='function'){
                        	LIST.option.onupload(jsondata);
                        }else{
                        	 $('#btn',container).before($('<li id="li_'+unid+'_'+file.index+'"><img src="'+basePath+jsondata.zoomPath+'" width="80" height="80" /><a href="javascript:;"  onclick="removeImage(\''+unid+'\', '+file.index+', '+jsondata.id+')"><span class="img-list-del">删除</span></a></li>').fadeIn('slow'));
                        }
                    }
                },
                onUploadStart: function (file) {
                    LIST.addLoading();
                    // 验证是否能继续上传
                    var len = $('#ul',container).find('li').length-1;
                    if (len > total) {
                    	LIST.removeLoading();
                    	aweto.Dialog.show("提示",'最多只能上传' + total + '个图片');
                        // 停止上传
                        $('#fileupload').uploadify('stop');
                        // 移除队列
                        $('#fileupload').uploadify('cancel', file.id);
                    }
                    if(typeof LIST.option.beforeupload=='function'){
                    	if(LIST.option.beforeupload()==false){
                    		 // 停止上传
                            $('#fileupload').uploadify('stop');
                            // 移除队列
                            $('#fileupload').uploadify('cancel', file.id);
                    	}
                    }
                }    ,
                onSelectError: function (file, errorCode, errorMsg) {
                    switch (errorCode) {
                        case -100:
                        	aweto.Dialog.show("提示",'选择的上传数目超过，您还能上传'+errorMsg+'个图片');
                            break;
                        case -110:
                        	aweto.Dialog.show("提示","文件 [" + file.name + "] 大小超出系统限制的"+ fileSizeLimit);
                            break;
                        case -120:
                        	aweto.Dialog.show("提示","文件 [" + file.name + "] 大小异常");
                            break;
                        case -130:
                        	aweto.Dialog.show("提示","文件 [" + file.name + "] 类型不正确");
                            break;
                    }
                },
                onFallback: function () {
                	aweto.Dialog.show("提示",'您未安装FLASH控件，无法上传！请安装FLASH控件后再试');
                }
            });
		};
		LIST.addLoading=function (unid) {
	        var loadingHtml = '<li id="loading_' + unid + '" class="img-list-load"><span><img src="' + basePath+ 'aweto/ui/plugins/uploadify/images/loading.gif" /></span></li>';
	        container.find('#btn').before(loadingHtml);
	    };
	    LIST.removeLoading= function (unid) {
	    	container.find('#loading_' + unid).remove();
	    };
	    LIST.removeImage=function (obj) {
	        // 移除图像
	    };
	    LIST.clear=function(){
	    	$(".img-list-item",container).remove();
	    };
		LIST.init();
	}).get(0);
}