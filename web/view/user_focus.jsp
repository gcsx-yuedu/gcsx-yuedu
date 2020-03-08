<!DOCTYPE html>
<html class="no-js">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@page import="po.BSJ.*"  %>
<%@page import="po.ZYM.ZBookType"  %>
<%@ page import="service.BSJ.BUserService" %>
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Personal Library - Codrops Template</title>
    <meta name="description" content="A responsive web app template with common components like profile, list, tabs, menu views. Made for Codrops exclusively.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user-css/output.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user-css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user-css/index.css">
</head>
<body class="bg-grey-lighter font-sans antialiased">
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
                <% for(ZBookType ty:types){%>
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
                <li>
                    <span class="line"></span>
                    <span>欢迎 </span>
                    <a href="/user_info?u_id=<%=session.getAttribute("userId")%>" class="app" style="cursor:pointer"><%=session.getAttribute("userName")%></a>
                </li>
                <li>
                    <span class="line"></span>
                    <a href="/exit" class="app" style="cursor:pointer" style="cursor:pointer">退出</a>
                </li>
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
<div class="flex">
    <!-- Side Nav -->
    <nav class="absolute lg:relative lg:flex lg:text-sm bg-indigo-darker lg:bg-transparent pin-l pin-r py-4 px-6 lg:pt-10 lg:pl-12 lg:pr-6 -mt-1 lg:mt-0 overflow-y-auto lg:w-1/5 lg:border-r z-40 hidden">
        <ul class="list-reset mb-8 w-full">
            <li class="item" style="padding-bottom:20px;padding-left:15px;">
                <a href="#" class="pic" style=" background: url(${pageContext.request.contextPath}/static/image/user-image/user_img1.jpg) no-repeat; background-size: cover; "></a>
                <a href="#" class="headImg"><img style="border-radius: 50%;overflow:hidden" src="${pageContext.request.contextPath}/static/image/user-image/head_img1.jpeg" alt="#"></a>
                <div class="info" style="padding-left:20px;">
                    <a href="#" class="info-title"><%=session.getAttribute("userName")%></a>
                    <p><i class="icon-star"></i><%=session.getAttribute("countFans")%>人关注</p>
                </div>
            </li>
            <li class="ml-2 mb-4 flex">
                <img src="http://demo.cssmoban.com/cssthemes6/tymp_11_libre/images/home-default.svg" alt="home-icon" class="w-4 h-4 mr-2">
                <div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium mobile-home-trigger"><a href="/home_page">返回首页</a></div>
            </li>
            <li class="ml-2 mb-4">
                <div class="flex" id="sidenav-categories-trigger">
                    <img src="http://demo.cssmoban.com/cssthemes6/tymp_11_libre/images/category-default.svg" alt="home-icon" class="w-4 h-4 mr-2">
                    <div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium w-full relative">
                        我的账户
                    </div>
                </div>
                <ul class="text-grey lg:text-grey-dark list-reset leading-loose mt-2" id="sidenav-categories">
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4"><a href="/user_change?u_id=<%=session.getAttribute("userId")%>">修改信息</a></li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4"><a href="/user_news?u_id=<%=session.getAttribute("userId")%>">我的消息</a></li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4"><a href="/user_focus?u_id=<%=session.getAttribute("userId")%>">我的关注/粉丝</a></li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4"><a href="/user_comment?u_id=<%=session.getAttribute("userId")%>">我的评论/读后感</a></li>
                </ul>
            </li>
            <li class="ml-2 mb-4 flex">
                <img src="http://demo.cssmoban.com/cssthemes6/tymp_11_libre/images/wishlist-default.svg" alt="wishlist-icon" class="w-4 h-4 mr-2">
                <div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium mobile-home-trigger"><a href="/user_info?u_id=<%=session.getAttribute("userId")%>">我的书架</a></div>
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
            <h4 class="hidden md:inline-block text-grey-dark font-normal">社交</h4>
            <div>
                <div class="inline-block md:hidden no-underline border-indigo pb-2 px-2 text-sm mr-2 text-indigo-darkest hover:cursor-pointer js-tab relative"
                     data-tab="section-stats">Stats</div>
                <div class="no-underline inline-block border-indigo pb-2 px-2 text-sm mr-2 text-indigo-darkest hover:cursor-pointer js-tab active relative"
                     data-tab="section-concern">我的关注</div>
                <div class="no-underline inline-block border-indigo pb-2 px-2 text-sm text-indigo-darkest hover:cursor-pointer js-tab relative"
                     data-tab="section-picks">我的粉丝</div>
            </div>
        </div>
        <!-- Library -->
        <div class="hidden px-2 pt-2 md:px-0 flex-wrap order-2 pb-8 js-tab-pane active" id="section-concern">
            <%
                List<BConcernList> concernList = (List<BConcernList>)request.getAttribute("concernList");
                for(BConcernList bs : concernList){
            %>
            <div style="padding-left:50px;padding-bottom:30px;">
                <a href="#" class="headImg"><img style="border-radius: 50%;overflow:hidden" src="${pageContext.request.contextPath}/static/image/user-image/head_img1.jpeg" alt="#"></a>
                <ul>
                    <li>
                        <div class="info" style="padding-left:20px;padding-right:100px;">
                            <a href="#" class="info-title"><%=bs.getConcernList().getU_name()%></a>
                            <p><i class="icon-star"></i><%=bs.getCountFans()%>人关注</p>
                        </div>
                        <a href="/cancelguanzhu?guanzhu_userid=<%=bs.getConcernList().getU_id()%>&&u_id=<%=session.getAttribute("userId")%>" class="icon-text__pink register" style="width:80px">取消关注</a>
                    </li>
                </ul>
            </div>
            <%}%>
        </div>

        <!-- picks -->
        <div class="hidden flex-wrap order-2 pt-0 md:pt-6 md:pb-8 js-tab-pane" id="section-picks">
            <%
                List<BFansList> fansList = (List<BFansList>)request.getAttribute("fansList");
                for(BFansList ss : fansList){
            %>
            <div style="padding-left:50px;padding-bottom:30px;">
                <a href="#" class="headImg"><img style="border-radius: 50%;overflow:hidden" src="${pageContext.request.contextPath}/static/image/user-image/head_img1.jpeg" alt="#"></a>
                <ul>
                    <li>
                        <div class="info" style="padding-left:20px;padding-right:100px;">
                            <a href="#" class="info-title"><%=ss.getFansList().getU_name()%></a>
                            <p><i class="icon-star"></i><%=ss.getCountFans()%>人关注</p>
                        </div>
                        <%
                            if(ss.getCount()==0){
                        %>
                        <a href="/guanzhu?u_id=<%=session.getAttribute("userId")%>&&user_id=<%=ss.getFansList().getU_id()%>" class="icon-text__pink register" style="width:80px">关注</a>
                        <%}else{%>
                        <a class="icon-text__pink register" style="width:80px">互相关注</a>
                        <%}%>
                    </li>
                </ul>
            </div>
            <%}%>
        </div>

    </div>

    <!-- Profile -->
    <div class="hidden absolute pin-b z-10 lg:relative lg:block w-full lg:w-1/5 bg-grey-lighter-2 px-6 pt-10" id="profile">
        <div class="flex items-center mb-6">
            <svg width="60px" height="60px" viewBox="0 0 60 60" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                 id="avatar">
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
工程实训第四组--"悦读"网
</body>
<script src="${pageContext.request.contextPath}/static/js/user-js/bundle.js" async defer></script>
</html>
