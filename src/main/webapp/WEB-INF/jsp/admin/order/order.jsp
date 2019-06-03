<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:set var="webpath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>
<link rel="shortcut icon" href="favicon.ico" />
</head>
<body class="layui-layout-body hp-white-theme">
	<jsp:include page="../../base.jsp"></jsp:include>
    <div class="layui-input-inline layui-col-md2">
      <input type="text" id="title" required  lay-verify="required" placeholder="请输入需要查询的订单号" autocomplete="off" class="layui-input">
  </div>
  <div class="layui-col-md2" style="margin-bottom: 5px;">
  <buttom class="layui-btn layui-btn-radius layui-btn-primary" onclick="sousuo()"><span class="layui-icon" style="font-size: 20px; color: #E6E6E6;">&#xe615;</span></buttom>
  <buttom class="layui-btn layui-btn-radius" onclick="huifu()"><span class="layui-icon" style="font-size: 20px; color: #E6E6E6;">&#xe61e;</span>恢复</buttom>
  </div>
	<table class="layui-table">
  <colgroup>
    <col width="170">
    <col width="80">
    <col width="320">
    <col width="60">
    <col width="90">
    <col width="90">
    <col width="90">
    <col width="120">
    <col width="120">
    <col width="120">
    <col width="90">
    <col width="120">
    <col width="120">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th>订单号</th>
      <th>用户名</th>
      <th>客户收货地址</th>
      <th>运费</th>
      <th>订单金额</th>
      <th>订单状态</th>
      <th>支付方式</th>
      <th>支付时间</th>
      <th>发货时间</th>
      <th>收货时间</th>
      <th>是否评价</th>
      <th>订单创建时间</th>
      <th>更新时间</th>
      <th>操作</th>
    </tr> 
  </thead>
  <tbody id="model1">
  </tbody>
</table>
<div id="layuipage"></div>
<script>

			$(function(){
				allorder();
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
			function allorder(curr){
				layui.use([ 'form', 'layer', 'laypage', 'laydate' ],function() {
					var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate;
					$.ajax({
						'method' : 'get',
						'url' : '${pageContext.request.contextPath}/admin/Order/selectAllOrderAdmin',
						'dataType' : 'json',
						data : {
							"pageNum" : curr || 1
						},
						'success' : function(page) {
							var html_content = "";
							$.each(page.list,function(i, o) {
								html_content += "<tr>";
								html_content += "<td>"
										+ o.pkOrderInfoId
										+ "</td>";
								html_content += "<td>"
										+ o.user.userName
										+ "</td>";
								html_content += "<td>"
										+ o.address.sheng
										+ o.address.city
										+ o.address.area
										+ o.address.detailAddress
										+ "</td>";
								html_content += "<td>"
										+ o.orderInfoFreight
										+ "</td>";
								html_content += "<td>"
										+ o.orderInfoMoney
										+ "</td>";
								if(o.orderInfoState==0){
									html_content += "<td>"
										+ "未付款"
										+ "</td>";
								}else if(o.orderInfoState==1){
									html_content += "<td>"
										+ "已付款"
										+ "</td>";
								}else if(o.orderInfoState==2){
									html_content += "<td>"
										+ "未发货"
										+ "</td>";
								}else if(o.orderInfoState==3){
									html_content += "<td>"
										+ "已发货"
										+ "</td>";
								}else if(o.orderInfoState==4){
									html_content += "<td>"
										+ "已签收"
										+ "</td>";
								};
								if(o.payMethod==null){
									html_content += "<td>"
										+ "未支付"
										+ "</td>";
								}else if(o.payMethod==1){
									html_content += "<td>"
										+ "微信"
										+ "</td>";
								}else if(o.payMethod==2){
									html_content += "<td>"
										+ "支付宝"
										+ "</td>";
								};
								html_content += "<td>"
										+ o.payTime
										+ "</td>";
								html_content += "<td>"
										+ o.deliveryTime
										+ "</td>";
								html_content += "<td>"
										+ o.receivingTime
										+ "</td>";
								if(o.isComment==0){
									html_content += "<td>"
										+ "待评价"
										+ "</td>";
								}else if(o.isComment==1){
									html_content += "<td>"
										+ "已评价"
										+ "</td>";
								};
								html_content += "<td>"
										+ o.createTime
										+ "</td>";	
								html_content += "<td>"
										+ o.updateTime
										+ "</td>";
								if(o.orderInfoState==4){
									html_content += "<th><a href='#' class='layui-icon' onclick=update('"
										+ o.pkOrderInfoId
										+ "','"
										+ o.orderInfoState
									    + "') style='font-size: 27px; color: #1E9FFF;margin-right: 5px;'>"
										+ "&#xe642;"
										+ "</a><buttom href='#' class='layui-icon' onclick=del('"
										+ o.pkOrderInfoId
										+ "') style='font-size: 27px; color: red;'>"
										+ "&#xe640;"
										+ "</buttom></th>";
								}else{
								html_content += "<th><a href='#' class='layui-icon' onclick=update('"
										+ o.pkOrderInfoId
										+ "','"
										+ o.orderInfoState
									    + "') style='font-size: 27px; color: #1E9FFF;margin-right: 5px;'>"
										+ "&#xe642;"
										+ "</a><a href='#' class='layui-icon layui-btn-disabled'"
										+ "style='font-size: 27px; color: #ECE7E7;'>"
										+ "&#xe640;"
										+ "</a></th>";
								};												
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
										allorder(pageNum);
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
					'url' : '${pageContext.request.contextPath}/admin/Order/selectOrderAdminMohu',
					'dataType' : 'json',
					 data : {
						 "orderid" : $("#title").val(),
						 "pageNum" : curr || 1
					 },
					 'success' : function(page) {
							var html_content = "";
							$.each(page.list,function(i, o) {
								html_content += "<tr>";
								html_content += "<td>"
										+ o.pkOrderInfoId
										+ "</td>";
								html_content += "<td>"
										+ o.user.userName
										+ "</td>";
								html_content += "<td>"
										+ o.address.sheng
										+ o.address.city
										+ o.address.area
										+ o.address.detailAddress
										+ "</td>";
								html_content += "<td>"
										+ o.orderInfoFreight
										+ "</td>";
								html_content += "<td>"
										+ o.orderInfoMoney
										+ "</td>";
								if(o.orderInfoState==0){
									html_content += "<td>"
										+ "未付款"
										+ "</td>";
								}else if(o.orderInfoState==1){
									html_content += "<td>"
										+ "已付款"
										+ "</td>";
								}else if(o.orderInfoState==2){
									html_content += "<td>"
										+ "未发货"
										+ "</td>";
								}else if(o.orderInfoState==3){
									html_content += "<td>"
										+ "已发货"
										+ "</td>";
								}else if(o.orderInfoState==4){
									html_content += "<td>"
										+ "已签收"
										+ "</td>";
								};
								if(o.payMethod==null){
									html_content += "<td>"
										+ "未支付"
										+ "</td>";
								}else if(o.payMethod==1){
									html_content += "<td>"
										+ "微信"
										+ "</td>";
								}else if(o.payMethod==2){
									html_content += "<td>"
										+ "支付宝"
										+ "</td>";
								};
								html_content += "<td>"
										+ o.payTime
										+ "</td>";
								html_content += "<td>"
										+ o.deliveryTime
										+ "</td>";
								html_content += "<td>"
										+ o.receivingTime
										+ "</td>";
								if(o.isComment==0){
									html_content += "<td>"
										+ "待评价"
										+ "</td>";
								}else if(o.isComment==1){
									html_content += "<td>"
										+ "已评价"
										+ "</td>";
								};
								html_content += "<td>"
										+ o.createTime
										+ "</td>";	
								html_content += "<td>"
										+ o.updateTime
										+ "</td>";
								if(o.orderInfoState==4){
									html_content += "<th><a href='#' class='layui-icon' onclick=update('"
										+ o.pkOrderInfoId
										+ "','"
										+ o.orderInfoState
									    + "') style='font-size: 27px; color: #1E9FFF;margin-right: 5px;'>"
										+ "&#xe642;"
										+ "</a><buttom href='#' class='layui-icon' onclick=del('"
										+ o.pkOrderInfoId
										+ "') style='font-size: 27px; color: red;'>"
										+ "&#xe640;"
										+ "</buttom></th>";
								}else{
								html_content += "<th><a href='#' class='layui-icon' onclick=update('"
										+ o.pkOrderInfoId
										+ "','"
										+ o.orderInfoState
									    + "') style='font-size: 27px; color: #1E9FFF;margin-right: 5px;'>"
										+ "&#xe642;"
										+ "</a><a href='#' class='layui-icon layui-btn-disabled'"
										+ "style='font-size: 27px; color: #ECE7E7;'>"
										+ "&#xe640;"
										+ "</a></th>";
								};															
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
										sousuo(pageNum);
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
			function huifu(curr){
				layui.use([ 'form', 'layer', 'laypage', 'laydate' ],function() {
				var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate;
				$.ajax({
					'method' : 'get',
					'url' : '${pageContext.request.contextPath}/admin/Order/selectOrderByDelete',
					'dataType' : 'json',
					 data : {
						 "pageNum" : curr || 1
					 },
					 'success' : function(page) {
							var html_content = "";
							$.each(page.list,function(i, o) {
								html_content += "<tr>";
								html_content += "<td>"
										+ o.pkOrderInfoId
										+ "</td>";
								html_content += "<td>"
										+ o.user.userName
										+ "</td>";
								html_content += "<td>"
										+ o.address.sheng
										+ o.address.city
										+ o.address.area
										+ o.address.detailAddress
										+ "</td>";
								html_content += "<td>"
										+ o.orderInfoFreight
										+ "</td>";
								html_content += "<td>"
										+ o.orderInfoMoney
										+ "</td>";
								if(o.orderInfoState==0){
									html_content += "<td>"
										+ "未付款"
										+ "</td>";
								}else if(o.orderInfoState==1){
									html_content += "<td>"
										+ "已付款"
										+ "</td>";
								}else if(o.orderInfoState==2){
									html_content += "<td>"
										+ "未发货"
										+ "</td>";
								}else if(o.orderInfoState==3){
									html_content += "<td>"
										+ "已发货"
										+ "</td>";
								}else if(o.orderInfoState==4){
									html_content += "<td>"
										+ "已签收"
										+ "</td>";
								};
								if(o.payMethod==null){
									html_content += "<td>"
										+ "未支付"
										+ "</td>";
								}else if(o.payMethod==1){
									html_content += "<td>"
										+ "微信"
										+ "</td>";
								}else if(o.payMethod==2){
									html_content += "<td>"
										+ "支付宝"
										+ "</td>";
								};
								html_content += "<td>"
										+ o.payTime
										+ "</td>";
								html_content += "<td>"
										+ o.deliveryTime
										+ "</td>";
								html_content += "<td>"
										+ o.receivingTime
										+ "</td>";
								if(o.isComment==0){
									html_content += "<td>"
										+ "待评价"
										+ "</td>";
								}else if(o.isComment==1){
									html_content += "<td>"
										+ "已评价"
										+ "</td>";
								};
								html_content += "<td>"
										+ o.createTime
										+ "</td>";	
								html_content += "<td>"
										+ o.updateTime
										+ "</td>";
								html_content += "<th><buttom class='layui-btn layui-btn-radius layui-btn-primary layui-icon' onclick=tohui('"
										+ o.pkOrderInfoId
										+"')>"
										+ "&#x1005;"
										+ "恢复"
										+ "</buttom></th>";												
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
										huifu(pageNum);
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
			
			function del(orderid){
				layer.confirm('亲，你要删除嘛?', {icon: 2, title:'提示'}, function(index){
					$.ajax({
						url : "${pageContext.request.contextPath}/admin/Order/OrderInfo_delete",
						type : "get",
						data : {
							"orderid" : orderid
						},
						dateType : "json",
						success : 
							function(a){
							if(a==0){
								layer.msg("删除失败");
								}
							else {
								layer.msg("删除成功");
								allorder();
								}
							}
							
					});
				});

			};
			function tohui(o){
				layer.confirm('亲，你要恢复嘛?', {icon: 1, title:'提示'}, function(index){
					$.ajax({
						url : "${pageContext.request.contextPath}/admin/Order/huifuController",
						type : "get",
						data : {
							"orderid" : o
						},
						dateType : "json",
						success : 
							function(a){
							if(a==0){
								layer.msg("恢复失败");
								}
							else {
								layer.msg("恢复成功");
								huifu();
								}
							}
							
					});
				});
			};
			function update(orderid,state){
				if(state==0){
					layer.msg('兄Die，没给钱不能瞎搞!', {icon: 2}); 
					}else if(state==1){
						layer.confirm('老板，仓库还有货嘛?真的要发货了嘛!', {icon: 1, title:'提示'}, function(index){
							$.ajax({
								url : "${pageContext.request.contextPath}/admin/Order/updatestate",
								type : "get",
								data : {
									"orderid" : orderid,
								},
								dateType : "json",
								success : 
									function(a){
									if(a==0){
										layer.msg("哥哥，发货失败，可能仓库没货了");
										}
									else {
										layer.msg("老板，发货成功咯");
										allorder();
										}
									}
									
							});
						});
						}else if(state==2){
						layer.confirm('老板，要发货了嘛?', {icon: 1, title:'提示'}, function(index){
							$.ajax({
								url : "${pageContext.request.contextPath}/admin/Order/updatestate",
								type : "get",
								data : {
									"orderid" : orderid,
								},
								dateType : "json",
								success : 
									function(a){
									if(a==0){
										layer.msg("哥哥，发货失败，可能仓库没货了");
										}
									else {
										layer.msg("老板，发货成功咯");
										allorder();
										}
									}
									
							});
						});
						}else if(state==3){
							layer.msg('老板，都发货了，不能再发了，会亏的!', {icon: 2}); 
							}else if(state==4){
							layer.msg('老板，这不归我们管了!', {icon: 2}); 
							}
				}
		</script>
</body>
</html>