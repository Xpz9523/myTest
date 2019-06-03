<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="webPath" value="${pageContext.request.contextPath}"></c:set> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>编辑地址</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.">
<link rel="stylesheet" href="${webPath}/background/lib/weui.min.css">
<link rel="stylesheet" href="${webPath}/background/css/jquery-weui.css">
<link rel="stylesheet" href="${webPath}/background/css/style.css">
</head>
<body ontouchstart>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">编辑地址</div>
</header>
<form action="${webPath}/myinfo/editAddress" method="post" >
<div class="weui-content">
  <div class="weui-cells weui-cells_form wy-address-edit">
  	<input type="hidden" name="id" value="${oneAddress.id}">
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">收货人</label></div>
      <div class="weui-cell__bd"><input class="weui-input" type="text" name="receivePersonName" value="${oneAddress.receivePersonName}" placeholder="请填写收货人"></div> 
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">手机号</label></div>
      <div class="weui-cell__bd"><input class="weui-input" type="number" name="receivePersonPhone" value="${oneAddress.receivePersonPhone}" pattern="[0-9]*" placeholder="请填写手机号"></div>
    </div>
    <input type="hidden" name="province" id="province" value="${oneAddress.province}">
    <input type="hidden" name="provinceCode" id="pcode" value="${oneAddress.provinceCode}">
    <input type="hidden" name="city" id="city" value="${oneAddress.city}">
    <input type="hidden" name="cityCode" id="ccode" value="${oneAddress.cityCode}">
    <input type="hidden" name="area" id="area" value="${oneAddress.area}">
    <input type="hidden" name="areaCode" id="acode" value="${oneAddress.areaCode}">
    <div class="weui-cell">
      <div class="weui-cell__hd"><label for="name" class="weui-label wy-lab">所在地区</label></div>
      <c:if test="${empty oneAddress.id}">
      <div class="weui-cell__bd"><input class="weui-input" id="address" type="text" value="湖北省 武汉市 武昌区" readonly="" data-code="420106" data-codes="420000,420100,420106"></div>
      </c:if>
      <c:if test="${not empty oneAddress.id}">
      	<div class="weui-cell__bd"><input class="weui-input" id="address" type="text" value="${oneAddress.province} ${oneAddress.city} ${oneAddress.area}" readonly=""  data-code="${oneAddress.areaCode}" data-codes="${oneAddress.provinceCode} ${oneAddress.cityCode} ${oneAddress.areaCode}"></div>
      </c:if>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">详细地址</label></div>
      <div class="weui-cell__bd" style="margin-top: 15px;">
        <textarea class="weui-textarea" name="address" placeholder="请填写详细地址">${oneAddress.address}</textarea>
      </div>
    </div>
    <div class="weui-cell weui-cell_switch">
      <div class="weui-cell__bd">设为默认地址</div>
      <div class="weui-cell__ft">
      
      <c:if test="${oneAddress.isDefault==1}">
      <input class="weui-switch checkbtn" checked="checked" type="checkbox">
      </c:if>
      
      <c:if test="${oneAddress.isDefault!=1}">
      	<input class="weui-switch checkbtn" type="checkbox">
      </c:if>
      <input class="weui-switch" name="isDefault" id="isdefault" type="hidden" value="${oneAddress.isDefault}">
     
      </div>
    </div>
  </div> 
  <div class="weui-btn-area">
  	<input type="submit" class="weui-btn weui-btn_primary" value="保存此地址" id="showTooltips">
    <a href="${webPath}/myinfo/deleteAddress?id=${oneAddress.id}" class="weui-btn weui-btn_warn">删除此地址</a>
  </div>
</div>
</form>
<script src="${webPath}/background/lib/jquery-2.1.4.js"></script> 
<script src="${webPath}/background/lib/fastclick.js"></script> 
<script type="text/javascript" src="${webPath}/background/js/jquery.Spinner.js"></script>
<script>
  $(function() {
    FastClick.attach(document.body);
    $(".wy-header-icon-back").click(function(){
     	window.history.back();
     });
  });
</script>

<script src="${webPath}/background/js/jquery-weui.js"></script>
<script src="${webPath}/background/js/city-picker.js"></script>
<script>
      $("#address").cityPicker({
        title: "选择出发地",
        onChange: function (picker, values, displayValues) {
          console.log(values, displayValues);
			$("#pcode").val(values[0]);
			$("#ccode").val(values[1]);
			$("#acode").val(values[2]);
			$("#province").val(displayValues[0]);
			$("#city").val(displayValues[1]);
			$("#area").val(displayValues[2]);
        }
      });
    </script>
 <script type="text/javascript">
	$(".checkbtn").click(function(){
		if($("input[type='checkbox']").is(':checked')){
			$("#isdefault").val(1);
			}else{
				$("#isdefault").val(0);
				}

		})
 </script>
</body>
</html>