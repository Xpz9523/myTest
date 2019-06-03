<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">

<title>显示新闻</title>
<style type="text/css">
</style>
</head>
<body ontouchstart>
	<jsp:include page="../base.jsp"></jsp:include>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">新闻列表</div>
</header>
<div class="weui-content">
  <div class="weui-cells wy-news-list">
  
  	<c:forEach items="${news }" var="news">
	  	<a class="weui-cell weui-cell_access" href='${pageContext.request.contextPath}/Wine/toNews/${news.pkNewsId}'>
	      <div class="weui-cell__bd">
	        <p>${news.newsTitle }</p>
	      </div>
	      <div class="weui-cell__ft"></div>
	     </a>
  	</c:forEach>
  </div>
  
</div>

<script>
  $(function() {
    FastClick.attach(document.body);
             $(".wy-header-icon-back").click(function(){
     	window.history.back();
     }); 
  });
</script>

</body>
</html>