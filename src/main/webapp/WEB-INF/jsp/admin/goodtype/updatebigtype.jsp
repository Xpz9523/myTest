<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="webPath"  value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <jsp:include page="../../base.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<legend>商品大类型管理</legend>
		</fieldset>

	<form class="layui-form" action="${webPath }/admin/Big/updateGoodType" method="post" id="myfrom">
	<div class="layui-form-item">
    <label class="layui-form-label">商品大种类名字</label>
    <div class="layui-input-block">
      <input type="text" name="typeBigName" autocomplete="off"  class="layui-input" value="${bigGoodType.typeBigName }" >
     <input type="hidden" name="pkTypeBigId" value="${bigGoodType.pkTypeBigId }"> 
    </div>
  </div>
   <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">商品大种类描述</label>
    <div class="layui-input-block">
      <textarea placeholder="" name="typeBigRemark" class="layui-textarea" >${bigGoodType.typeBigRemark }</textarea>
    </div>
  </div>
	<div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1" >立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
	
		</form>
</body>
<script type="text/javascript">
	$(".options[value='${user.deptid}']").attr("selected",true);
</script>

</html>