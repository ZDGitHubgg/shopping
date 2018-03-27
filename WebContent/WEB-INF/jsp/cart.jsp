<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的购物车</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Shop-CSS.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<style type="text/css">
	a{text-decoration: none;}
</style>

<script type="text/javascript">
	//删除所选的商品订单
	function deleteById(oid) {
		if(window.confirm("确定要删除吗？")){
			$.ajax({
				dataType : "text",
				type : "post",
				url : "${pageContext.request.contextPath}/user/deleteByOid/"+oid,
				
			});
			location.reload();
		}
	}
	
	function shopbyid(oid){
		if(window.confirm("是否购买？")){
			$.ajax({
				dataType : "text",
				type : "post",
				url : "${pageContext.request.contextPath}/user/shop/"+oid,
				success : function(res){
					if(res=="1"){
						alert("购买成功！");
					}
				}
			});
			location.reload();
		}
	}

	function shop(uid){
		if(window.confirm("是否全部购买？")){
			$.ajax({
				dataType : "text",
				type : "post",
				url : "${pageContext.request.contextPath}/user/shopAll/"+uid,
				success : function(res){
					if(res=="1"){
						alert("购买成功！");
						location.href = "${pageContext.request.contextPath}/user/success";
					}
				}
			});
		}
	}
	
	
	$(function(){
		$("#myform").validate({
			submitHandler : function() {
				//提交Ajax
				 $.ajax({
							data : $("#myform").serialize(),
							dataType : "text",
							type : "post",
							url : "${pageContext.request.contextPath}/user/clean"
						}); 
			}
			
		});
	});

		window.onload = function() {
			//全选与全不选
			var all = document.getElementsByName("checkAll")[0];
			var one = document.getElementsByName("checkOne");
			all.onchange = function(){
				if(all.checked){
					//全选按钮被选中，让所有的name是checkone的checkbox都被选中
					for(var i=0;i<one.length;i++){
						one[i].checked = true;
					}
				}else{
					//全选按钮不被选中，让所有的name是checkone的checkbox都不被选中
					for(var i=0;i<one.length;i++){
						one[i].checked = false;
					}
				}
			}
			/* 为checkOne的checkbox注册onchange时间,当每次onchange被触发时，就去
			 * 验证所有的按钮的选中状态，只要有一个按钮的选中状态是false，则全选按钮的选中状态是false
			 */
			for(var i=0;i<one.length;i++){
				one[i].onchange = function(){
					var flag = true;
					//当checkone发生状态变化时校验所有的checkone是否是全选中或全不选中，然后改变all的选中状态。
					for(var i=0;i<one.length;i++){
						if(one[i].checked!=true){
							flag = false;
						}
					}if(flag){
						all.checked = true;
					}else{
						all.checked = false;
					}
				}
			}
		}
		
		$(function(){
			$(".order tr:even").css("background-color","white");
			$(".order tr:odd").css("background-color","#E5E5E5");
		});
</script>
</head>
<body bgcolor="antiquewhite">
	<p style="font-size: 30px;font-style: italic;color: brown;"align="center">我的购物车</p>
	<form id="myform">
	<table class="order" width="75%" align="center" cellpadding="0px" cellspacing="0px"
		border="1px">
		<div style="width: 86%" align="right">
			<a href="${pageContext.request.contextPath}/user/showpro">返回首页</a>
		</div>
	
		<!-- 序号 名称	 门店价格  数量	总价格	删除 -->
		<tr>
			<td colspan="7" align="right">
				<input type="checkbox" name="checkAll">全选 
			</td>
		</tr>
		<tr>
			<td align="center">序号</td>
			<td align="center">名称</td>
			<td align="center">门店价格</td>
			<td align="center">数量</td>
			<td align="center">总价格</td>
			<td align="center">删除</td>
			<td align="center">购买</td>
		</tr>
				
		<c:forEach items="${orders }" var="ord" varStatus="vs">
			<tr>
				<td align="center">${vs.count }</td>
				<td align="center">${ord.pname }</td>
				<td align="center">${ord.price }</td>
				<td align="center">${ord.number }</td>
				<td align="center">${ord.price*ord.number}</td>
				<td align="center">
					<button onclick="deleteById('${ord.oid}')">删除</button>
					<input type="checkbox" name="checkOne" value="${ord.oid }">
				</td>	
				<td align="center">
				<button onclick="shopbyid('${ord.oid}')">购买</button>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td align="center">总计</td>
			<td colspan="2"></td>
			<td align="center">${totalnumber }</td>
			<td align="center">${totalprice }</td>
			<td align="center"><input type="submit" value="清空"></td>
			<td align="center">
			<button onclick="shop('${user.uid}')">下单</button>
		</tr>
		
	</table>
	</form>
		<div style="height: 150px"></div>
		<!--承诺书-->
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