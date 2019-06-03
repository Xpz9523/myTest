<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>商城分类</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"></meta>
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
"></meta>
<style type="text/css">
.mouseOver {
	background: #00B2EE;
	color: white;
	width: 500px;
}

.mouseOut {
	background: #EDEDED;
	width: 500px;
}

</style>
<link rel="stylesheet" href="${webpath}/lib/front/lib/weui.min.css"></link>
<link rel="stylesheet" href="${webpath}/lib/front/css/jquery-weui.css"></link>
<link rel="stylesheet" href="${webpath}/lib/front/css/style.css"></link>
<link rel="stylesheet" href="${webpath}/lib/front/css/hpshop.css"></link>
</head>
<body ontouchstart>
<!--顶部搜索-->
<!--主体-->
	 
<div class="wy-content">
  <div class="category-top">
 <header class='weui-header'>
  <div class="weui-search-bar" id="searchBar">
  <div class="wy-header-icon-back" > <span></span></div>
    <form class="weui-search-bar__form">
      <div class="weui-search-bar__box">
        <i class="weui-icon-search"></i>
        <input type="text" name="keyWord" id="keyWords"  style="width: 200px; height: 20px;" onkeyup="getMoreContens()"
			onfocus="getMoreContens()" onblur="clearContent()" class="weui-search-bar__input" id="searchInput" placeholder="搜索您想要的商品" required/>
      	<div id="popDiv" class="showDiv">
			<table id="content_table">
				<tbody id="content_table_body">
				</tbody>
			</table>
		</div>
       <!-- 	<input type="text" name="keyWords" id="keyWords"
			style="width: 200px; height: 20px;" onkeyup="getMoreContens()"
			onfocus="getMoreContens()" onblur="clearContent()" /> -->
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
  </div>
  <aside>
    <div class="menu-left scrollbar-none" id="sidebar">
      <ul>
        <ul id="u1">
		</ul>
      </ul>
    </div>
  </aside>
  
  
<!--   <section class="menu-right padding-all j-content">
    <h5>最新推荐</h5>
   

  </section> -->

    <section class="menu-right padding-all j-content"  >
    <h5 id="h1"></h5>
    <ul id="u2"> </ul>
   
  </section> 
</div>
<script src="${webpath}/lib/front/lib/fastclick.js"></script> 
<script src="${webpath}/lib/front/lib/jquery-2.1.4.js"></script> 
<script src="${webpath}/lib/common/js/classify.js"></script>
<script src="${webpath}/lib/common/js/type_good.js"></script>
<script>
//解决触屏设备点击延时问题
//当触发"Click"事件时，移动端浏览器将等待约300毫秒的时间后再做出响应，原因是浏览器要判断用户是否执行双击。
//jQuery 使用方法：
//$(function() {    
//        FastClick.attach(document.body);
//});
  $(function() {
    FastClick.attach(document.body);
      	     $(".wy-header-icon-back").click(function(){
      	    	 // 点击 后退刷新后的页面
     	   window.history.back();//location.reload();
           });
  });
</script>
<script src="${webpath}/lib/front/js/jquery-weui.js"></script>
<script type="text/javascript">
	/* $(function($){
		$('#sidebar ul li').click(function(){  //给所有 ui 下面的li 元素添加点击事件，
			//把当前点击的li 元素添加 class="active" ,给同胞兄弟li移除 class="active"
			$(this).addClass('active').siblings('li').removeClass('active');
			//获取当前li 元素的索引 赋值给index变量
			var index = $(this).index();
			// 根据索引找第几个 j-content 进行显示，把其他'j-content' 隐藏掉
			$('.j-content').eq(index).show().siblings('.j-content').hide();
		})
	}) */
	
	$(function($) {
		$(document).on('click','#sidebar ul li',function() {
					$(this).addClass('active').siblings('li').removeClass('active');
					var index = $(this).index();
					$('.j-content').eq(index).show().siblings('.j-content').hide();})
	})
</script>
</body>
</html>
