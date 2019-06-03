<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="webpath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body ontouchstart>
	<jsp:include page="../../base.jsp"></jsp:include>
	<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">支付宝扫码支付</div>
</header>
 
<div align="center" style="margin-top: 50px;">
	 <img src="upload/zfbQr.png" />
</div>
<div class="mg10-0 t-c">金额：<span class="wy-pro-pri mg-tb-5">¥<em class="num font-20">296.00</em></span></div>
<script>
  $(function() {
    FastClick.attach(document.body);
         $(".wy-header-icon-back").click(function(){
     	//window.history.back();
      location.href='userCenter.html'
     });
  });
</script>
<script>
      $("#address").cityPicker({
        title: "选择出发地",
        onChange: function (picker, values, displayValues) {
          console.log(values, displayValues);
        }
      });
    </script>
</body>
</html>