<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>商城首页</title>
<meta charset="utf-8"></meta>
<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"></meta>
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
"></meta>

<link rel="stylesheet" href="${webpath}/lib/front/lib/weui.min.css"></link>
<link rel="stylesheet" href="${webpath}/lib/front/css/jquery-weui.css"></link>
<link rel="stylesheet" href="${webpath}/lib/front/css/style.css"></link>
<link rel="stylesheet" href="${webpath}/lib/front/css/hpshop.css"></link>
<link rel="stylesheet" href="${webpath}/lib/layui/css/layui.css"></link>
<link rel="stylesheet" type="text/css" href="${webpath}/lib/layui/css/hp-common.css" />


</head>
<body class= "ontouchstart">
<!--顶部搜索-->
<div class="wy-content">
  <div class="">
<header class='weui-header'>
  <div class="weui-search-bar" id="searchBar">
    <form class="weui-search-bar__form">
      <div class="weui-search-bar__box">
        <i class="weui-icon-search"></i>
        <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索您想要的商品" required/>
        <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
      </div>
      <label class="weui-search-bar__label" id="searchText" style="transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1);">
        <i class="weui-icon-search"></i>
        <span>搜索您想要的商品</span>
      </label>
    </form>
    <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
  </div>
</header>
<!--主体-->
<div class='weui-content'>
  <!--顶部轮播-->
  <div class="swiper-container  swiper-banner ">
    <div class="swiper-wrapper" id="CarouselImgs">
 
    </div>
    <div class="swiper-pagination"></div>
  </div>
  <!--图标分类-->
  <div class="weui-flex wy-iconlist-box">
    <div class="weui-flex__item"><a href="pro_list.html" class="wy-links-iconlist"><div class="img"><img src="${webpath}/lib/front/images/menu/1.png"/></div><p>销量卖出</p></a></div>
    <div class="weui-flex__item"><a href="pro_list.html" class="wy-links-iconlist"><div class="img"><img src="${webpath}/lib/front/images/menu/2.png"/></div><p>人气收藏</p></a></div>
    <div class="weui-flex__item"><a href="all_orders.html" class="wy-links-iconlist"><div class="img"><img src="${webpath}/lib/front/images/menu/3.png"/></div><p>限时秒杀</p></a></div>
    <div class="weui-flex__item"><a href="Settled_in.html" class="wy-links-iconlist"><div class="img"><img src="${webpath}/lib/front/images/menu/4.png"/></div><p>订单管理</p></a></div>
  </div>
  <!--新闻切换-->
  <div class="wy-ind-news">
    <i class="news-icon-laba"></i>
    <div class="swiper-container swiper-news">
      <div class="swiper-wrapper" id="AAA">
       
      </div>
      <div class="swiper-pagination"></div>
    </div>
    <a href="news_list.html" class="newsmore"><i class="news-icon-more"></i></a>
  </div>
  <!--销量卖出-->
  <div class="wy-Module">
    <div class="wy-Module-tit"><span>销量卖出</span></div>
    <div class="wy-Module-con">
      <div class="swiper-container swiper-xlmc" style="padding-top:34px;"> 
        <div class="swiper-wrapper " id="swiperXlmc">

        </div>
        <div class="swiper-pagination jingxuan-pagination"></div>
      </div>
    </div>
  </div>
  
    <!--人气收藏-->
  <div class="wy-Module">
    <div class="wy-Module-tit"><span>人气收藏</span></div>
    <div class="wy-Module-con">
      <div class="swiper-container swiper-rqsc" style="padding-top:34px;">
        <div class="swiper-wrapper" id="goodConllectionNum">
        
        </div>
        <div class="swiper-pagination jingxuan-pagination"></div>
      </div>
    </div>
  </div>
  
  <!--为你推荐-->
  <div class="wy-Module">
    <div class="wy-Module-tit-line"><span>为你推荐</span></div>
    <div class="wy-Module-con">
      <ul class="wy-pro-list clear" id="tuijian1" >
      
      
      
   
      </ul>
     <!--  <div class="morelinks"><a href="pro_list.html">查看更多 >></a></div> -->
     <div class="weui-loadmore">
    <i class="weui-loading"></i>
    <span class="weui-loadmore__tips">正在加载</span>
    </div>
    <div class="weui-loadmore2">
   <!--  <i class="weui-loading"></i> -->
   <!--  <span class="weui-loadmore__tips">底部</span> -->
    </div>
  </div>
</div>
</div>
</div>
</div>
<!--底部导航-->
<jsp:include page="../footer.jsp"></jsp:include>


<script src="${webpath}/lib/front/lib/fastclick.js"></script> 
<script src="${webpath}/lib/front/lib/jquery-2.1.4.js"></script> 
<script>
  $(function() {
    FastClick.attach(document.body);
  });
</script> 
<script src="${webpath}/lib/front/js/jquery-weui.js"></script>
<script src="${webpath}/lib/front/js/swiper.js"></script>
<%-- <script src="${webpath}/lib/common/js/showmore.js"></script> --%>
<%-- <script src="${webpath}/lib/common/js/mian.js"></script> --%>
<script>
 	
	
/* 	 $(".swiper-rqsc").swiper({
		pagination: '.swiper-pagination',
		loop: true,
		paginationType:'fraction',
        slidesPerView:2,
        paginationClickable: true,
        spaceBetween: 5
      }); */
	/*  $(".swiper-xlmc").swiper({
		pagination: '.swiper-pagination',
		paginationType:'fraction',
		loop: true,
        slidesPerView:3,
		slidesPerColumn: 2,
        paginationClickable: true,
        spaceBetween:2
      }); */

      
//跳转到分类显示页面
 $(function(){
	$("#fenlei").click(function(){
		window.location.href="${pageContext.request.contextPath}/view/classify";
	});
 });
		 
	
      
  
      
      
	 //异步加载新闻轮播
	 $.ajax({
		    url:'${pageContext.request.contextPath}/view/news',
			data:{},
			type:'POST',
			dataType:'json',
			success:function(data){
				var html='';
 				$.each(data,function(index,news){
 					html += 
 				 	"<div class='swiper-slide'><a href='${pageContext.request.contextPath}/Wine/toNews/"+news.pkNewsId+"'>"+news.newsTitle+"</a></div>"; 
 				});
 				//console.log(html)
				$("#AAA").append(html);
				$(".swiper-news").swiper({
					loop: true,
					direction: 'vertical',
					paginationHide :true,
			        autoplay: 3000
			      });
			}
	 });
	   
	 
	 
	//异步加载前台首页图片轮播
	 	$.ajax({
 			url:"${pageContext.request.contextPath}/view/Front",
 			data:{},
 			type:'POST',
 			dataType:'json',
 			success:function(data){
 				
 				var $html='';
 				$.each(data,function(index,img){
 					
 					$html += '<div class="swiper-slide">'
							+ '<a id="sendGoodsInfo" imgid="'+img.fkGoodId+'"  href="javascript:;">'
							+ '<img class="carousel-img" src="' + img.carouselImg +  '" />' + '</a>' + '</div>';
 				});
				$("#CarouselImgs").html($html);
				$(".swiper-banner").swiper({
			        loop: true,
			        autoplay: 3000
			      });
 			},
 			error:function(){
 				
 			}
 		});  
	
	
	
	
	 	//异步加载前台销量卖出轮播
	 	$.ajax({
 			url:"${pageContext.request.contextPath}/view/goodSaleNum",
 			data:{},
 			type:'POST',
 			dataType:'json',
 			success:function(data){
 				
 				var html='';
 				$.each(data,function(index,good){
 					
 					html += 
 						'<div class="swiper-slide">'+'<a href="${webPath}/GoodsController/sendGoodsInoPage.jhtml?id=${good.pkGoodId}">'+'<img class="xlmc-img" src="'+'/'+good.goodCoverImg+'" />'+'</a>'+'</div>';
 				});
				$("#swiperXlmc").append(html);
				 $(".swiper-xlmc").swiper({
						pagination: '.swiper-pagination',
						paginationType:'fraction',
						loop: true,
				        slidesPerView:3,
						slidesPerColumn: 2,
				        paginationClickable: true,
				        spaceBetween:2
				      });
 			},
 			error:function(){
 				
 			}
 		}); 
	 	
	 	
	 	

	 	//异步加载前台人气收藏轮播
	 	$.ajax({
 			url:"${pageContext.request.contextPath}/view/goodConllectionNum",
 			data:{},
 			type:'POST',
 			dataType:'json',
 			success:function(data){
 				
 				var html='';
 				$.each(data,function(index,good2){
 					
 					html += 
 						'<div class="swiper-slide">'+'<a href="${webPath}/GoodsController/sendGoodsInoPage.jhtml?id=${good2.pkGoodId}">'+'<img class="rqsc-img" src="'+'/'+good2.goodCoverImg  +'" />'+'</a>'+'</div>';
 						
 				});
				$("#goodConllectionNum").append(html);

				 $(".swiper-rqsc").swiper({
					pagination: '.swiper-pagination',
					loop: true,
					paginationType:'fraction',
			        slidesPerView:2,
			        paginationClickable: true,
			        spaceBetween: 5
			      });
 			},
 			error:function(){
 				
 			}
 		}); 
	 	
	 	
	 	
	 	

	 	//流式加载前台为你推荐页面
	 	$(function(){
	 		var page;
	 		page=1;
	 		showmorepage(1);
	 		
	 		$(document.body).pullToRefresh().on("pull-to-refresh", function() {
	 	        setTimeout(function() {
	 	          $("#time").text(new Date);
	 	          $(document.body).pullToRefreshDone();
	 	        }, 2000);
	 	      });
	 	      // infinite
	 	      var loading = false;
	 	      $(document.body).infinite().on("infinite", function() {
	 	        if(loading) return;
	 	        loading = true;
	 	        setTimeout(function() {
	 	        	page=page+1;
	 	        	showmorepage(page);
	 	        	loading = false;
	 	        }, 2000);
	 	      }); 
	 	});




	 	function showmorepage(pageNum){
	 		var id = $("#goodsId").val();
	 		var name = $("#goodsName").val();
	 		var url;
	 		var data={};
	 		url="/view/getpageAll";
	 		 data.pageNum=pageNum||'1';
	 		
	 				$.ajax({
	 					url : url,
	 					data : data,
	 					type : 'post',
	 					dataType : 'json',
	 					success : function(json) {
	 						var List=json.data.list;
	 						// 数据清除
	 						if (json.data.list.length > 0) {
	 					
	 						var $html='';
	 						$.each(List,function(index,goods){
	 						$("#tuijian1").append(
	 								'<li><a href="'
	 								+ '/GoodController/sendGoodsInoPage.jhtml?id='
	 								+ goods.pkGoodId
	 								+ '"><div class="proimg"><img style="max-width:100%;" src="'
	 								+ '/'
	 								+ goods.goodCoverImg
	 								+ '"></div><div class="protxt"><div class="name" style="height:35px"><div style="overflow:hidden;display:-webkit-box;-webkit-box-orient:vertical;-webkit-line-clamp: 2;text-overflow: ellipsis;">'
	 								+ goods.goodTitle
	 								+ '</div></div><div class="wy-pro-pri">¥<span>'
	 								+ goods.goodPrice
	 								+ '</span></div></div></a></li>');
	 								});
	 					}else if(json.data.list.length <= 0){
	 						var html='';
	 						  html += "<div class=\"weui-cells__title\" style= 'margin: 0 auto;text-align: center;'>亲，已经到底部了哦！</div>";
	 		                   $("#weui-loadmore2").append(html);
	 		                   $(".weui-loadmore").toggle();
	 							 loading = true;
	 		              }
	 					 }	 
	 				}); 
	 				
	 	}
	 
</script>
</body>
</html>
