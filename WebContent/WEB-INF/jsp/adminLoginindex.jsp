<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function changeImg(obj) {
		obj.src="/shopping/check.action?time="+new Date().getTime();
	}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<script type="text/javascript">

		//表单校验
		$(function() {
			$("#myForm").validate({
								rules : {
									aname : "required",
									apassword : "required",
									checkcode : "required"
								},
								messages : {
									aname : "用户名不能为空",
									apassword : "密码不能为空",
									checkcode : "验证码不能为空"
								}
								
							});
		})

</script>
</head>
<body bgcolor="antiquewhite">
		<p style="font-size: 30px;font-style: italic;color: brown;"align="center">
			用户登录
		</p>
		<form id="myForm" action="${pageContext.request.contextPath }/admin/adminLogin.action" method="post">
			<table align="center">
				<tr>
					<td align="right">
						用户名:
					</td>
					<td align="left">
						<input type="text" name="aname"/>
					</td>
				</tr>
				<tr>
					<td align="right">
						密码:
					</td>
					<td align="left">
						<input type="password" name="apassword"/>
					</td>
				</tr>
				<!-- 验证码 -->
				<tr>
					<td align="right">验证码:</td>
					<td width="50%"><input type="text" name="checkcode"/>
						<img onclick="changeImg(this)" src="${pageContext.request.contextPath }/check.action">
						<font color="red">${message==null?"":message }</font>
					</td>
				</tr>
			</table>
			<br />
			<div align="center">
				<input type="reset" value="重置" />
				<input type="submit" value="登录" />
			</div>
		</form>
		<br />
		<div align="center">
			<a href="${pageContext.request.contextPath }/index.action">返回首页</a>
		</div>
	</body>
</html>