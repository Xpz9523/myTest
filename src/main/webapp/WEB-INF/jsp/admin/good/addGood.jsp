<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加商品</title>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="../../base.jsp"></jsp:include>
	<div id="mydiv">
		<form class="layui-form" action="" method="post" id="myform">
			<div class="layui-form-item">
				<label class="layui-form-label">商品名称：</label>
				<div class="layui-input-block">
					<input type="text" name="goodName" placeholder="请输入商品名称" autocomplete="off" class="layui-input" id="goodName" lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品标题：</label>
				<div class="layui-input-block">
					<input type="text" name="goodTitle" placeholder="请输入商品的标题" autocomplete="off" class="layui-input" id="goodTitle">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品子标题</label>
				<div class="layui-input-block">
					<input type="text" name="goodSubTitle" placeholder="请输入商品的子标题" autocomplete="off" class="layui-input" id="goodSubTitle">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品价格</label>
				<div class="layui-input-block">
					<input type="text" name="goodPrice" autocomplete="off" placeholder="请输入商品价格" class="layui-input" id="goodPrice">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">运费</label>
				<div class="layui-input-block">
					<input type="text" name="goodFreight" autocomplete="off" placeholder="请输入商品的运费" class="layui-input" id="goodFreight">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">库存</label>
				<div class="layui-input-block">
					<input type="text" name="goodNum" autocomplete="off" placeholder="请输入商品的库存" class="layui-input" id="goodNum">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品状态</label>
				<div class="layui-input-block">
			      <input type="radio" name="goodState" value="0" title="准备上架">
			      <input type="radio" name="goodState" value="1" title="上架">
			      <input type="radio" name="goodState" value="2" title="下架">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品类型</label>
				<div class="layui-input-block">
					<select name="fkGoodTypeSmallId" lay-verify="required" lay-search="" id="">
						<option value="">请选择类型</option>
						<c:forEach items="${goodTypeSmall }" var="goodTypeSmall">
							<option value="${goodTypeSmall.pkTypeSmallId }">${goodTypeSmall.typeSmallName }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">封面图片</label>
					<div class="layui-upload-drag" id="good1" style="margin-left: 30px;">
						<div id="img">
							  <i class="layui-icon"> </i>
							  <p>点击上传封面图片，或将文件拖拽到此处</p>
						 </div>
					</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品的轮播图</label>
				<div class="layui-input-block">
					<div class="layui-upload">
					  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;width: 60%;">
					 	   预览图：
					    <div class="layui-upload-list" id="good2"></div>
					 </blockquote>
					 <button type="button" class="layui-btn" id="good3">上传封面图</button> 
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品详情</label>
				<div class="layui-input-block" id="goodDetail">
					<textarea id="good4" style="display: none;" name="" lay-filter="index"></textarea>
				</div>
			</div>
			
			<div class="layui-form-item">
				<div class="layui-input-block" >
					<input type="submit" class="layui-btn" lay-submit="" lay-filter="demo1" value="立即提交" id="cbtn">
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	layui.use(['form','upload','layedit'],function(){
	  var form = layui.form,upload = layui.upload,layedit = layui.layedit;
			  //拖拽上传
			  upload.render({
			    elem: '#good1'
			    ,url: '${pageContext.request.contextPath}/admin/GoodUploadImg'
			    ,done: function(res){
			      console.log(res)
			      $("#img").html("");
			      $("#img").append("<img src='${pageContext.request.contextPath}/"+ res.data.src +"' width='100px' height='100px' class='layui-upload-img'> <input type='hidden' name='goodCoverImg' value='"+ res.data.src +"'  >")
			      layer.msg(res.msg);
			    }
			  });
			  
			  
			  //多图片上传
			  upload.render({
			    elem: '#good3'
			    ,url: '${pageContext.request.contextPath}/admin/GoodUploadImgs'
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
			      $('#good2').append("<input type='hidden' name='goodCarouselImgs' value='"+ res.data.src +"'  > ")
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
					  console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					  console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					  console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					  var myform=$("#myform").serialize();
					  console.log(myform) //当前容器的全部表单字段，名值对形式：{name: value}
					   $.ajax({
							url : "${pageContext.request.contextPath}/admin/Good/addGoods",
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
</html>