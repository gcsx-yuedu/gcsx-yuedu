<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="po.DJX.DLongComm" %>
<%@ page import="po.DJX.DHuitie" %>
<%@ page import="po.DJX.DBookType" %>
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
    List<DBookType> typeList = (List<DBookType>) session.getAttribute("typeList");
    List<DLongComm> longCommList = (List<DLongComm>) session.getAttribute("longCommList");
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
                            <div class="category"><a href="/comment?book_id=<%=longComm.getBook_id()%>">>点击返回</a></div>
                        </div>
                        <h1><%=longComm.getTitle()%><a href="#"><i class="fa fa-bookmark-o"></i></a></h1>
                        <div class="post-footer d-flex align-items-center flex-column flex-sm-row"><a href="#" class="author d-flex align-items-center flex-wrap">
                            <div class="avatar"><img src="../static/image/article-image/avatar-1.jpg" alt="..." class="img-fluid"></div>
                            <div class="title"><span><%=longComm.getAuthor_name()%></span></div></a>
                            <div class="d-flex align-items-center flex-wrap">
                                <div class="date">发表时间：<%=longComm.getLc_time()%></div>
                                <div class="views">评论数：<%=longComm.getLc_coment()%></div>

                            </div>
                        </div>
                        <div class="post-body">
                            <p class="lead"><%=longComm.getLc_article()%></p>

                        </div>


                        <%--评论区--%>
                        <div class="post-comments">
                            <header>
                                <h3 class="h6">评论区<span class="no-of-comments">(<%=longComm.getLc_coment()%>)</span></h3>
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
                        <%--回帖--%>
                        <div class="add-comment">
                            <header>
                                <h3 class="h6">发表评论</h3>
                            </header>
                            <div  class="commenting-form">
                                <input type="hidden" id="tiezi_id" value="<%=longComm.getLc_id()%>" >
                                <input type="hidden" id="huitieren_id" value="<%=session.getAttribute("userId")%>">
                                <input type="hidden" id="duixiang_id" value="<%=longComm.getAuthor_id()%>">
                                <input type="hidden" id="nowComment" value="<%=longComm.getLc_coment()%>">
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <textarea name="usercomment" id="huitie_content" placeholder="输入你的评论" class="form-control"></textarea>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <input onclick="addHuitie()
" type="submit" class="btn btn-block" value="点击发表">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <aside class="col-lg-4">

            <div class="widget latest-posts">
                <header>
                    <h3 class="h6">他的最近评论</h3>
                </header>
                <div class="blog-posts"><a href="">
                    <%
                        for (DLongComm longComm1:longCommList){
                    %>
                    <div class="item d-flex align-items-center">
                        <div class="image"><img src="../static/image/article-image/small-thumbnail-1.jpg" alt="..." class="img-fluid"></div>
                        <div class="title"><a href="/article?lc_id=<%=longComm1.getLc_id()%>"><strong><%=longComm1.getTitle()%></strong></a>
                            <div class="d-flex align-items-center">
                                <div class="views">评论数：<%=longComm1.getLc_coment()%></div>
                            </div>
                        </div>
                    </div></a><a href="#">
                    <%
                        }
                    %>

                    </a></div>
            </div>

            <div class="widget tags">
                <header>
                    <h3 class="h6">标签</h3>
                </header>
                <ul class="list-inline">
                    <%
                        for(DBookType s:typeList){
                    %>
                    <li class="list-inline-item"><a href="/showBookByType?userId=<%=session.getAttribute("userId")%>&t_id=<%=s.getT_id()%>&t_type=<%=s.getT_type()%>" class="tag">#<%=s.getT_type()%></a></li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </aside>
    </div>
</div>
<script>
    function addHuitie() {
        var tiezi_id = document.getElementById("tiezi_id").value;
        var huitieren_id = document.getElementById("huitieren_id").value;
        var duixiang_id = document.getElementById("duixiang_id").value;
        var huitie_content = document.getElementById("huitie_content").value;
        var nowComment = document.getElementById("nowComment").value;
        $.ajax({
            url: '/userIsForbid',
            type: 'post',
            async: false,
            data:{"u_id":huitieren_id},
            success:function (forbid) {
                if (forbid==0){
                    $.ajax({
                        url: '/addHuitie',
                        async:false,
                        type: 'post',
                        data:{"tiezi_id":tiezi_id,
                            "huitieren_id":huitieren_id,
                            "duixiang_id":duixiang_id,
                            "huitie_content":huitie_content,
                            "nowComment":nowComment,
                        },
                        success:function () {
                            alert("评论发表成功");
                            document.getElementById("huitie_content").value = "";
                            location.reload();
                        },
                        error:function () {
                            alert("系统出错");
                        }
                    });
                } else {
                    alert("你已被禁言");
                    document.getElementById("huitie_content").value = "";
                }

            },
            error:function () {
                alert("系统出错");
            }
        });
    }
</script>
</body>
</html>