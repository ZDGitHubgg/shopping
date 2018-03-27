<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上商城</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Shop-CSS.css" />	
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/ad.js">	
		</script>	
</head>
<body>
		<div id="div1">
			<!--logo-->
			<div>
				<div id="div-left">
					<img src="${pageContext.request.contextPath}/images/img/mylogo.png" />
				</div>
				<div id="div-right">
					<a href="${pageContext.request.contextPath }/admin/adminLoginindex.action">管理员登录</a>
					<a href="${pageContext.request.contextPath }/user/tologinindex.action">用户登录</a>
					<a href="${pageContext.request.contextPath }/user/toregister.action">注册</a>					
				</div>
			    <div class="clear"></div>
			</div>
			<!--导航栏-->
			<div id="div2" >
				<div id="div2-left">
					<ul>
					<a href="${pageContext.request.contextPath }/user/showpro"><li>首页</li></a>
					<a href="${pageContext.request.contextPath }/user/searchbyphone"><li>手机</li></a>
					<a href="${pageContext.request.contextPath }/user/searchbycom"><li>电脑</li></a>
					<a href="${pageContext.request.contextPath }/user/searchbycloth"><li>衣服鞋帽</li></a>
				</ul>
				</div>
				<!-- <div id="div2-right">
					<button >搜索</button>
					<input type="text" />
				</div> -->
			</div>
			<!--bannner-->
			<div>
				<img id="gbtimg" src="${pageContext.request.contextPath}/images/img/b1.jpg" width="100%"/>
			</div>
			<!--必卖款logo-->
			<div>
				<img src="${pageContext.request.contextPath}/images/img/tittle1.png" width="100%"/>
			</div>
			<!--必卖款商品-->
			<div>
				<div id="div-left" >
					<img src="${pageContext.request.contextPath}/images/img/banner_left.jpg" width="100%" height="380px"/>
				</div>
				<div id="div-right">
					<div class="pro">
						<img src="${pageContext.request.contextPath}/images/img/small02.jpg" />
					<p>显示器<br />￥999</p>
					</div>
					<div class="pro">
						<img src="${pageContext.request.contextPath}/images/img/small01.jpg" />
					<p>搅拌机<br />￥99</p>
					</div>
					<div class="pro">
						<img src="${pageContext.request.contextPath}/images/img/small03.jpg" />
					<p>电饭锅<br />￥199</p>
					</div>
					<div class="pro">
						<img src="${pageContext.request.contextPath}/images/img/small04.jpg" />
					<p>面包机<br/>￥299</p>
					</div>
					<div class="pro">
						<img src="${pageContext.request.contextPath}/images/img/small05.jpg" />
					<p>饮水机<br />￥999
					</p>
					</div>
					<div class="pro">
						<img src="${pageContext.request.contextPath}/images/img/small06.jpg" />
					<p>洗衣机<br />￥599</p>
					</div>
					<div class="pro">
						<img src="${pageContext.request.contextPath}/images/img/small08.jpg" />
					<p>高压锅<br />￥399</p>
					</div>
					<div class="pro">
						<img src="${pageContext.request.contextPath}/images/img/small09.jpg" />
					<p>微波炉<br />￥1999</p>
					</div>
				</div>
			</div>
			<!--生活电器logo-->
			<div>
				<img src="${pageContext.request.contextPath}/images/img/tittle2.png" width="100%"/>
			</div>
			<!--生活电器-->
			<div>
				<div id="div-left">
					<img src="${pageContext.request.contextPath}/images/img/banner_left2.jpg" width="100%" height="375px"/>
				</div>
				<div id="div-right">
					<div class="pro">
						<img src="${pageContext.request.contextPath}/images/img/small02.jpg" />
					<p>显示器<br />￥999</p>
					</div>
					<div class="pro">
						<img src="${pageContext.request.contextPath}/images/img/small01.jpg" />
					<p>
						搅拌机<br />￥99
					</p>
					</div>
					<div class="pro">
						<img src="${pageContext.request.contextPath}/images/img/small03.jpg" />
					<p>
						电饭锅<br />￥199
					</p>
					</div>
					<div class="pro">
						<img src="${pageContext.request.contextPath}/images/img/small04.jpg" />
					<p>
						面包机<br/>￥299
					</p>
					</div>
					<div class="pro">
						<img src="${pageContext.request.contextPath}/images/img/small05.jpg" />
					<p>
						饮水机<br />￥999
					</p>
					</div>
					<div class="pro">
						<img src="${pageContext.request.contextPath}/images/img/small06.jpg" />
					<p>
						洗衣机<br />￥599
					</p>
					</div>
					<div class="pro">
						<img src="${pageContext.request.contextPath}/images/img/small08.jpg" />
					<p>
						高压锅<br />￥399
					</p>
					</div>
					<div class="pro">
						<img src="${pageContext.request.contextPath}/images/img/small09.jpg" />
					<p>
						微波炉<br />￥1999
					</p>
					</div>
				</div>
			</div>
			<!--承诺书-->
			<div>
				<img src="${pageContext.request.contextPath}/images/img/bottom.png" width="100%" />
			</div>
			<!--超链接-->
			<div id="div3">
				<a href="">关于我们</a>
				<a href="">联系我们</a>
				<a href="">招贤纳士</a>
				<a href="">法律声明</a>
				<a href="">友情链接</a>
				<a href="">支付方式</a>
				<a href="">配送方式</a>
				<a href="">广告声明</a>
			</div>
			<!--版权-->
			<div id="div4">
				<p>Copyright ©2014-2018  网上商城  版权所有</p>
			</div>
		</div>
	</body>
</html>