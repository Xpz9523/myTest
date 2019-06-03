<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="webpath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML>
<html>
<head>
<title>今朝有酒后台登录</title>
<!-- Custom Theme files -->
<link
	rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="后台登录" />
<!--Google Fonts-->
<!--<link href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
-->
<!--Google Fonts-->
</head>
<script type="text/javascript">
	function getHeadImg() {
		layui.use('layer', function(){
		var loginName = $("#loginName").val();
		$.ajax({
			method : 'post',
			url : '${webpath}/user/getHeadImg',
			dataType : 'json',
			data : {
				"loginName" : loginName
			},
			success : function(data) {
				if (data.code == 200) {
					var headImgPath = data.data.userHeadimg;
					console.log(data);
					$("#headImg").attr("src", "${webpath}/lib/common/img/" + headImgPath);
				} else if (data.code == 500) {
					$("#headImg").attr("src", "${webpath}/lib/common/img/login/wine.jpg");
				}
			},
			error : function() {
			}
		});
		});
	}
</script>
<body id="loginBody">
	<jsp:include page="../../base.jsp"></jsp:include>
	<!--header start here-->
	<div class="login-form">
		<div class="top-login">
			<img src="${webpath}/lib/common/img/login/wine.jpg" alt=""
				style="border-radius: 90px;" id="headImg" />
		</div>
		<h1>今朝有酒后台管理</h1>
		<div class="login-top">
			<form action="${webpath}/manage/login" method="post">
				<div class="login-ic">
					<i></i> <input type="text" placeholder="请输入用户名" name="loginName"
						onBlur="getHeadImg()" id="loginName" />
					<div class="clear"></div>
				</div>
				<div class="login-ic">
					<i class="icon"></i> <input type="password" placeholder="请输入密码"
						name="loginPwd" />
					<div class="clear"></div>
				</div>

				<div class="log-bwn" id="loginBtn">
					<input type="submit" value="Login"
						id="loginButton">
				</div>
			</form>
		</div>
		<p class="copy">© 2018 Made By WYD</p>
	</div>
	<!--header start here-->
</body>
</html>