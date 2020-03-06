<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="po.DJX.DBookType" %>
<%@ page import="sun.security.util.Length" %>
<%@ page import="po.DJX.DBook" %>
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

<%
String username = (String) session.getAttribute("username");
if (username == null) {
response.sendRedirect("/Msignup");
}
%>

<%
    List<DBookType> bookTypeList = (List<DBookType>) session.getAttribute("bookTypeList");
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
                    <li class="nav-item blue m-2">
                        <a href="/houtai-tianjiashuji" class="nav-link border border-light rounded">
                        添加书籍
                        </a>
                    </li>
                    <li class="nav-item m-2">
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
            <a href="/houtai-xinxitongji" class="list-group-item list-group-item-action waves-effect">
                <i class="fas fa-chart-pie mr-3"></i>信息统计
            </a>
            <a href="/houtai-yonghuguanli" class="list-group-item waves-effect">
                <i class="fas fa-user mr-3"></i>用户管理</a>
            <a href="/houtai-shujiguanli" class="list-group-item list-group-item-action waves-effect">
                <i class="fas fa-table mr-3"></i>书籍管理</a>
            <a href="/houtai-tianjiashuji" class="list-group-item  active list-group-item-action waves-effect">
                <i class="fas fa-map mr-3"></i>添加书籍</a>
        </div>

    </div>
    <!-- Sidebar -->

</header>
<!--Main Navigation-->

<!--Main layout-->
<main class="pt-5 mx-lg-5">
    <div class="container-fluid mt-5">
        <%--添加书籍的table页面--%>
        <%--首先是card作为整体--%>

            <div class="row">
                <div class="col-xl-12">
                    <div class="card shadow">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h4 class="m-0 font-weight-bold text-primary">书籍添加页面</h4>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <form role="form" class="form-horizontal">
                                <div class="form-group">
                                    <label for="b_name" class="col-xl-2 col-form-label-lg">书名</label>
                                    <div class="col-xl-10">
                                        <input type="text" name="b_name" id="b_name" onchange="checkBookName()" class="form-control" placeholder="请输入书名">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label for="b_author" class="col-xl-2 col-form-label-lg">作者</label>
                                    <div class="col-xl-10">
                                        <input type="text" name="b_author" id="b_author" class="form-control" placeholder="请输入作者">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xl-2 col-form-label-lg">书籍类型</label>
                                    <div class="col-xl-10">
                                        <%--循环遍历所有的书籍类型--%>

                                        <%
//                                            System.out.println(bookTypeList.size());
                                            for (int i=0;i<bookTypeList.size()-1;i++){
                                        %>
                                            <div style="width: 50%;float: left">
                                                    <h6><input id="bookType" name="bookType" type="checkbox" class="custom-checkbox" value="<%=bookTypeList.get(i).getT_id()%>">
                                                    <%=bookTypeList.get(i).getT_type()%>
                                                    </h6>
                                            </div>

                                        <%
                                            }
                                        %>
                                        <div style="width:25%;">
                                            <input name="bookType" type="checkbox" class="custom-checkbox" value="<%=bookTypeList.get(bookTypeList.size()-1).getT_id()%>">
                                            <%=bookTypeList.get(bookTypeList.size()-1).getT_type()%>
                                        </div>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label for="b_content" class="col-xl-2 col-form-label-lg">书籍简介</label>
                                    <div class="col-xl-10">
                                        <label for="b_content" class="col-xl-12">
                                            <textarea name="b_content" id="b_content" class="form-control" rows="3"></textarea>
                                        </label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="b_cover" class="col-xl-2 col-form-label-lg">上传书籍封面</label>
                                    <div class="col-xl-10">
                                        <input type="file" onchange="toBase64()" accept="image/jpeg,image/png,image/jpg" name="b_cover" id="b_cover" class="">
                                    </div>
                                    <div class="col-xl-10">
                                    <img src="" style="display: none" height="152px" width="114px" id="base64Img" name="base64Im"  alt="">
                                </div>
                                </div>

                                <div class="form-group">
                                    <input onclick="add()" type="button" class="col-xl-4 offset-4" value="提交">
                                </div>
                            </form>
                            <script>
                                var reader;
                                function toBase64() {
                                    var file = document.querySelector('input[type=file]').files[0];
                                    reader = new FileReader();
                                    reader.onloadend = function () {
                                        $("#base64Img").attr("style", "display:inline-block");
                                        $("#base64Img").attr("src", reader.result);
                                        console.log(reader.result);
                                    };
                                    if (file) {
                                        reader.readAsDataURL(file);
                                    }
                                }

                                function checkBookName() {
                                    var bookName = document.getElementById("b_name").value;
                                    $.ajax({
                                        url:'/sameBookName',
                                        async:false,
                                        type: 'post',
                                        dataType: 'text',
                                        data:{"bookName":bookName},
                                        success:function (s) {
                                            if (s=="1"){
                                                alert("书籍已存在");
                                                location.reload();
                                            }
                                        },
                                        error:function () {
                                            alert("系统出错");
                                        }
                                    });
                                }


                                function add() {
                                    var b_name = document.getElementById("b_name").value;
                                    var b_author = document.getElementById("b_author").value;
                                    var b_cover = reader.result.toString();
                                    // alert(b_cover);
                                    var b_content = document.getElementById("b_content").value;
                                    var obj = document.getElementsByName("bookType");
                                    var b_type = [];
                                    for (k in obj) {
                                        if (obj[k].checked){
                                            b_type.push(obj[k].value);
                                        }
                                    }
                                    alert(b_type);



                                    $.ajax({
                                        url:'/addBook',
                                        async:false,
                                        type: 'post',
                                        dataType: 'text',
                                        data:{"b_name":b_name,
                                        "b_author":b_author,
                                        "b_cover":b_cover,
                                        "b_content":b_content},
                                        success:function () {
                                            // alert('书籍信息存储成功');
                                            // alert(b_type);
                                            $.ajax({
                                                url:'/saveBookType',
                                                async:false,
                                                type: 'post',
                                                dataType: 'text',
                                                data: {
                                                    "book_name": b_name,
                                                    "b_type": b_type.toString(),
                                                },
                                                success:function () {
                                                    // alert("书籍相关类型添加成功");
                                                    alert("书籍添加成功");
                                                },
                                                error:function () {
                                                    // alert(b_type);
                                                    alert("saveBookTypeError");
                                                }

                                            });
                                        },
                                        error:function () {
                                            alert('系统出错');
                                        },
                                    });
                                    location.reload();
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
