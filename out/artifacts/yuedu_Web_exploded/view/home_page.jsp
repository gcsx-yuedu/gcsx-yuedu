<!DOCTYPE html>
<%@ page language="java" import="po.ZYM.ZBookType" pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="po.ZYM.ZLongComm" %>
<%@ page import="po.ZYM.ZUserList" %>
<%@ page import="po.ZYM.ZBook" %>
<%@ page import="po.DJX.DBook" %>
<%@ page contentType="text/html;charset=utf-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Home</title>
.
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/home-css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/home-css/index.css">
</head>
<body>
<%  String wenzi = request.getParameter("wenzi");
	List<ZBookType> types = (List<ZBookType>)session.getAttribute("types");
	List<ZLongComm> longComm=(List<ZLongComm>)session.getAttribute("longComm");
	List<ZUserList> userList = (List<ZUserList>)session.getAttribute("userList");
	List<ZBook> bookList = (List<ZBook>)session.getAttribute("bookList");
	List<DBook> recommendBookList = (List<DBook>)session.getAttribute("recommendBookList");
%>
<header class="header">
<div class="header-inner body-width">
  <a href="#" class="logo"></a>
  <div class="category">
	<a class="category-link">分类</a>
	<i class="icon-arrow"></i>
      <div class="drop_con">
          <%
              for (ZBookType ty:types){
                  if (session.getAttribute("userId")==null) {%>
          <a href="/showBookByType0?t_id=<%=ty.getT_id()%>&t_type=<%=ty.getT_type()%>"><%=ty.getT_type()%></a>
          <%}else{%>
          <a href="/showBookByType?t_id=<%=ty.getT_id()%>&t_type=<%=ty.getT_type()%>&userId=<%=session.getAttribute("userId")%>"> <%=ty.getT_type()%></a>
          <%}}%>
      </div>
	<div class="category-result"></div>
	<!-- 边框 -->
	<span class="btn-border"></span>
	<span class="result-border"></span>
	<span class="neck-border"></span>
  </div>
	<form action="/book_search" method="post" id="myForm">
		<div class="search">
			<input type="hidden" name="userId" value="<%= session.getAttribute("userId")==null?"":session.getAttribute("userId") %>">
			<input type="text" name="wenzi" class="search-text" placeholder="Seach here..."value="<%= wenzi==null?"":wenzi %>" />
			<button class="search-btn"><i class="icon-search"></i></button>
		</div>
	</form>
	<%--<%}%>--%>


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
			<a href="/exit" class="app" style="cursor:pointer" style="cursor:pointer">退出</a>
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
		  <%
			  for(int i=0;i<5;i++){
		  %>
		<li class="item" data-title="<%=bookList.get(i).getB_name()%>" data-author="by <%=bookList.get(i).getB_author()%>">
		  <a onclick="window.location.href='javascript:btnqukankan(\'<%=bookList.get(i).getB_id()%> \',<%=session.getAttribute("userId")%>)'" class="pic"><img src="<%=bookList.get(i).getB_cover()%>" alt="#" style="width:100%;height:100%;"></a>
		</li>
		  <%}%>
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
			<%for(int i=0;i<4;i++){
			%>
		  <li class="link">
			<a onclick="window.location.href='javascript:btnArticle(\'<%=longComm.get(i).getLc_id()%> \',<%=session.getAttribute("userId")%>)'" style="cursor:pointer"><%=longComm.get(i).getTitle()%></a>
			<span></span>
			<a><%=longComm.get(i).getLc_time()%></a>
			<span></span>
			<a><%=longComm.get(i).getLc_coment()%></a>
		  </li>
			<%}%>
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
		<%
			if(session.getAttribute("userId")==null){
				for(ZBook z:bookList){
		%>
	  <li class="item">
		<%--<a href="#" class="pic"><img src="<%=z.getB_cover()%>" style="width:100%;height:75%;" alt="#"></a>--%>
			<img src="<%=z.getB_cover()%>" style="width:100%;height:100%;" alt="#" onclick="window.location.href='javascript:btnqukankan(\'<%=z.getB_id()%>\',<%=session.getAttribute("userId")%>)'">
		<%--<div class="info">--%>
		  <%--&lt;%&ndash;<a href="#" class="title"><%=z.getB_name()%>   by <%=z.getB_author()%></a>&ndash;%&gt;--%>
		  <%--&lt;%&ndash;<span><%=z.getCounts()%>人收藏</span>&ndash;%&gt;--%>
		  <%--<a href="/book_infor?b_id=<%=z.getB_id()%>" class="icon-text__pink purchase">去看看</a>--%>
		<%--</div>--%>
	  </li>
		<%}}else{
				for(DBook r:recommendBookList){
		%>
		<li class="item">
			<img src="<%=r.getB_cover()%>" style="width:100%;height:100%;" alt="#" onclick="window.location.href='javascript:btnqukankan(\'<%=r.getB_id()%>\',<%=session.getAttribute("userId")%>)'">
		</li>
		<%}}%>
	</ul>
  </div>
  <div class="main-cont main-user">
	<div class="main-cont__title">
	  <h3>达人推荐</h3>
	</div>
	<ul class="main-cont__list clearfix">
		<%
			for(int i=0;i<=4;i++){
		%>
	  <li class="item">
		<a href="#" class="pic" style=" background: url(${pageContext.request.contextPath}/static/image/home-image/cont/user_img1.jpg) no-repeat; background-size: cover; "></a>
		<a href="#" class="headImg"><img src="${pageContext.request.contextPath}/static/image/home-image/cont/head_img1.jpeg" alt="#"></a>
		<div class="info">
		  <a href="#" class="info-title"><%=userList.get(i).getFansList().getU_name()%></a>
		  <p><i class="icon-star"></i><%=userList.get(i).getCountFans()%></p>
			<% if(userList.get(i).getCount()==0){%>
		    <p><a onclick="window.location.href='javascript:btnconcern(\'<%=userList.get(i).getFansList().getu_id()%>\',<%=session.getAttribute("userId")%>)'" class="icon-text__pink register" style="width:80px;cursor:pointer;">关注</a></p>
			<% }else if(userList.get(i).getCount()==-1){%>
			<p><a class="icon-text__pink register" style="width:80px">我</a></p>
			<%}else{%>
			<p><a class="icon-text__pink register" style="width:80px">已关注</a></p>
			<%}%>
		</div>
	  </li>
		<%}%>
	</ul>
  </div>
</div>
</div>

<script src="${pageContext.request.contextPath}/static/js/home-js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/home-js/script.js"></script>
<script src="${pageContext.request.contextPath}/static/js/book-js/Zbund.js" async defer></script>

</body>
</html>