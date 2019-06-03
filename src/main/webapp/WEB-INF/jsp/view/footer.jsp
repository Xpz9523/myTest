<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--底部导航-->
<div class="foot-black"></div>
<div class="weui-tabbar wy-foot-menu">
  <a href="${pageContext.request.contextPath}/view/index" class="weui-tabbar__item">
    <div class="weui-tabbar__icon foot-menu-home"></div>
    <p class="weui-tabbar__label">首页</p>
  </a>
  <a href="classify.html" class="weui-tabbar__item">
    <div class="weui-tabbar__icon foot-menu-list"></div>
    <p class="weui-tabbar__label">分类</p>
  </a>
  <a href="${pageContext.request.contextPath}/car/gomyCar" class="weui-tabbar__item">
    <!-- <span class="weui-badge"
			style="position: absolute;top: -.4em;right: 1em;"></span> -->
    <div class="weui-tabbar__icon foot-menu-cart"></div>
    <p class="weui-tabbar__label">购物车</p>
  </a>
  <c:if test="${not empty user }">
    <a href="${pageContext.request.contextPath}/Wine/Info" class="weui-tabbar__item weui-bar__item--on">
    <div class="weui-tabbar__icon foot-menu-member"></div>
    <p class="weui-tabbar__label">我的</p>
  </a>
  </c:if>
   <c:if test="${empty user }">
    <a href="${pageContext.request.contextPath}/Wine/login" class="weui-tabbar__item weui-bar__item--on">
    <div class="weui-tabbar__icon foot-menu-member"></div>
    <p class="weui-tabbar__label">我的</p>
  </a>
  </c:if>

</div>

</body>
</html>