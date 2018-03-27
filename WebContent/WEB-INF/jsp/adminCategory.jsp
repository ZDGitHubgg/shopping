<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function deleteCat(cid) {
		var result = confirm("确定要删除吗？")
		if(result){
			location.href="${pageContext.request.contextPath}/admin/adminDeleteCategory/"+cid;	
		}
	}
	function addProduct() {
		location.href="${pageContext.request.contextPath}/admin/toCategory";
	}

	//全选与全不选
	window.onload = function(){
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

</head>
<body bgcolor="antiquewhite">
	<form action="${pageContext.request.contextPath }/admin/deleteCategory" method="post">
	<table width="50%" align="center" cellpadding="0px" cellspacing="0px"
		border="1px">
		<caption>商品分类列表</caption>
		
		<tr>
			<td colspan="3" align="right"><button onclick="addProduct()">添加分类</button></td>
		</tr>
		
		<tr>
			<td align="center">序号</td>
			<td align="center">分类</td>
			<td align="center">删除</td>
		</tr>
			<c:forEach items="${category }" var="cat" varStatus="vs">
			<tr>
				<td align="center">${vs.count }</td>
				<td align="center">${cat.cname }</td>
				<td align="center">
					<a href="javascript:void(0)" onclick="deleteCat('${cat.cid}')">删除</a>
					<input type="checkbox" name="checkOne" value="${cat.cid }">
				</td>	
			</tr>
			</c:forEach>
			
			<tr>
			<td colspan="3" align="right">
				<div style="width: 30%" align="right">
					<input type="checkbox" name="checkAll">全选/全不选 &nbsp; &nbsp;
					<input type="submit" value="删除">
				</div>
			</td>
			</tr>
	</table>
	</form>
</body>
</html>