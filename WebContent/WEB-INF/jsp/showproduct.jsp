<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.zd.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>网上商城</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Shop-CSS.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ad.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>	
<style type="text/css">
#pageul li {
	font-size: 20px;
	margin-right: 10px;
}

#pageul a {
	color: black;
}
</style>

<script type="text/javascript">
	function searchfn(obj) {
		$.post(
				"${pageContext.request.contextPath}/user/search",
				{"word":obj.value},
				function(data){
					var content="";
					if(data!=null){
						//服务器返回的数据是一个json数组
						for(var i=0;i<data.length;i++){
							content+=
								"<div onmouseover='overfn(this)' onclick='clickfn(this)' onmouseout='outfn(this)'>"
								+data[i].pname+"</div>";
						}
						//设置div的开始和结束标签之间的html内容
						$("#searchContentDiv").html(content);
						$("#searchContentDiv").css("display","block");
					}
				},
				"json"
			);
	}
	
	function clickfn(obj){
		//获取obj这个div内的内容
		//$(obj).html()
		//val:是设置表单标签input的value属性的值
		$("#searchInput").val($(obj).html());	
		$("#searchContentDiv").css("display","none");
	}
	
	function overfn(obj) {
		$(obj).css("background-color","#999");
	}
	function outfn(obj) {
		$(obj).css("background-color","#FFF");
	}
</script>

</head>
<body>
	<div style="width: 30%;" align="center">
		<img id="adImg" src="${pageContext.request.contextPath}/images/img/ad.jpg" style="display: none;"
			width="100%" />
	</div>
	<div id="div1">
		<!--logo-->
		<div>
			<div id="div-left">
				<img src="${pageContext.request.contextPath}/images/img/mylogo.png" />
			</div>
			<div id="div-right">
				<a href="${pageContext.request.contextPath}/user/showcart/${user.uid }">购物车</a>
				<a href="${pageContext.request.contextPath}/user/logout">注销</a> 
				<a href="${pageContext.request.contextPath}/user/outlogin">退出</a>
				<a>欢迎你，<font color="red" size="2">${user.username }</font></a>
			</div>
			<!-- 清除浮动 -->
			<div class="clear"></div>
		</div>
		<!--导航栏-->
		<div id="div2">
			<div id="div2-left">
				<ul>
					<a href="${pageContext.request.contextPath }/toindex"><li>首页</li></a>
					<a href="${pageContext.request.contextPath }/user/searchbyphone"><li>手机</li></a>
					<a href="${pageContext.request.contextPath }/user/searchbycom"><li>电脑</li></a>
					<a href="${pageContext.request.contextPath }/user/searchbycloth"><li>衣服鞋帽</li></a>
				</ul>
			</div>
		<!-- 搜索栏 -->	
		<div style="float: right;">
			<div >
				<input id="searchInput" type="text" size="30px" onkeyup="searchfn(this)" />
				<button type="button" >搜索</button>
				<div style="position:relative;width:268px;">
						<div id="searchContentDiv" style="position:absolute;
							border:1px solid #999;width:223px;display: none;">	
						</div>
				</div>
			</div>
		</div>
							
		</div>
		<!--bannner-->
		<div>
			<img id="gbtimg" src="${pageContext.request.contextPath}/images/img/b1.jpg" width="100%" />
		</div>
		<!--必卖款logo-->
		<div>
			<img src="${pageContext.request.contextPath}/images/img/tittle1.png" width="100%" />
		</div>
		<!-- 分页后的商品列 -->
		<div style="width: 100%;">
			<c:forEach items="${pageBean.pageData }" var="pro">
				<div style="width: 25%; height: 210px; float: left; padding-top: 10px; text-align: center;">
					<a href="${pageContext.request.contextPath }/user/toprodesc/${pro.pid }">
					<img width="130px" height="130px"src="${pageContext.request.contextPath }/images/${pro.pimage }"></a><br>
					<p>${pro.pname }<br>${pro.shop_price }</p>
				</div>
			</c:forEach>
		</div>
		
		<div class="clear"></div>
		
		<div style="text-align: center;">
			<ul id="pageul">
				<!-- 上一页 -->
				<c:if test="${pageBean.currentPage!=1 }">
					<li><a href="${pageContext.request.contextPath }/user/showpro?currentPage=${pageBean.currentPage-1}">上一页</a></li>
				</c:if>
				<c:if test="${pageBean.currentPage==1 }">
					<li><a>上一页</a></li>
				</c:if>

				<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
					<c:if test="${page!=pageBean.currentPage }">
						<li><a href="${pageContext.request.contextPath }/user/showpro?currentPage=${page }">${page }</a></li>
					</c:if>
					<c:if test="${page==pageBean.currentPage }">
						<li><font size="6px">${page }</font></li>
					</c:if>
				</c:forEach>
				<!-- 下一页 -->
				<c:if test="${pageBean.currentPage!=pageBean.totalPage }">
					<li><a href="${pageContext.request.contextPath }/user/showpro?currentPage=${pageBean.currentPage+1}">下一页</a></li>
				</c:if>
				<c:if test="${pageBean.currentPage==pageBean.totalPage }">
					<li>下一页</li>
				</c:if>
			</ul>
		</div>

		<!--承诺书-->
		<div>
			<img src="${pageContext.request.contextPath}/images/img/bottom.png" width="100%" />
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
	</div>
</body>
</html>
