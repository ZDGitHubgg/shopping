<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function(){
		var cid = "${product.cid}";
		var sc = document.getElementById("scid");
		var options = sc.getElementsByTagName("option");
		for(var i=0;i<options.length;i++){
			if(options[i].value==cid){
				options[i].selected = true;
			}
		}
		
		var ih = "${product.is_hot}";
		var si = document.getElementById("sis_hot");
		var options_si = si.getElementsByTagName("option");
		for(var i=0;i<options_si.length;i++){
			if(options_si[i].value==ih){
				options_si[i].selected = true;
			}
		}
		
		
	}
	
	function fanhui() {
		location.href="${pageContext.request.contextPath}/admin/fanhui";
	}

</script>

</head>
<body bgcolor="antiquewhite">
	<form action="${pageContext.request.contextPath }/admin/adminEditProduct" method="post">
		<table width="50%" align="center" cellpadding="0px" cellspacing="0px" border="1px">
			<caption>编辑商品</caption>
			<input type="hidden" name="pid" value="${product.pid }" />
			<tr>
				<td align="center">商品名称</td>
				<td align="left"><input type="text" name="pname" value="${product.pname }"></td>
			</tr>
			<tr>
				<td align="center">商场价格</td>
				<td align="left"><input type="text" name="market_price" value="${product.market_price }"></td>
			</tr>
			<tr>
				<td align="center">门店价格</td>
				<td align="left"><input type="text" name="shop_price" value="${product.shop_price }"></td>
			</tr>
			<tr>
				<td align="center">商品图片</td>
				<td align="left"><input type="file" name="pimage"></td>
			</tr>
			<tr>
				<td align="center">所属分类</td>
				<td>
					<select name="cid" id="scid">
						<c:forEach items="${category }" var="cat">
							<option value="${cat.cid }">${cat.cname }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center">商品描述</td>
				<td align="left"><textarea rows="5" cols="40" name="pdesc">${product.pdesc }</textarea></td>
			</tr>
			<tr>
				<td align="center">是否热门</td>
				<td align="left">
					<select name="is_hot" id="sis_hot">
						<option value="1">是</option>
						<option value="0">否</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button type="submit">确定</button>
					<button type="reset">重置</button>
					<button type="button" onclick="fanhui()">返回</button> 
				</td>
			</tr>
		</table>
		<input type="hidden" name="pflag" value="1">
	</form>
</body>
</html>