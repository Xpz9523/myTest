<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>地址管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
</head>
<body ontouchstart>
<jsp:include page="../base.jsp"></jsp:include>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">地址管理</div>
</header>
<div class="weui-content">
  <div class="weui-panel address-box" id="demo1">
     <c:forEach items="${address }" var="address">
	    <div class="weui-panel__bd">
	      <div class="weui-media-box weui-media-box_text address-list-box">
	        <a href="${pageContext.request.contextPath}/Wine/addressId/${address.pkAddressId }" class="address-edit"></a>
	        <h4 class="weui-media-box__title"><span>${address.personName }</span>&nbsp;&nbsp;<span>${address.personPhone}</span></h4>
	        <p class="weui-media-box__desc address-txt">${address.sheng}-${address.city }-${address.area }-${address.detailAddress }</p>
	        <c:if test="${address.isDefault == 1}">
	        	<span class="default-add" style="background-color: #EA869A;margin-top: 10px;">默认地址</span>
	        </c:if>
	      </div>
	    </div>
    </c:forEach> 
    
    
  </div>
  <div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" style="background-color: #EA869A;" href="${pageContext.request.contextPath}/Wine/addAddress/${fkUserId}" id="showTooltips">添加收货地址</a>
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
