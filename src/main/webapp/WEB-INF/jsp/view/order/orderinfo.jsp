<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="webpath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body ontouchstart>
	<jsp:include page="../../base.jsp"></jsp:include>
	<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">订单详情</div>
</header>
<div class="weui-content">
  <div class="wy-media-box weui-media-box_text address-select">
    <div class="weui-media-box_appmsg">
      <div class="weui-media-box__hd proinfo-txt-l" style="width:35px;"><span class="promotion-label-tit"><img src="${webpath}/lib/weui/images/maps.png" /></span></div>
      <div class="weui-media-box__bd">
        <a href="${pageContext.request.contextPath}/Wine/toAddress/${user.pkUserId}" class="weui-cell_access">
          <h4 class="address-name"><span>${user.userName}</span><span>${user.userPhone}</span></h4>
          <div class="address-txt">${address.sheng}${address.city}${address.area}${address.detailAddress}</div>
        </a>
      </div>
      <div class="weui-media-box__hd proinfo-txt-l" style="width:16px;"><div class="weui-cell_access"><span class="weui-cell__ft"></span></div></div>
    </div>
  </div>
  <div class="wy-media-box weui-media-box_text">
    <div class="weui-media-box__bd">
       	  <c:forEach  items="${orderInfo}" var="orderinfo">
     <div class="weui-media-box_appmsg ord-pro-list">
        <div class="weui-media-box__hd"><a href="pro_info.html"><img class="weui-media-box__thumb" src="${orderinfo.goodImg}" alt=""></a></div>
        <div class="weui-media-box__bd">
          <h1 class="weui-media-box__desc"><a href="pro_info.html" class="ord-pro-link">${orderinfo.title}</a></h1>
          <p class="weui-media-box__desc">${orderinfo.specificationsInfo}</p>
          <div class="clear mg-t-10">
            <div class="wy-pro-pri fl">¥<em class="num font-15">${orderinfo.countMoney}</em></div>
            <div class="pro-amount fr"><span class="font-13">数量×<em class="name">${orderinfo.num}</em></span></div>
          </div>
        </div>
      </div>
       </c:forEach>
    </div>
  </div>
  <div class="weui-panel">
    <div class="weui-panel__bd">
      <div class="weui-media-box weui-media-box_small-appmsg">
        <div class="weui-cells">
          <div class="weui-cell weui-cell_access" href="javascript:;">
            <div class="weui-cell__bd weui-cell_primary">
              <p class="font-14"><span class="mg-r-10">运费</span><span class="fr txt-color-red">￥<em class="num">10.00</em></span></p>
            </div>
          </div>
          <a class="weui-cell weui-cell_access" href="coupon.html">
            <div class="weui-cell__bd weui-cell_primary">
              <p class="font-14"><span class="mg-r-10">折扣券</span><span class="sitem-tip"><em class="num">0</em>张可用</span></p>
            </div>
            <span class="weui-cell__ft"></span>
          </a>
        </div>
      </div>
    </div>
  </div>
  <div class="wy-media-box weui-media-box_text">
    <div class="mg10-0 t-c">总金额：<span class="wy-pro-pri mg-tb-5">¥<em class="num font-20">${countprice}</em></span></div>

   <div>
   	<div class="weui-cell weui-cell_access"> 
   	    	<div class="weui-cell__bd"><img style="width: 40px;height: 40px;" src="${webpath}/lib/weui/images/wxPay.png" /><span style="margin-left: 18px;">微信支付</span></div>
          <div class="weui-media-box__hd check-w weui-cells_checkbox">
          <label class="weui-check__label" for="cart-pto3">
            <div class="weui-cell__hd "><input type="radio" data-pay="0" class="weui-check pay" name="cartpro" id="cart-pto3"><i class="weui-icon-checked"></i></div>
          </label>
        </div>
   	</div>
   
   	<div class="weui-cell weui-cell_access"> 
   	    	<div class="weui-cell__bd"><img style="width: 40px;height: 40px;" src="${webpath}/lib/weui/images/zfbPay.png" /><span style="margin-left: 18px;">支付宝支付</span></div>
          <div class="weui-media-box__hd check-w weui-cells_checkbox" >
          <label class="weui-check__label" for="cart-pto4">
            <div class="weui-cell__hd "><input type="radio" data-pay="1"  class="weui-check pay" name="cartpro" id="cart-pto4"><i class="weui-icon-checked"></i></div>
          </label>
        </div>
   	</div>
  </div>
   <div class="mg10-0"><a id="payBtn" href="javascript:;" class="weui-btn weui-btn_primary" style="background-color: #EA869A;">确认支付</a></div>
</div>
<script type="text/javascript" src="${webPath}/lib/weui/js/jquery.Spinner.js"></script>
<script>
  $(function() {
    FastClick.attach(document.body);
     $(".wy-header-icon-back").click(function(){
     	window.history.back();
     });
    
    $("#payBtn").click(function(){
    	
    	if($(".pay:checked").length<=0){$.toast("请选择支付方式", "text");return;}
    	var val=$(".pay:checked").data("pay");
    	if(val){ 
        location.href='${webPath}/view/zfbQr?pay=1'
    	}else{
    	location.href='${webPath}/view/zfbQr?pay=2'
    	}
    });
    
  });
</script>
<script type="text/javascript">
$(function(){
	$(".Spinner").Spinner({value:1, len:3, max:999});
});
</script>
	
</body>
</html>