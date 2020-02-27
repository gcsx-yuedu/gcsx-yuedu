<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>houtai</title>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/houtai/js/http_cdnjs.cloudflare.com_ajax_libs_Chart.js_2.9.3_Chart.js"></script>
<%--<!-- MDB core JavaScript -->--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/houtai/js/mdb.min.js"></script>--%>
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
        <a href="#" class="list-group-item active waves-effect">
          <i class="fas fa-chart-pie mr-3"></i>信息统计</a>
        <a href="${pageContext.request.contextPath}/view/houtai-yonghuguanli.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-user mr-3"></i>用户管理</a>
        <a href="${pageContext.request.contextPath}/view/houtai-shujiguanli.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-table mr-3"></i>书籍管理</a>
        <a href="${pageContext.request.contextPath}/view/houtai-tianjiashuji.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-map mr-3"></i>添加书籍</a>
        <a href="${pageContext.request.contextPath}/view/houtai-jubaoxnxiguanli.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-money-bill-alt mr-3"></i>举报信息管理&nbsp;&nbsp;<span class="badge black">20</span></a>
      </div>

    </div>
    <!-- Sidebar -->

  </header>
  <!--Main Navigation-->

  <!--Main layout-->
  <main class="pt-5 mx-lg-5">
    <div class="container-fluid mt-5">

      <div class="row fadeIn">
        <div class="col-md-8 mb-4">
          <div class="card col-md-10 white">
            <div class="card-body">
              <%--<img class="card-img" src="../static/image/houtai/img/timg.jpg"></img>--%>
                <canvas id="canvas1" width="500px" height="400px"></canvas>
            </div>
          </div>
        </div>
        <%--<div class="col-md-4 mb-4 ">--%>
          <%--<div class="col-6 mb-4 blue">null</div>--%>
        <%--</div>--%>
      </div>
      <div class="row wow fadeIn">
        <div class="col-md-10 mb-4">
          <div class="col-md-10 " >
            <div class="card col-md-12">
              <div class="card-body">
                <canvas id="canvas2" width="600px" height="400px"></canvas>
              </div>

            </div>
          </div>
        </div>
      </div>

      <!--Grid row-->
      <%--<div class="row wow fadeIn">--%>

        <%--<!--Grid column-->--%>
        <%--<div class="col-md-9 mb-4">--%>

          <%--<!--Card-->--%>
          <%--<div class="card">--%>

            <%--<!--Card content-->--%>
            <%--<div class="card-body">--%>

              <%--<canvas id="myChart"></canvas>--%>

            <%--</div>--%>

          <%--</div>--%>
          <%--<!--/.Card-->--%>

        <%--</div>--%>
        <%--<!--Grid column-->--%>

        <%--<!--Grid column-->--%>
        <%--<div class="col-md-3 mb-4">--%>

          <%--<!--Card-->--%>
          <%--<div class="card mb-4">--%>

            <%--<!-- Card header -->--%>
            <%--<div class="card-header text-center">--%>
              <%--Pie chart--%>
            <%--</div>--%>

            <%--<!--Card content-->--%>
            <%--<div class="card-body">--%>

              <%--<canvas id="pieChart"></canvas>--%>

            <%--</div>--%>

          <%--</div>--%>
          <%--<!--/.Card-->--%>

          <%--<!--Card-->--%>
          <%--<div class="card mb-4">--%>

            <%--<!--Card content-->--%>
            <%--<div class="card-body">--%>

              <%--<!-- List group links -->--%>
              <%--<div class="list-group list-group-flush">--%>
                <%--<a class="list-group-item list-group-item-action waves-effect">Sales--%>
                  <%--<span class="badge badge-success badge-pill pull-right">22%--%>
                    <%--<i class="fas fa-arrow-up ml-1"></i>--%>
                  <%--</span>--%>
                <%--</a>--%>
                <%--<a class="list-group-item list-group-item-action waves-effect">Traffic--%>
                  <%--<span class="badge badge-danger badge-pill pull-right">5%--%>
                    <%--<i class="fas fa-arrow-down ml-1"></i>--%>
                  <%--</span>--%>
                <%--</a>--%>
                <%--<a class="list-group-item list-group-item-action waves-effect">Orders--%>
                  <%--<span class="badge badge-primary badge-pill pull-right">14</span>--%>
                <%--</a>--%>
                <%--<a class="list-group-item list-group-item-action waves-effect">Issues--%>
                  <%--<span class="badge badge-primary badge-pill pull-right">123</span>--%>
                <%--</a>--%>
                <%--<a class="list-group-item list-group-item-action waves-effect">Messages--%>
                  <%--<span class="badge badge-primary badge-pill pull-right">8</span>--%>
                <%--</a>--%>
              <%--</div>--%>
              <%--<!-- List group links -->--%>

            <%--</div>--%>

          <%--</div>--%>
          <%--<!--/.Card-->--%>

        <%--</div>--%>
        <%--<!--Grid column-->--%>

      <%--</div>--%>
      <%--&lt;%&ndash;新的一行&ndash;%&gt;--%>
      <%--<div class="row wow fadeIn">--%>
        <%--<div class="col-md-9">--%>
          <%--<div class="card">--%>
            <%--<div class="card-body">--%>
              <%--<canvas id="test1"></canvas>--%>
            <%--</div>--%>
          <%--</div>--%>
        <%--</div>--%>

      <%--</div>--%>

    </div>
  </main>



  <script>

    var ctx = document.getElementById('canvas1').getContext('2d');
    var barChart = new Chart(ctx,{
      type: 'bar',
      data: {
        labels: ["China", "India", "United States", "Indonesia", "Brazil", "Pakistan", "Nigeria", "Bangladesh", "Russia", "Japan"],
        datasets: [{
          label: 'Population',
          data: [1379302771, 1281935911, 326625791, 260580739, 207353391, 204924861, 190632261, 157826578, 142257519, 126451398],
          backgroundColor: [
            'rgba(255, 99, 132, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 206, 86, 0.6)',
            'rgba(75, 192, 192, 0.6)',
            'rgba(153, 102, 255, 0.6)',
            'rgba(255, 159, 64, 0.6)',
            'rgba(255, 99, 132, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 206, 86, 0.6)',
            'rgba(75, 192, 192, 0.6)',
            'rgba(153, 102, 255, 0.6)'
          ],
          options: {
            scales: {
              yAxes: [{
                ticks: {
                  beginAtZero: true
                }
              }]
            }
          }
        }]
      }
    });

    var ctx1 = document.getElementById('canvas2').getContext('2d');
    var barChart1 = new Chart(ctx1,{
      type: 'bar',
      data: {
        labels: ["China", "India", "United States", "Indonesia", "Brazil", "Pakistan", "Nigeria", "Bangladesh", "Russia", "Japan"],
        datasets: [{
          label: 'Population',
          data: [1379302771, 1281935911, 326625791, 260580739, 207353391, 204924861, 190632261, 157826578, 142257519, 126451398],
          backgroundColor: [
            'rgba(255, 99, 132, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 206, 86, 0.6)',
            'rgba(75, 192, 192, 0.6)',
            'rgba(153, 102, 255, 0.6)',
            'rgba(255, 159, 64, 0.6)',
            'rgba(255, 99, 132, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 206, 86, 0.6)',
            'rgba(75, 192, 192, 0.6)',
            'rgba(153, 102, 255, 0.6)'
          ],
          options: {
            scales: {
              yAxes: [{
                ticks: {
                  beginAtZero: true
                }
              }]
            }
          }
        }]
      }
    });

  </script>




  <!-- Charts -->
  <%--<script>--%>
    <%--// Line--%>
    <%--var ctx = document.getElementById("myChart").getContext('2d');--%>
    <%--var myChart = new Chart(ctx, {--%>
      <%--type: 'bar',--%>
      <%--data: {--%>
        <%--labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],--%>
        <%--datasets: [{--%>
          <%--label: '# of Votes',--%>
          <%--data: [12, 19, 3, 5, 2, 3],--%>
          <%--backgroundColor: [--%>
            <%--'rgba(255, 99, 132, 0.2)',--%>
            <%--'rgba(54, 162, 235, 0.2)',--%>
            <%--'rgba(255, 206, 86, 0.2)',--%>
            <%--'rgba(75, 192, 192, 0.2)',--%>
            <%--'rgba(153, 102, 255, 0.2)',--%>
            <%--'rgba(255, 159, 64, 0.2)'--%>
          <%--],--%>
          <%--borderColor: [--%>
            <%--'rgba(255,99,132,1)',--%>
            <%--'rgba(54, 162, 235, 1)',--%>
            <%--'rgba(255, 206, 86, 1)',--%>
            <%--'rgba(75, 192, 192, 1)',--%>
            <%--'rgba(153, 102, 255, 1)',--%>
            <%--'rgba(255, 159, 64, 1)'--%>
          <%--],--%>
          <%--borderWidth: 1--%>
        <%--}]--%>
      <%--},--%>
      <%--options: {--%>
        <%--scales: {--%>
          <%--yAxes: [{--%>
            <%--ticks: {--%>
              <%--beginAtZero: true--%>
            <%--}--%>
          <%--}]--%>
        <%--}--%>
      <%--}--%>
    <%--});--%>

    <%--//pie--%>
    <%--var ctxP = document.getElementById("pieChart").getContext('2d');--%>
    <%--var myPieChart = new Chart(ctxP, {--%>
      <%--type: 'pie',--%>
      <%--data: {--%>
        <%--labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"],--%>
        <%--datasets: [{--%>
          <%--data: [300, 150, 100, 440, 120],--%>
          <%--backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],--%>
          <%--hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]--%>
        <%--}]--%>
      <%--},--%>
      <%--options: {--%>
        <%--responsive: true,--%>
        <%--legend: false--%>
      <%--}--%>
    <%--});--%>

    <%--var ctx1 = document.getElementById("text1").getContext('2d');--%>
    <%--var text1 = new Chart(ctx1,{--%>
      <%--type: 'bar',--%>
      <%--data: {--%>
        <%--labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],--%>
        <%--datasets: [{--%>
          <%--label: '# of Votes',--%>
          <%--data: [12, 19, 3, 5, 2, 3],--%>
          <%--backgroundColor: [--%>
            <%--'rgba(255, 99, 132, 0.2)',--%>
            <%--'rgba(54, 162, 235, 0.2)',--%>
            <%--'rgba(255, 206, 86, 0.2)',--%>
            <%--'rgba(75, 192, 192, 0.2)',--%>
            <%--'rgba(153, 102, 255, 0.2)',--%>
            <%--'rgba(255, 159, 64, 0.2)'--%>
          <%--],--%>
          <%--borderColor: [--%>
            <%--'rgba(255,99,132,1)',--%>
            <%--'rgba(54, 162, 235, 1)',--%>
            <%--'rgba(255, 206, 86, 1)',--%>
            <%--'rgba(75, 192, 192, 1)',--%>
            <%--'rgba(153, 102, 255, 1)',--%>
            <%--'rgba(255, 159, 64, 1)'--%>
          <%--],--%>
          <%--borderWidth: 1--%>
        <%--}]--%>
      <%--},--%>
      <%--options: {--%>
        <%--scales: {--%>
          <%--yAxes: [{--%>
            <%--ticks: {--%>
              <%--beginAtZero: true--%>
            <%--}--%>
          <%--}]--%>
        <%--}--%>
      <%--}--%>
    <%--});--%>
  <%--</script>--%>

  
</body>

</html>
