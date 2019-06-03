<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人气排行</title>
</head>
<body>
<jsp:include page="../../base.jsp"></jsp:include>
<div><label class="layui-form-label"><button id="abtn" class="layui-btn layui-btn-molv">收藏/销量</button></label></div>
<table class="layui-table" id="" lay-skin="nob">
	<thead>
			<tr>
				<th>人气排行</th>
				<th>商品名称</th>
				<th>收藏数量</th>
				<th>销量数量</th>
			</tr>
		</thead>
		<tbody id="demo1">
				
		</tbody>
	
	</table>
<div id="demo2" style="float: right;"></div>
</body>
<script type="text/javascript">

$(function(){
	 var url='${pageContext.request.contextPath}/admin/Good/sale';
	 fenye(url);	
	 var a=0;
	  $("#abtn").click(function(){
		  a++;
		  if(a%2==0){
			  url = "${pageContext.request.contextPath}/admin/Good/sale";
			  fenye(url);	
		  }else{
			  url= "${pageContext.request.contextPath}/admin/Good/conllection";
			  fenye(url);	
		  }
	  })
})

function fenye(url) {
	layui.use('laypage', function(){
		  var laypage = layui.laypage;
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

	//点击页数从后台获取数据
	function getUserListByPage(url,config){
		$.getJSON(url,config,function(res){
			parseUserList(res,config.pageNo);
		});
	}

	//解析数据，currPage参数为预留参数，当删除一行刷新列表时，可以记住当前页而不至于显示到首页去
	function parseUserList(res,currPage){
		var html = "";
		 $.each(res.list, function(i, b){
	            html += "<tr>";
            	html +="<td>top"+(1+i)+"</td>";
            	html +="<td>"+b.goodName+"</td>";
            	html +="<td>"+b.goodCollectionNum+"</td>";
            	html +="<td>"+b.goodSaleNum+"</td>";
	            html += "</tr>";
	          });
		 $("#demo1").html(html);
	}
</script>
</html>