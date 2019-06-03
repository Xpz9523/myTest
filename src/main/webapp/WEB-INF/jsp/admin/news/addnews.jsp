<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:set var="webpath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻添加</title>
<link rel="shortcut icon" href="favicon.ico" />
</head>
<body class="layui-layout-body hp-white-theme">
<jsp:include page="../../base.jsp"></jsp:include>
<div style="height: 40px;">
</div>
<form class="layui-form" action="${pageContext.request.contextPath}/admin/News/addNewsAndImg">
  <input type="hidden" name="pkNewsId" value="${n.pkNewsId}">
  <div class="layui-form-item">
    <label class="layui-form-label">新闻标题</label>
    <div class="layui-input-block">
      <input type="text" name="title" required value="${n.newsTitle}"  lay-verify="required" placeholder="请输入新闻标题" autocomplete="off" class="layui-input">
    </div>
  </div>
    <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">新闻内容</label>
    <div class="layui-input-block" id="newsDetail">
      <textarea id="demo" name="content"style="display: none;" lay-filter="index"></textarea>
    </div>
  </div>
    <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" type="submit" lay-submit lay-filter="formDemo">立即提交</button>
    </div>
  </div>
</form>
<script>
//DemoForm表单
layui.use(['form','layedit'], function(){
  var form = layui.form,layedit = layui.layedit;
  
  //监听提交
  form.on('submit(formDemo)', function(data){
    layer.msg(JSON.stringify(data.field));
    //return false;
  });
  
//文本编辑器
 $("#demo").html('${n.newsContent}');
  layedit.set({
	  uploadImage: {url: '/admin/News/imguploading', type: 'post'}//设置图片上传接口
	});
	
 var index=layedit.build('demo',{
	  height: 550//设置高度
	 }); //建立编辑器
  layedit.getContent(index);
	  
});
</script>
      
</body>
</html>