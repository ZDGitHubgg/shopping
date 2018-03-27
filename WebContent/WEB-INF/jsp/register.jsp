<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>

<script type="text/javascript">
$(function(){
	$("#myform").validate({
		rules : {
			username : "required",
			password : "required",
			repwd : "required",
			email : "required",
			sex : "required",
			telephone : "required"		
		},
		messages : {
			username : "用户名不能为空",
			password : "密码不能为空",
			repwd : "确认密码不能为空",
			email : "邮箱不能为空",
			sex : "性别不能为空",
			telephone : "手机号码不能为空"
		}	
		
	});
});
</script>

</head>

<body bgcolor="antiquewhite">
		<p align="center" style="color: red;">${message==null?"":message }</p>
		<p style="font-size: 30px;font-style: italic;color: brown;"align="center"><b>用户注册</b></p>
		<form id="myform" action="${pageContext.request.contextPath }/user/register" method="post">
			<table align="center">
				<tr>
					<td align="right">
						用户名:
					</td>
					<td width="50%">
						<input type="text"  name="username"/>
					</td>
				</tr>
				<tr>
					<td align="right">
						密码:
					</td>
					<td >
						<input type="password" name="password"/>
					</td>
					<tr>
					<td align="right">
						确认密码:
					</td>
					<td >
						<input type="password"  name="repwd"/>
					</td>
				</tr>
				<tr>
					<td align="right">
						电子邮件:
					</td>
					<td >
						<input type="text" name="email"/>
					</td>
				</tr>
				<tr>
					<td align="right">
						性别:
					</td>
					<td >
						<input type="radio" name="sex" value="male"/>男
						<input type="radio" name="sex" value="female"/>女
						<label for="sex" class="error"></label><br />
					</td>
				</tr>
				<tr>
					<td align="right">
						手机号码:
					</td>
					<td align="left">
						<input type="text" placeholder="手机号码必须是11位数字" name="telephone"/>
					</td>
				</tr>
				
			</table>
			<div align="center">
				<input type="reset" value="重置" />
				<input type="submit" value="确定" />
			</div>
		</form>
		<br>
		<div align="center">
			<a href="${pageContext.request.contextPath }/toindex">返回首页</a>
			<a href="${pageContext.request.contextPath }/user/tologinindex.action">立即登录</a>
		</div>
	</body>
</html>