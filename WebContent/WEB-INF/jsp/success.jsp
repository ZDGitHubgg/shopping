<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Shop-CSS.css" />
<script>
	var time = 5;
	var timer;
	window.onload = function() {
		desc();
	}
	function desc() {
		//前提：time>0,把time-1，然后显示在span中.再开启定时器，间隔一秒后再次执行该方法
		if (time >= 0) {
			var sp1 = document.getElementById("sp1");
			sp1.innerHTML = time;
			time--;
			//设置定时器，timer就表示该定时器
			timer = setTimeout(desc, 1000);
		} else {
			location.href = "${pageContext.request.contextPath}/user/showpro";
		}
	}
	function clearTimer() {
		//清除定时器
		clearTimeout(timer);
		location.href = "${pageContext.request.contextPath}/user/showpro";
	}
</script>
</head>
<body>
	<div align="center" style="margin-top: 100px">
		<h2>恭喜你购买成功！<span style="color: red;" id="sp1">5</span>秒后返回首页。
		<input type="button" onclick="clearTimer()" value="立即返回首页" />
	</div>
	<!--承诺书-->
	<div style="height: 200px"></div>
		<div>
			<img src="${pageContext.request.contextPath}/images/img/bottom.png" width="100%" height="80px" />
		</div>
		<!--超链接-->
		<div id="div3">
			<a href="">关于我们</a> <a href="">联系我们</a> <a href="">招贤纳士</a> <a
				href="">法律声明</a> <a href="">友情链接</a> <a href="">支付方式</a> <a href="">配送方式</a>
			<a href="">广告声明</a>
		</div>
		<!--版权-->
		<div id="div4">
			<p>Copyright ©2014-2018  网上商城  版权所有</p>
		</div>
</body>
</html>