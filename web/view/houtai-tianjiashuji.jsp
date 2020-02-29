<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
            <!-- <li class="nav-item active">
              <a class="nav-link waves-effect" href="#">主页
                <span class="sr-only">(current)</span>
              </a>
            </li> -->
            <!-- <li class="nav-item">
              <a class="nav-link waves-effect" href="#" target="_blank">About
                MDB</a>
            </li>
            <li class="nav-item">
              <a class="nav-link waves-effect" href="#getting-started/download/"
                target="_blank">Free
                download</a>
            </li>
            <li class="nav-item">
              <a class="nav-link waves-effect" href="#" target="_blank">Free
                tutorials</a>
            </li> -->
          </ul>

          <!-- Right -->
          <ul class="navbar-nav nav-flex-icons">
            <!-- <li class="nav-item">
              <a href="#" class="nav-link waves-effect" target="_blank">
                <i class="fab fa-facebook-f"></i>
              </a>
            </li> -->
            <!-- <li class="nav-item">
              <a href="#" class="nav-link waves-effect" target="_blank">
                <i class="fab fa-twitter"></i>
              </a>
            </li> -->
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
        <a href="${pageContext.request.contextPath}/view/houtai-yonghuguanli.jsp" class="list-group-item list-group-item-action waves-effect">
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

    </div>
  </main>


  
</body>

</html>
