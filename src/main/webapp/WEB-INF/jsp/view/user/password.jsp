<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.">
<title>修改密码</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css" />
</head>
<body ontouchstart>
<jsp:include page="../base.jsp"></jsp:include>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">密码修改</div>
</header>
<div class="weui-content">
<form class="layui-form" action="" id="myform">
  <div class="weui-cells cardlist">
	<div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">旧密码</label></div>
      <div class="weui-cell__bd"><input class="weui-input" name="oldPwd" type="password"  placeholder="请输入旧密码" id="old"></div>
      <input type="hidden" name="pkUserId" value="${pkUserId }"> 
    </div>
	<div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">新密码</label></div>
      <div class="weui-cell__bd"><input class="weui-input" name="newPwd" type="password"  placeholder="请输入新密码" id="newPwd"></div>
    </div>
	<div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">确认密码</label></div>
      <div class="weui-cell__bd"><input class="weui-input" type="password"  placeholder="请确认新密码" id="newPwds"></div>
    </div>
  </div>
  <div class="mg10-0"><input type="button" id="payBtn" value="确认修改"  lay-submit lay-filter="*" class="weui-btn weui-btn_primary" style="background-color: #EA869A;"></div>
</form>     
</div>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script>
  $(function() {
  	 $(".wy-header-icon-back").click(function(){
     	window.history.back();
     });
  	 
  });
	  layui.use(['layer','form'], function(){
		  var layer = layui.layer, form=layui.form;
		  	 form.on('submit(*)', function(data){
		  		 console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				 console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				 console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
				  var old=$("#old").val();
				  var newPwd=$("#newPwd").val();
				  var newPwds=$("#newPwds").val();
				  if(old.length<=0){
					  layer.msg("请输入旧密码");
					  return false;
				  }
				  if(newPwd.length<=0){
					  layer.msg("请输入新密码");
					  return false;
				  }
				  if(newPwds.length<=0){
					  layer.msg("请重复新密码");
					  return false;
				  }
				  if(newPwd.length!=newPwds.length){
					  layer.msg("密码请保持一致");
					  return false;
				  }
			
	           $.ajax({
				type : 'get',
				data : data.field,
				url : '${pageContext.request.contextPath}/Wine/view/upPwd',
				dataType : "json",
				success : function(data) {
					if (data.code == 200) {
						layer.msg(data.msg);
						setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
							window.location.reload();//页面刷新
						},1000);
					} else if (data.code == 500) {
						layer.msg(data.msg);
						$("#myform")[0].reset();
						return false;
					}
				}
			})
			return false;
		});
	});
</script>

</body>
</html>
