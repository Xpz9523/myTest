<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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

<script type="text/javascript">
	//图片格式化
	function imgFmt(d) {
		return '<img style="width:40px;height:40px;border-radius:90px;" src="'+'${webpath}/'+d.userHeadimg+'" />'
	}
	
	//等级格式化
	function levelFmt(d){
		if(d.fkUserLevelId==1){
			return "英勇黄铜";
		}else if(d.fkUserLevelId==2){
			return "不屈白银";
		}else if(d.fkUserLevelId==3){
			return "荣耀黄金";
		}else if(d.fkUserLevelId==4){
			return "华贵铂金";
		}else if(d.fkUserLevelId==5){
			return "璀璨钻石";
		}else{
			return "";
		}
	}
	
	//性别格式化
	function sexFmt(d){
		if(d.userSex==1){
			return "男";
		}else{
			return "女";
		}
	}

	function addUser() {
		layui.use('layer', function() {
			var $ = layui.jquery, layer = layui.layer;

			layer.open({
				type : 1,
				title : '新建用户',
				skin : 'layui-layer-molv',
				area : [ '780px', '500px' ],
				content : $("#add")
			//这里content是一个普通的String
			});
		});
	};
	
	function confirmAdd(){
		var src = $("#headImg")[0].src;
		var userHeadimg = src.substring(22);
		var loginName = $("#loginName").val();
		var userName = $("#userName").val();
		var userAge = $("#userAge").val();
		var userSex = $("input[name='userSex']:checked").val();
		var userPhone = $("#userPhone").val();
		var userEmail = $("#userEmail").val();
		var userBirthday = $("#userBirthday").val();
		$.ajax({
			'method':'post',
			'url':'${webpath}/admin/user/confirmAdd',
			'dataType':'json',
			data:{"userHeadimg":userHeadimg,"loginName":loginName,"userName":userName,"userAge":userAge,"userSex":userSex,"userPhone":userPhone,"userEmail":userEmail,"userBirthday":userBirthday},
			'success':function(map){
				layer.msg("新建成功");
			},
			'error':function(){
				layer.msg("新建失败");
			 }
			});
	}
	
	function confirmEdit(){
		var src = $("#Img")[0].src;
		var pkUserId = $("#uid").val();
		var userHeadimg = src.substring(22);
		var loginName = $("#login").val();
		var userName = $("#user").val();
		var userAge = $("#Age").val();
		var userSex = $("input[name='Sex']:checked").val();
		var userPhone = $("#Phone").val();
		var userEmail = $("#Email").val();
		var userBirthday = $("#Birthday").val();
		$.ajax({
			'method':'post',
			'url':'${webpath}/admin/user/confirmEdit',
			'dataType':'json',
			data:{"pkUserId":pkUserId,"userHeadimg":userHeadimg,"loginName":loginName,"userName":userName,"userAge":userAge,"userSex":userSex,"userPhone":userPhone,"userEmail":userEmail,"userBirthday":userBirthday},
			'success':function(map){
				layer.msg("修改成功");
			},
			'error':function(){
				layer.msg("修改失败");
			 }
			});
	}
</script>
</head>

<body>
	<!-- 新建弹窗 -->
	<form class="layui-form" action="" style="display: none;" id="add">
		<div class="layui-col-md-offset5 layui-col-md4">
			<img src="${webpath}/lib/common/img/login/03.jpg" id="headImg" alt="点击选择头像"
				style="border-radius: 90px; width: 100px; height: 100px; margin-top: 20px; margin-bottom: 20px;"/>
		</div>

		<div class="layui-form-item layui-col-md-offset1 layui-col-md10">
			<div class="layui-inline">
				<label class="layui-form-label">昵称</label>
				<div class="layui-input-inline">
					<input type="text" name="loginName" id="loginName"
						 class="layui-input" style="border-top:none;border-left:none;border-right:none;">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-inline">
					<input type="text" name="userName" id="userName"
						class="layui-input" style="border-top:none;border-left:none;border-right:none;">
				</div>
			</div>
		</div>

		<div class="layui-form-item layui-col-md-offset1 layui-col-md10">
			<div class="layui-inline">
				<label class="layui-form-label">年龄</label>
				<div class="layui-input-inline">
					<input type="text" name="userAge" id="userAge"
						class="layui-input" style="border-top:none;border-left:none;border-right:none;">
				</div>
			</div>
			
			<div class="layui-inline">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-inline">
					<input type="radio" name="userSex" value="1" title="男" checked="">
					<input type="radio" name="userSex" value="0" title="女">
				</div>
			</div>
		</div>

		<div class="layui-form-item layui-col-md-offset1 layui-col-md10">
			<div class="layui-inline">
				<label class="layui-form-label">电话</label>
				<div class="layui-input-inline">
					<input type="tel" name="userPhone" id="userPhone"
						class="layui-input" style="border-top:none;border-left:none;border-right:none;">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">邮箱</label>
				<div class="layui-input-inline">
					<input type="text" name="userEmail" id="userEmail"
						class="layui-input" style="border-top:none;border-left:none;border-right:none;">
				</div>
			</div>
		</div>
		
		<div class="layui-form-item layui-col-md-offset1 layui-col-md10">
			<div class="layui-inline">
				<label class="layui-form-label">出生日期</label>
				<div class="layui-input-inline">
					<input type="text" name="userBirthday" id="userBirthday"
						 class="layui-input" style="border-top:none;border-left:none;border-right:none;">
				</div>
			</div>
		</div>
		<div class="layui-form-item layui-col-md-offset3 layui-col-md6">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo" onclick="confirmAdd()">确认添加</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	
	<!-- 编辑弹窗 -->
	<form class="layui-form" action="" style="display: none;" id="edit">
		<input type="hidden" id="uid">
		<div class="layui-col-md-offset5 layui-col-md4">
			<img src="${webpath}/lib/common/img/login/03.jpg" id="Img" alt="点击选择头像"
				style="border-radius: 90px; width: 100px; height: 100px; margin-top: 20px; margin-bottom: 20px;"/>
		</div>

		<div class="layui-form-item layui-col-md-offset1 layui-col-md10">
			<div class="layui-inline">
				<label class="layui-form-label">昵称</label>
				<div class="layui-input-inline">
					<input type="text" name="loginName" id="login"
						 class="layui-input" style="border-top:none;border-left:none;border-right:none;">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-inline">
					<input type="text" name="userName" id="user"
						class="layui-input" style="border-top:none;border-left:none;border-right:none;">
				</div>
			</div>
		</div>

		<div class="layui-form-item layui-col-md-offset1 layui-col-md10">
			<div class="layui-inline">
				<label class="layui-form-label">年龄</label>
				<div class="layui-input-inline">
					<input type="text" name="userAge" id="Age"
						class="layui-input" style="border-top:none;border-left:none;border-right:none;">
				</div>
			</div>
			
			<div class="layui-inline">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-inline">
					<input type="radio" name="Sex" value="1" title="男" checked="">
					<input type="radio" name="Sex" value="0" title="女">
				</div>
			</div>
		</div>

		<div class="layui-form-item layui-col-md-offset1 layui-col-md10">
			<div class="layui-inline">
				<label class="layui-form-label">电话</label>
				<div class="layui-input-inline">
					<input type="tel" name="userPhone" id="Phone"
						class="layui-input" style="border-top:none;border-left:none;border-right:none;">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">邮箱</label>
				<div class="layui-input-inline">
					<input type="text" name="userEmail" id="Email"
						class="layui-input" style="border-top:none;border-left:none;border-right:none;">
				</div>
			</div>
		</div>
		
		<div class="layui-form-item layui-col-md-offset1 layui-col-md10">
			<div class="layui-inline">
				<label class="layui-form-label">出生日期</label>
				<div class="layui-input-inline">
					<input type="text" name="userBirthday" id="Birthday"
						 class="layui-input" style="border-top:none;border-left:none;border-right:none;">
				</div>
			</div>
		</div>
		<div class="layui-form-item layui-col-md-offset3 layui-col-md6">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo" onclick="confirmEdit()">确认修改</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>

	<jsp:include page="../../base.jsp"></jsp:include>

	<style>
	.layui-table-cell {
		height: 40px;
		line-height: 40px;
	}
	</style>

	<div class="layui-btn-group demoTable">
		<button id="addBtn" class="layui-btn layui-btn-normal"
			onclick="addUser()">
			<i class="layui-icon"></i>添加
		</button>
		<button class="layui-btn layui-btn-danger">
			<i class="layui-icon"></i>删除
		</button>
		<button id="refrsh" class="layui-btn hp-btn-green">
			<i class="layui-icon">ဂ</i>刷新
		</button>
	</div>

	<table class="layui-table"
		lay-data="{height:'full-50',cellMinWidth: 80, url:'${webpath}/admin/user/listUser', page:true, request: {
	    	  	pageName: 'pageNum',limitName: 'pageSize'},id:'demo',showLoad:true}"
		lay-filter="demo">
		<thead>
			<tr>
				<th lay-data="{type:'checkbox'}"></th>
				<th lay-data="{field:'userHeadimg',templet:imgFmt,style:'height:40px'}">头像</th>
				<th lay-data="{field:'loginName'}">登录名</th>
				<th lay-data="{field:'userName'}">用户名</th>
				<th lay-data="{field:'fkUserLevelId',templet:levelFmt}">用户等级</th>
				<th lay-data="{field:'userPhone'}">电话</th>
				<th lay-data="{field:'userEmail'}">邮箱</th>
				<th lay-data="{field:'userBirthday'}">出生日期</th>
				<th lay-data="{field:'userSex',sort: true,templet:sexFmt}">性别</th>
				<th lay-data="{field:'userAge'}">年龄</th>
				<th lay-data="{field:'createTime'}">创建时间</th>
				<th lay-data="{field:'updateTime'}">修改时间</th>
				<th lay-data="{width:178, align:'center', toolbar: '#barDemo1'}">操作</th>
			</tr>
		</thead>
	</table>
	<!-- <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a> -->
	<script type="text/html" id="barDemo1">
  
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

</body>

<script>
	// 配置
	layui.config({
		base : '${webpath}/lib/common/hpModules/' // 扩展模块目录
	}).extend({ // 模块别名 
		hpWindow : 'hpWindow/hpWindow'
	});
	layui.use([ 'form', 'table', 'hpWindow' ], function() {
		var table = layui.table;
		var $ = layui.$;
		var form = layui.form;
		var hpWindow = layui.hpWindow;

		hpWindow.open("#addBtn", "html/add.html", {
			title : '添加',
			area : [ '500px', '350px' ],
			btn : [ '确认', '取消' ],
			anim : 1,
			success : function(layero, index) {
				form.render();
				form.on('submit(save)', function(data) {
					// ajax
					$.get("../json/demo6.json", {}, function(json) {
						if (json && json.code == 200) {
							console.log('yes');
							layer.close(index);
						} else {
							layer.msg('数据有误');
						}
					})
					return false;
				});
			},
			yes : function(index, layero) {
				layero.find('.icon-save').click();
				//layer.close(index);
			},
			btn2 : function(index, layero) {
				layer.msg('取消 按钮 被点击')
				layer.close(index);
			},
			cancel : function(index, layero) {
				layer.msg('x 按钮 被点击')
			}

		});

		// 表格刷新
		$("#refrsh").click(function() {
			//执行重载
			table.reload('demo', {
				page : {
					curr : 1
				//重新从第 1 页开始
				},
				where : {
					// 参数
					kd : 'kd'
				}
			});

		})

		//监听表格复选框选择
		table.on('checkbox(demo)', function(obj) {
			console.log(obj)
		});

		//监听单元格编辑
		table.on('edit(demo)', function(obj) {
			var value = obj.value //得到修改后的值
			, data = obj.data //得到所在行所有键值
			, field = obj.field; //得到字段

		});

		//监听工具条
		table.on('tool(demo)', function(obj) {
			var data = obj.data;
			if (obj.event === 'del') {
				layer.confirm('真的删除行么', function(index) {
					 $.ajax({
			  				'method':'get',
			  				'url':'${webpath}/admin/user/confirmDel',
			  				'dataType':'json',
			  				data:{"pkUserId":data.pkUserId},
			  				'success':function(map){
			  					layer.msg("删除成功");
			  					//刷新表格
			  					table.reload('demo', {
			  				        page: {
			  				          curr: 1 //重新从第 1 页开始
			  				        }
			  				        ,where: {
			  				          // 参数
			  				          kd:'kd'
			  				        }
			  				      });
			  					
			  				},
			  				'error':function(){
			  					layer.msg("删除失败");
			  				 }
			  				});
					layer.close(index);
				});
			} else if (obj.event === 'edit') {
				/* layer.prompt({
					formType : 2,
					value : data.username
				}, function(value, index) {
					obj.update({
						username : value
					});
					layer.close(index);
				}); */
				
				layui.use('layer', function(){
					 var $ = layui.jquery, layer = layui.layer;
					 
					 layer.open({
						  type: 1, 
						  title:'编辑用户',
						  skin: 'layui-layer-molv',
						  area: ['780px', '500px'],
						  content: $("#edit") //这里content是一个普通的String
						});
				});
				
				 $.ajax({
						'method':'post',
						'url':'${webpath}/admin/user/Edit',
						'dataType':'json',
						data:{"pkUserId":data.pkUserId},
						'success':function(map){
							//回显用户信息
							$("#Img").attr("src","${webpath}/"+map.UserHeadimg);
							$("#login").val(map.LoginName);
							$("#user").val(map.UserName);
							$("#Age").val(map.UserAge);
							$("input[name='Sex']:checked").val(map.UserSex);
							$("#Phone").val(map.UserPhone);
							$("#Email").val(map.UserEmail);
							$("#Birthday").val(map.UserBirthday);
							$("#uid").val(data.pkUserId);
						},
						'error':function(){
							
						 }
						});
			}
		});

		//监听排序
		table.on('sort(demo)', function(obj) {
			console.log(this, obj.field, obj.type)

			return;
			table.reload('idTest', {
				initSort : obj,
				where : { //重新请求服务端
					key : obj.field //排序字段
					,
					order : obj.type
				//排序方式
				}
			//,height: 300
			});
		});

	})

	
	layui.use([ 'form', 'laydate','layer','upload'],function() {
						var form = layui.form, layer = layui.layer, laydate = layui.laydate, upload = layui.upload;		
						
						 var uploadInst = upload.render({
							    elem: '#headImg' //绑定元素
							    ,url: '${webpath}/admin/user/uploadHeadImg' //上传接口
							    ,done: function(res){
							      //上传完毕回调
							      $("#headImg").attr("src","${webpath}/"+res.data.src);
							    }
							    ,error: function(){
							      //请求异常回调
							    }
							  });
						 
						 var uploadInst = upload.render({
							    elem: '#Img' //绑定元素
							    ,url: '${webpath}/admin/user/uploadHeadImg' //上传接口
							    ,done: function(res){
							      //上传完毕回调
							      $("#Img").attr("src","${webpath}/"+res.data.src);
							    }
							    ,error: function(){
							      //请求异常回调
							    }
							  });
						 
						 laydate.render({
							    elem: '#userBirthday' //指定元素
							  });
						 
						 laydate.render({
							    elem: '#Birthday' //指定元素
							  });

						//监听指定开关
						form.on('switch(switchTest)', function(data) {
							layer.msg('开关checked：'
									+ (this.checked ? 'true' : 'false'), {
								offset : '6px'
							});
							layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
									data.othis)
						});

						//监听提交
						form.on('submit(demo1)', function(data) {
							layer.alert(JSON.stringify(data.field), {
								title : '最终的提交信息'
							})
							return false;
						});

					});
</script>
</body>
</html>
