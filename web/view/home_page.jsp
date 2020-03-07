<!DOCTYPE html>
<%@ page language="java" import="po.ZYM.ZBookType" pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=utf-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Home</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/home-css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/home-css/index.css">
</head>
<body>
<%  String wenzi = request.getParameter("wenzi");
	List<ZBookType> types = (List<ZBookType>)session.getAttribute("types");
%>
<header class="header">
<div class="header-inner body-width">
  <a href="#" class="logo"></a>
  <div class="category">
	<a class="category-link">分类</a>
	<i class="icon-arrow"></i>
	<div class="drop_con">
	<%for (ZBookType ty:types){%>
		<a href="/showBookByType?t_id=<%=ty.getT_id()%>&t_type=<%=ty.getT_type()%>"><%=ty.getT_type()%></a>
	<%}%>
    </div>
	<div class="category-result"></div>
	<!-- 边框 -->
	<span class="btn-border"></span>
	<span class="result-border"></span>
	<span class="neck-border"></span>
  </div>

	<form action="/book_search" method="post" id="myForm">
		<div class="search">
			<input type="text" class="search-text" placeholder="Seach here..."value="<%= wenzi==null?"":wenzi %>">
			<button class="search-btn"><i class="icon-search"></i></button>
		</div>
	</form>
  <nav class="header-nav">
	<ul>
	  <li>
		<span class="line"></span>
		<a href="#" class="dreamer">悦读</a>
		<i class="icon-text__pink icon-new">new</i>
	  </li>
		<%
			String userName = (String)session.getAttribute("userName");
		    if (userName==null){
		%>
		<li>
			<span class="line"></span>
			<a href="${pageContext.request.contextPath}/view/sign-up-yh.jsp" class="icon-text__pink register">登录</a>
		</li>
			<%}else{%>
		<li>
			<span class="line"></span>
			<span>欢迎 </span>
			<a href="/user_info?u_id=<%=session.getAttribute("userId")%>" class="app" style="cursor:pointer"><%=userName%></a>
		</li>
		<li>
			<span class="line"></span>
			<a href="/home_page" class="app" style="cursor:pointer" style="cursor:pointer">退出</a>
		</li>
			<%}%>

	  <li>
		<span class="line"></span>
		<i class="icon-app"></i>
		<a href="#" class="app">手机版</a>
		<i class="icon-arrow"></i>
		<div class="app-hover">
		  <a href="#"></a>
		  <p>扫一扫下载手机客户端</p>
		</div>
	  </li>
	</ul>
  </nav>
</div>
<div class="header-shadow"></div>
</header>

<div class="main">
<div class="main-inner body-width">
  <div class="banner clearfix">
	<div class="slider" id="slider">
	  <ul class="slider-wrapper">
		<li class="item" data-title="这位上神！速速到我的本子里来">
		  <a href="#" class="pic"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/slider_img1.jpg" alt="#"></a>
		</li>
		<li class="item" data-title="想换上新衣去旅行！" data-author="by 占秋">
		  <a href="#" class="pic"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/slider_img2.jpg" alt="#"></a>
		</li>
		<li class="item" data-title="你的书写工具需要一个庇护所" data-author="by Moollly">
		  <a href="#" class="pic"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/slider_img3.jpg" alt="#"></a>
		</li>
		<li class="item" data-title="气温起伏，一件外套保护你" data-author="by 郑南音">
		  <a href="#" class="pic"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/slider_img4.jpg" alt="#"></a>
		</li>
		<li class="item" data-title="鲜为人知的泰国小众小城——董里">
		  <a href="#" class="pic"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/slider_img5.jpg" alt="#"></a>
		</li>
	  </ul>
	  <a href="javascript:;" class="slider-prev"></a>
	  <a href="javascript:;" class="slider-next"></a>
	  <div class="slider-title">
		<h2></h2>
		<span></span>
	  </div>
	  <div class="slider-btns">
		<span class="item"></span>
		<span class="item"></span>
		<span class="item"></span>
		<span class="item"></span>
		<span class="item"></span>
	  </div>
	</div>
	<div class="banner-info">
	  <div class="news body-border">
		<ul>
		  <li class="title">社区热点</li>
		  <li class="link">
			<a href="#">今天你健康打卡了吗</a>
			<span></span>
			<a>作者</a>
			<span></span>
			<a>时间</a>
		  </li>
		  <li class="link">
			<a href="#">『人气连衣裙精选』 大合集</a>
			<span></span>
			<a>作者</a>
			<span></span>
			<a>时间</a>
		  </li>
		  <li class="link">
			<a href="#">今天你健康打卡了吗</a>
			<span></span>
			<a>作者</a>
			<span></span>
			<a>时间</a>
		  </li>
		  <li class="link">
			<a href="#">今天你健康打卡了吗</a>
			<span></span>
			<a>作者</a>
			<span></span>
			<a>时间</a>
		  </li>
		</ul>
	  </div>
	  <div class="app body-border"><a href="https://www.duitang.com/"></a></div>
	</div>
  </div>
  <div class="main-cont main-recommend">
	<div class="main-cont__title">
	  <h3>猜你喜欢</h3>
	</div>
	<ul class="main-cont__list clearfix">
	  <li class="item">
		<a href="#" class="pic"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/main_img6.jpg" alt="#"></a>
		<div class="info">
		  <a href="#" class="title">书名   by 作者</a>
		  <span>***人收藏</span>
		  <a href="#" class="icon-text__pink purchase">去看看</a>
		</div>
	  </li>
	  <li class="item">
		<a href="#" class="pic"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/main_img7.jpg" alt="#"></a>
		<div class="info">
		  <a href="#" class="title">书名   by 作者</a>
		  <span>***人收藏</span>
		  <a href="#" class="icon-text__pink purchase">去看看</a>
		</div>
	  </li>
	  <li class="item">
		<a href="#" class="pic"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/main_img8.jpg" alt="#"></a>
		<div class="info">
		  <a href="#" class="title">书名   by 作者</a>
		  <span>***人收藏</span>
		  <a href="#" class="icon-text__pink purchase">去看看</a>
		</div>
	  </li>
	  <li class="item">
		<a href="#" class="pic"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/main_img9.jpg" alt="#"></a>
		<div class="info">
		  <a href="#" class="title">书名   by 作者</a>
		  <span>***人收藏</span>
		  <a href="#" class="icon-text__pink purchase">去看看</a>
		</div>
	  </li>
	  <li class="item">
		<a href="#" class="pic"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/main_img10.jpg" alt="#"></a>
		<div class="info">
		  <a href="#" class="title">书名   by 作者</a>
		  <span>***人收藏</span>
		  <a href="#" class="icon-text__pink purchase">去看看</a>
		</div>
	  </li>
	</ul>
  </div>
  <div class="main-cont main-recommend">
	<div class="main-cont__title">
		<h3>单品推荐</h3>
	  <p class="list">


	  </p>
	</div>
	<ul class="main-cont__list clearfix">
	  <li class="item">
		<a href="#" class="pic"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/main_img6.jpg" alt="#"></a>
		<div class="info">
		  <a href="#" class="title">书名   by 作者</a>
		  <span>***人收藏</span>
		  <a href="#" class="icon-text__pink purchase">去看看</a>
		</div>
	  </li>
	  <li class="item">
		<a href="#" class="pic"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/main_img7.jpg" alt="#"></a>
		<div class="info">
		  <a href="#" class="title">书名   by 作者</a>
		  <span>***人收藏</span>
		  <a href="#" class="icon-text__pink purchase">去看看</a>
		</div>
	  </li>
	  <li class="item">
		<a href="#" class="pic"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/main_img8.jpg" alt="#"></a>
		<div class="info">
		  <a href="#" class="title">书名   by 作者</a>
		  <span>***人收藏</span>
		  <a href="#" class="icon-text__pink purchase">去看看</a>
		</div>
	  </li>
	  <li class="item">
		<a href="#" class="pic"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/main_img9.jpg" alt="#"></a>
		<div class="info">
		  <a href="#" class="title">书名   by 作者</a>
		  <span>***人收藏</span>
		  <a href="#" class="icon-text__pink purchase">去看看</a>
		</div>
	  </li>
	  <li class="item">
		<a href="#" class="pic"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/main_img10.jpg" alt="#"></a>
		<div class="info">
		  <a href="#" class="title">书名   by 作者</a>
		  <span>***人收藏</span>
		  <a href="#" class="icon-text__pink purchase">去看看</a>
		</div>
	  </li>
	</ul>
  </div>
  <div class="main-cont main-user">
	<div class="main-cont__title">
	  <h3>达人推荐</h3>
	</div>
	<ul class="main-cont__list clearfix">
	  <li class="item">
		<a href="#" class="pic" style=" background: url(${pageContext.request.contextPath}/static/image/home-image/cont/user_img1.jpg) no-repeat; background-size: cover; "></a>
		<a href="#" class="headImg"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/head_img1.jpeg" alt="#"></a>
		<div class="info">
		  <a href="#" class="info-title">作者</a>
		  <p><i class="icon-star"></i>9645</p>
		  <p><b>***</b>人关注</p>
		</div>
	  </li>
	  <li class="item">
		<a href="#" class="pic" style=" background: url(${pageContext.request.contextPath}/static/image/home-image/cont/user_img2.jpg) no-repeat; background-size: cover; "></a>
		<a href="#" class="headImg"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/head_img2.jpeg" alt="#"></a>
		<div class="info">
		  <a href="#" class="info-title">作者</a>
		  <p><i class="icon-star"></i>9645</p>
		  <p><b>***</b>人关注</p>
		</div>
	  </li>
	  <li class="item">
		<a href="#" class="pic" style=" background: url(${pageContext.request.contextPath}/static/image/home-image/cont/user_img3.jpg) no-repeat; background-size: cover; "></a>
		<a href="#" class="headImg"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/head_img3.jpeg" alt="#"></a>
		<div class="info">
		  <a href="#" class="info-title">作者</a>
		  <p><i class="icon-star"></i>9645</p>
		  <p><b>***</b>人关注</p>
		</div>
	  </li>
	  <li class="item">
		<a href="#" class="pic" style=" background: url(${pageContext.request.contextPath}/static/image/home-image/cont/user_img4.jpg) no-repeat; background-size: cover; "></a>
		<a href="#" class="headImg"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/head_img4.jpeg" alt="#"></a>
		<div class="info">
		  <a href="#" class="info-title">作者</a>
		  <p><i class="icon-star"></i>9645</p>
		  <p><b>***</b>人关注</p>
		</div>
	  </li>
	  <li class="item">
		<a href="#" class="pic" style=" background: url(${pageContext.request.contextPath}/static/image/home-image/cont/user_img5.jpg) no-repeat; background-size: cover; "></a>
		<a href="#" class="headImg"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/head_img5.jpeg" alt="#"></a>
		<div class="info">
		  <<a href="#" class="info-title">作者</a>
		  <p><i class="icon-star"></i>9645</p>
		  <p><b>***</b>人关注</p>
		</div>
	  </li>
	</ul>
  </div>
</div>
</div>

<script src="${pageContext.request.contextPath}/static/js/home-js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/home-js/script.js"></script>

</body>
</html>