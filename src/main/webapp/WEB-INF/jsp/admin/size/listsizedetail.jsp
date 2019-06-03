<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <c:set var="webPath"  value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>厚溥.IT新闻后台管理系统-用户管理信息模块</title>
<c:set var="webPath" value="${pageContext.request.contextPath}"></c:set>
  <jsp:include page="../../base.jsp"></jsp:include>
</head>
<body>
	<div class="hp-container">
		<!-- 菜单   查询  -->
		<blockquote class="layui-elem-quote" style="margin-top: 5px;">
			<div class="hp-form-item">
				
						<div class="layui-inline">
						<button class="layui-btn" id="addUser" >
							<i class="layui-icon"></i> 添加信息
						</button>
					</div>
					
			</div>
		</blockquote>
		<!-- 表格  -->
		<div class="hp-table-data-container">
			<table class="layui-table hp-table" id="dataTable">
				<thead>
					<tr>
						<th>序号</th>
						<th>类型名称</th>
						<th>类型解释</th>
						<th>类型创建时间</th>
						<th>类型修改时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
	
			
	<form class="layui-form" action="" style="display: none;margin-top: 10px;" id="addForm">
				
			<div class="layui-form-item layui-col-md10">
				<div class="layui-row">
					<label class="layui-form-label">规格名称</label>
					<div class="layui-input-block">
						<input type="text" name="sizeName" lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="sizeDetailName">
					</div>
				</div>
			</div>

			<div class="layui-form-item layui-form-text">
    <label class="layui-form-label">规格描述</label>
    <div class="layui-input-block">
      <textarea placeholder="" name="sizeRemark" class="layui-textarea"  id="sizeDetailRemark"></textarea>
    </div>
  </div>
			
			
  	
  
			
	<div class="layui-form-item  layui-col-md10">
    <label class="layui-form-label">规格类型框</label>
    <div class="layui-input-block"  id="dept">
   	
    </div>
	</div>
	<div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1" id="saveBtn">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
		</form>
			
			
			<!-- 分页位标  -->
			<div id="hp-laypage-area">
				<div class="layui-inline">
				</div>
				<div class="layui-inline hp-page" id="hp-layui-page"></div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">	
	

	$(function() {
 		$("#addUser").click(function() {
 			$("#addForm")[0].reset();
 			layui.use(['form','layer'], function(){
 				var $ = layui.jquery,form = layui.form, layer=layui.layer;
 			layer.open({
 				title: '<b>添加商品大类型</b>',
 				skin: 'layui-layer-molv',
 				type: 1,
 				content: $('#addForm'),
 				shadeClose: true //点击遮罩关闭层 
 					,
 				anim: 4,
 				area: ['600px', '450px']
 			});
 		});
 	});
	});
	
	
	layui.use([ 'form', 'layer', 'laypage', 'laydate' ],
			function() {
				var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate;
	// 定义用户分页显示
	function listUsers(curr) {
		
					
					
					
					$.ajax({
					'method' : 'get',
					'url' : ' ${pageContext.request.contextPath}/admin/Big/selectAllSizedetail',
					'dataType' : 'json',
					data : {
						"pageNum" : curr || 1
					},
					'success' : function(page) {
						var html_content = "";
						$.each(page.list,function(i,SizeDetail) {
											html_content += "<tr>";
											html_content += "<td>"+ (i + 1)+ "</td>";
											html_content += "<td>"+ SizeDetail.sizeDetailName+ "</td>";
											/*html_content += "<td>"+ document.write(GoodTypeBig.typeBigRemark.substring())+ "</td>";*/
											html_content += "<td>"+ SizeDetail.sizeDetailRemark+ "</td>";
											html_content += "<td>"+SizeDetail.createTime + "</td>";
											html_content += "<td>"+ SizeDetail.updateTime+ "</td>";
											/* html_content += "<td><a href='${pageContext.request.contextPath}/updateUser?did="+user.pkUserId+" ' class='layui-btn layui-btn-norma'>编辑</a><a href='#' class='layui-btn layui-btn-warm'  onclick='del("+ user.pkUserId+ ")' >删除</a></td>"; */
											html_content += "<td><a href='#' class='layui-btn layui-btn-warm'  onclick='deleteBigGoodType("+SizeDetail.pkSizeDetailId+")' >删除</a></td>";
											html_content += "</tr>";
											});
											$("#dataTable tbody").html(html_content);

						// 处理分页组件
						laypage.render({
									elem : 'hp-layui-page',
									count : page.total,//总记录数
									limit : page.pageSize,
									curr : page.pageNum,
									jump : function(
											obj, first) {
										if (!first) {
											var pageNo = obj.curr;//点击的页码
											// 点击分页空间 执行方法
											listUsers(pageNo);
													}
														}
															});
					
					},'error' : function() {
						layer.msg('服务器异常');
					}
				});

		
		}
	//得到所有规格
	function listSize(){
		layui.use('form', function(){
			  var form = layui.form;
 		$.ajax({
 		type:'post',
 		url:'${webPath}/admin/Deteail/getAllSize',
 		dataType:'json',	
 		success: function(data){
 			var content="";
 			$.each(data.Size,function(i,Size){	 				
 				content+="<input type='radio' name='fkSizeId' value="+Size.pkSizeId+" title="+Size.sizeName+" />";
 			})
 			$("#dept").html(content);
 		},
 		error:function(){
 			alert('服务器异常');
 		}
 		});
 		
 	});
	}
	
	//添加商品大类型
	function addBigGoodTyep(){
		
		$("#saveBtn").click(function(){
						
				 		var sizeDetailName = $("#sizeDetailName").val();
						var sizeDetailRemark = $("#sizeDetailRemark").val();
						var fkSizeId=$("input[name='fkSizeId']:checked").val();
						$.ajax({
							'url' :'${pageContext.request.contextPath}/admin/Deteail/AddSizeDeteail',
							'type':'post',
							'dataType':'json',
							data:{'sizeDetailName' :sizeDetailName,'sizeDetailRemark':sizeDetailRemark,'fkSizeId':fkSizeId},
							success: function(data){
								if(data.status==200){
									layer.msg(data.message);
									$(function(){
										var timer;
										clearTimeout(timer);
										setTimeout(doajax(), 1000);//过1s执行方法体。
										listUsers()
									});
								}else if(data.status==500){
									layer.msg(data.message);
								}
							}
							
						});
						
						
			
					
		});


	}
	addBigGoodTyep();
	listSize();
	listUsers();
	});
		//逻辑删除商品大类型
		function deleteBigGoodType(id){
			layui.use([ 'form', 'layer', 'laypage', 'laydate' ],
					function() {
						var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate;
					if(window.confirm('你确定删除吗？')){
					$.ajax({
						url:'${webPath}/admin/Big/deleteSizeDetail',
						type:'post',
						datatype:'json',
						data:{
							"bid":id,
							},
						success: function(data){
							if(data.status==200){
								layer.msg(data.message);
								setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
									window.location.reload();//页面刷新
								},500);
							}else if(data.status==500){
								layer.msg(data.message);
							};
						}
						
					});
					
				}else{
		 			
		 			return false;
		 		}
			
			});
			
			
		}
			
		
					
	// 页面初始化调用
	
	</script>
</body>
</html>