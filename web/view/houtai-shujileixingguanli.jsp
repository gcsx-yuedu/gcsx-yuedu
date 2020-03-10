<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="po.DJX.DBook" %>
<%@ page import="po.DJX.DBookList" %>
<%@ page import="com.mysql.jdbc.StringUtils" %>
<%@ page import="po.DJX.DBookType" %>
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
</head>

<%
  String username = (String) session.getAttribute("username");
  if (username == null) {
    response.sendRedirect("/Msignup");
  }
%>
<%
    Integer pageNumber = (Integer) session.getAttribute("pageNumber");
//    int pageNum =1;
    List<DBookType> bookTypes = (List<DBookType>) session.getAttribute("typeList");
    int totalSize = (int) session.getAttribute("totalSize");
%>


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
              <li class="nav-item  m-2">
                  <a href="/houtai-shujiguanli" class="nav-link border border-light rounded">
                      书籍管理
                  </a>
              </li>
              <li class="nav-item m-2 blue">
                  <a href="/houtai-shujileixingguanli" class="nav-link border border-light rounded">
                      书籍类型管理
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
            <a href="/houtai-xinxitongji" class="list-group-item list-group-item-action waves-effect">
                <i class="fas fa-chart-pie mr-3"></i>信息统计
            </a>
            <a href="/houtai-yonghuguanli" class="list-group-item list-group-item-action waves-effect">
                <i class="fas fa-user mr-3"></i>用户管理</a>
            <a href="/houtai-shujiguanli" class="list-group-item active list-group-item-action waves-effect">
                <i class="fas fa-table mr-3"></i>书籍管理</a>
            <a href="/houtai-tianjiashuji" class="list-group-item list-group-item-action waves-effect">
                <i class="fas fa-map mr-3"></i>添加书籍</a>
        </div>

    </div>
    <!-- Sidebar -->

  </header>
  <!--Main Navigation-->

  <!--Main layout-->
  <main class="pt-5 mx-lg-5">
    <div class="container-fluid mt-5">

    <div class="row">
        <div class="col-xl-12">

            <div class="card shadow">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h4 class="m-0 font-weight-bold text-primary">书籍类型展示页面</h4>
            </div>

            <%--获取书籍列表的信息并展示--%>
            <div class="card-body white">
                <table role="table" class="col-xl-12 table-hover table-bordered table-striped text-center">
                    <tr style="height: 60px;font-family: 微软雅黑">
                    <th style="font-size: 20px">序号</th>
                    <th style="font-size: 20px">书籍类型类型</th>
                    <th style="font-size: 20px" colspan="2">操作</th>
                    </tr>
                    <%
                        int k=1;
                        for (DBookType bookType:bookTypes){
                    %>
                    <tr style="height: 20px;">
                        <td style="font-size: 15px"><%=k%><input type="hidden" value="<%=bookType.getT_id()%>"></td>
                        <td><%=bookType.getT_type()%></td>
                        <td><a href="/deleteType?t_id=<%=bookType.getT_id()%>">删除</a></td>
                    </tr>
                    <%
                            k++;
                        }
                    %>
                </table>
                <div class="col-xl-10 offset-xl-1 text-center">
                    <select  onchange="nextPg()" id="pageNum" name="pageNum" class="combobox col-xl-12">
                        <%
                            for (int i=0;i<totalSize;i++){
                        %>
                        <option  value="<%=i+1%>" <%if(pageNumber==i+1){%>selected<%}%>>第<%=i+1%>页</option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>
            </div>

        </div>
    </div>

    </div>
  </main>
<script>
    function nextPg() {
        var pageNum = document.getElementById("pageNum").value;
        window.location.href="/houtai-shujileixingguanli?pageNumber="+pageNum;
    }
</script>

  
</body>

</html>
