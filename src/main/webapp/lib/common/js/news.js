/**
 * 作者：pl
 * 功能：1.新聞輪播管理
 * 		
 */
$(function(){
    	carouselimg.init();
    });
 //管理
 var carouselimg={
 	//初始化
 	init:function(){
 		this.initEvent();
 	},
 	//初始化事件
 	initEvent:function(){
 		var url="/view/news";
 		var data={};
 	/*	data.isDelete='0';*/
 		$.ajax({
 			url:url,
 			data:data,
 			type:'POST',
 			dataType:'json',
 			success:function(data){
 				var html='';
 				$.each(data,function(index,news){
 					
 					html += '<div class="swiper-slide">'
							+ '<a id="news" newsid="'+news.newsTitle+'"  href="javascript:;">'
							+ news.newsTitle + '</a>' + '</div>';
 				});
				$("#newsId").html(html);
				 $('.swiper-wrapper').swiper({
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
 	
 	}
 };
 		