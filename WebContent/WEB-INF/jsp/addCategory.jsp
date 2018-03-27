<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fanhui() {
		location.href="${pageContext.request.contextPath}/admin/fanhuiCategory";
	}
</script>
</head>
<body bgcolor="antiquewhite">
	<form action="${pageContext.request.contextPath }/admin/daleteCategory" method="post">
		<table width="35%" align="center" cellpadding="0px" cellspacing="0px" border="1px">
			<caption>添加分类</caption>
			<tr>
				<td align="center">商品分类</td>
				<td align="left"><input type="text" name="cname"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
					<font color="red">${message==null?"":message }</font>
					<button type="submit">确定</button>
					<button type="reset">重置</button>
					<button type="button" onclick="fanhui()">返回</button> 
				</td>
			</tr>
		</table>
		
	</form>
</body>
</html>