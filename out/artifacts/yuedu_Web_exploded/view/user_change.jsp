<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Personal Library - Codrops Template</title>
    <meta name="description" content="A responsive web app template with common components like profile, list, tabs, menu views. Made for Codrops exclusively.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user-css/output.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user-css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user-css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user-css/form.css">
</head>
<body class="bg-grey-lighter font-sans antialiased">
<header class="header">
    <div class="header-inner body-width">
        <a href="#" class="logo"></a>
        <div class="category">
            <a class="category-link">分类</a>
            <i class="icon-arrow"></i>
            <div class="drop_con">
                <a>哈哈哈哈</a>
                <a>hhhhh</a>
            </div>
            <div class="category-result"></div>
            <!-- 边框 -->
            <span class="btn-border"></span>
            <span class="result-border"></span>
            <span class="neck-border"></span>
        </div>
        <div class="search">
            <input type="text" class="search-text" placeholder="Seach here${pageContext.request.contextPath}/static.">
            <button class="search-btn"><i class="icon-search"></i></button>
        </div>
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
                    <a class="app" style="cursor:pointer">用户名</a>
                </li>
                <li>
                    <span class="line"></span>
                    <a class="app" style="cursor:pointer">退出</a>
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
<div class="flex" >
    <!-- Side Nav -->
    <nav class="absolute lg:relative lg:flex lg:text-sm bg-indigo-darker lg:bg-transparent pin-l pin-r py-4 px-6 lg:pt-10 lg:pl-12 lg:pr-6 -mt-1 lg:mt-0 overflow-y-auto lg:w-1/5 lg:border-r z-40 hidden">
        <ul class="list-reset mb-8 w-full">
            <li class="item" style="padding-bottom:20px;padding-left:15px;">
                <a href="#" class="pic" style=" background: url(${pageContext.request.contextPath}/static/image/user-image/user_img1.jpg) no-repeat; background-size: cover; "></a>
                <a href="#" class="headImg"><img style="border-radius: 50%;overflow:hidden" src="${pageContext.request.contextPath}/static/image/user-image/head_img1.jpeg" alt="#"></a>
                <div class="info" style="padding-left:20px;">
                    <a href="#" class="info-title">用户名</a>
                    <p><i class="icon-star"></i>45人关注</p>
                </div>
            </li>
            <li class="ml-2 mb-4 flex">
                <img src="http://demo.cssmoban.com/cssthemes6/tymp_11_libre/images/home-default.svg" alt="home-icon" class="w-4 h-4 mr-2">
                <div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium mobile-home-trigger">返回首页</div>
            </li>
            <li class="ml-2 mb-4">
                <div class="flex" id="sidenav-categories-trigger">
                    <img src="http://demo.cssmoban.com/cssthemes6/tymp_11_libre/images/category-default.svg" alt="home-icon" class="w-4 h-4 mr-2">
                    <div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium w-full relative">
                        我的账户
                    </div>
                </div>
                <ul class="text-grey lg:text-grey-dark list-reset leading-loose mt-2" id="sidenav-categories">
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4" style="color:black">修改信息</li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4">我的评论</li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4">我的读后感</li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4">我的消息</li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4">我的关注</li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4">我的粉丝</li>
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
            <h4 class="hidden md:inline-block text-grey-dark font-medium">你的信息：</h4>
            <div>
                <div class="inline-block md:hidden no-underline border-indigo pb-2 px-2 text-sm mr-2 text-indigo-darkest hover:cursor-pointer js-tab relative"
                     data-tab="section-stats">Stats</div>

                <div class="no-underline inline-block border-indigo pb-2 px-2 text-sm text-indigo-darkest hover:cursor-pointer js-tab relative"
                     data-tab="section-picks">Picks for you</div>
            </div>
        </div>
        <!-- Library -->
        <div class="hidden px-2 pt-2 md:px-0 flex-wrap order-2 pb-8 js-tab-pane active" id="section-library">
            <form id="payment">
                <fieldset>
                    <legend>用户详细资料</legend>
                    <ol>
                        <li class="item">
                            <a href="#" class="pic" style=" background: url(${pageContext.request.contextPath}/static/image/user-image/user_img1.jpg) no-repeat; background-size: cover; "></a>
                            <a href="#" class="headImg"><img style="border-radius: 50%;overflow:hidden" src="${pageContext.request.contextPath}/static/image/user-image/head_img1.jpeg" alt="#"></a>
                        </li>
                        <li>
                            <label for="name">用户名：</label>
                            <input id="name" name="name" type="text" placeholder="请输入用户名" required autofocus>
                        </li>
                        <li>
                            <label for="password">密码：</label>
                            <input id="email" name="email" type="text" placeholder="请输入新密码" required>
                        </li>
                        <li>
                            <label for="sex">性别：</label>
                            <select name="sex" id="name">
                                <option value=""></option>
                                <option value="">男</option>
                                <option value="">女</option>
                            </select>
                        </li>
                        <li>
                            <label for="email">邮箱地址：</label>
                            <input id="email" name="email" type="email" placeholder="example@163.com" required>
                        </li>
                    </ol>
                </fieldset>
                <fieldset>
                    <button type="submit">确认并提交</button>
                </fieldset>
            </form>
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
工程实训第四组--"悦读"网
</body>
<script src="bundle.js" async defer></script>
</html>