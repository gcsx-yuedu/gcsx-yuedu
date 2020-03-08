<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="po.DJX.DLongComm" %>
<%@ page import="po.DJX.DHuitie" %>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>读后感</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/vendor/artcile-ven/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/vendor/artcile-ven/font-awesome/css/font-awesome.min.css">
    <!-- Custom icon font-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/article-css/fontastic.css">
    <!-- Google fonts - Open Sans-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
    <!-- Fancybox-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/vendor/artcile-ven/@fancyapps/fancybox/jquery.fancybox.min.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/article-css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/article-css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/book_infor-css/reset.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/book_infor-css/index.css">--%>
</head>
<!-- JavaScript files-->
<script src="${pageContext.request.contextPath}/static/vendor/artcile-ven/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/vendor/artcile-ven/popper.js/umd/popper.min.js"> </script>
<script src="${pageContext.request.contextPath}/static/vendor/artcile-ven/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/vendor/artcile-ven/jquery.cookie/jquery.cookie.js"> </script>
<script src="${pageContext.request.contextPath}/static/vendor/artcile-ven/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/article-js/front.js"></script>
<body>

<%
    DLongComm longComm = (DLongComm) session.getAttribute("longComm");
    List<DHuitie> huitieList = (List<DHuitie>) session.getAttribute("huitieList");
%>


<div class="container">
    <div class="row">
        <!-- Latest Posts -->
        <main class="post blog-post col-lg-8">
            <div class="container">
                <div class="post-single">
                    <!--<div class="post-thumbnail"><img src="img/blog-post-3.jpeg" alt="..." class="img-fluid"></div>-->
                    <div class="post-details">
                        <div class="post-meta d-flex justify-content-between">
                            <div class="category"><a href="#">>点击返回</a></div>
                        </div>
                        <h1><%=longComm.getTitle()%><a href="#"><i class="fa fa-bookmark-o"></i></a></h1>
                        <div class="post-footer d-flex align-items-center flex-column flex-sm-row"><a href="#" class="author d-flex align-items-center flex-wrap">
                            <div class="avatar"><img src="../static/image/article-image/avatar-1.jpg" alt="..." class="img-fluid"></div>
                            <div class="title"><span><%=longComm.getAuthor_name()%></span></div></a>
                            <div class="d-flex align-items-center flex-wrap">
                                <div class="date"><i class="icon-clock"></i><%=longComm.getLc_time()%></div>
                                <div class="views"><i class="icon-eye"></i><%=longComm.getLc_coment()%></div>
                                <div class="comments meta-last"><i class="icon-comment"></i><%=longComm.getLc_click()%></div>
                            </div>
                        </div>
                        <div class="post-body">
                            <p class="lead"><%=longComm.getLc_article()%></p>

                        </div>


                        <%--评论区--%>
                        <div class="post-comments">
                            <header>
                                <h3 class="h6">评论区<span class="no-of-comments"><%=longComm.getLc_coment()%></span></h3>
                            </header>
                            <%
                                for (DHuitie huitie:huitieList){
                            %>
                            <div class="comment">
                                <div class="comment-header d-flex justify-content-between">
                                    <div class="user d-flex align-items-center">
                                        <div class="image"><img src="../static/image/article-image/user.svg" alt="..." class="img-fluid rounded-circle"></div>
                                        <div class="title"><strong><%=huitie.getAuthor_name()%></strong><span class="date"><%=huitie.getHuitie_time()%></span></div>
                                    </div>
                                </div>
                                <div class="comment-body">
                                    <p><%=huitie.getHuitie_content()%></p>
                                </div>
                            </div>
                            <%
                                }
                            %>


                        </div>
                        <div class="add-comment">
                            <header>
                                <h3 class="h6">发表评论</h3>
                            </header>
                            <form action="#" class="commenting-form">
                                <div class="row">

                                    <div class="form-group col-md-12">
                                        <textarea name="usercomment" id="usercomment" placeholder="输入你的评论" class="form-control"></textarea>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <button type="submit" class="btn btn-secondary">提交</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <aside class="col-lg-4">

            <div class="widget latest-posts">
                <header>
                    <h3 class="h6">Latest Posts</h3>
                </header>
                <div class="blog-posts"><a href="#">
                    <div class="item d-flex align-items-center">
                        <div class="image"><img src="../static/image/article-image/small-thumbnail-1.jpg" alt="..." class="img-fluid"></div>
                        <div class="title"><strong>Alberto Savoia Can Teach You About</strong>
                            <div class="d-flex align-items-center">
                                <div class="views"><i class="icon-eye"></i> 500</div>
                                <div class="comments"><i class="icon-comment"></i>12</div>
                            </div>
                        </div>
                    </div></a><a href="#">
                    <div class="item d-flex align-items-center">
                        <div class="image"><img src="../static/image/article-image/small-thumbnail-2.jpg" alt="..." class="img-fluid"></div>
                        <div class="title"><strong>Alberto Savoia Can Teach You About</strong>
                            <div class="d-flex align-items-center">
                                <div class="views"><i class="icon-eye"></i> 500</div>
                                <div class="comments"><i class="icon-comment"></i>12</div>
                            </div>
                        </div>
                    </div></a><a href="#">
                    <div class="item d-flex align-items-center">
                        <div class="image"><img src="../static/image/article-image/small-thumbnail-3.jpg" alt="..." class="img-fluid"></div>
                        <div class="title"><strong>Alberto Savoia Can Teach You About</strong>
                            <div class="d-flex align-items-center">
                                <div class="views"><i class="icon-eye"></i> 500</div>
                                <div class="comments"><i class="icon-comment"></i>12</div>
                            </div>
                        </div>
                    </div></a></div>
            </div>

            <div class="widget tags">
                <header>
                    <h3 class="h6">Tags</h3>
                </header>
                <ul class="list-inline">
                    <li class="list-inline-item"><a href="#" class="tag">#Business</a></li>
                    <li class="list-inline-item"><a href="#" class="tag">#Technology</a></li>
                    <li class="list-inline-item"><a href="#" class="tag">#Fashion</a></li>
                    <li class="list-inline-item"><a href="#" class="tag">#Sports</a></li>
                    <li class="list-inline-item"><a href="#" class="tag">#Economy</a></li>
                </ul>
            </div>
        </aside>
    </div>
</div>
</body>
</html>