<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:set var="webpath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单明细</title>
<link rel="shortcut icon" href="favicon.ico" />
</head>
<body class="layui-layout-body hp-white-theme">
<jsp:include page="../../base.jsp"></jsp:include>
    <div class="layui-input-inline layui-col-md2">
      <input type="text" id="title" required  lay-verify="required" placeholder="请输入需要查询的订单明细号" autocomplete="off" class="layui-input">
  </div>
  <div class="layui-col-md2" style="margin-bottom: 5px;">
  <buttom class="layui-btn layui-btn-radius layui-btn-primary" onclick="sousuo()"><span class="layui-icon" style="font-size: 20px; color: #E6E6E6;">&#xe615;</span></buttom>
  </div>
  <table class="layui-table">
  <colgroup>
    <col width="80">
    <col width="90">
    <col width="80">
    <col width="90">
    <col width="90">
    <col width="240">
    <col width="80">
    <col width="80">
    <col width="80">
    <col width="130">
    <col width="90">
    <col width="90">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th>序号</th>
      <th>订单明细号</th>
      <th>商品号</th>
      <th>订单号</th>
      <th>订购数量</th>
      <th>商品标题</th>
      <th>商品单价</th>
      <th>商品总价</th>
      <th>商品封面</th>
      <th>商品规格信息</th>
      <th>创建时间</th>
      <th>更新时间</th>
    </tr> 
  </thead>
  <tbody id="model1">
  </tbody>
</table>
<div id="layuipage"></div>
<script>

			$(function(){
				allorderinfo();
			});
			// 配置
			layui.config({
				base: './lib/common/hpModules/' // 扩展模块目录
			}).extend({ // 模块别名
				hpTab: 'hpTab/hpTab',
				hpRightMenu: 'hpRightMenu/hpRightMenu',
				hpFormAll: 'hpFormAll/hpFormAll'
			});
			//JavaScript代码区域
			layui.use(['element', 'carousel','hpTheme', 'hpTab', 'hpLayedit', 'hpRightMenu'], function() {
				var element = layui.element;
				var carousel = layui.carousel; //轮播
				var hpTab = layui.hpTab;
				var hpRightMenu = layui.hpRightMenu;
				var hpTheme=layui.hpTheme;
				$ = layui.jquery;
           	    // 初始化主题
				hpTheme.init();
				 //初始化轮播
				carousel.render({
					elem: '#test1',
					width: '100%', //设置容器宽度
					interval: 1500,
					height: '500px',
					arrow: 'none', //不显示箭头
					anim: 'fade', //切换动画方式
				});
			
				// 初始化 动态tab
				hpTab.init();
				// 右键tab菜单
				hpRightMenu.init();

			});
			function allorderinfo(curr){
				layui.use([ 'form', 'layer', 'laypage', 'laydate' ],function() {
					var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate;
					$.ajax({
						'method' : 'get',
						'url' : '${pageContext.request.contextPath}/admin/OrderInfo/selectAllOrderInfoAdmin',
						'dataType' : 'json',
						data : {
							"pageNum" : curr || 1
						},
						'success' : function(page) {
							var html_content = "";
							$.each(page.list,function(i, o) {
								html_content += "<tr>";
								html_content += "<td>"
										+ (i+1)
										+ "</td>";
								html_content += "<td>"
										+ o.pkOrderInfoDetailId
										+ "</td>";
								html_content += "<td>"
										+ o.fkGoodId
										+ "</td>";
								html_content += "<td>"
										+ o.fkOrderInfoId
										+ "</td>";
								html_content += "<td>"
										+ o.num
										+ "</td>";
								html_content += "<td>"
										+ o.title
										+ "</td>";
								html_content += "<td>"
										+ o.price
										+ "</td>";
								html_content += "<td>"
										+ o.countMoney
										+ "</td>";
								html_content += "<td><img src='"
										+ o.goodImg
										+ "' width='60px'></td>";
								html_content += "<td>"
										+ o.specificationsInfo
										+ "</td>";
								html_content += "<td>"
										+ o.createTime
										+ "</td>";	
								html_content += "<td>"
										+ o.updateTime
										+ "</td>";											
								html_content += "</tr>";
							});
							$("#model1").html(html_content);
							//处理分页组件
							laypage.render({
								elem : 'layuipage',
								count : page.total,
								limit : page.pageSize,
								curr : page.pageNum,
								jump : function(obj, first) {
									if (!first) {
										var pageNum = obj.curr;//点击的页码
										// 点击分页空间 执行方法
										allorderinfo(pageNum);
									}
								}
							})
						},
						'error' : function() {
							layer.msg('服务器异常');
						}
					})
				})
			};
			function sousuo(curr){
				layui.use([ 'form', 'layer', 'laypage', 'laydate' ],function() {
					var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate;
					$.ajax({
						'method' : 'get',
						'url' : '${pageContext.request.contextPath}/admin/OrderInfo/selectAllOrderInfoAdminMohu',
						'dataType' : 'json',
						data : {
							"pageNum" : curr || 1,
							"orderinfoid" : $("#title").val()
						},
						'success' : function(page) {
							var html_content = "";
							$.each(page.list,function(i, o) {
								html_content += "<tr>";
								html_content += "<td>"
										+ (i+1)
										+ "</td>";
								html_content += "<td>"
										+ o.pkOrderInfoDetailId
										+ "</td>";
								html_content += "<td>"
										+ o.fkGoodId
										+ "</td>";
								html_content += "<td>"
										+ o.fkOrderInfoId
										+ "</td>";
								html_content += "<td>"
										+ o.num
										+ "</td>";
								html_content += "<td>"
										+ o.title
										+ "</td>";
								html_content += "<td>"
										+ o.price
										+ "</td>";
								html_content += "<td>"
										+ o.countMoney
										+ "</td>";
								html_content += "<td><img src='"
										+ o.goodImg
										+ "' width='60px'></td>";
								html_content += "<td>"
										+ o.specificationsInfo
										+ "</td>";
								html_content += "<td>"
										+ o.createTime
										+ "</td>";	
								html_content += "<td>"
										+ o.updateTime
										+ "</td>";											
								html_content += "</tr>";
							});
							$("#model1").html(html_content);
							//处理分页组件
							laypage.render({
								elem : 'layuipage',
								count : page.total,
								limit : page.pageSize,
								curr : page.pageNum,
								jump : function(obj, first) {
									if (!first) {
										var pageNum = obj.curr;//点击的页码
										// 点击分页空间 执行方法
										allorderinfo(pageNum);
									}
								}
							})
						},
						'error' : function() {
							layer.msg('服务器异常');
						}
					})
				})
			};
</script>
</body>
</html>