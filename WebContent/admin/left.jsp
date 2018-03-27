<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/dtree.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/dtree.css">

</head>
<body bgcolor="antiquewhite">
<table width="100%" cellpadding="0px" cellspacing="0px">
	<tr>
		<td>
			<div>
				<!-- <a style="text-decoration: none;" href="javascript: d.openAll();">展开</a>　 -->
				<!-- <a style="text-decoration: none;" href="javascript: d.closeAll();">关闭</a> -->
				<button style="outline: none;" onclick="d.openAll()">展开</button>
				<button style="outline: none;" onclick="d.closeAll()">关闭</button>
				
				<script type="text/javascript">
						d = new dTree('d');
						d.add('01',-1,'商城后台管理');//01表示本级的编号  -1表示跟目录
						d.add('0101','01','分类管理模块');//第二个属性表示所属的父级的编号
						d.add('010101','0101','分类管理','${pageContext.request.contextPath}/admin/adminCategoryList','','right');//第四个属性，是该标签被敌机后请求资源的地址
						d.add('0102','01','商品管理模块');
						d.add('010201','0102','商品管理','${pageContext.request.contextPath}/admin/adminProductList','','right');//right指的是请求的资源显示在的目标frame的name。
						d.add('0103','01','用户管理模块');
						d.add('010301','0103','用户管理','${pageContext.request.contextPath}/admin/adminUserList','','right');
						d.add('0104','01','订单管理模块');
						d.add('010401','0104','订单管理','${pageContext.request.contextPath}/admin/adminOrderList','','right');
						document.write(d);
				</script>
			</div>
		</td>
	</tr>
</table>
</body>
</html>