<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.">
<title>查看个人信息</title>

<style type="text/css">
body{
	font-size: 20px;
}
</style>
</head>
<body ontouchstart>
	<jsp:include page="../base.jsp"></jsp:include>
	<!--主体-->
<div class='weui-content'>
  <div class="wy-center-top">
    <div class="weui-media-box weui-media-box_appmsg" style="margin: 0 auto;width: 220px;">
      <div class="weui-media-box__hd">
			<img class="weui-media-box__thumb radius"  src="${pageContext.request.contextPath}/${user.userHeadimg }">
	  </div>
      <div class="weui-media-box__bd">
        <h4 class="weui-media-box__title user-name"><a href="${pageContext.request.contextPath}/Wine/view/toInfo/${user.pkUserId}" style="color: #FFF;">${user.userName }</a></h4>
        <p class="user-grade weui-media-box__title " style="color: #FFFFFF;">${user.userLevel.userLevelName }</p>
      </div>
    </div>
  </div>
  <div class="weui-panel weui-panel_access">
    <div class="weui-panel__hd">
      <a href="${pageContext.request.contextPath}/Wine/toOrderAll/${user.pkUserId}" class="weui-cell weui-cell_access center-alloder">
        <div class="weui-cell__bd wy-cell">
          <div class="weui-cell__hd">
			   <img src="${pageContext.request.contextPath}/lib/weui/images/center-icon-order-all.png" class="center-list-icon">
		  </div>
          <div class="weui-cell__bd weui-cell_primary">
			   <p class="center-list-txt">全部订单</p>
		  </div>
        </div>
        <span class="weui-cell__ft"></span>
      </a>   
    </div>
    <div class="weui-panel__bd">
      <div class="weui-flex">
        <div class="weui-flex__item">
          <a href="look_orders.html" class="center-ordersModule">
          <c:if test="${order0==0}">
          
          </c:if>
          <c:if test="${order0!=0}">
         	 <span class="weui-badge" style="position: absolute;top:5px;right:10px; font-size:10px;">${order0}</span>
          </c:if>
            <div class="imgicon">
				<img src="${pageContext.request.contextPath}/lib/weui/images/center-icon-order-dfk.png" />
			</div>
            <div class="name">待付款</div>
          </a>
        </div>
        <div class="weui-flex__item">
          <a href="look_orders.html" class="center-ordersModule">
          <c:if test="${order2==0}">
          
          </c:if>
          <c:if test="${order2!=0}">
          <span class="weui-badge" style="position: absolute;top:5px;right:10px; font-size:10px;">${order2}</span>
          </c:if>
            <div class="imgicon">
				<img src="${pageContext.request.contextPath}/lib/weui/images/center-icon-order-dfh.png" />
			</div>
            <div class="name">待发货</div>
          </a>
        </div>
        <div class="weui-flex__item">
          <a href="look_orders.html" class="center-ordersModule">
          <c:if test="${order3==0}">
          
          </c:if>
          <c:if test="${order3!=0}">
             <span class="weui-badge"
							style="position: absolute;top:5px;right:10px; font-size:10px;">${order3}</span>
          </c:if>
            <div class="imgicon">
				<img src="${pageContext.request.contextPath}/lib/weui/images/center-icon-order-dsh.png" />
			</div>
            <div class="name">待收货</div>
          </a>
        </div>
        <div class="weui-flex__item">
          <a href="orders.html" class="center-ordersModule">
          <c:if test="${order4==0}">
          
          </c:if>
          <c:if test="${order4!=0}">
            <span class="weui-badge"
							style="position: absolute;top:5px;right:10px; font-size:10px;">${order4}</span>
          </c:if>
            <div class="imgicon">
								<img src="${pageContext.request.contextPath}/lib/weui/images/center-icon-order-dpj.png" />
							</div>
            <div class="name">待评价</div>
          </a>
        </div>
      </div>
    </div>
  </div>
  
  <div class="weui-panel">
        <div class="weui-panel__bd">
          <div class="weui-media-box weui-media-box_small-appmsg">
            <div class="weui-cells">
              <a class="weui-cell weui-cell_access"
							href="${pageContext.request.contextPath}/Wine/news">
                <div class="weui-cell__hd">
								<img src="${pageContext.request.contextPath}/lib/weui/images/center-icon-sc.png" alt=""
									class="center-list-icon">
							</div>
                <div class="weui-cell__bd weui-cell_primary">
                  <p class="center-list-txt">新闻列表</p>
                </div>
                <span class="weui-cell__ft"></span>
              </a>
              <a class="weui-cell weui-cell_access"
							href="${pageContext.request.contextPath}/Wine/toAddress/${user.pkUserId}">
                <div class="weui-cell__hd">
								<img src="${pageContext.request.contextPath}/lib/weui/images/center-icon-dz.png" alt=""
									class="center-list-icon">
							</div>
                <div class="weui-cell__bd weui-cell_primary">
                  <p class="center-list-txt">地址管理</p>
                </div>
                <span class="weui-cell__ft"></span>
              </a>
              <a class="weui-cell weui-cell_access" href="${pageContext.request.contextPath}/Wine/view/toPassword/${user.pkUserId}">
                <div class="weui-cell__hd">
								<img src="${pageContext.request.contextPath}/lib/weui/images/center-icon-dlmm.png" alt=""
									class="center-list-icon">
							</div>
                <div class="weui-cell__bd weui-cell_primary">
                  <p class="center-list-txt">密码修改</p>
                </div>
                <span class="weui-cell__ft"></span>
              </a>
              <a class="weui-cell weui-cell_access" href="${pageContext.request.contextPath}/Wine/exit">
                <div class="weui-cell__hd">
								<img src="${pageContext.request.contextPath}/lib/weui/images/center-icon-out.png" alt=""
									class="center-list-icon">
							</div>
                <div class="weui-cell__bd weui-cell_primary">
                  <p class="center-list-txt">退出账号</p>
                </div>
                <div class="weui-cell__bd weui-cell_primary">
                <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1056619204&site=qq&menu=yes">
					<img border="0" src="${pageContext.request.contextPath}/lib/common/img/good/wangwang.gif" alt="点击这里给我发消息" title="点击这里给我发消息"/>
				</a>
                </div>
                <span class="weui-cell__ft"></span>
              </a>
            </div>
          </div>
        </div>
      </div>
</div>

<!--底部导航-->
<jsp:include page="../footer.jsp"></jsp:include>

<script>
	$(function() {
		FastClick.attach(document.body);
	});
</script> 

</body>
</html>
