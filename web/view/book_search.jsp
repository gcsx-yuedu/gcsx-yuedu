<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="po.ZYM.ZBook" %>
<%@ page import="po.ZYM.ZBookType" %>
<%@ page import="po.ZYM.ZBookShelf" %>
<%@ page import="service.ZYM.ZBookService" %>
<%@ page contentType="text/html;charset=utf-8"%>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>BookSearch</title>
    <meta name="description" content="A responsive web app template with common components like profile, list, tabs, menu views. Made for Codrops exclusively.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/book-css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/book-css/output.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/book-css/index.css">
</head>
<body class="bg-grey-lighter font-sans antialiased">
<%
    String wenzi = request.getParameter("wenzi");
    int count = (int)session.getAttribute("count");
    List<ZBook> books =(List<ZBook>)session.getAttribute("books");
    List<ZBookType> types = (List<ZBookType>)session.getAttribute("types");
//    ZBookShelf shel = (ZBookShelf)session.getAttribute("shel");
//    Integer u_id = (Integer)session.getAttribute("userId");
//    System.out.println("u_id="+u_id);
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
                <input type="hidden" name="userId" value="<%= session.getAttribute("userId")==null?"":session.getAttribute("userId") %>">
                <input type="text" name="wenzi" class="search-text" placeholder="Seach here..."value="<%= wenzi==null?"":wenzi %>" />
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
<!-- Main -->
<div class="flex" >
    <!-- Side Nav -->
    <nav class="absolute lg:relative lg:flex lg:text-sm bg-indigo-darker lg:bg-transparent pin-l pin-r py-4 px-6 lg:pt-10 lg:pl-12 lg:pr-6 -mt-1 lg:mt-0 overflow-y-auto lg:w-1/5 lg:border-r z-40 hidden">
        <ul class="list-reset mb-8 w-full">
            <li class="ml-2 mb-4 flex">
                <img src="http://demo.cssmoban.com/cssthemes6/tymp_11_libre/images/home-default.svg" alt="home-icon" class="w-4 h-4 mr-2">
                <div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium mobile-home-trigger"><a href="/home_page">返回首页</a></div>
            </li>
            <li class="ml-2 mb-4">
                <div class="flex" id="sidenav-categories-trigger">
                    <img src="http://demo.cssmoban.com/cssthemes6/tymp_11_libre/images/category-default.svg" alt="home-icon" class="w-4 h-4 mr-2">
                    <div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium w-full relative">
                        分类

                    </div>
                </div>
                <ul class="text-grey lg:text-grey-dark list-reset leading-loose mt-2" id="sidenav-categories">
                    <%
                        for (ZBookType type:types){
                            if (session.getAttribute("userId")==null) {%>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4">
                        <a href="/showBookByType0?t_id=<%=type.getT_id()%>&t_type=<%=type.getT_type()%>"> <%=type.getT_type()%></a>
                    </li>
                    <%}else{%>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4">
                        <a href="/showBookByType?t_id=<%=type.getT_id()%>&t_type=<%=type.getT_type()%>&userId=<%=session.getAttribute("userId")%>"> <%=type.getT_type()%></a>
                    </li>
                    <%}%>
                    <%}%>
                </ul>
            </li>
            <li class="ml-2 mb-4 flex">
                <img src="http://demo.cssmoban.com/cssthemes6/tymp_11_libre/images/wishlist-default.svg" alt="wishlist-icon" class="w-4 h-4 mr-2">
                <div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium mobile-home-trigger">我的书架</div>
            </li>
            <li class="ml-2 mb-4 flex lg:hidden">
                <img src="http://demo.cssmoban.com/cssthemes6/tymp_11_libre/images/profile-default.svg" alt="profile-icon" class="w-4 h-4 mr-2">
                <div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium" id="mobile-profile-trigger">Profile</div>
            </li>
        </ul>
    </nav>
    <!-- Content -->
    <div class="flex flex-1 flex-col md:px-6 pt-10" id="content">
        <!-- Title -->

        <!-- Desktop Stats -->

        <!-- Filter -->
        <div class="px-6 md:px-0 flex items-baseline justify-between border-b-2 border-grey-light mt-6 order-0 lg:order-1">
            <h4 class="hidden md:inline-block text-grey-dark font-medium">找到相关书籍<%=count%>本：</h4>
            <div>
                <div class="inline-block md:hidden no-underline border-indigo pb-2 px-2 text-sm mr-2 text-indigo-darkest hover:cursor-pointer js-tab relative"
                     data-tab="section-stats">Stats</div>

                <div class="no-underline inline-block border-indigo pb-2 px-2 text-sm text-indigo-darkest hover:cursor-pointer js-tab relative"
                     data-tab="section-picks">Picks for you</div>
            </div>
        </div>
        <!-- Library -->
        <div class="hidden px-2 pt-2 md:px-0 flex-wrap order-2 pb-8 js-tab-pane active" id="section-picks">
            <ul>
                <%
                    for (ZBook book:books){
                        String typeList=org.apache.commons.lang.StringUtils.strip(book.getTypeList().toString(),"[]");
                %>
                <li class=" flex items-baseline justify-between border-b-2 border-grey-light">
                    <div class="flex flex-row sm:flex-row items-center sm:items-start w-full xs:w-1/2 sm:w-1/3 md:w-full p-4 js-book">
                        <img src="<%=book.getB_cover()%>" alt="book-01" class="w-1/3 sm:w-1/5 shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo">
                        <div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/2 sm:w-1/3 md:w-1/10 p-4 js-book"></div>

                        <div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
                            <p class="text-xl my-2 font-medium sm:font-normal">《<%=book.getB_name()%>》</p>
                            <p class="text-l my-2 font-medium sm:font-normal">&nbsp;作者：<%=book.getB_author()%></p>
                            <p class="text-sm my-2 font-medium sm:font-normal">&nbsp;类型：<%=typeList%>
                            </p>
                            <button onclick="window.location.href='/book_infor?b_id=<%=book.getB_id()%>'" class="shadow-md mt-3 bg-grey-lightest hover:bg-white text-indigo-darker text-xs py-2 px-4 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none">去看看</button>&nbsp;
                            <%
                                System.out.println("主count 1或0："+book.getCounts());
                                if (book.getCounts()==0){%>
                            <button onclick="window.location.href='javascript:btnAddToShelf(\'<%=book.getB_id()%>\',<%=session.getAttribute("userId")%>)'" class="shadow-md mt-3 bg-grey-lightest hover:bg-white text-indigo-darker text-xs py-2 px-4 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none">添加到书架</button></a>
                            <%}else{%>
                            <button class="shadow-md mt-3 bg-grey-lightest hover:bg-white text-indigo-darker text-xs py-2 px-4 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none">已在我的书架</button></a>
                            <%}%>
                        </div>
                    </div>
                </li>
                <% }%>
            </ul>
        </div>
    </div>

    <!-- Profile -->
    <div class="hidden absolute pin-b z-10 lg:relative lg:block w-full lg:w-1/5 bg-grey-lighter-2 px-6 pt-10" id="profile">
        <div class="flex items-center mb-6">
            <svg width="60px" height="60px" viewBox="0 0 60 60" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"id="avatar">
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                    <g transform="translate(-1178.000000, -87.000000)">
                        <g transform="translate(1159.000000, 0.000000)">
                            <g transform="translate(0.000000, 87.000000)">
                                <g transform="translate(19.000000, 0.000000)">
                                    <circle id="small-circle" fill="#5661B3" cx="30" cy="30" r="30"></circle>
                                    <path id="moon" d="M30.5,49.7304688 C40.7172679,49.7304688 30.5,43.266096 30.5,33.0488281 C30.5,22.8315603 40.7172679,12 30.5,12 C20.2827321,12 11.0390625,20.6479665 11.0390625,30.8652344 C11.0390625,41.0825022 20.2827321,49.7304688 30.5,49.7304688 Z"
                                          fill="#F4E1E0"></path>
                                    <circle id="big-circle" fill="#070707" cx="31" cy="31" r="11"></circle>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
            </svg>
            <div class="ml-3">
                <p>欢迎回来</p>
                <p class="text-grey-dark mt-1 text-sm">Joined since 2017</p>
            </div>
        </div>
        <div class="my-4 border-t pt-4">
            <h3 class="text-indigo-dark font-normal">You have read <strong>4 of 30 books</strong></h3>
            <div class="flex flex-wrap -ml-2 justify-start items-center">
                <img src="http://demo.cssmoban.com/cssthemes6/tymp_11_libre/images/read-01.jpg" alt="read" class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block m-2 transition-normal hover:brighter">
                <img src="http://demo.cssmoban.com/cssthemes6/tymp_11_libre/images/book-01.jpg" alt="read" class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block m-2 transition-normal hover:brighter">
                <img src="http://demo.cssmoban.com/cssthemes6/tymp_11_libre/images/read-03.jpg" alt="read" class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block m-2 transition-normal hover:brighter">
                <img src="http://demo.cssmoban.com/cssthemes6/tymp_11_libre/images/read-04.jpg" alt="read" class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block m-2 transition-normal hover:brighter">
            </div>
        </div>
        <div class="mt-6">
            <p class="text-grey-dark mt-1 text-sm">猜你喜欢</p>
            <div class="flex items-start mt-2">
                <img src="http://demo.cssmoban.com/cssthemes6/tymp_11_libre/images/book-01.jpg" alt="read" class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block transition-normal hover:brighter">
                <div class="ml-3">
                    <p class="mt-1 leading-normal text-sm">三国演义</p>
                    <p class="mt-1 leading-normal text-xs">(罗贯中)</p>
                </div>
            </div>
            <div class="flex items-start mt-2">
                <img src="http://demo.cssmoban.com/cssthemes6/tymp_11_libre/images/book-01.jpg" alt="read" class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block transition-normal hover:brighter">
                <div class="ml-3">
                    <p class="mt-1 leading-normal text-sm">三国演义</p>
                    <p class="mt-1 leading-normal text-xs">(罗贯中)</p>
                </div>
            </div>
            <div class="flex items-start mt-2">
                <img src="http://demo.cssmoban.com/cssthemes6/tymp_11_libre/images/book-01.jpg" alt="read" class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block transition-normal hover:brighter">
                <div class="ml-3">
                    <p class="mt-1 leading-normal text-sm">三国演义</p>
                    <p class="mt-1 leading-normal text-xs">(罗贯中)</p>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script src="${pageContext.request.contextPath}/static/js/book-js/bundle.js" async defer></script>
<script src="${pageContext.request.contextPath}/static/js/book-js/Zbund.js" async defer></script>
</html>
