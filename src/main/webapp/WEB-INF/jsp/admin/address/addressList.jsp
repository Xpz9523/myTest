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
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="${webpath}/lib/layui/css/layui.css">
<link rel="stylesheet" type="text/css"
	href="${webpath}/lib/layui/css/hp-common.css" />
</head>

<body>
	<!-- 修改表单 -->
	<form class="layui-form" action=""
		style="display: none; margin-top: 10px;" id="updateForm">
		<input type="hidden" id="pkAddressId">
		<div class="layui-form-item">
			<div class="layui-inline layui-col-md-offset1 layui-col-md9">
				<label class="layui-form-label">收貨姓名：</label>
				<div class="layui-input-inline">
					<input type="tel" id="personName" name="personName"
						lay-verify="required|phone" autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline layui-col-md-offset1 layui-col-md9">
				<label class="layui-form-label">收貨電話：</label>
				<div class="layui-input-inline">
					<input type="tel" id="personPhone" name="personPhone"
						lay-verify="required|phone" autocomplete="off" class="layui-input">
				</div>
			</div>

		</div>
		<div class="layui-form-item">
			<div
				class="layui-inline hp-form-inline layui-col-md-offset1 layui-col-md9">
				<label class="layui-form-label hp-form-label">&nbsp;&nbsp;所在省份：</label>
				<div class="layui-input-inline">
					<select name="sheng" id="sheng" lay-verify="">
						
						<option value="湖北省">湖北省</option>
						<option value="湖南省">湖南省</option>
						<option value="河南省">河南省</option>
						<option value="安微省">安微省</option>
						<option value="广東省">广東省</option>
						<option value="江蘇省">江蘇省</option>
						<option value="四川省">四川省</option>
						<option value="天津">天津</option>
						<option value="河北省">河北省</option>
						<option value="福建省">福建省</option>
						<option value="新疆維吾爾自治區">新疆維吾爾自治區</option>
						<option value="浙江省">浙江省</option>
						<option value="北京市">北京市</option>
						<option value="重庆市">重庆市</option>
						<option value="上海市">上海市</option>
						<option value="青海省">青海省</option>
						<option value="广西省">广西省</option>
						<option value="云南省">云南省</option>
						<option value="山东省">山东省</option>
						<option value="吉林省">吉林省</option>
						<option value="黑龙江省">黑龙江省</option>
						<option value="辽宁省">辽宁省</option>
						<option value="海南省">海南省</option>
						
						
						
						
					</select>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline layui-col-md-offset1 layui-col-md9">
				<label class="layui-form-label">省份編碼：</label>
				<div class="layui-input-inline">
					<input type="tel" id="shengCode" name="shengCode"
						lay-verify="required|phone" autocomplete="off" class="layui-input">
				</div>
			</div>

		</div>
		<div class="layui-form-item">
			<div
				class="layui-inline hp-form-inline layui-col-md-offset1 layui-col-md9">
				<label class="layui-form-label hp-form-label">&nbsp;&nbsp;所在市&nbsp;&nbsp;：&nbsp;&nbsp;</label>
				<div class="layui-input-inline" style="width: 195px;">
					<select name="city" lay-verify="" id="city">
						
						<option value="北京">北京</option>
						<option value="上海">上海</option>
						<option value="杭州">杭州</option>
						<option value="武汉">武汉</option>
						<option value="广州">广州</option>
						<option value="南京">南京</option>
						<option value="成都">成都</option>
						<option value="天津">天津</option>
						<option value="乌鲁木齐">乌鲁木齐</option>
					</select>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline layui-col-md-offset1 layui-col-md9">
				<label class="layui-form-label">市(县)編碼：</label>
				<div class="layui-input-inline">
					<input type="tel" id="cityCode" name="cityCode"
						lay-verify="required|phone" autocomplete="off" class="layui-input">
				</div>
			</div>

		</div>
		<div class="layui-form-item">
			<div class="layui-inline layui-col-md-offset1 layui-col-md9">
				<label class="layui-form-label">区域：</label>
				<div class="layui-input-inline">
					<input type="tel" id="area" name="area" lay-verify="required|phone"
						autocomplete="off" class="layui-input">
				</div>
			</div>

		</div>
		<div class="layui-form-item">
			<div class="layui-inline layui-col-md-offset1 layui-col-md9">
				<label class="layui-form-label">区域编码：</label>
				<div class="layui-input-inline">
					<input type="tel" id="areaCode" name="areaCode"
						lay-verify="required|phone" autocomplete="off" class="layui-input">
				</div>
			</div>

		</div>

		<div class="layui-form-item">
			<div class="layui-inline layui-col-md-offset1 layui-col-md9">
				<label class="layui-form-label">修改日期:</label>
				<div class="layui-input-inline">
					<input type="text" name="updatetime" id="updatetime" lay-verify="date"
						placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
		

		<div
			class="layui-form-item layui-form-text layui-col-md-offset1 layui-col-md9">
			<label class="layui-form-label">详细地址：</label>
			<div class="layui-input-block">
				<textarea id="detailAddress" name="detailAddress"
					placeholder="请输入内容" class="layui-textarea"></textarea>
			</div>

		</div>
		<div class="layui-form-item layui-col-md10">
			<div class="layui-row">
				<div class="layui-col-md-offset4 layui-col-md2">
					<button class="layui-btn" id="updateBtn" onclick='UpdateAddress()'>确认</button>
				</div>
				<div class="layui-col-md-offset2 layui-col-md3">
					<button class="layui-btn layui-btn-danger" onclick='reset()'>取消</button>
				</div>
			</div>
		</div>
	</form>

	<div class="layui-btn-group demoTable hp-div-form">

		<!--  <button class="layui-btn layui-btn-danger" ><i class="layui-icon"></i>删除</button> -->
		<%--  <button id="refrsh" class="layui-btn hp-btn-green" href="${webpath}/address/admin/selectAllAddressList"><i class="layui-icon">ဂ</i>刷新</button> --%>
		<a id="refrsh" class="layui-btn hp-btn-green"
			href="${webpath}/address/admin/selectAllAddressList"><i
			class="layui-icon">ဂ</i>刷新</a>
	</div>
	<table id="addressList" lay-filter="addressList"></table>


	<script type="text/html" id="addressListBar">
 <!-- <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a> -->
  <a class="layui-btn layui-btn-xs" lay-event="edit" >编辑</a>  
  

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
<script type="text/javascript" src="${webpath}/lib/layui/layui.all.js"></script>
<script src="${webpath}/lib/common/js/address.js"></script>
<script type="text/javascript">
	layui.use([ 'form', 'layedit', 'laydate' ],function() {
						var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
						//日期
						laydate.render({
							elem : '#updatetime'
						});

					});
</script>



</body>
</html>
