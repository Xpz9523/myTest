<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="webPath"  value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <jsp:include page="../../base.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<legend>商品小类型修改</legend>
		</fieldset>

	<form class="layui-form" action="" method="post">
	<div class="layui-form-item">
    <label class="layui-form-label">商品小种类名字</label>
    <div class="layui-input-block">
      <input type="text" name="typeSmallName" autocomplete="off" id="typeSmallName" class="layui-input" value="${GoodTypeSmall.typeSmallName }" >
     <input type="hidden" name="pkTypeSmallId" value="${GoodTypeSmall.pkTypeSmallId }" id="pkTypeSmallId"> 
    
    </div>
  </div>
	<div class="layui-form-item">
			 	 <div class="layui-input-block">
			    		<img alt="点击上传小类型图片"  src="${webPath }/${GoodTypeSmall.typeSmallImg}" id="headimg"  name="typeSmallImg" style="width: 150px;height:150px;" class="img-rounded"/>
			   	 <button type="button" class="layui-btn" id="good3">更改上传封面图</button><span>（此次操作会清空之前的数据）</span> 
			    </div>
			  </div> 
	 
	 <div class="layui-form-item">
    <label class="layui-form-label">商品大种类修改</label>
    <div class="layui-input-inline">
      <select name="fkTypeBigId" lay-filter="aihao" >
       <c:forEach items="${bg }" var="bg">
        <option value="${bg.pkTypeBigId }"   class="options">${bg.typeBigName }</option>
      	</c:forEach>
      </select>
    </div>
  </div>
	<div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1" id="saveBtn" >立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
	
		</form>
</body>
<script type="text/javascript">
		
		layui.use(['form','layer','laypage','laydate','upload'], function(){
		 	var $ = layui.jquery, form = layui.form,layer = layui.layer,laypage = layui.laypage,laydate=layui.laydate;
		 	 var upload = layui.upload;
			  var uploadInst = upload.render({
				    elem: '#good3' //绑定元素
				   	,method:'post'
				    ,url: '${pageContext.request.contextPath}/upload' //上传接口
				    ,done: function(res){
				      //上传完毕回调
				       if(res.code == 200){
						   $("#headimg").attr("src","${pageContext.request.contextPath}/"+ res.data.src);   
						   $("#imgpath").val(res.data.src);
						   $("#headimg").val(res.data.src);
						   $("#typeSmallImg").val(res.data.src);
						   layer.msg(res.msg);
					     }else{typeSmallImg
					    	 layer.msg('上传失败');
						   }
				    }
				    ,error: function(){
				      //请求异常回调
				    }
				  });
	
		}); 
		</script>	
<script type="text/javascript">
	$(".options[value='${GoodTypeSmall.fkTypeBigId}']").attr("selected",true);
</script>
<script type="text/javascript">
layui.use([ 'form', 'layer', 'laypage', 'laydate' ],
		function() {
			var $ = layui.jquery, form = layui.form, layer = layui.layer, laypage = layui.laypage, laydate = layui.laydate;
// 定义用户分页显示
function listBigType(){
	layui.use('form', function(){
		  var form = layui.form;
		$.ajax({
		type:'post',
		url:'${webPath}/admin/small/getAllBigGoodType',
		dataType:'json',	
		success: function(data){
			var content="";
			$.each(data.list,function(i,list){	 				
				content+="<input type='radio' name='fkTypeBigId' value="+list.pkTypeBigId+" title="+list.typeBigName+" />";
			})
			$("#dept").html(content);
		},
		error:function(){
			alert('服务器异常');
		}
		});
		
	});
}
function updatesamllGoodTyep(){
	
	$("#saveBtn").click(function(){
					var pkTypeSmallId = $("#pkTypeSmallId").val();
					var typeSmallName = $("#typeSmallName").val();
					var typeSmallImg = $("#headimg").val();
					var fkTypeBigId=$("select").val();	
					alert(fkTypeBigId);
					$.ajax({
						'url' :'${webPath }/admin/small/updateGoodType',
						'type':'post',
						'dataType':'json',
						data:{'typeSmallName' :typeSmallName,'typeSmallImg':typeSmallImg,'fkTypeBigId':fkTypeBigId,'pkTypeSmallId':pkTypeSmallId},
						success: function(data){
							if(data.status==200){
								layer.msg(data.message);
								setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
									window.location.reload();//页面刷新
								},2000);//过1s执行方法体。
									listUsers()
								});
							}else if(data.status==500){
								layer.msg(data.message);
							}
						}
						
					});
					
					
		
				
	});


}
updatesamllGoodTyep();
listBigType();

});
</script>
</html>