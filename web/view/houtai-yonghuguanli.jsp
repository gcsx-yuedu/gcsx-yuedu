<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="po.DJX.DUserinfo" %>
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

<%
String username = (String) session.getAttribute("username");
if (username == null) {
response.sendRedirect("/Msignup");
}
%>

<%
    List<DUserinfo> userinfoList = (List<DUserinfo>) session.getAttribute("userInfo");
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
            <a href="/houtai-yonghuguanli" class="list-group-item active waves-effect">
                <i class="fas fa-user mr-3"></i>用户管理</a>
            <a href="/houtai-shujiguanli" class="list-group-item list-group-item-action waves-effect">
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
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h4 class="m-0 font-weight-bold text-primary">用户信息展示页面</h4>
            </div>
        <div class="card-body white">
            <table class="col-xl-12 table-hover table-bordered table-striped text-center" role="table">
                <tr style="height: 60px;font-family: 微软雅黑">
                    <th style="font-size: 20px">序号</th>
                    <th style="font-size: 20px">用户名称</th>
                    <th style="font-size: 20px">用户密码</th>
                    <th style="font-size: 20px">用户性别</th>
                    <th style="font-size: 20px">用户地址</th>
                    <th style="font-size: 20px">是否禁言</th>
                </tr>
                <%
                    int k=0;
                    for (DUserinfo userinfo:userinfoList){
                        k++;
                        String forbid = "未禁言(点击禁言)";
                        int flag = Integer.parseInt(userinfo.getU_forbid());
                        if (flag!=0){
                            forbid = "已禁言(点击接触禁言)";
                        }
                %>
                <tr style="height: 40px">
                    <td style="font-size: 16px"><%=k%></td>
                    <td style="font-size: 16px"><%=userinfo.getU_name()%></td>
                    <td style="font-size: 16px"><%=userinfo.getU_password()%></td>
                    <td style="font-size: 16px"><%=userinfo.getU_sex()%></td>
                    <td style="font-size: 16px"><%=userinfo.getU_address()%></td>
                    <td style="font-size: 16px"><input onclick="changeStatus(<%=userinfo.getU_id()%>)" id="<%=userinfo.getU_id()%>"  class="btn <%if(flag==0){%>btn-outline-light-blue<%}else {%>btn-light-blue <%}%>" value="<%=forbid%>"></td>
                </tr>
                <%
                    }
                %>
            </table>
            <script>
                function changeStatus(u_id) {
                    // alert(u_id);
                    // alert("changeStatus");
                    var isForbid = document.getElementById(u_id).value;
                    // alert(isForbid);
                    if (isForbid=="未禁言(点击禁言)"){
                        document.getElementById(u_id).setAttribute("class","btn btn-light-blue");
                        document.getElementById(u_id).value="已禁言(点击接触禁言)";
                        $.ajax({
                            url: '/Forbid',
                            async: false,
                            type: 'post',
                            data:{"u_id":u_id,},
                            success:function () {
                                alert("禁言成功");
                            },
                            error:function () {
                                alert("系统出错");
                            },
                        });
                    }
                    if (isForbid=="已禁言(点击接触禁言)"){
                        document.getElementById(u_id).setAttribute("class","btn btn-outline-light-blue");
                        document.getElementById(u_id).value="未禁言(点击禁言)";
                        $.ajax({
                            url: '/UnForbid',
                            async: false,
                            type: 'post',
                            data:{"u_id":u_id,},
                            success:function () {
                                alert("解除禁言成功");
                                // location.reload();
                            },
                            error:function () {
                                alert("系统出错");
                            },
                        });
                    }
                }
            </script>
        </div>
        </div>
            </div>
        </div>

    </div>
</main>
<!--Main layout-->

</body>

</html>
