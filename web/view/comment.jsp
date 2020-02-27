<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<!doctype html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en-US"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en-US"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en-US"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en-US"> <!--<![endif]-->
<head>
    <!-- META TAGS -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>书评区</title>

    <!-- Style Sheet-->
    <link rel="stylesheet" href="style.css"/>
    <link rel='stylesheet' id='bootstrap-css-css'  href='${pageContext.request.contextPath}/static/css/comm-css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />

    <link rel='stylesheet' id='responsive-css-css'  href='${pageContext.request.contextPath}/static/css/comm-css/responsive5152.css?ver=1.0' type='text/css' media='all' />

    <link rel='stylesheet' id='pretty-photo-css-css'  href='${pageContext.request.contextPath}/static/js/comm-js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
    <link rel='stylesheet' id='main-css-css'  href='${pageContext.request.contextPath}/static/css/comm-css/main5152.css?ver=1.0' type='text/css' media='all' />

    <link rel='stylesheet' id='custom-css-css'  href='${pageContext.request.contextPath}/static/css/comm-css/custom5152.html?ver=1.0' type='text/css' media='all' />


    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/book_infor-css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/book_infor-css/index.css">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/static/js/comm-js/html5.js"></script></script>
    <![endif]-->

</head>

<body>

<!-- Start of Header -->
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
            <input type="text" class="search-text" placeholder="Seach here...">
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
                    <a href="#" class="icon-text__pink register">注册</a>
                </li>
                <li>
                    <span class="line"></span>
                    <a href="#">登录</a>
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
<!-- End of Header -->

<!-- Start of Search Wrapper -->
<!--<div class="search-area-wrapper">
        <div class="search-area container">
                <h3 class="search-header">长评区</h3>
                <p class="search-tag-line">If you have any question you can ask below or enter what you are looking for!</p>


        </div>
</div>-->
<!-- End of Search Wrapper -->

<!-- Start of Page Container -->
<div class="page-container">
    <div class="container">
        <div class="row">

            <!-- start of page content -->
            <div class="span8 main-listing">

                <div class="row separator">
                    <section class="span4 articles-list">
                        <h3><a href="#">Posting</a></h3>
                        <ul class="articles">
                            <li class="article-entry standard">
                                <h4><a href="${pageContext.request.contextPath}/view/article.jsp">Integrating WordPress with Your Website</a></h4>
                                <span class="article-meta">25 Feb, 2013 in </span>
                                <span class="like-count">66</span>
                            </li>
                            <li class="article-entry standard">
                                <h4><a href="article.jsp">WordPress Site Maintenance</a></h4>
                                <span class="article-meta">24 Feb, 2013 in </span>
                                <span class="like-count">15</span>
                            </li>
                            <li class="article-entry video">
                                <h4><a href="article.jsp">Meta Tags in WordPress</a></h4>
                                <span class="article-meta">23 Feb, 2013 in </span>
                                <span class="like-count">8</span>
                            </li>
                            <li class="article-entry image">
                                <h4><a href="article.jsp">WordPress in Your Language</a></h4>
                                <span class="article-meta">22 Feb, 2013 in </span>
                                <span class="like-count">6</span>
                            </li>
                            <li class="article-entry standard">
                                <h4><a href="article.jsp">Know Your Sources</a></h4>
                                <span class="article-meta">22 Feb, 2013 in </span>
                                <span class="like-count">2</span>
                            </li>
                            <li class="article-entry standard">
                                <h4><a href="article.jsp.html">Validating a Website</a></h4>
                                <span class="article-meta">21 Feb, 2013 in </span>
                                <span class="like-count">3</span>
                            </li>
                        </ul>
                    </section>


                    <!--<section class="span4 articles-list">
                            <h3>Latest Articles</h3>
                            <ul class="articles">
                                    <li class="article-entry standard">
                                            <h4><a href="single.html">Integrating WordPress with Your Website</a></h4>
                                            <span class="article-meta">25 Feb, 2013 in <a href="#" title="View all posts in Server &amp; Database">Server &amp; Database</a></span>
                                            <span class="like-count">66</span>
                                    </li>
                                    <li class="article-entry standard">
                                            <h4><a href="single.html">Using Javascript</a></h4>
                                            <span class="article-meta">25 Feb, 2013 in <a href="#" title="View all posts in Advanced Techniques">Advanced Techniques</a></span>
                                            <span class="like-count">18</span>
                                    </li>
                                    <li class="article-entry image">
                                            <h4><a href="single.html">Using Images</a></h4>
                                            <span class="article-meta">25 Feb, 2013 in <a href="#" title="View all posts in Designing in WordPress">Designing in WordPress</a></span>
                                            <span class="like-count">7</span>
                                    </li>
                                    <li class="article-entry video">
                                            <h4><a href="single.html">Using Video</a></h4>
                                            <span class="article-meta">24 Feb, 2013 in <a href="#" title="View all posts in WordPress Plugins">WordPress Plugins</a></span>
                                            <span class="like-count">7</span>
                                    </li>
                                    <li class="article-entry standard">
                                            <h4><a href="single.html">WordPress Site Maintenance</a></h4>
                                            <span class="article-meta">24 Feb, 2013 in <a href="#" title="View all posts in Website Dev">Website Dev</a></span>
                                            <span class="like-count">15</span>
                                    </li>
                                    <li class="article-entry standard">
                                            <h4><a href="single.html">WordPress CSS Information and Techniques</a></h4>
                                            <span class="article-meta">24 Feb, 2013 in <a href="#" title="View all posts in Theme Development">Theme Development</a></span>
                                            <span class="like-count">1</span>
                                    </li>
                            </ul>
                    </section>-->
                </div>

                <div id="pagination">
                    <a href="#" class="btn active">1</a>
                    <a href="#" class="btn">2</a>
                    <a href="#" class="btn">3</a>
                    <a href="#" class="btn">Next »</a>
                    <a href="#" class="btn">Last »</a>
                </div>

            </div>
            <!-- end of page content -->


            <!-- start of sidebar -->
            <aside class="span4 page-sidebar">

                <section class="widget">
                    <div class="support-widget">
                        <h3 class="title">长评区</h3>
                        <p class="intro">Need more support? If you did not found an answer, contact us for further help.</p>
                    </div>
                </section>


                <!--<section class="widget">
                        <h3 class="title">Featured Articles</h3>
                        <ul class="articles">
                                <li class="article-entry standard">
                                        <h4><a href="single.html">Integrating WordPress with Your Website</a></h4>
                                        <span class="article-meta">25 Feb, 2013 in <a href="#" title="View all posts in Server &amp; Database">Server &amp; Database</a></span>
                                        <span class="like-count">66</span>
                                </li>
                                <li class="article-entry standard">
                                        <h4><a href="single.html">WordPress Site Maintenance</a></h4>
                                        <span class="article-meta">24 Feb, 2013 in <a href="#" title="View all posts in Website Dev">Website Dev</a></span>
                                        <span class="like-count">15</span>
                                </li>
                                <li class="article-entry video">
                                        <h4><a href="single.html">Meta Tags in WordPress</a></h4>
                                        <span class="article-meta">23 Feb, 2013 in <a href="#" title="View all posts in Website Dev">Website Dev</a></span>
                                        <span class="like-count">8</span>
                                </li>
                                <li class="article-entry image">
                                        <h4><a href="single.html">WordPress in Your Language</a></h4>
                                        <span class="article-meta">22 Feb, 2013 in <a href="#" title="View all posts in Advanced Techniques">Advanced Techniques</a></span>
                                        <span class="like-count">6</span>
                                </li>
                        </ul>
                </section>-->





                <section class="widget">
                    <h3 class="title">Recent Comments</h3>
                    <ul id="recentcomments">
                        <li class="recentcomments"><a href="#" rel="external nofollow" class="url">John Doe</a> on <a href="#">Integrating WordPress with Your Website</a></li>
                        <li class="recentcomments">saqib sarwar on <a href="#">Integrating WordPress with Your Website</a></li>
                        <li class="recentcomments"><a href="#" rel="external nofollow" class="url">John Doe</a> on <a href="#">Integrating WordPress with Your Website</a></li>
                        <li class="recentcomments"><a href="#" rel="external nofollow" class="url">Mr WordPress</a> on <a href="#">Installing WordPress</a></li>
                    </ul>
                </section>

            </aside>
            <!-- end of sidebar -->
        </div>
    </div>
</div>
<!-- End of Page Container -->
<!-- Footer Bottom -->
<div id="footer-bottom-wrapper">
    <div id="footer-bottom" class="container">
        <div class="row">
            <div class="span6">
                <p class="copyright">
                    Copyright © 2013. All Rights Reserved by KnowledgeBase.Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
                </p>
            </div>
            <div class="span6">
                <!-- Social Navigation -->
                <ul class="social-nav clearfix">
                    <li class="linkedin"><a target="_blank" href="#"></a></li>
                    <li class="stumble"><a target="_blank" href="#"></a></li>
                    <li class="google"><a target="_blank" href="#"></a></li>
                    <li class="deviantart"><a target="_blank" href="#"></a></li>
                    <li class="flickr"><a target="_blank" href="#"></a></li>
                    <li class="skype"><a target="_blank" href="skype:#?call"></a></li>
                    <li class="rss"><a target="_blank" href="#"></a></li>
                    <li class="twitter"><a target="_blank" href="#"></a></li>
                    <li class="facebook"><a target="_blank" href="#"></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End of Footer Bottom -->

<!-- End of Footer -->

<a href="#top" id="scroll-top"></a>

<!-- script -->
<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/comm-js/jquery-1.8.3.min.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/comm-js/jquery.easing.1.34e44.js?ver=1.3'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/comm-js/prettyphoto/jquery.prettyPhotoaeb9.js?ver=3.1.4'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/comm-js/jquery.liveSearchd5f7.js?ver=2.0'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/comm-js/jflickrfeed.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/comm-js/jquery.formd471.js?ver=3.18'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/comm-js/jquery.validate.minfc6b.js?ver=1.10.0'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/comm-js/custom5152.js?ver=1.0'></script>

</body>
</html>

