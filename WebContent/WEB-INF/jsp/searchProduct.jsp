<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function addProduct() {
		location.href="${pageContext.request.contextPath}/admin/adminAddProduct";
	}
	function deletePro(pid) {
		var result = confirm("确定要删除吗？")
		if(result){
			location.href="${pageContext.request.contextPath}/admin/adminDeleteProduct/"+pid;
		}
	}
	
	//删除所选的商品
	/* function delPro() {
		var result = confirm("确定要删除吗？")
		if(result){
			location.href="${pageContext.request.contextPath}/adminProductListServlet";
		}
	} */
	
	//回显搜索的商品分类和商品是否热门
	window.onload = function(){
		//商品分类
		var cid = "${condition.cid}";
		var sc = document.getElementById("scid");
		var options = sc.getElementsByTagName("option");
		for(var i=0;i<options.length;i++){
			if(options[i].value==cid){
				options[i].selected=true;
			}
		}
		
		//是否热门
		var is_hot = "${condition.is_hot}";
		var si = document.getElementById("sis_hot");
		var options_si = si.getElementsByTagName("option");
		for(var i=0;i<options_si.length;i++){
			if(options_si[i].value==is_hot){
				options_si[i].selected=true;
			}
		}
		
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
	
</script>

<title>Insert title here</title>
</head>
<body bgcolor="antiquewhite">

	<table width="75%" align="center" cellpadding="0px" cellspacing="0px"
		border="1px">
		<caption>商品列表</caption>
		
		<tr>
			<td colspan="7" align="right"><button onclick="addProduct()">添加商品</button></td>
		</tr>

		<tr>
			<form action="${pageContext.request.contextPath }/admin/adminSearchProductList" method="post">
			<td align="left" colspan="7" width="100%">
					商品名称<input type="text" name="pname" value="${condition.pname }"}">
					是否热门<select name="is_hot" id="sis_hot">
							<option value="">--请选择--</option>
							<option value="1">是</option>
							<option value="0">否</option>
							</select>
					商品分类<select name="cid" id="scid">
							<option value="">--请选择--</option>
							<c:forEach items="${category }" var="cat">
								<option value="${cat.cid }">${cat.cname }</option>
							</c:forEach>
							</select>
					<input type="submit" value="搜索">
				</form>
			</td>
		</tr>
		<!-- 序号	图片	名称	门店价格	是否热门	编辑	删除 -->
		<tr>
			<td align="center">序号</td>
			<td align="center">图片</td>
			<td align="center">名称</td>
			<td align="center">门店价格</td>
			<td align="center">是否热门</td>
			<td align="center">编辑</td>
			<td align="center">删除</td>
		</tr>
		<!-- 通过request域对象将productlist展示到jsp页面 -->
		<form action="${pageContext.request.contextPath }/admin/adminDeleteAllProduct" method="post">
		<c:forEach items="${productlist }" var="pro" varStatus="vs">
			<tr>
				<td align="center">${vs.count }</td>
				<td align="center">
					<img src="${pageContext.request.contextPath }/images/${pro.pimage}" width="40px" height="45px">
				</td>
				<td align="center">${pro.pname }</td>
				<td align="center">${pro.shop_price }</td>
				<td align="center">${pro.is_hot==1?"是":"否" }</td>
				<td align="center">
					<a href="${pageContext.request.contextPath }/admin/adminShowEditProduct/${pro.pid}">编辑</a>
				</td>
				<td align="center">
					<a href="javascript:void(0)" onclick="deletePro(${pro.pid})">删除</a>
					<input type="checkbox" name="checkOne" value="${pro.pid }">
				</td>	
			</tr>
		</c:forEach>
		<tr>
			<td colspan="7" align="right">
				<input type="checkbox" name="checkAll">全选/全不选 &nbsp; &nbsp;
				<input type="submit" value="删除"> 
			</td>
		</tr>
		</form>
	</table>
</body>
</html>