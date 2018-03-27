<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fanhui() {
		location.href="${pageContext.request.contextPath}/admin/fanhui";
	}

	function upload(ele){
		document.getElementById("fileName").value = document.getElementById("file").value;
		if(ele.files[0].size>2097152){
			alert("文件不允许超过2M");
			$("#sendEmail").attr('disabled',true);  
		}else{
			$("#sendEmail").attr('disabled',false);
		}
	}
</script>
</head>
<body bgcolor="antiquewhite">
	<form action="${pageContext.request.contextPath }/admin/adminAddProduct" method="post" enctype="multipart/form-data">
		<table width="60%" align="center" cellpadding="0px" cellspacing="0px" border="1px">
			<caption>添加商品</caption>
			<tr>
				<td align="center">商品名称</td>
				<td align="left"><input type="text" name="pname"></td>
			</tr>
			<tr>
				<td align="center">商场价格</td>
				<td align="left"><input type="text" name="market_price"></td>
			</tr>
			<tr>
				<td align="center">门店价格</td>
				<td align="left"><input type="text" name="shop_price"></td>
			</tr>
			<tr>
				<td align="center">商品图片</td>
				<td align="left">
				<input type="text" name="pimage" id="fileName">
				<input type="file" name="file" id="file" onchange="upload(this)"></td>
			</tr>
			<tr>
				<td align="center">所属分类</td>
				<td>
					<select name="cid">
						<c:forEach items="${categorylist }" var="cat">
							<option value="${cat.cid }">${cat.cname }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center">商品描述</td>
				<td align="left"><textarea rows="5" cols="40" name="pdesc"></textarea></td>
			</tr>
			<tr>
				<td align="center">是否热门</td>
				<td align="left">
					<select name="is_hot">
						<option value="1">是</option>
						<option value="0">否</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<font color="red">${message==null?"":message }</font>
					<button type="submit" id="sendEmail">确定</button>
					<button type="reset">重置</button>
					<button type="button" onclick="fanhui()">返回</button> 
				</td>
			</tr>
		</table>
		
	</form>
</body>
</html>