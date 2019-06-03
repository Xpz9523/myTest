<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:set var="webpath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="viewport" content="height=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<title>注册</title>
  <link rel="stylesheet" href="${webpath}/lib/layui/css/layui.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/common/css/common.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/common/css/register.css"/>
    <style>
        .message{
            background: none;
            padding-top: 10%;
        }
        .message input {
            width: 83%;
            margin: 0 4%;
        }
        .content form input:not(:nth-child(6)) {
            border: 0;
            margin-bottom: 8%;
        }
        .message .icons b{
            top: 14.5%;
            left: 11%;
        }
        .message .icons b:nth-child(2){
            top: 37%;
            left: 10%;
        }
        .message .icons b:nth-child(3){
            top: 60%;
        }
        .message .icons b:nth-child(4){
            top: 82%;
        }
        .code{
            top: 33.475%;
            right: 7.5%;
            background: #21a9f5;
            color: #ffffff;
            padding: 3.635% 5%;
        }
    </style>
    
</head>
<body>

    <div class="register">
        <div class="regTop">
            <span>用户注册</span>
            <a class="back" href="login.html">&lt;&nbsp;返回</a>
        </div>
        <div class="content">
            <form class="layui-form" action="${webpath}/Wine/registerUser">
                <div class="message">
                    <input type="tel" name="phone" placeholder="输入手机号" id="phonev" pattern="[0-9]{11}" required/>
                    <input type="text" placeholder="输入验证码" id="yanzhen" pattern="[0-9]{6}" onblur="yanzhenma()" required/>
                   	<input type="hidden" id="yanzhenone">
                    <input type="password" id="pwdone" placeholder="请输入新密码" pattern="[0-9A-Za-z]{6,25}" required/>
                    <input type="password" name="pwd" id="pwdtwo"  placeholder="请再次输入密码" pattern="[0-9A-Za-z]{6,25}" required/>
                    <button style="border:none;display:block" class="code" id="btn" name="phonebtn" onclick="yan(60)">获取手机验证码</button>
                </div>
                <button class="submit" id="regist" lay-submit lay-filter="*">立即注册</button>
            </form>
        </div>
    </div>
    <script src="${webpath}/lib/layui/layui.js"></script>
    <script src="${webpath}/lib/jQuery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
	    function update_p(num,t) {
		    	var btnphone = document.getElementById('btn');
		    	if(num == t) {
	 			    $("#btn").attr("disabled",null);
		    		btnphone.innerHTML=" 重新发送 ";
		    		$("#btn").css("background-color","#21A9F5"); 
		    	}
		    	else {
		    		printnr = t-num;
		    		btnphone.innerHTML= " (" + printnr +")秒后重新发送";
		    		$("#btn").attr("disabled", "false"); 
		    		$("#btn").css("background-color","#868686"); 
		    	}
	    }
		function yan(t){
			layui.use('layer', function(){
			var layer = layui.layer;
			var phone = $("#phonev").val();
			var yanzhenone = document.getElementById('btn');
			if(phone!=""){
/* 				for(i=1;i<=t;i++) {
					window.setTimeout("update_p(" + i + ","+t+")", i * 1000);
						}; */
					$.ajax({
						url : "${pageContext.request.contextPath}/Wine/yanz",
						type : "get",
						data : {
							"phone" : phone
						},
						dataType : "json",
						success : 
							function(i){
							if(i==0){
								for(i=1;i<=t;i++) {
									window.setTimeout("update_p(" + i + ","+t+")", i * 1000);
										};
								$.ajax({
									url : "${pageContext.request.contextPath}/Wine/sendPhone",
									type : "post",
									data : {
										"phone" : phone
									},
									dataType : "json",
									success : 
										function(map){
											if(map.i==0){
 												layer.msg("验证码已发送，请注意查收!");
												$("#yanzhenone").val(map.phoneyan);
												window.setTimeout("tick()",60000);
												}
											else{
												layer.msg("异常，内部验证出错!");
												};
										}
									})
								}
							else if(i==1){
								layer.msg("手机号已存在!");
								}
							}
							
					});
				 
				}else{
					layer.msg("请输入手机号!");
				}
			}); 
			}
		function tick(){
			$("#yanzhenone").val("");
			}
		function yanzhenma(){
			layui.use('layer', function(){
				var yanzhen = $("#yanzhen").val();
				var yanzhenone = $("#yanzhenone").val();
				if(yanzhen!=""){
					if(yanzhen===yanzhenone){
						layer.msg("验证码输入正确!");
						}else{
						layer.msg("验证码输入错误!");
						}
					}else{
						layer.msg("请输入验证码!");
						}

			});
			}
	  	layui.use(['layer','form'], function(){
		  		 var layer = layui.layer, form=layui.form;
	  	 form.on('submit(*)', function(data){
	  		 console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
			 console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
			 console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
				var pwdone = $("#pwdone").val();
				var pwdtwo = $("#pwdtwo").val();
				var yanzhen = $("#yanzhen").val();
				var yanzhenone = $("#yanzhenone").val();
				if(yanzhen!=""){
					if(yanzhen==yanzhenone){
						if(pwdone===pwdtwo){
							layer.msg("密码输入一致!");
							}else{
							layer.msg("密码输入不一致，请重新输入!");
							return false;
						};
						}else{
							layer.msg("验证码输入错误!");
							return false;
						}
					}else{
						layer.msg("请输入验证码!");
						return false;
						}


		});
  		});

		
    </script>
</body>
</html>