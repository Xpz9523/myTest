<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../../base.jsp"></jsp:include>
</head>
<body>
	<%-- <a class="layui-btn btn-add btn-default" id="addUser">添加</a> 
<a  href="${pageContext.request.contextPath }/toCateList" class="layui-btn btn-add btn-default" id="btn-refresh"></a>	 --%>

	<!-- <button class="layui-btn"  id="addUser">添加</button> -->

	<!-- 工具集 -->
	<div class="my-btn-box">
		<span class="fl"> <!-- <a
			class="layui-btn layui-btn-danger radius btn-delect"
			id="btn-delete-all">批量删除</a> --> <a class="layui-btn btn-add btn-default"
			id="btn-add">添加</a> <a class="layui-btn btn-add btn-default" href="${webpath}/Carousel/admin/selectGoodCarousel"
			id="btn-refresh"><i class="layui-icon">&#x1002;</i></a>
		</span> <span class="fr">

		<!-- 	<div class="layui-input-inline">
				<input type="text" autocomplete="off" placeholder="请输入搜索条件"
					class="layui-input">
			</div>
			<button class="layui-btn mgl-20">查询</button> -->
		</span>
	</div>

	<div class="hp-table-data-container" id="container">
		<table class="layui-table hp-table" id="dataTable">
			<thead>
				<tr>
					<th>序号</th>
					<th>图片描述</th>
					<th>图片</th>
					<!-- <th>图片所属商品</th> -->
					<th>创建时间</th>
					<th>修改时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody class="container">

			</tbody>
		</table>
	</div>
	<div id="hp-layui-page"></div>

	<form class="layui-form" action=""
		style="display: none; margin-top: 10px;" id="addForm">



		<div class="layui-form-item layui-col-md-offset2 layui-col-md9">
			<div class="layui-row">
				<div class="layui-input-block">
					<img src="${webpath}/lib/common/img/carouselimg/1.jpg"
						style="border-radius: 90px; width: 200px; height: 200px; border: 1px solid lightgreen; text-align: center;"
						id="demo2">
						<input type="hidden" name="carouselImg" value="/lib/common/carouselimg/1.jpg">
				</div>
			</div>
		</div>

		<input type="hidden" id="xid">
			<!-- layui-col-md-offset1代表左邊偏移1 layui-col-md7代表內容框總共占7格（from 一共12格） -->
	<div class="layui-form-item layui-col-md-offset1 layui-col-md9">
			<label class="layui-form-label">商品列表</label>
			<div class="layui-input-block">
				<select name="fkGoodId" id="select1">
					<c:forEach items="${goodList }" var="goodList">
					<option value="${goodList.pkGoodId}">${goodList.goodName}</option>
					</c:forEach>
					
				</select>
			</div>
		</div>
		 <div class="layui-form-item layui-form-text layui-col-md-offset1 layui-col-md9">
		 <label class="layui-form-label">请输入内容</label>
        <div class="layui-input-block">
            <textarea id="LAY_demo_editor" placeholder="请输入内容" name="carouselRemark" class="layui-textarea"></textarea>
        </div>
        
    </div>

		<div class="layui-form-item layui-col-md12">
			<div class="layui-row">
				<div class="layui-col-md-offset3 layui-col-md3">
					<!-- <button class="layui-btn" id="saveBtn" onclick='save()'>确认</button> -->
					<button class="layui-btn" lay-submit lay-filter="save">立即提交</button>
				</div>
				<div class="layui-col-md-offset2 layui-col-md3">
					<button class="layui-btn layui-btn-danger" onclick='reset()'>取消</button>
				</div>
			</div>
		</div>
	</form>
	
	
	<!-- 修改表单 -->
	<form class="layui-form" action=""
		style="display: none; margin-top: 10px;" id="updateForm">
		<div class="layui-form-item layui-col-md-offset1 layui-col-md6">
			<div class="layui-row">
				<div class="layui-input-block">
					<img src=""
						style="border-radius: 90px; width: 200px; height: 200px; border: 1px solid lightgreen; text-align: center;"
						id="updateImg">
				</div>
			</div>
		</div>

		<input type="hidden" id="cid">
		<div class="layui-form-item layui-col-md-offset1 layui-col-md9">
			<label class="layui-form-label">商品列表</label>
			<div class="layui-input-block">
				<select name="foodType.foodTypeId" id="select2">
					<c:forEach items="${goodList }" var="goodList">
					<option value="${goodList.pkGoodId}">${goodList.goodName}</option>
					</c:forEach>
					
				</select>
			</div>
		</div>
		 <div class="layui-form-item layui-form-text layui-col-md-offset1 layui-col-md9">
		 <label class="layui-form-label">请输入内容</label>
        <div class="layui-input-block">
            <textarea id="update_demo_editor" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
        
    </div>



		<div class="layui-form-item layui-col-md-offset1 layui-col-md9">
			<div class="layui-row">
				<div class="layui-col-md-offset4 layui-col-md2">
					<button class="layui-btn  " id="updateBtn" onclick='UpdateUser()'>确认</button>
				</div>
				<div class="layui-col-md-offset2 layui-col-md3">
					<button class="layui-btn layui-btn-danger " onclick='reset()'>取消</button>
				</div>
			</div>
		</div>
	</form>
	
</body>
<script type="text/javascript">
	// 定义用户分页显示
	function listUsers(curr) {
		layui
				.use(
						[ 'form', 'layer', 'laypage', 'laydate' ],
						function() {
							var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate;
							$
									.ajax({
										'method' : 'get',
										'url' : ' ${pageContext.request.contextPath}/Carousel/admin/selectCarouselAll',
										'dataType' : 'json',
										data : {
											"pageNum" : curr || 1
										},
										'success' : function(page) {
											var html_content = "";
											$
													.each(
															page.list,
															function(i,
																	Carousel) {html_content += "<tr>";
																	html_content += "<td>"+ (i + 1)+ "</td>";
																html_content += "<td>"+ Carousel.carouselRemark+ "</td>";
																html_content += "<td > <a href="+Carousel.carouselImg+"><img  style='width: 50px;height: 50px' src="+Carousel.carouselImg+"  class='layui-circle' /> </a> </td>";
																/*   html_content += "<td>"+ Carousel.goodName+ "</td>";   */
																html_content += "<td>"+ Carousel.createTime+ "</td>";
																html_content += "<td>"+ Carousel.updateTime+ "</td>";
																/* user.foodType.pkCarouselId */
																/* html_content += "<td><a href='${pageContext.request.contextPath}/updateUser?did="+user.pkUserId+" ' class='layui-btn layui-btn-norma'>编辑</a><a href='#' class='layui-btn layui-btn-warm'  onclick='del("+ user.pkUserId+ ")' >删除</a></td>"; */
																html_content += "<td><a href='# ' class='layui-btn layui-btn-norma'   onclick='applyUpdate("+ JSON.stringify(Carousel)+ ")'>编辑</a><a href='#' class='layui-btn layui-btn-warm'  onclick='del("+ JSON.stringify(Carousel)+ ")' >删除</a></td>";
																html_content += "</tr>";
															});
											$("#dataTable tbody").html(
													html_content);

											// 处理分页组件
											laypage.render({
												elem : 'hp-layui-page',
												count : page.total,//总记录数
												limit : page.pageSize,
												curr : page.pageNum,
												jump : function(obj, first) {
													if (!first) {
														var pageNo = obj.curr;//点击的页码
														// 点击分页空间 执行方法
														listUsers(pageNo);
													}
												}
											});

										},
										'error' : function() {
											layer.msg('服务器异常');
										}
									});

						});
	}

	/* 删除 */
	function del(Carousel) {
		var uid = Carousel.pkCarouselId;
		if (window.confirm('您确定要删除吗？')) {
			$.ajax({
						url : "${pageContext.request.contextPath}/Carousel/admin/delCarousel",
						type : "post",
						data : {
							"pkCarouselId" : uid
						},
						dataType : "json",
						success : function(data) {
							if (data == 1) {
								layer.msg("删除成功");// 提示成功操作消息
								listUsers();//成功后回调函数
							} else if (data == 0) {
								alert("删除失败")
							}
						}
					});
		} else {
			return false;
		}

	};

	//添加弹出层
	$("#btn-add").click(function() {
		layui.use([ 'form', 'layer', 'laypage', 'laydate' ],function() {
											var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate;
											layer.open({
												title : '<b>添加美食</b>',
												skin : 'layui-layer-molv',
												type : 1,
												content : $('#addForm'),
												shadeClose : true, //点击遮罩关闭层 

												anim : 4,
												area : [ '700px', '700px' ]
											});
										});
					});

	/* 添加时上传轮播图 */
	 layui.use('upload', function(){
		  var $ = layui.jquery
		  ,upload = layui.upload;
		  //普通图片上传
		  var uploadInst = upload.render({
		    elem: '#demo2'
		    ,url: '${pageContext.request.contextPath}/Carousel/admin/upload'
		    ,before: function(obj){
		      //预读本地文件示例，不支持ie8
		      obj.preview(function(index, file, result){
		        $('#demo2').attr('src', result); //图片链接（base64）
		        $('#demo2').append("input type='hidden' name='carouselImgs' value='"+result+"' ");
		      });
		    }
		    ,done: function(res){
		      //如果上传失败
		      if(res.code > 0){
		        return layer.msg('上传失败');
		      }
		      //上传成功
		      if(res.code = 0){
			        return layer.msg('上传成功');
			      }
		    }
		    ,error: function(){
		      //演示失败状态，并实现重传
		      var demoText = $('#demoText');
		      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
		      demoText.find('.demo-reload').on('click', function(){
		        uploadInst.upload();
		      });
		    }
		  });
	});
	 /* 添加 **/
/* 	  function save() {
		 //var checkValue=$("#deptno").val();
		 var checkValue=$("#select1  option:selected").val();
		 var text = $("#LAY_demo_editor").val();
	     var addForm = $("#addForm").serialize();
			$.ajax({
				url : "${pageContext.request.contextPath}/Carousel/admin/postCarousel",
				type : "post",
				data : addForm,
				dataType : "json",
				success : function(data) {
				
					if (data == 1) {
						layer.msg("添加成功");
						listUsers();//成功后回调函数
					} else if (data== 2) {
						alert("用户名重复")
						listUsers();//成功后回调函数
					}
				}
			});
	

	}; */
	$(function(){
		layui.use('form', function() {
		var $ = layui.jquery,form = layui.form;
		form.on('submit(save)', function(data){
			 /*  console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
			  console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
			  console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value} */
				$.ajax({
					url : "${pageContext.request.contextPath}/Carousel/admin/postCarousel",
					type : "post",
					data : data.field,
					dataType : "json",
					success : function(data) {
						if (data == 1) {
							layer.msg("添加成功");
							listUsers();//成功后回调函数
						} else if (data== 2) {
							alert("添加失败")
							listUsers();//成功后回调函数
						}
					}
				});
			 // return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
			
	});
	});

	
	//弹出层修改
	function applyUpdate(Carousel){
		
		  document.getElementById("cid").value=Carousel.pkCarouselId; 
		 document.getElementById("updateImg").src=Carousel.carouselImg; //将图片回传到弹出层
		 
		 document.getElementById("update_demo_editor").value=Carousel.carouselRemark; 
		layui.use([ 'form', 'layer', 'laypage', 'laydate' ],
				function() {
					var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate;
		layer.open({
			title : '<b>修改</b>',
			skin : 'layui-layer-molv',
			type : 1,
			content : $('#updateForm'),
			shadeClose : true, //点击遮罩关闭层 

			anim : 4,
			area : [ '750px', '750px' ]
		});
		});

	} 
	
	//弹出层修改上传图片
	 layui.use('upload', function(){
		  var $ = layui.jquery
		  ,upload = layui.upload;
		  //普通图片上传
		  var uploadInst = upload.render({
		    elem: '#updateImg'
		    ,url: "${pageContext.request.contextPath}/Carousel/admin/upload"
		    ,before: function(obj){
		      //预读本地文件示例，不支持ie8
		      obj.preview(function(index, file, result){
		        $('#updateImg').attr('src', result); //图片链接（base64）
		      });
		    }
		    ,done: function(res){
		      //如果上传失败
		      if(res.code > 0){
		        return layer.msg('上传失败');
		      }
		      //上传成功
		      if(res.code = 0){
			        return layer.msg('上传成功');
			      }
		    }
		    ,error: function(){
		      //演示失败状态，并实现重传
		      var demoText = $('#demoText');
		      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
		      demoText.find('.demo-reload').on('click', function(){
		        uploadInst.upload();
		      });
		    }
		  });
	});
	
	
	/* 修改  */
 	function UpdateUser() {
	 	var fid = $("#cid").val();
	 	 var checkValue=$("#select2  option:selected").val();
	 	 var text = $("#update_demo_editor").val(); 
	 	
 		 
			$.ajax({
				url : "${pageContext.request.contextPath}/Carousel/admin/updateCarousel",
				type : "post",
				data : {
					"pkCarouselId":fid,
					"carouselRemark":checkValue,
					"carouselRemark":text
					
				},
				dataType : "json",
				success : function(data) {
					if (data == 1) {
						alert("修改成功");
						listUsers();//成功后回调函数
					} else if (data== 0) {
						alert("修改失败");
						listUsers();//成功后回调函数
					}
				}
			});
	

	};
	
	// 页面初始化调用
	listUsers();
</script>
</html>