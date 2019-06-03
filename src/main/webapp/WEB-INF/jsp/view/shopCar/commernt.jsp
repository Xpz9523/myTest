<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <c:set var="webPath"  value="${pageContext.request.contextPath}"></c:set>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>发表评价</title>

<meta charset="utf-8">
<link rel="stylesheet" href="${webPath}/lib/weui/css/weui.min.css"/>
<link rel="stylesheet" href="${webPath}/lib/weui/css/jquery-weui.css"/>
<link rel="stylesheet" href="${webPath}/lib/weui/css/style.css"/>
<link rel="stylesheet" href="${webpath}/lib/layui/css/layui.css" />
  <link rel="stylesheet" href="${webpath}/lib/common/css/hp-layui.css" />
  <link rel="stylesheet" href="${webpath}/lib/common/css/drag.css" />
  <link rel="stylesheet" href="${webpath}/lib/common/css/login1.css" />
  <link rel="stylesheet" href="${webpath}/lib/common/css/hp-common.css" />
   <script src="${webpath}/lib/jQuery/jquery-3.2.1.min.js"></script>
   <script src="${webpath}/lib/layui/layui.js"></script>
   <script src="${webpath}/lib/bootstrap/js/bootstrap.min.js"></script>
   <script src="${webpath}/lib/common/js/drag.js"></script>	
   <script src="${webPath}/lib/weui/js/jquery-weui.js"></script>
   
   
</head>
<body ontouchstart>
<!--主体-->

<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">发表评价</div>
</header>
<div class="weui-content clear">
  	<form action="" id="myform">
  <div class="order-list-Below clear">
    <h1>商品评价</h1>
    <ul class="box">
      <li class="on"></li>
      <li class="on"></li>
      <li class="on"></li>
      <li class="on"></li>
      <li class="on"></li>
    </ul>
  </div>
  <input type="hidden" name="fkUserId" value="">
  <div class="weui-cells weui-cells_form com-txt-area">
    <div class="weui-cell">
      <div class="weui-cell__bd">
        <textarea class="weui-textarea txt-area"  name="content" placeholder="这个商品满足你的期待吗？说说你的使用心得，分享给想买的他们吧" rows="3"></textarea>
        
        <div class="weui-textarea-counter font-12 num"><span>0</span>/200</div>
      </div>
    </div>
  </div>
  <div class="weui-cells weui-cells_checkbox commg">
    <label class="weui-cell weui-check__label" for="s11">
      <div class="weui-cell__hd">
        <input type="checkbox" class="weui-check" value="0" name="isShowName" id="s11" checked="checked">
       <input type="hidden" name="fkGoodId" value="1">
        <i class="weui-icon-checked"></i>
      </div>
      <div class="weui-cell__bd"><p>匿名评价</p></div>
    </label>
  </div>
  <div class="weui-cells weui-cells_form">
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <div class="weui-uploader">
            <div class="weui-uploader__hd">
              <p class="weui-uploader__title font-14">图片上传</p>
              <div class="weui-uploader__info font-12">0/2</div>
            </div>
            <div class="weui-uploader__bd">
               <div class="layui-form-item">
				<label class="layui-form-label">晒评论图</label>
				<div class="layui-input-block">
					<div class="layui-upload">
					  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;width: 60%;">
					 	   预览图：
					    <div class="layui-upload-list" id="good2"></div>
					 </blockquote>
					 <button type="button" class="layui-btn" id="good3">上传评论图</button> 
					</div>
				</div>
			</div>
            </div>
          </div>
        	<input type="hidden" id="commentLevel" name="commentLevel" value="" />
        </div>
      </div>
  </div>
  <div class="com-button" lay-submit lay-filter="demo1"><a href="javascript:void(0);" id="cbtn" >发表评价</a></div>
</form>
</div>
<script src="${webPath}/lib/weui/js/jquery-2.1.4.js"></script> 
<script src="${webPath}/lib/weui/js/fastclick.js"></script> 
<script type="text/javascript" src="${webPath}/lib/weui/js/jquery.Spinner.js"></script>
<script>
  $(function() {
    FastClick.attach(document.body);
             $(".wy-header-icon-back").click(function(){
     	window.history.back();
     });
  });
</script>
<script type="text/javascript">
	
	 $(function(){  
                var val = '';
                var strSel = '';
				$(".box li").click(function(){
				var i = $(this).index();
				if(i==0){
						$("#commentLevel").attr("value",1);
					}if(i=="1"){
						$("#commentLevel").attr("value",2);
				}if(i=="2"){
							$("#commentLevel").attr("value",3);
					}if(i=="3"){
							$("#commentLevel").attr("value",4);
						}
				if(i=="4"){
						$("#commentLevel").attr("value",5);
			}
        	
            })
	})
</script>
<script type="text/javascript">
	layui.use(['form','upload','layedit'],function(){
	  var form = layui.form,upload = layui.upload,layedit = layui.layedit;
			  
			  //多图片上传
			  upload.render({
			    elem: '#good3'
			    ,url: '${pageContext.request.contextPath}/Wine/GoodUploadImgs'
			    ,multiple: true
			    ,before: function(obj){
			      //预读本地文件示例，不支持ie8
			      obj.preview(function(index, file, result){
			        $('#good2').append("<img src='"+ result +"' alt='"+ file.name +"' width='100px' height='100px' class='layui-upload-img'> ")
			        layer.msg('上传中...', {
			            icon: 16,
			            time: 3000,
			            shade: [0.3, '#393D49']
			        //测试
			        }, function(){
			        });
			      });
			    }
			    ,done: function(res){
			      //上传完毕
			      $('#good2').append("<input type='hidden' name='showImgs' value='"+ res.data.src +"'  > ")
			    }
			  });
			  
			  //编辑器图片上传
			  layedit.set({  
	              uploadImage: {  
	                    url: '${pageContext.request.contextPath}/admin/GoodUploadImg' //接口url  
	                  , type: 'post' //默认post  
	                }  
	            });
				  var index=layedit.build('good4'); //建立编辑器
				  $("#cbtn").click(function(){
					  
					  var goodDetail=layedit.getContent(index);
					  $("#goodDetail").append("<input type='hidden' name='goodDetail' value='"+ goodDetail +"'  > ")
				  })
				  
				  form.on('submit(demo1)', function(data){
					  if($("input[type='checkbox']").is(':checked')){
					 		alert("勾选");
					 	}else{
					 	$("#s11")	
					 	}
					  console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					  console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					  console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					  var myform=$("#myform").serialize();
					  console.log(myform) //当前容器的全部表单字段，名值对形式：{name: value}
					   $.ajax({
							url : "${pageContext.request.contextPath}/Wine/view/addcommernt",
							type : "get",
							dataType : "json",
							data:myform,
							success : function(data) {
								if(data.code == 200){
									layer.msg(data.msg);
										setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
											window.location.reload();//页面刷新
										},1000);
								 }else if(data.code == 500){
									 layer.msg(data.msg);
								 } 
							}
						});
					  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
					});
		});
</script>

<script type="text/javascript">
$(".order-list-Below ul li").click(
    function(){
        var num = $(this).index()+1;
        var len = $(this).index();
        var thats = $(this).parent(".order-list-Below ul").find("li");
        if($(thats).eq(len).attr("class")=="on"){
            if($(thats).eq(num).attr("class")=="on"){
                $(thats).removeClass();
                for (var i=0 ; i<num; i++) {
                    $(thats).eq(i).addClass("on");
                }
            }else{
                $(thats).removeClass();
                for (var k=0 ; k<len; k++) {
                    $(thats).eq(k).addClass("on");
                }
            }
        }else{
            $(thats).removeClass();
            for (var j=0 ; j<num; j++) {
                $(thats).eq(j).addClass("on");
            }
        }
    }
);


</script>

</body>
</html>