<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.zd.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Shop-CSS.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<title>商品详情页</title>
<script type="text/javascript">
	function showCart(userid) {
		var result = confirm("查看购物车")
		if(result){
			location.href="${pageContext.request.contextPath}/user/showcart/"+userid;
		}
	}
	function toLogin() {
		location.href = "${pageContext.request.contextPath}/user/tologinindex.action";
	}
	function showPro() {
		location.href = "${pageContext.request.contextPath}/user/showpro";
	}
	
	$(function(){
		$("#myform").validate({
			rules : {
				number : "required"
					
			},
			messages : {
				number : "请选择购买的数量"
				
			},
			submitHandler : function() {
				//提交Ajax
				 $.ajax({
							data : $("#myform").serialize(),
							dataType : "text",
							type : "post",
							url : "${pageContext.request.contextPath }/user/addcart/${product.pid}",
							success : function(rec) {
								if(rec=="0"){
									alert("添加成功！");
								}else{
									alert("你还未登录！");
								}	
							}
						}); 
			}
			
		});
	});
	
	
</script>
</head>
<body>
	
	<div style="height: 30px"></div>
		<div style="width: 70%;margin: auto">
			<div style="width: 35%;float: left;">
			<img width="200px" height="200px" src="${pageContext.request.contextPath }/images/${product.pimage }">
		</div>
		<div style="width: 100%">
			<form id="myform">
				<table>
					<tr>
						<td align="left"><b>商品名:</b></td>
						<td>${product.pname }</td>
					</tr>
					<tr>
						<td align="left"><b>价格:</b></td>
						<td>${product.shop_price }</td>
					</tr>
					<tr>
						<td align="left"><b>商品详情:</b></td>
						<td >
							<textarea readonly="readonly" rows="5" cols="50">${product.pdesc }</textarea>
						</td>
					</tr>
					<tr>
						<td align="left"><b>购买数量:</b></td>
						<td >
							<input style="width: 20px" type="text" name="number">
						</td>
					</tr>
			
				</table>
				
			<div align="left">
				<input type="submit" value="加入" />
			</div>
				<input type="hidden" name="pname" value="${product.pname }" />
				<input type="hidden" name="price" value="${product.shop_price }" />
			</form>
			<button  onclick="showCart('${user.uid}')">查看购物车</button>
				<button onclick="toLogin()">立即登录</button>
				<button onclick="showPro()">继续购物</button>
		</div>
		</div>
		<div style="height: 130px"></div>
		<!--承诺书-->
			<div>
				<img src="${pageContext.request.contextPath}/images/img/bottom.png" width="100%" height="80px" />
			</div>
			<!--超链接-->
			<div id="div3">
				<a href="">关于我们</a>
				<a href="">联系我们</a>
				<a href="">招贤纳士</a>
				<a href="">法律声明</a>
				<a href="">友情链接</a>
				<a href="">支付方式</a>
				<a href="">配送方式</a>
				<a href="">广告声明</a>
			</div>
			<!--版权-->
			<div id="div4">
				<p>Copyright ©2014-2018  网上商城  版权所有</p>
			</div>
		</div>
</body>
</html>