<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="po.BookType" %>
<%@ page import="sun.security.util.Length" %>
<%@ page contentType="text/html;charset=utf-8"%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>悦读后台管理系统</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/houtai/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="${pageContext.request.contextPath}/static/css/houtai/css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="${pageContext.request.contextPath}/static/css/houtai/css/style.min.css" rel="stylesheet">
    <style>

        .map-container{
            overflow:hidden;
            padding-bottom:56.25%;
            position:relative;
            height:0;
        }
        .map-container iframe{
            left:0;
            top:0;
            height:100%;
            width:100%;
            position:absolute;
        }
    </style>
</head>

<%--<%--%>
<%--String username = (String) session.getAttribute("username");--%>
<%--if (username == null) {--%>
<%--response.sendRedirect("sign-up-gly.jsp");--%>
<%--}--%>
<%--%>--%>

<%
    List<BookType> bookTypeList = (List<BookType>) session.getAttribute("bookTypeList");
%>



<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/houtai/js/jquery-3.4.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/houtai/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/houtai/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/houtai/js/mdb.min.js"></script>
<!-- Initializations -->
<script type="text/javascript">
    // Animations initialization
    new WOW().init();

</script>

<body class="grey lighten-3">

<!--Main Navigation-->
<header>

    <!-- Navbar -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
        <div class="container-fluid">

            <!-- Brand -->
            <a class="navbar-brand waves-effect" href="#">
                <strong class="blue-text">悦读后台管理系统</strong>
            </a>

            <!-- Collapse -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Links -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">

                <!-- Left -->
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item m-2">
                        <a href="/houtai-tianjiashuji" class="nav-link border border-light rounded">
                        添加书籍
                        </a>
                    </li>
                    <li class="nav-item blue m-2">
                        <a href="/houtai-tianjiashujileixing" class="nav-link border border-light rounded">
                            添加书籍类型
                        </a>
                    </li>
                </ul>

                <!-- Right -->
                <ul class="navbar-nav nav-flex-icons">

                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/view/sign-up-gly.jsp" class="nav-link border border-light rounded waves-effect"
                           target="_self">
                            <i class="fab fa-github mr-2"></i>退出登录
                        </a>
                    </li>
                </ul>

            </div>

        </div>
    </nav>
    <!-- Navbar -->

    <!-- Sidebar -->
    <div class="sidebar-fixed position-fixed">

        <a class="logo-wrapper waves-effect">
            <img src="${pageContext.request.contextPath}/static/image/houtai/img/timg.jpg" class="img-fluid" alt="">
        </a>

        <div class="list-group list-group-flush">
            <a href="${pageContext.request.contextPath}/view/houtai-xinxitongji.jsp" class="list-group-item list-group-item-action waves-effect">
                <i class="fas fa-chart-pie mr-3"></i>信息统计</a>
            <a href="/houtai-xinxitongji" class="list-group-item list-group-item-action waves-effect">
                <i class="fas fa-user mr-3"></i>用户管理</a>
            <a href="${pageContext.request.contextPath}/view/houtai-shujiguanli.jsp" class="list-group-item list-group-item-action waves-effect">
                <i class="fas fa-table mr-3"></i>书籍管理</a>
            <a href="#" class="list-group-item active waves-effect">
                <i class="fas fa-map mr-3"></i>添加书籍</a>
            <a href="${pageContext.request.contextPath}/view/houtai-jubaoxnxiguanli.jsp" class="list-group-item list-group-item-action waves-effect">
                <i class="fas fa-money-bill-alt mr-3"></i>举报信息管理</a>
        </div>

    </div>
    <!-- Sidebar -->

</header>
<!--Main Navigation-->

<!--Main layout-->
<main class="pt-5 mx-lg-5">
    <div class="container-fluid mt-5">
        <%--添加书籍类型的table页面--%>
        <%--首先是card作为整体--%>

            <div class="row">
                <div class="col-xl-12">
                    <div class="card shadow">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h4 class="m-0 font-weight-bold text-primary">书籍类型添加页面</h4>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label>
                                        <h5>书籍类型</h5>
                                    </label>
                                    <div class="col-xl-10">
                                        <input type="text" class="form-control" name="t_type" id="bookType" placeholder="请输入书籍类型">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input onclick="addBookType()" type="submit" class="col-xl-4 offset-4" value="提交">
                                </div>
                            </form>
                            <script>
                                function addBookType() {
                                    var t_type = document.getElementById("bookType").value;
                                    $.ajax({
                                        url:'/sameType',
                                        async:false,
                                        type: 'post',
                                        dataType: 'text',
                                        data:{"t_type":t_type},
                                        success:function (f) {
                                            // alert('f='+f);
                                            if ('1'==f){
                                                console.log('f=1');
                                                alert('该类型已存在，请重新输入！');
                                            } else {
                                                alert('跳转添加页面');
                                                // window.location.href = '/addBookType?t_type='+t_type;
                                                $.ajax({
                                                    url:'/addBookType',
                                                    async:false,
                                                    type: 'post',
                                                    dataType: 'text',
                                                    data:{"t_type":t_type},
                                                    success: function () {
                                                        alert('添加成功');
                                                    },
                                                    error: function () {
                                                        alert('系统出错');
                                                    }
                                                });
                                            }
                                        },
                                        error:function () {
                                            alert('系统出错');
                                        }

                                    });
                                }
                            </script>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</main>



</body>

</html>
