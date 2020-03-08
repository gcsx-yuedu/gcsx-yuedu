<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="po.ZYM.ZBookType" %>
<%@ page import="po.DJX.DBookType" %>
<%@ page import="po.DJX.DLongComm" %>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<!doctype html>

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
<!-- script -->
<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/comm-js/jquery-1.8.3.min.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/comm-js/jquery.easing.1.34e44.js?ver=1.3'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/comm-js/prettyphoto/jquery.prettyPhotoaeb9.js?ver=3.1.4'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/comm-js/jquery.liveSearchd5f7.js?ver=2.0'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/comm-js/jflickrfeed.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/comm-js/jquery.formd471.js?ver=3.18'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/comm-js/jquery.validate.minfc6b.js?ver=1.10.0'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/comm-js/custom5152.js?ver=1.0'></script>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user-css/output.css">--%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user-css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user-css/index.css">

<body>

<!-- Start of Header -->
<%  String wenzi = request.getParameter("wenzi");
    List<ZBookType> types = (List<ZBookType>)session.getAttribute("types");
    int totalPage = (int) session.getAttribute("totalPage");
    Integer pageNum = (Integer) session.getAttribute("pageNum");
    List<DLongComm> longCommList = (List<DLongComm>) session.getAttribute("longCommList");
    int book_id = (int) session.getAttribute("book_id");
    int userId = (int) session.getAttribute("userId");
    String userName = (String) session.getAttribute("userName");
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
                <input type="text" class="search-text" style="border: none;outline: none" placeholder="Seach here..."value="<%= wenzi==null?"":wenzi %>">
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
                    <a href="/user_info?u_id=<%=session.getAttribute("userId")%>" class="app" style="cursor:pointer"><%=userName%></a>
                </li>
                <li>
                    <span class="line"></span>
                    <a href="/home_page" class="app" style="cursor:pointer">退出</a>
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


<!-- Start of Page Container -->
<div class="page-container">
    <div class="container">
        <div class="row">

            <!-- start of page content -->
            <div class="span8 main-listing">

                <div class="row separator">
                    <section class="span4 articles-list">
                        <h3><a href="#form">Posting</a></h3>
                        <ul class="articles">
                            <%
                                for (DLongComm comm:longCommList){
                            %>
                            <li class="article-entry standard">
                                <h4><a href="/article?lc_id=<%=comm.getLc_id()%>"><%=comm.getTitle()%></a></h4>
                                <span class="article-meta"><%=comm.getLc_time()%></span>
                                <span class="like-count"><%=comm.getLc_click()%></span>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </section>

                </div>

                <div id="pagination">
                    <%
                        for (int k=1;k<=totalPage;k++){
                    %>
                    <a href="/comment?pageNum=<%=k%>&book_id=<%=book_id%>" class="btn <%if(k==pageNum){%>active<%}%>"><%=k%></a>
                    <%
                        }
                    %>
                    <a href="/comment?pageNum=<%=pageNum+1%>&book_id=<%=book_id%>" class="btn">Next »</a>
                    <a href="/comment?pageNum=<%=totalPage%>&book_id=<%=book_id%>" class="btn">Last »</a>
                </div>

            </div>
            <!-- end of page content -->


            <!-- start of sidebar -->
            <aside class="span4 page-sidebar">

                <section class="widget">
                    <div class="support-widget">
                        <h3 class="title">读后感</h3>
                        <p class="intro">Need more support? If you did not found an answer, contact us for further help.</p>
                    </div>
                </section>

            </aside>
            <!-- end of sidebar -->
        </div>
    </div>
</div>
<!-- End of Page Container -->

<div class="contain">
    <form class="contact" action="" method="post" id="form">
        <div class="row clearfix">
            <div class="lbl">
                <label for="book_title">标题</label>
                <input id="comm_book_id" name="book_id" type="hidden" value="<%=book_id%>" >
                <input id="comm_author_id" type="hidden" name="author_id" value="<%=userId%>" >
            </div>
            <div class="ctrl">
                <input type="text" id="book_title" name="title" data-required="true" data-validation="text"
                       data-msg="Invalid Name" placeholder="请在此输入标题...">
            </div>
        </div>
        <div class="row clearfix">
            <div class="lbl">
                <label for="lc_article">
                    Message</label>
            </div>
            <div class="ctrl">
                <textarea id="lc_article" name="lc_article" rows="6" cols="10"></textarea>
            </div>
        </div>
        <div class="row  clearfix" style="align-content: center">
            <div class="span10 offset2">
                <input onclick="addLC()" type="submit" name="submit" id="submit" class="submit" value="点击发表评论">
            </div>
        </div>
    </form>

    <script>
        function addLC() {
            var book_id=document.getElementById("comm_book_id").value;
            var author_id=document.getElementById("comm_author_id").value;
            var title=document.getElementById("book_title").value;
            var lc_article=document.getElementById("lc_article").value;
            $.ajax({
                url: '/addLongComm',
                async:false,
                type: 'post',
                data:{"book_id":book_id,
                    "author_id":author_id,
                    "title":title,
                    "lc_article":lc_article,
                },
                success:function () {
                    alert("评论添加成功");
                    window.location.reload();
                },
                error:function () {
                    alert("系统出错");
                },
            });
        }
    </script>
    <!--<div id="success">
        Your E-Mail has been sent successfully!</div>
    <div id="error">
        Unable to send e-mail at the moment, please try later.</div>
    <div id="validation">
    </div>-->
</div>
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



</body>
</html>

