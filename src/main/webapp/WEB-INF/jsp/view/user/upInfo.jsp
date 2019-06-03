<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.">
<title>修改信息</title>
  <link rel="stylesheet" href="${webpath}/lib/layui/css/layui.css" />
  <style type="text/css">
  .sex{
  		position:relative; 
  		top: 2px;
  		margin-right: 2px;
  }
  </style>
</head>
<body ontouchstart>
<jsp:include page="../base.jsp"></jsp:include>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">资料修改</div>
</header>
<div class="weui-content">
<form class="layui-form" action="" id="myform">
  <div class="weui-cells cardlist">
	<div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">姓名：</label></div>
      <div class="weui-cell__bd"><input class="weui-input" name="userName" type="text" value="${user.userName }"  ><input type="hidden" name="pkUserId" value="${user.pkUserId }"> </div>
    </div>
	<div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">电话：</label></div>
      <div class="weui-cell__bd"><input class="weui-input" name="userPhone" type="text" value="${user.userPhone }"></div>
    </div>
	<div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">邮箱：</label></div>
      <div class="weui-cell__bd"><input class="weui-input" name="userEmail" type="text" value="${user.userEmail }"></div>
    </div>
    <div class="weui-cell">
	    <div class="weui-cell__hd"><label class="weui-label wy-lab">年龄：</label></div>
	    <div class="weui-cell__bd"><input class="weui-input" type="text" name="userAge" value="${user.userAge }" ></div>
    </div>
	<div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">性别：</label></div>
      <div class="weui-cell__bd"><span class="sex">男</span><input class="weui-input" type="radio"  name="userSex" value="1"><span class="sex">女</span><input class="weui-input" type="radio" name="userSex" value="0"></div>
    </div>
  </div>
  <div class="mg10-0"><input type="button" id="payBtn" value="确认修改"  lay-submit lay-filter="*" class="weui-btn weui-btn_primary" style="background-color: #EA869A;"></div>
</form>     
</div>
<script src="${webpath}/lib/layui/layui.js"></script>
<script>
  $(function() {
  	 $(".wy-header-icon-back").click(function(){
     	window.history.back();
     });
  	 var userSex="${user.userSex}";
		$("input[type='radio']").each(function(){
			var userSexId=$(this).val();
			if(userSex==userSexId){
				$(this).prop("checked",true);
			}
		})
  	 
  });
	  layui.use(['layer','form'], function(){
		  var layer = layui.layer, form=layui.form;
		  	 form.on('submit(*)', function(data){
		  		 console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				 console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				 console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
	           $.ajax({
				type : 'post',
				data : data.field,
				url : '${pageContext.request.contextPath}/Wine/view/upInfo',
				dataType : "json",
				success : function(data) {
					if (data.code == 200) {
						$.toast("操作成功");
						setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
							window.location.reload();//页面刷新
						},1000);
					} else if (data.code == 500) {
						$.toast("操作失败");
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
