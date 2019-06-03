<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="webpath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>数据列表</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="apple-mobile-web-app-status-bar-style" content="black"> 
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telephone=no">
  <link rel="stylesheet" href="${webpath}/lib/layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="${webpath}/lib/layui/css/hp-common.css"/>
</head>

<body>

	
	<div class="layui-btn-group demoTable">
 
<!--   <button class="layui-btn layui-btn-danger" ><i class="layui-icon"></i>删除</button> -->
 <%--  <button id="refrsh" class="layui-btn hp-btn-green" href="${webpath}/address/admin/selectAllAddressList"><i class="layui-icon">ဂ</i>刷新</button> --%>
<a id="refrsh" class="layui-btn hp-btn-green" href="${webpath}/admin/selectAllCart"><i class="layui-icon">ဂ</i>刷新</a>
</div>
 <table id="addressList" lay-filter="addressList"></table>

	     
<script type="text/html" id="addressListBar">
 <!-- <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a> -->
  <!-- <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>-->
  

{{#  if(d.isDelete==0){ }}
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
 {{#  } }}
{{#  if(d.isDelete==1){ }}
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="hui">恢复</a>
 {{#  } }}
</script>
 
	     
<script type="text/html" id="addressListBar2">
  
 {{#  if(d.isDefault==0){ }}
	<span>是</span>
 {{#  } }}
 {{#  if(d.isDefault==1){ }}
	<span>否</span>
 {{#  } }}
</script>          	     
</body>
<script type="text/javascript" src="${webpath}/lib/layui/layui.js"></script>
<script src="${webpath}/lib/common/js/cart.js"></script> 


	

</body>
</html>
