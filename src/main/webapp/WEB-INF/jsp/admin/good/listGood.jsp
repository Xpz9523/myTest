<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询商品</title>
</head>
<body>
<jsp:include page="../../base.jsp"></jsp:include>
<div>
		<button id="fbtn" class="layui-btn layui-btn-radius layui-btn-normal"> <i class="layui-icon">&#x1002;</i>刷新</button>
		<button id="abtn" class="layui-btn layui-btn-radius layui-btn-normal"> <i class="layui-icon">&#xe608;</i>添加</button>
		<button id="dbtn" class="layui-btn layui-btn-radius layui-btn-danger"> <i class="layui-icon">&#xe640;</i>删除</button>
		<button id="zbtn" class="layui-btn layui-btn-radius layui-btn-warm"> <i class="layui-icon">&#xe6b2;</i>恢复</button>
</div>
<table class="layui-table" id="">
	<thead>
			<tr>
				<th id="th"><input  id="xbtn" type="checkbox"   name="all" lay-skin="primary" style="position: relative;top:3px;"></th>
				<th>商品封面图</th>
				<th>编号</th>
				<th>商品名称</th>
				<th>商品标题</th>
				<th>商品子标题</th>
				<th>商品价格</th>
				<th>运费</th>
				<th>库存数量</th>
				<th>收藏数量</th>
				<th>销量卖出</th>
				<th>商品类型</th>
				<th>状态</th>
				<th>创建时间</th>
				<th>更新时间</th>
				<th width="80px">操作</th>
			</tr>
		</thead>
		<tbody id="demo1">
				
		</tbody>
	
	</table>
		<div id="demo2" style="float: right;"></div>
</body>
<script type="text/javascript">
	
	$(function(){
		layui.use('layer', function(){
		var layer = layui.layer;
		fenye();
		//添加按钮 挑战到添加页面
		$("#abtn").click(function(){
			window.location.href="${pageContext.request.contextPath}/admin/Good/addGood";
		})
		
		//点击最顶上的复选框时实现全选
		$("#xbtn").click(function(){//当点击全选框时 
			var flag = $("#xbtn").is(":checked");//判断全选按钮的状态 
			var checkItems=document.getElementsByName("newsletter"); 
			for(var i=0;i<checkItems.length;i++){ 
			  checkItems[i].checked = flag; 
			} 
		});
		
		//点击刷新时 刷新界面回到主页
		$("#fbtn").click(function(){
			window.location.reload();
		});
		
		//点击删除时 实现批量删除
		$("#dbtn").click(function(){
			var num='';
			 $('input:checkbox[name=newsletter]:checked').each(function(i){
                if(this.checked){
                	if(0==i){
                		num = $(this).val();
                       }else{
                    	 num += (","+$(this).val());
                       }
                }
            });
			 //window.alert("你选了："+$('input:checkbox[name=newsletter]:checked').length+"个，其中有："+num);
			  layer.confirm("您确定要删除这"+$('input:checkbox[name=newsletter]:checked').length+"个吗?", {icon: 5, title:'提示'}, function(index){
             	 $.ajax({
  					url : "${pageContext.request.contextPath}/admin/Good/delGoods",
  					type : "get",
  					dataType : "json",
  					data:{"pkGoodId":num},
  					success : function(data) {
  						if(data.code == 200){
  							layer.msg(data.msg);
  							fenye();
  						 }else if(data.code == 500){
  							 layer.msg(data.msg);
  							 fenye();
  						 } 
  					}
  				});
  			   layer.close(index);
              });
	     });
		
		//点击恢复按钮时 查看已被删除的商品
		$("#zbtn").click(function(){
			$("#th").remove();
			fenye2();
		});
	 });
	});

function fenye() {
	layui.use('laypage', function(){
		  var laypage = layui.laypage;
		  var url = "${pageContext.request.contextPath}/admin/Good/goodLimit";
		  var config = {pageNum:1,pageSize:10};
		  $.getJSON(url,config,function(res){
			  laypage.render({
				    elem: 'demo2',
				    count: res.total, //总条数
				    limit:config.pageSize, //每页条数
				    theme: '#1AA094', //自定义颜色
				    jump: function(obj, first){
				        if(!first){ //首次则不进入
				        	config.pageNum = obj.curr;
				        	getUserListByPage(url,config);
				        }
				    }
			   });
			  parseUserList(res,config.pageNo);  
		  }); 

		});
	}

	function fenye2(){
		layui.use('laypage', function(){
			  var laypage = layui.laypage;
			  var url = "${pageContext.request.contextPath}/admin/Good/toRecover";
			  var config = {pageNum:1,pageSize:10};
			  $.getJSON(url,config,function(res){
				  laypage.render({
					    elem: 'demo2',
					    count: res.total, //总条数
					    limit:config.pageSize, //每页条数
					    theme: '#1AA094', //自定义颜色
					    jump: function(obj, first){
					        if(!first){ //首次则不进入
					        	config.pageNum = obj.curr;
					        	getUserListByPage2(url,config);
					        }
					    }
				   });
				  parseUserList2(res,config.pageNo);  
			  }); 
		});
	}
	//点击页数从后台获取数据
	function getUserListByPage(url,config){
		$.getJSON(url,config,function(res){
			parseUserList(res,config.pageNo);
		});
	}
	//点击页数从后台获取数据
	function getUserListByPage2(url,config){
		$.getJSON(url,config,function(res){
			parseUserList2(res,config.pageNo);
		});
	}

	//解析数据，currPage参数为预留参数，当删除一行刷新列表时，可以记住当前页而不至于显示到首页去
	function parseUserList(res,currPage){
		layui.use('form', function(){
	    var form = layui.form;
		var html = "";
		 $.each(res.list, function(i, b){
	            html += "<tr style='height:120px;'>";
	            html += "<td><input type='checkbox' value='"+b.pkGoodId+"' name='newsletter'  lay-skin='primary'></td>";
	            html += "<td><img src='${pageContext.request.contextPath}/"+b.goodCoverImg+"' width='100px' height='80px' style='position: relative;top:20px;'> </td>";
            	html +="<td>"+(1+i)+"</td>";
            	html +="<td>"+b.goodName+"</td>";
            	html +="<td>"+b.goodTitle+"</td>";
            	html +="<td>"+b.goodSubTitle+"</td>";
            	html +="<td>"+b.goodPrice+"</td>";
            	html +="<td>"+b.goodFreight+"</td>";
            	html +="<td>"+b.goodNum+"</td>";
            	html +="<td>"+b.goodCollectionNum+"</td>";
            	html +="<td>"+b.goodSaleNum+"</td>";
            	html +="<td>"+b.goodTypeSmall.typeSmallName+"</td>";
            	html +="<td>"+b.goodStateName+"</td>";
            	html +="<td>"+b.createTime+"</td>";
            	html +="<td>"+b.updateTime+"</td>";
            	html +="<td>&nbsp;&nbsp;<button  class='layui-btn layui-btn-sm layui-btn-radius '  onclick=update('"+b.pkGoodId+"')>编辑</button><button  class='layui-btn layui-btn-sm layui-btn-radius layui-btn-danger'  onclick=del('"+b.pkGoodId+"')>删除</button></td>";
	            html += "</tr>";
	          });
		 $("#demo1").html(html);
		 form.render();
	});
	}
	//解析数据，currPage参数为预留参数，当删除一行刷新列表时，可以记住当前页而不至于显示到首页去
	function parseUserList2(res,currPage){
		layui.use('form', function(){
	    var form = layui.form;
		var html = "";
		 $.each(res.list, function(i, b){
	            html += "<tr>";
	            html += "<td><img src='${pageContext.request.contextPath}/"+b.goodCoverImg+"'</td>";
            	html +="<td>"+(1+i)+"</td>";
            	html +="<td>"+b.goodName+"</td>";
            	html +="<td>"+b.goodTitle+"</td>";
            	html +="<td>"+b.goodSubTitle+"</td>";
            	html +="<td>"+b.goodPrice+"</td>";
            	html +="<td>"+b.goodFreight+"</td>";
            	html +="<td>"+b.goodNum+"</td>";
            	html +="<td>"+b.goodCollectionNum+"</td>";
            	html +="<td>"+b.goodSaleNum+"</td>";
            	html +="<td>"+b.goodTypeSmall.typeSmallName+"</td>";
            	html +="<td>"+b.goodStateName+"</td>";
            	html +="<td>"+b.createTime+"</td>";
            	html +="<td>"+b.updateTime+"</td>";
            	html +="<td>&nbsp;&nbsp;<button  class='layui-btn layui-btn-sm layui-btn-radius ' onclick=recover('"+b.pkGoodId+"')>恢复</button></td>";
	            html += "</tr>";
	          });
		 $("#demo1").html(html);
		 form.render();
	});
	}
	
	//恢复
	function recover(pkGoodId){
		layui.use('layer', function(){
			 layer.confirm('您确定要恢复吗?', {icon: 1, title:'提示'}, function(index){
				 $.ajax({
					    url : "${pageContext.request.contextPath}/admin/Good/recover",
						type : "get",
						dataType : "json",
						data:{"pkGoodId":pkGoodId},
						success : function(data) {
							if(data.code == 200){
								layer.msg(data.msg);
								fenye2();
							 }else if(data.code == 500){
								 layer.msg(data.msg);
								 fenye2();
							 } 
						}
					 });
				 layer.close(index);
		    	});
		});
	}
	
	function update(pkGoodId){
		window.location.href="${pageContext.request.contextPath}/admin/upGood/"+pkGoodId+"";
	}
	
	function del(pkGoodId){
		layui.use('layer', function(){
		 layer.confirm('您确定要删除吗?', {icon: 5, title:'提示'}, function(index){
			 $.ajax({
					url : "${pageContext.request.contextPath}/admin/Good/delGood",
					type : "get",
					dataType : "json",
					data:{"pkGoodId":pkGoodId},
					success : function(data) {
						if(data.code == 200){
							layer.msg(data.msg);
							fenye();
						 }else if(data.code == 500){
							 layer.msg(data.msg);
							 fenye();
						 } 
					}
				});
			 layer.close(index);
    	});
	  });
	}
	
</script>
</html> 