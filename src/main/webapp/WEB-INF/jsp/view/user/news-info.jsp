<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.">
</head>
<body ontouchstart>
<jsp:include page="../base.jsp"></jsp:include>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">新闻详情</div>
</header>
<div class="weui-content">
  <article class="weui-article">
    <h1>${news.newsTitle}</h1>
    <h3 class="wy-news-time">发布时间：<fmt:formatDate value="${news.createTime }" pattern="yyyy-MM-dd HH-mm-ss"/></h3>
    <section class="wy-news-info">
      <p>${news.newsContent }</p>
    </section>
  </article>
  
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
