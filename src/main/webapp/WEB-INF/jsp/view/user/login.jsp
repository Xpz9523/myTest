<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>登录</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/common/css/common.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/common/css/login.css"/>
  <style type="text/css">
  	body{
  	font-size: 16px;
  	
  	}
  </style>
</head>
<body style="background-color: #C4191D;">
    <div id="login"></div>
    <div class="login_bg">
        <div id="logo">
            <img src="${pageContext.request.contextPath}/lib/common/img/login/logo.png" alt=""/>
        </div>
        <form action="${pageContext.request.contextPath}/Wine/Info" method="post">
            <div class="userName">
                <lable>用户名：</lable>
                <input type="text" name="name" placeholder="请输入用户名" required/>
            </div>
            <div class="passWord">
                <lable>密&nbsp;&nbsp;&nbsp;码：</lable>
                <input type="password" name="password" placeholder="请输入密码" pattern="[0-9A-Za-z]{6,25}" required/>
            </div>
            <div class="choose_box">
                <div>
                    <input type="checkbox" checked="checked" name="checkbox"/>
                    <lable>记住密码</lable>
                </div>
                <a href="${pageContext.request.contextPath}/Wine/toregister">还没有帐号？去注册</a>
            </div>
            <button class="login_btn" type="submit">登&nbsp;&nbsp;录</button>
        </form>
        <div class="other_login">
            <div class="other"></div>
            <span>其他方式登录</span>
            <div class="other"></div>
        </div>
        <div class="other_choose">
            <a href="">
                <img src="${pageContext.request.contextPath}/lib/common/img/login/qq.png" alt=""/>
            </a>
            <a href="">
                <img src="${pageContext.request.contextPath}/lib/common/img/login/wx.png" alt=""/>
            </a>
            <a href="">
                <img src="${pageContext.request.contextPath}/lib/common/img/login/wb.png" alt=""/>
            </a>
        </div>
    </div>
</body>
</html>