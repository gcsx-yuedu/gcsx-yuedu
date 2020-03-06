<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <%--<!-- Material Design Bootstrap -->--%>
    <link href="${pageContext.request.contextPath}/static/css/houtai/css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="${pageContext.request.contextPath}/static/css/houtai/css/style.min.css" rel="stylesheet">
    <%--<link href="$">--%>

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


<%
String username = (String) session.getAttribute("username");
if (username == null) {
response.sendRedirect("/Msignup");
}
%>
<%
    int userNum = (int)session.getAttribute("userNum");
//    System.out.println("userNum="+userNum);
    int bookNum = (int) session.getAttribute("bookNum");
    int commentNum = (int) session.getAttribute("commentNum");
    int manNum = (int) session.getAttribute("manNum");
    int womanNum = (int) session.getAttribute("womanNum");
    List<DBookType> bookTypeList = (List<DBookType>) session.getAttribute("typeList");
%>

<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/houtai/js/jquery-3.4.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/houtai/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/houtai/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/houtai/js/http_cdnjs.cloudflare.com_ajax_libs_Chart.js_2.9.3_Chart.js"></script>
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
                </ul>

                <!-- Right -->
                <ul class="nav navbar-nav navbar-right">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/view/sign-up-gly.jsp" class="nav-link border border-light rounded waves-effect"
                           target="_self">
                            <i class="fa fa-home mr-3"></i>退出登录
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
            <a href="/houtai-xinxitongji" class="list-group-item active  list-group-item-action waves-effect">
                <i class="fas fa-chart-pie mr-3"></i>信息统计
            </a>
            <a href="/houtai-yonghuguanli" class="list-group-item waves-effect">
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

        <%--头部样式--%>
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h4 class="h4 mb-0 text-gray-600">数据统计</h4>
        </div>

        <div class="row fadeIn">
            <%--分成3块，分别显示用户总数、评论总数、登记图书总数--%>
            <div class="col-xl-4 col-md-4 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">注册用户人数</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%=userNum%></div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--图书总数--%>
            <div class="col-xl-4 col-md-4 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">登记图书总数</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%=bookNum%></div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--评论总数--%>
            <div class="col-xl-4 col-md-4 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">评论总数</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%=commentNum%></div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-comments fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

            <div class="row">
                <!-- Area Chart -->
                <div class="col-xl-6">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">用户男女比例</h6>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-area">
                                <canvas id="canvas2"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="${pageContext.request.contextPath}/static/js/gly-js/http_lib.sinaapp.com_js_jquery_2.2.4_jquery-2.2.4.js"></script>

                <script>

                    var ctx2 = document.getElementById("canvas2").getContext("2d");
                    var canvas2 = new Chart(ctx2, {
                        type: 'pie',
                        data: {
                            labels:['男','女'],
                            datasets:[{
                                data: ['<%=manNum%>', '<%=womanNum%>'],
                                backgroundColor:['rgba(104,34,139,1)','rgba(238,197,145,1)'],
                            }],
                        },
                    });
                </script>
                <div class="col-xl-6">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">X月Y日-M月N日评论数量</h6>

                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-area">
                                <canvas id="myAreaChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <script>

                    var ctx = document.getElementById("myAreaChart").getContext("2d");
                    var canves1 = new Chart(ctx,{
                        type: 'line',
                        data:{
                            labels: ["January", "February", "March", "April", "May", "June", "July"],
                            datasets: [
                                {
                                    label: "My First dataset",
                                    fillColor: "rgba(220,220,220,0.2)",
                                    strokeColor: "rgba(220,220,220,1)",
                                    pointColor: "rgba(220,220,220,1)",
                                    pointStrokeColor: "#fff",
                                    pointHighlightFill: "#fff",
                                    pointHighlightStroke: "rgba(220,220,220,1)",
                                    data: [65, 59, 80, 81, 56, 55, 40]
                                },
                                {
                                    label: "My Second dataset",
                                    fillColor: "rgba(151,187,205,0.2)",
                                    strokeColor: "rgba(151,187,205,1)",
                                    pointColor: "rgba(151,187,205,1)",
                                    pointStrokeColor: "#fff",
                                    pointHighlightFill: "#fff",
                                    pointHighlightStroke: "rgba(151,187,205,1)",
                                    data: [28, 48, 40, 19, 86, 27, 90]
                                }
                            ]
                        },
                    });
                </script>

            </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">书籍分类数量</h6>
                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <div class="chart-area">
                            <canvas id="canvas3"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                var ctx3 = document.getElementById("canvas3").getContext('2d');
                var canvas3 = new Chart(ctx3,{
                    type: 'bar',
                    data: {
                        labels:[<%
                            for (DBookType bookType:bookTypeList){
                            %>
                            '<%=bookType.getT_type()%>',
                            <%
                            }
                            %>],
                        datasets:[{
                            label: '类型',
                            data:[<%
                                for (DBookType bookType:bookTypeList){
                                %>
                                '<%=bookType.getTypeNum()%>',
                                <%
                                }
                                %>],
                            // backgroundColor:
                        }],
                    },
                });
            </script>
            <!-- Area Chart -->


        </div>

    </div>
</main>

<script>

</script>

</body>

</html>
