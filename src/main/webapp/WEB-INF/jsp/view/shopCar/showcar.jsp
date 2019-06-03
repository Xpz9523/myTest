<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="webPath" value="${pageContext.request.contextPath}"></c:set>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>购物车</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
<link rel="stylesheet" href="${webPath}/lib/weui/css/weui.min.css"/>
<link rel="stylesheet" href="${webPath}/lib/weui/css/jquery-weui.css"/>
<link rel="stylesheet" href="${webPath}/lib/weui/css/style.css"/>
</head>
<body>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">购物车</div>
</header>
<div class="weui-content" id="carss">
 
  <c:forEach items="${list}" var="c">
  <div class="weui-panel weui-panel_access"  id="mycar">
    <input type="hidden" value="${c.pkShopCarId}" id="mycarid">
 	<input type="hidden" value="${c.num}" class="mynum">
    <div class="weui-panel__bd">
      <div class="weui-media-box_appmsg pd-10">
        <div class="weui-media-box__hd check-w weui-cells_checkbox">
          <label class="weui-check__label" for="${c.pkShopCarId}">
            <div class="weui-cell__hd cat-check"><input type="checkbox" class="weui-check" name="cartpro" id="${c.pkShopCarId}" value="${c.pkShopCarId}"><i class="weui-icon-checked"></i></div>
          </label>
        </div>
        <div class="weui-media-box__hd"><a href="${webPath}/desk/goodsDetail?id=${c.fkGoodId}"><img class="weui-media-box__thumb" src="${c.goodImg}" alt=""></a></div>
        <div class="weui-media-box__bd">
          <h1 class="weui-media-box__desc"><a href="${webPath}/desk/goodsDetail?id=${c.fkGoodId}" class="ord-pro-link">${c.title}</a></h1>
          <p class="weui-media-box__desc"></p>
          <div class="clear mg-t-10">
            <div class="wy-pro-pri fl">¥<em class="num font-15">${c.price}</em></div>
            <div class="pro-amount fr"><div class="Spinner"> </div></div>
         
          </div>
        </div>
      </div>
    </div>
  </div>
</c:forEach>
  
</div>
<!--底部导航-->
<div class="foot-black"></div>
 <div class="weui-tabbar wy-foot-menu " style="position:absolute;bottom: 45px;"> 
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
    <p class="cart-total-txt">合计：<i>￥</i><span class="num font-16" id="zong1">0</span></p>
  </div>
  <a href="#" class="red-color npd w-90 t-c"  onclick="jiesuan()">
    <p class="promotion-foot-menu-label">去结算</p>
  </a>
</div> 
<jsp:include page="../footer.jsp"></jsp:include> 

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
</script>


<script type="text/javascript">
$(function(){	
	for(i=0;i<$(".mynum").length;i++){
		if($($(".mynum")[i]).val() > 1){
			$(".Spinner").eq(i).Spinner({value:$($(".mynum")[i]).val(), len:3, max:999});
		}else{
			$(".Spinner").eq(i).Spinner({value:1, len:3, max:999});
		}
	}

	
});
</script>



<script src="${webPath}/lib/weui/js/jquery-weui.js"></script>
<!---全选按钮-->
<script type="text/javascript">
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
					$("#zong1").text(0);
				} else {
					$(this).prop("checked", true);
				    $.ajax({
						url : "${webPath}/car/commentprice",
						type : "post",
						dataType : "json",
						success : function(data) {
							  var gg=0;
							  $.each(data,function(i,car){
									gg +=car.countMoney;							
							   });
							  $("#zong1").text(gg*10/10);						 						 												
						  }
					  })
				} 
			});
    
   		}
		
	});

});
</script>
<!-- 购物车 -->
<script type="text/javascript">
//减
$("#carss").on("click","#subtract",function(){
	var id=$(this).parents("#mycar").children("#mycarid");
	var c=id.val();
	$.ajax({
			url : "${webPath}/car/subtract",
			type : "post",
			data :{"pkShopCarId":c},
			dataType : "json",
			success : function(data) {						
				 var qq=$("#zong1").text();
				 var oop=parseFloat(qq)-parseFloat(data.price);
				 if(qq!=0){
					 if(data.num!=1){
					   var lll=oop.toFixed(1);
					   $("#zong1").text(lll);
					   }					  					      
				   				 						 												
			  }
			}
		  }) 
	
})
//加
$("#carss").on("click","#add",function(){
	var id=$(this).parents("#mycar").children("#mycarid");
	var c=id.val();
     $.ajax({
		url : "${webPath}/car/add",
		type : "post",
		data :{"id":c},
		dataType : "json",
		success : function(data) {
		   var qq=$("#zong1").text();
		   if(qq==0){            
			   }else{
				   var oop=parseFloat(qq)+parseFloat(data.price);
				   $("#zong1").text(oop.toFixed(1));	 
				 }
				 												
		  }
	  }) 
})
 //处理勾选的总价
$("#carss").on("click",".weui-check",function(){
	var id=$(this).parents("#mycar").children("#mycarid");
	var c=id.val();
	var d=$("#zong1").text();
 if($(this).is(':checked')==true){ 
	//更新数据库最新数据	 		 	
    $.ajax({
		url : "${webPath}/car/selectByid",
		type : "post",
		data :{"id":c,"price":d},
		dataType : "json",
		success : function(data) {
			$("#zong1").text(data);		 						 												
		  }
	  })
	

			  
 }
 else{
	   $.ajax({
			url : "${webPath}/car/selectByid2",
			type : "post",
			data :{"id":c,"prices":d},
			dataType : "json",
			success : function(data) {
					$("#zong1").text(data);		 						 												
			  }
		  })	

	 }
	
 
	
}) 
//结算



</script>
<script type="text/javascript">
	function jiesuan(){
		var ids = new Array();
		var ck = $("input[type='checkbox']:checked");
		var price = $("#zong1").html(); 
		ck.each(function() {
			 ids.push($(this).val());
			 });
		$.ajax({
			 url:'${webPath}/'
			 data:{"ids":ids,"price":price}
			 dataType:"json"
		 });
	}
</script>

</body>
</html>