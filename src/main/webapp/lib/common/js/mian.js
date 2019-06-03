/**
 * 作者：pl
 * 功能：1.轮播图管理
 * 		2.轮播图跳转到相关商品的页面
 */
$(function(){
    	carouselimg.init();
    });
 //轮播图管理
 var carouselimg={
 	//初始化
 	init:function(){
 		this.initEvent();
 	},
 	//初始化事件
 	initEvent:function(){
 		var url="/view/Front";
 		var data={};
 	/*	data.isDelete='0';*/
 		$.ajax({
 			url:url,
 			data:data,
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
				 $('.swiper-container').swiper({
                    mode: 'horizontal',
                    pagination: '.swiper-pagination',
                    loop: true,
                    autoplay: 2000,
                    observer: true,//修改swiper自己或子元素时，自动初始化swiper
                    observeParents: true//修改swiper的父元素时，自动初始化swiper
                });
 			},
 			error:function(){
 				
 			}
 		});
 		
 		//跳转到商品的信息页面
 		$(document).on("click","#sendGoodsInfo",function(){
 			var imgid=$(this).attr("imgid");
 			location.href='/GoodsController/sendGoodsInoPage?id='+imgid;
 			
 		});
 	}
 };