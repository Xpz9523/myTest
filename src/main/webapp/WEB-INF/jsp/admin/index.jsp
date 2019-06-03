<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:set var="webpath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>今朝有酒后台管理系统</title>
        <link rel="shortcut icon" href="favicon.ico" />
	</head>

	<body class="layui-layout-body hp-white-theme">
		<jsp:include page="../base.jsp"></jsp:include>
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header">
				<div class=       "layui-logo">
					今 朝 有 酒
				</div>
				<ul class="layui-nav layui-layout-right">
					<li class="layui-nav-item">
						<a class="name" href="javascript:;"><i class="layui-icon"></i>主题<span class="layui-nav-more"></span></a>
						<dl class="layui-nav-child layui-anim layui-anim-upbit">
							<dd>
								<a skin="hp-black-theme" class="hp-theme-skin-switch"  href="javascript:;">低调黑</a>
							</dd>
							<dd >
								<a skin="hp-blue-theme" class="hp-theme-skin-switch" href="javascript:;">炫酷蓝</a>
							</dd>
							<dd>
								<a skin="hp-green-theme" class="hp-theme-skin-switch"  href="javascript:;">原谅绿</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="">退出</a>
					</li>
				</ul>
			</div>

			<div class="layui-side hp-left-menu">
				<div class="layui-side-scroll">
					<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
					<ul class="layui-nav hp-nav-none">
						<li class="layui-nav-item">
							<a href="javascript:;"  class="hp-user-name">
								<img src="${webpath}/lib/common/img/${u.userHeadimg }" class="layui-circle-img"><span class="hp-kd" style="position: relative;top:-8px;">${loginName}</span>
							</a>
							<dl class="layui-nav-child">
								<dd>
									<a href="">基本资料</a>
								</dd>
								<dd>
									<a href="">安全设置</a>
								</dd>
							</dl>
						</li>
					</ul>

					<ul class="layui-nav layui-nav-tree" lay-filter="test">
						<li class="layui-nav-item layui-nav-itemed">
						<a class="" href="javascript:;"><i class="layui-icon">&#xe612;</i> 用户</a>
							<dl class="layui-nav-child">
								<dd>
									<a class="hp-tab-add" hp-href="${webpath}/admin/user/touserpage" href="javascript:;"><i class="layui-icon">&#xe613;</i> 用户管理</a>
								</dd>
								<dd>
									<a class="hp-tab-add" hp-href="${webpath}/admin/userlevel/tolevelpage" href="javascript:;"><i class="layui-icon">&#xe658;</i> 等级管理</a>
								</dd>
							</dl>
						</li>
						
						<li class="layui-nav-item layui-nav-itemed">
							<a class="" href="javascript:;"><i class="layui-icon">&#xe649;</i> 新闻</a>
							<dl class="layui-nav-child">
								<dd>
									<a class="hp-tab-add" hp-href="${webpath}/admin/News/toNewsAdmin" href="javascript:;"><i class="layui-icon">&#xe639;</i> 新闻管理</a>
								</dd>
							</dl>
						</li>
						
						<li class="layui-nav-item layui-nav-itemed">
							<a class="" href="javascript:;"><i class="layui-icon">&#xe857;</i> 商品</a>
							<dl class="layui-nav-child">
								<dd>
									<a class="hp-tab-add" hp-href="${webpath}/admin/Good/listGood" href="javascript:;"><i class="layui-icon">&#xe857;</i> 商品管理</a>
								</dd>
								<dd>
									<a class="hp-tab-add" hp-href="${webpath}/Carousel/admin/selectGoodCarousel" href="javascript:;"><i class="layui-icon">&#xe634;</i> 轮播管理</a>
								</dd>
								<dd>
									<a class="hp-tab-add" hp-href="${webpath}/admin/Good/toHot" href="javascript:;"><i class="layui-icon">&#xe6c6;</i> 人气销量</a>
								</dd>
								<dd>
									<a class="hp-tab-add" hp-href="${webpath}/address/admin/selectAllAddressList" href="javascript:;"><i class="layui-icon">&#xe68e;</i> 收货地址</a>
								</dd>
								<dd>
									<a class="hp-tab-add" hp-href="${webpath}/admin/selectAllCart" href="javascript:;"><i class="layui-icon">&#xe698;</i> 购物车</a>
								</dd>
							</dl>
						</li>
						
						<li class="layui-nav-item">
							<a class="" href="javascript:;"><i class="layui-icon">&#xe627;</i> 订单类型</a>
							<dl class="layui-nav-child">
								<dd>
									<a class="hp-tab-add" hp-href="${webpath}/admin/Order/toOrderAdmin" href="javascript:;"><i class="layui-icon">&#xe602;</i> 订单表</a>
								</dd>
								<dd>
									<a class="hp-tab-add" hp-href="${webpath}/admin/OrderInfo/toOrderinfo" href="javascript:;"><i class="layui-icon">&#xe602;</i> 订单明细表</a>
								</dd>
							</dl>
						</li>
						
						<li class="layui-nav-item">
							<a class="" href="javascript:;"><i class="layui-icon">&#xe627;</i> 规格类型</a>
							<dl class="layui-nav-child">
								<dd>
									<a class="hp-tab-add" hp-href="${wbpath }/admin/Big/listsize" href="javascript:;"><i class="layui-icon">&#xe602;</i> 规格种类</a>
								</dd>
								<dd>
									<a class="hp-tab-add" hp-href="${wbpath }/admin/samll/listsize" href="javascript:;"><i class="layui-icon">&#xe602;</i> 规格明细</a>
								</dd>
							</dl>
						</li>
						
						<li class="layui-nav-item">
							<a class="" href="javascript:;"><i class="layui-icon">&#xe627;</i> 商品类型</a>
							<dl class="layui-nav-child">
								<dd>
									<a class="hp-tab-add" hp-href="${wbpath }/admin/Big/listGoodTypes" href="javascript:;"><i class="layui-icon">&#xe602;</i> 大类型</a>
								</dd>
								<dd>
									<a class="hp-tab-add" hp-href="${wbpath }/admin/Small/listGoodTypes" href="javascript:;"><i class="layui-icon">&#xe602;</i> 小类型</a>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>

			<div class="layui-body">
				<!-- 内容主体区域 -->
					<div class="layui-tab hp-tab " style="" lay-filter="hp-tab-filter" lay-allowclose="true">
						<ul class="layui-tab-title" style="">
							<li class="layui-this" lay-id="0">首页</li>
						</ul>
						<div class="layui-tab-content">
							<div class="layui-tab-item layui-show">
                                <!--时间线 -->
								<div>
									<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
										<legend>今朝有酒、 今生前世</legend>
									</fieldset>
									<ul class="layui-timeline">
										<li class="layui-timeline-item">
											 <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
											<div class="layui-timeline-content layui-text">
												<div class="layui-timeline-title" style="color: red;">
													项目开发环境
												</div> 
											</div>
										</li>
										<li class="layui-timeline-item">
											 <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
											<div class="layui-timeline-content layui-text">
												<div class="layui-timeline-title" style="color: red;">
													软件环境:
												</div>
											     <ul>
													<li>
														1.操作系统:64位Windows7旗舰版
													</li>
													<li>
														2.开发工具:eclipse
													</li>
													<li>
														3.数据库系统:MySql
													</li>
												</ul>
											</div>
										</li>
										<li class="layui-timeline-item">
											<i class="layui-icon layui-timeline-axis"></i>
											<div class="layui-timeline-content layui-text">
												<div class="layui-timeline-title" style="color: red;">
													系统运行:
												</div>
											</div>
										</li>										
										<li class="layui-timeline-item">
											<i class="layui-icon layui-timeline-axis"></i>
											<div class="layui-timeline-content layui-text">
												<div class="layui-timeline-title" style="color: red;">本系统为SSM+SpringBoot集成开发，运行步骤如下。</div>
												<ul>
													<li>
														1.运行windows操作系统
													</li>
													<li>
														2.由于本系统是由JAVA编写所以需要安装 JDK1.8JAVA虚拟机，安装方法为:运行JDK1.8安装文件，选择路径进行安装
													</li>
													<li>
														3.运行tomcat安装文件，选择安装路径，选择第二步已经安装好的JRE路径，进行tomcat的安装
													</li>
													<li>
														4.部署程序至tomcat
													</li>
													<li>
														5.安装MySql数据库，导入表结构的SQL脚本，启动数据库实例服务
													</li>
													<li>
														6.启动tomcat
													</li>
													<li>
														7.打开浏览器并且输入如下网址<br>
														http://localhost:8080/Wine/manage/tologin
													</li>
													<li>
													系统也需要一些日常的管理和服务器的维护等
													</li>
													</ul>
											</div>
										</li>
										<li class="layui-timeline-item">
											<i class="layui-icon layui-timeline-axis"></i>
											<div class="layui-timeline-content layui-text">
												<div class="layui-timeline-title" style="color: red;">感谢贵公司使用今朝有酒后台管理系统</div>
											</div>
										</li>
										<li class="layui-timeline-item">
											<i class="layui-icon layui-timeline-axis"></i>
											<div class="layui-timeline-content layui-text">
												<div class="layui-timeline-title" style="color: red;">使用过程若出现无法控制的问题或有效建议请及时联系"今朝有酒工作室" </div>
											</div>
										</li>
									
									</ul>
							</div>
						</div>
					</div>

				</div>
			</div>

			<div class="layui-footer">
				<!-- 底部固定区域 -->
				© hp-layui-version-1.0
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
		<script>
			// 配置
			layui.config({
				base: '${webpath}/lib/common/hpModules/' // 扩展模块目录
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
		</script>
	</body>

</html>