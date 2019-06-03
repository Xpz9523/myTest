<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
  	function addLevel(){
		layui.use('layer', function(){
			 var $ = layui.jquery, layer = layui.layer;
			 
			 layer.open({
				  type: 1, 
				  title:'新建用户等级',
				  skin: 'layui-layer-molv',
				  area: ['400px', '300px'],
				  content: $("#add") //这里content是一个普通的String
				});
		});
	};
	
	function confirmAdd(){
		var userLevelName = $("#userLevelName").val();
		var userLevelRemark = $("#userLevelRemark").val();
		
		$.ajax({
			'method':'post',
			'url':'${webpath}/admin/userlevel/confirmAdd',
			'dataType':'json',
			data:{"userLevelName":userLevelName,"userLevelRemark":userLevelRemark},
			'success':function(map){
				layer.msg("新建成功");
			},
			'error':function(){
				layer.msg("新建失败");
			 }
			});
	}
	
	function confirmEdit(){
	    var pkUserLevelId = document.getElementById("LevelId").value;
		var userLevelName = $("#LevelName").val();
		var userLevelRemark = $("#LevelRemark").val();
		
		$.ajax({
			'method':'post',
			'url':'${webpath}/admin/userlevel/confirmEdit',
			'dataType':'json',
			data:{"pkUserLevelId":pkUserLevelId,"userLevelName":userLevelName,"userLevelRemark":userLevelRemark},
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
	 <form class="layui-form" action="" style="display:none;" id="add">
	 	<div class="layui-col-md-offset2 layui-col-md8" style="margin-top:20px;">
	 		<input type="text" name="dname" class="layui-input" id="userLevelName" style="border-top:none;border-left:none;border-right:none;" placeholder="请输入用户等级">
	 	</div>	
      	<div class="layui-col-md-offset2 layui-col-md8" style="margin-top:20px;">
      		<textarea placeholder="请输入备注信息" class="layui-textarea" id="userLevelRemark"></textarea>
      	</div>
      	<div class="layui-col-md-offset3 layui-col-md6" style="margin-top:20px;">
      		<button class="layui-btn" type="submit" onclick="confirmAdd()">确认添加</button>
      		<button class="layui-btn layui-btn-primary" type="reset">重置</button>
      	</div>
     </form>
     
     <!-- 编辑弹窗 -->
     <form class="layui-form" action="" style="display:none;" id="edit">
     	<input type="hidden" id="LevelId">
	 	<div class="layui-col-md-offset2 layui-col-md8" style="margin-top:20px;">
	 		<input type="text" name="dname" class="layui-input" id="LevelName" style="border-top:none;border-left:none;border-right:none;" placeholder="请输入用户等级">
	 	</div>	
      	<div class="layui-col-md-offset2 layui-col-md8" style="margin-top:20px;">
      		<textarea placeholder="请输入备注信息" class="layui-textarea" id="LevelRemark"></textarea>
      	</div>
      	<div class="layui-col-md-offset3 layui-col-md6" style="margin-top:20px;">
      		<button class="layui-btn" type="submit" onclick="confirmEdit()">确认修改</button>
      		<button class="layui-btn layui-btn-primary" type="reset">重置</button>
      	</div>
     </form>

	<jsp:include page="../../base.jsp"></jsp:include>

<div class="layui-btn-group demoTable">
  <button id="addBtn" class="layui-btn layui-btn-normal" onclick="addLevel()"><i class="layui-icon"></i>添加</button>
  <button class="layui-btn layui-btn-danger" ><i class="layui-icon"></i>批量删除</button>
  <button id="refrsh" class="layui-btn hp-btn-green"><i class="layui-icon">ဂ</i>刷新</button>
</div>
 
<table class="layui-table" lay-data="{cellMinWidth: 80, url:'${webpath}/admin/userlevel/listUserLevel', page:true, request: {
	    	  	pageName: 'pageNum',limitName: 'pageSize'},id:'demo',showLoad:true}" lay-filter="demo">
  <thead>
    <tr>
      <th lay-data="{type:'checkbox'}"></th>
      <th lay-data="{field:'pkUserLevelId', width:80}">ID</th>
      <th lay-data="{field:'userLevelName', sort: true}">等级名称</th>
      <th lay-data="{field:'userLevelRemark'}">备注</th>
      <th lay-data="{field:'createTime'}">创建时间</th>
      <th lay-data="{field:'updateTime' }">修改时间</th>
      <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo1'}">操作</th>
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
				base: '${webpath}/lib/common/hpModules/' // 扩展模块目录
			}).extend({ // 模块别名 
				hpWindow: 'hpWindow/hpWindow'
			});
			layui.use(['form','table', 'hpWindow'],
function() {
	var table = layui.table;
	var $ = layui.$;
	var form=layui.form;
	var hpWindow = layui.hpWindow;

	hpWindow.open("#addBtn", "html/add.html", {
		title: '添加',
		area: ['500px', '350px'],
		btn: ['确认', '取消'],
		anim:1,
		success: function(layero, index){
				    	form.render();
				        form.on('submit(save)', function(data){
				        	// ajax
				          $.get("../json/demo6.json",{},function(json){
				          	if(json && json.code==200){
				          		 console.log('yes');
				          		 layer.close(index);
				          	}else{
				          		layer.msg('数据有误');
				          	}
				          })
				          return false;
				       });
				    },
		yes: function(index, layero) {
						layero.find('.icon-save').click();
						//layer.close(index);
					},
		btn2: function(index, layero) {
			layer.msg('取消 按钮 被点击')
			layer.close(index);
		},
		cancel: function(index, layero) {
			layer.msg('x 按钮 被点击')
		}

	});
	
	
	
	// 表格刷新
   $("#refrsh").click(function(){
   	      //执行重载
      table.reload('demo', {
        page: {
          curr: 1 //重新从第 1 页开始
        }
        ,where: {
          // 参数
          kd:'kd'
        }
      });
   	
   })
   
   //监听表格复选框选择
  table.on('checkbox(demo)', function(obj){
    console.log(obj)
  });
  
  //监听单元格编辑
  table.on('edit(demo)', function(obj){
    var value = obj.value //得到修改后的值
    ,data = obj.data //得到所在行所有键值
    ,field = obj.field; //得到字段
    
  });
  
  //监听工具条
  table.on('tool(demo)', function(obj){
    var data = obj.data;
    if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
        
  				  $.ajax({
  				'method':'get',
  				'url':'${webpath}/admin/userlevel/confirmDel',
  				'dataType':'json',
  				data:{"pkUserLevelId":data.pkUserLevelId},
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
    } else if(obj.event === 'edit'){
      /* layer.prompt({
        formType: 2
        ,value: data.username
      }, function(value, index){
        obj.update({
          username: value
        });
        layer.close(index);
      }); */
    	layui.use('layer', function(){
			 var $ = layui.jquery, layer = layui.layer;
			 
			 layer.open({
				  type: 1, 
				  title:'编辑用户等级',
				  skin: 'layui-layer-molv',
				  area: ['400px', '300px'],
				  content: $("#edit") //这里content是一个普通的String
				});
		});
      
    	 $.ajax({
				'method':'get',
				'url':'${webpath}/admin/userlevel/edit',
				'dataType':'json',
				data:{"pkUserLevelId":data.pkUserLevelId},
				'success':function(map){
					$("#LevelName").val(map.LevelName);
					$("#LevelRemark").val(map.LevelRemark);
					$("#LevelId").val(data.pkUserLevelId);
				},
				'error':function(){
					
				 }
				});
      
    }
  });
  
  //监听排序
  table.on('sort(demo)', function(obj){
    console.log(this, obj.field, obj.type)
    
    return;
    table.reload('idTest', {
      initSort: obj
      ,where: { //重新请求服务端
        key: obj.field //排序字段
        ,order: obj.type //排序方式
      }
      //,height: 300
    });
  });

   
  
})
</script>
</html>
