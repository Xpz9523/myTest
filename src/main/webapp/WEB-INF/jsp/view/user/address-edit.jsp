<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加或者修改地址</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css" />
</head>
<body ontouchstart>
<jsp:include page="../base.jsp"></jsp:include>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">新建地址</div>
</header>
<form action="" class="layui-form">
	<div class="weui-content">
	  <div class="weui-cells weui-cells_form wy-address-edit">
	    <div class="weui-cell">
	      <div class="weui-cell__hd"><label class="weui-label wy-lab">收货人</label></div>
	      <div class="weui-cell__bd">
	      	<input class="weui-input" type="number" name="personName"  placeholder="请填写收货人" value="${addressId.personName}">
	      	<input type="hidden" name="fkUserId" value="${fkUserId}"> 
	      	<input type="hidden" name="pkAddressId" value="${addressId.pkAddressId}"> 
	      </div> 
	    </div>
	    <div class="weui-cell">
	      <div class="weui-cell__hd"><label class="weui-label wy-lab">手机号</label></div>
	      <div class="weui-cell__bd"><input class="weui-input" type="number" name="personPhone" value="${addressId.personPhone}"  placeholder="请填写手机号" ></div>
	    </div>
	    <div class="weui-cell">
	      <div class="weui-cell__hd"><label for="name" class="weui-label wy-lab">所在地区</label></div>
	      <div class="weui-cell__bd">
	      <c:if test="${empty addressId.pkAddressId }">
	     	<input class="weui-input" name="addresss" id="address" type="text" value="湖北省 武汉市 武昌区"   readonly="" data-code="420106" data-codes="420000,420100,420106">
	      </c:if>
	      <c:if test="${not empty addressId.pkAddressId }">
	     	<input class="weui-input" name="addresss" id="address" type="text" value="${addressId.sheng} ${addressId.city} ${addressId.area}"   readonly="" data-code="${addressId.areaCode}" data-codes="${addressId.shengCode} ${addressId.cityCode} ${addressId.areaCode}">
	      </c:if>
	      	<input type="hidden" name="sheng" id="sheng" value="${addressId.sheng}">
    		<input type="hidden" name="shengCode" id="shengCode" value="${addressId.shengCode}">
    		<input type="hidden" name="city" id="city" " value="${addressId.city}">
    		<input type="hidden" name="cityCode" id="ccode" value="${addressId.cityCode}">
    		<input type="hidden" name="area" id="area" value="${addressId.area}">
    		<input type="hidden" name="areaCode" id="acode" value="${addressId.areaCode}">
	      </div>
	    </div>
	    <div class="weui-cell">
	      <div class="weui-cell__hd"><label class="weui-label wy-lab">详细地址</label></div>
	      <div class="weui-cell__bd" style="margin-top: 15px;">
	        <textarea class="weui-textarea" placeholder="请填写详细地址" id="detailAddress" name="detailAddress" >${addressId.detailAddress}</textarea>
	      </div>
	    </div>
	    <div class="weui-cell weui-cell_switch">
	    <div class="weui-cell__bd">设为默认地址</div>
	    <div class="weui-cell__ft">
	    <c:if test="${addressId.isDefault==1 }">
	      	<input class="weui-switch" type="checkbox"  name="isDefaults" id="isDefault" checked="checked">
	     </c:if>
	     <c:if test="${addressId.isDefault!=1 }">
	      	<input class="weui-switch" type="checkbox"  name="isDefaults" id="isDefault">
	     </c:if>
	     </div>
	    </div>
	  </div> 
	  <div class="weui-btn-area">
	    <button class="weui-btn weui-btn_primary" lay-submit lay-filter="save">保存此地址</button>
	    <button class="weui-btn weui-btn_warn" lay-submit lay-filter="del">删除此地址</button>
	  </div>
	</div>
</form>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script>
  $(function() {
    FastClick.attach(document.body);
    $(".wy-header-icon-back").click(function(){
     	window.history.back();
     });
  });
</script>

<script>
      $("#address").cityPicker({
        title: "选择出发地",
        onChange: function (picker, values, displayValues) {
          console.log(values, displayValues);
            $("#shengCode").val(values[0]);
			$("#ccode").val(values[1]);
			$("#acode").val(values[2]);
			$("#sheng").val(displayValues[0]);
			$("#city").val(displayValues[1]);
			$("#area").val(displayValues[2]);
        }
      });
      layui.use(['layer','form'], function(){
		  var layer = layui.layer, form=layui.form;
		  	 form.on('submit(save)', function(data){
		  		 console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				 console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				 console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
		  		$.ajax({
		  			type:"get",
		  			dataType:"json",
		  			url:"${pageContext.request.contextPath}/Wine/addAddressInfo",
		  			data:data.field,
		  			success:function(data){
		  				if (data.code == 200) {
							layer.msg(data.msg);
							  setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
								window.location.reload();//页面刷新
							},1000);
						} else if (data.code == 500) {
							layer.msg(data.msg);
						}
		  			}
		  		})
		  		 return false;
		  	 	});
		  	 
		  	 form.on('submit(del)', function(data){
		  		 console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				 console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				 console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
		  		 return false;
	  	 	   });
		  	 });
    </script>
</body>
</html>
