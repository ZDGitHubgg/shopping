<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<script type="text/javascript">
	function changeImg(obj) {
		//点击图片，更换验证码
		obj.src="/shopping/check.action?time="+new Date().getTime();
	}	
	
	$(function(){
		$("#myform").validate({
			submitHandler : function() {
				//提交Ajax
				 $.ajax({
							data : $("#myform").serialize(),
							dataType : "json",
							type : "post",
							url : "${pageContext.request.contextPath }/user/dologin",
							success : function(rec) {
								if(rec=="1"){
									location.href = "${pageContext.request.contextPath }/user/showpro";
								}else if(rec=="0"){
									alert("用户名或密码错误!");
								}else if (rec=="2") {
									alert("验证码错误！");
								}else if (rec=="3") {
									alert("请输入验证码！");
								}	
							}
						}); 
			}
			
		});
	});
</script>

</head>
<body bgcolor="antiquewhite">
		<p style="font-size: 30px;font-style: italic;color: brown;"align="center">
			用户登录
		</p>
		<form id="myform" >
			<table align="center">
				<tr>
					<td align="right">
						用户名:
					</td>
					<td align="left">
						<input type="text" name="username"/>
					</td>
				</tr>
				<tr>
					<td align="right">
						密码:
					</td>
					<td align="left">
						<input type="password" name="password"/>
					</td>
				</tr>
				<tr>
					<td align="right">验证码:</td>
					<td width="50%"><input type="text" name="checkcode"/>
						<img onclick="changeImg(this)" src="${pageContext.request.contextPath }/check.action">
					</td>
				</tr>
			</table>
			</table>
			<br />
			<div align="center">
				<input type="reset" value="重置" />
				<input type="submit" value="登录" />
			</div>
		</form>
		<br />
		<div align="center">
			<a href="${pageContext.request.contextPath }/toindex">返回首页</a>
		</div>
	</body>
</html>