<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻管理</title>
<link rel="shortcut icon" href="favicon.ico" />
</head>
<body class="layui-layout-body hp-white-theme">
<jsp:include page="../../base.jsp"></jsp:include>
    <div class="layui-input-inline layui-col-md2">
      <input type="text" id="title" required  lay-verify="required" placeholder="请输入需要查询的新闻标题" autocomplete="off" class="layui-input">
  </div>
  <div class="layui-col-md3" style="margin-bottom: 5px;">
  <buttom class=" layui-col-md3 layui-btn layui-btn-radius layui-btn-primary" onclick="sousuo()"><span class="layui-icon" style="font-size: 20px; color: #E6E6E6;">&#xe615;</span></buttom>
  <buttom class="layui-col-md3 layui-btn layui-btn-radius" onclick="huifu()"><span class="layui-icon" style="font-size: 20px; color: #E6E6E6;">&#xe61e;</span>恢复</buttom>
  <a class="layui-col-md3 layui-btn layui-btn-radius layui-btn-normal" href="${pageContext.request.contextPath}/admin/News/toAddNews"><span class="layui-icon" style="font-size: 20px; color: #E6E6E6;">&#xe61f;</span>添加</a>
  </div>
  <table class="layui-table">
  <colgroup>
  </colgroup>
  <thead>
    <tr>
      <th>新闻编号</th>
      <th>新闻标题</th>
      <th>创建时间</th>
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
				news();
			});
			// 配置
			layui.config({
				base: '../lib/common/hpModules/' // 扩展模块目录
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
			function news(curr){
				layui.use([ 'form', 'layer', 'laypage', 'laydate' ],function() {
					var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate;
					$.ajax({
						'method' : 'get',
						'url' : '${pageContext.request.contextPath}/admin/News/selectAllNews',
						'dataType' : 'json',
						data : {
							"pageNum" : curr || 1
						},
						'success' : function(page) {
							var html_content = "";
							$.each(page.list,function(i, n) {
								html_content += "<tr>";
								html_content += "<td>"
										+ (i+1)
										+ "</td>";
								html_content += "<td>"
										+ n.newsTitle
										+ "</td>";
								html_content += "<td>"
										+ n.createTime
										+ "</td>";	
								html_content += "<td>"
										+ n.updateTime
										+ "</td>";
								html_content += "<th><a href='${pageContext.request.contextPath}/admin/News/NewsDoUpdateController?newsid="+n.pkNewsId+"' class='layui-icon'"
										+ "style='font-size: 27px; color: #1E9FFF;margin-right: 5px;'>"
										+ "&#xe642;"
										+ "</a><a href='#' class='layui-icon' onclick=del('"
										+ n.pkNewsId
										+ "') style='font-size: 27px; color: red;'>"
										+ "&#xe640;"
										+ "</a></th>";											
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
										news(pageNum);
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
						'url' : '${pageContext.request.contextPath}/admin/News/selectAllNewsMohu',
						'dataType' : 'json',
						data : {
							"pageNum" : curr || 1,
							"title" : $("#title").val()
						},
						'success' : function(page) {
							var html_content = "";
							$.each(page.list,function(i, n) {
								html_content += "<tr>";
								html_content += "<td>"
										+ (i+1)
										+ "</td>";
								html_content += "<td>"
										+ n.newsTitle
										+ "</td>";
								html_content += "<td>"
										+ n.createTime
										+ "</td>";	
								html_content += "<td>"
										+ n.updateTime
										+ "</td>";
										html_content += "<th><a href='${pageContext.request.contextPath}/admin/News/NewsDoUpdateController?newsid="+n.pkNewsId+"' class='layui-icon'"
										+ "style='font-size: 27px; color: #1E9FFF;margin-right: 5px;'>"
										+ "&#xe642;"
										+ "</a><a href='#' class='layui-icon' onclick=del('"
										+ n.pkNewsId
										+ "') style='font-size: 27px; color: red;'>"
										+ "&#xe640;"
										+ "</a></th>";										
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
										news(pageNum);
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
			function del(newsid){
				layer.confirm('亲，你要删除嘛?', {icon: 2, title:'提示'}, function(index){
					$.ajax({
						url : "${pageContext.request.contextPath}/admin/News/News_delete",
						type : "get",
						data : {
							"newsid" : newsid
						},
						dateType : "json",
						success : 
							function(a){
							if(a==0){
								layer.msg("删除失败");
								}
							else {
								layer.msg("删除成功");
								news();
								}
							}
							
					});
				});

			};
			function huifu(curr){
				layui.use([ 'form', 'layer', 'laypage', 'laydate' ],function() {
				var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate;
				$.ajax({
					'method' : 'get',
					'url' : '${pageContext.request.contextPath}/admin/News/newsSelecrtHuifu',
					'dataType' : 'json',
					 data : {
						 "pageNum" : curr || 1
					 },
					 'success' : function(page) {
						 var html_content = "";
							$.each(page.list,function(i, n) {
								html_content += "<tr>";
								html_content += "<td>"
										+ (i+1)
										+ "</td>";
								html_content += "<td>"
										+ n.newsTitle
										+ "</td>";
								html_content += "<td>"
										+ n.createTime
										+ "</td>";	
								html_content += "<td>"
										+ n.updateTime
										+ "</td>";
								html_content += "<th><buttom class='layui-btn layui-btn-radius layui-btn-primary layui-icon' onclick=tohui('"
									+ n.pkNewsId
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
			function tohui(n){
				layer.confirm('亲，你要恢复嘛?', {icon: 1, title:'提示'}, function(index){
					$.ajax({
						url : "${pageContext.request.contextPath}/admin/News/NewsDoHuifuController",
						type : "get",
						data : {
							"newsid" : n
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
</script>
</body>
</html>