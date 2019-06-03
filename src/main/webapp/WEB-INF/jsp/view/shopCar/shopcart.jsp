<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <c:set var="webPath"  value="${pageContext.request.contextPath}"></c:set>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>购物车</title>
<link rel="stylesheet" href="${webPath}/lib/weui/css/weui.min.css"/>
<link rel="stylesheet" href="${webPath}/lib/weui/css/jquery-weui.css"/>
<link rel="stylesheet" href="${webPath}/lib/weui/css/style.css"/>
</head>
<body ontouchstart>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">购物车</div>
</header>
<div class="weui-content" id="cc">
 <c:forEach items="${list }" var="car">
 
 <div class="weui-panel weui-panel_access">
    <div class="weui-panel__bd">
      <div class="weui-media-box_appmsg pd-10">
        <div class="weui-media-box__hd check-w weui-cells_checkbox">
          <label class="weui-check__label" for="${car.pkShopCarId }" >
            <div class="weui-cell__hd cat-check"><input type="checkbox" onclick="getcheckbox(${car.price}*${car.num})" class="weui-check" name="cartpro" id="${car.pkShopCarId }" value="${car.price }"><i class="weui-icon-checked"></i></div>
          </label>
        </div>
        <div class="weui-media-box__hd"><a href="pro_info.html"><img class="weui-media-box__thumb" src="${car.goodImg }" alt=""></a></div>
        <div class="weui-media-box__bd">
          <h1 class="weui-media-box__desc"><a href="pro_info.html" class="ord-pro-link">${car.title }</a></h1>
          <p class="weui-media-box__desc">${car.sizeInfo }</p>
          <div class="clear mg-t-10">
            <div class="wy-pro-pri fl">￥<em class="num font-15">${car.price }</em></div>
            <div class="pro-amount fr"><div class="Spinner"></div></div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
 
 </c:forEach>
  
</div>
<!--底部导航-->
<div class="foot-black"></div>
<div class="weui-tabbar wy-foot-menu">
  <div class="npd cart-foot-check-item weui-cells_checkbox allselect">
    <label class="weui-cell allsec-well weui-check__label" for="all">
        <div class="weui-cell__hd">
          <input type="checkbox" class="weui-check" name="all-sec" id="all">
          <i class="weui-icon-checked"></i>
        </div>
       
        <div class="weui-cell__bd">
          <p class="font-14">全选</p>
        </div>
    </label>
     
  </div>
  <div class="weui-tabbar__item  npd">
    <p class="cart-total-txt" >合计：<i>￥</i><em class="num font-16" id="zong1">520.00</em></p>
  </div>
  <button class="select">获得选中项</button>
  <a href="${webPath}/view/toorderInfo" class="red-color npd w-90 t-c">
    <p class="promotion-foot-menu-label">去结算</p>
  </a>
</div>

<script src="${webPath}/lib/weui/js/jquery-2.1.4.js"></script> 
<script src="${webPath}/lib/weui/js/fastclick.js"></script> 
<script type="text/javascript" src="${webPath}/lib/weui/js/jquery.Spinner.js"></script>
<script>
  $(function() {
    FastClick.attach(document.body);
        $(".wy-header-icon-back").click(function(e){
     	   window.history.back();
     	   e.stopPropagation();
           });
  });
  
  function getcheckbox(price){
		  	alert(price);
  }
  
</script>
 <script type="text/javascript">
            $(function(){  
                var val = '';
                var strSel = '';
				$(".select").click(function(){
			var ck = $("input[type='checkbox']:checked")
			var ckVal = 0;
			
		for(var i = 0; i<ck.length; i++){

		ckVal = parseFloat(ckVal)+parseFloat($(ck[i]).val()) ;
}
            alert(ckVal);
				})
        	
            })
        </script>
<script type="text/javascript">
$(function(){
	$(".Spinner").Spinner({value:1, len:3, max:999});
});
</script>
<script src="${webPath}/lib/weui/js/jquery-weui.js"></script>
<!---全选按钮-->

<script type="text/javascript">
	
	function jia(id){
			alert("1");
			
	};
	function jian(){
			alert("减");
			
	};
	
	
$(document).ready(function () {      
	$(".allselect").click(function () {
		if($(this).find("input[name=all-sec]").prop("checked")){
			$("input[name=cartpro]").each(function () {
				$(this).prop("checked", true);
			});
		
		}
		else
   		{
			$("input[name=cartpro]").each(function () {
				if ($(this).prop("checked")) {
					$(this).prop("checked", false);
				} else {
					$(this).prop("checked", true);
				} 
			});
    
   		}
		
	});

});
</script>
<script>
      $(document).on("click", ".wy-dele", function() {
        $.confirm("您确定要把此商品从购物车删除吗?", "确认删除?", function() {
          $.toast("商品已经删除!");
        }, function() {
          //取消操作
        });
      });
     
    </script>
<script type="text/javascript">
$("#cc").on("click","input",function(){
	$(this)
})
</script>

</body>
</html>
