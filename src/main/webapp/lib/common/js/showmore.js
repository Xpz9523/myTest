

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