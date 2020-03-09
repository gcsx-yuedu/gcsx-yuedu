<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="po.JZX.JBook" %>
<%@ page import="po.JZX.JBookList" %>
<%@ page import="po.JZX.JShortComm" %>
<%@ page import="po.ZYM.ZBookType" %>
<%@ page contentType="text/html;charset=utf-8"%>
<head>
    <title>书籍信息</title>
    <!-- custom-theme -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content="" />
    <%--<script>--%>
        <%--addEventListener("load", function () {--%>
            <%--setTimeout(hideURLbar, 0);--%>
        <%--}, false);--%>

        <%--function hideURLbar() {--%>
            <%--window.scrollTo(0, 1);--%>
        <%--}--%>
    <%--</script>--%>
    <!-- default-css-files -->
    <!--  light box js -->
    <script src="${pageContext.request.contextPath}/static/js/book_infor-js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/book_infor-js/lightbox-plus-jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/book_infor-js/jquery-2.1.4.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/book_infor-css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="${pageContext.request.contextPath}/static/css/book_infor-css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/book_infor-css/star-rating.css" rel="stylesheet" media="all" type="text/css">
    <script src="${pageContext.request.contextPath}/static/js/book_infor-js/star-rating.js" type="text/javascript"></script>
    <!-- default-css-files -->
    <!-- style-css-file -->
    <link href="${pageContext.request.contextPath}/static/css/book_infor-css/style.css" rel='stylesheet' type='text/css' />
    <!-- pricing-tablel -->
    <script src="${pageContext.request.contextPath}/static/js/book_infor-js/jquery.magnific-popup.js"></script>
    <!-- //style-css-file -->
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/book_infor-css/lightbox.css">--%>
    <!-- For-Gallery-CSS -->
    <!-- web fonts -->
    <!-- smooth scrolling -->
    <script src="${pageContext.request.contextPath}/static/js/book_infor-js/SmoothScroll.min.js"></script>
    <!-- //smooth scrolling -->

    <!-- start-smoth-scrolling -->
    <script src="${pageContext.request.contextPath}/static/js/book_infor-js/move-top.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/book_infor-js/easing.js"></script>
    <link href="http://fonts.googleapis.com/css?family=Alex+Brush&amp;subset=latin-ext" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i&amp;subset=cyrillic,latin-ext,vietnamese"
          rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800&amp;subset=latin-ext" rel="stylesheet">
    <!-- //web fonts -->
    <!--导航栏-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/book_infor-css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/book_infor-css/index.css">
</head>

<%
    JBook book =(JBook) session.getAttribute("book");
    List<JShortComm> scList=(List<JShortComm>)session.getAttribute("ShortComm");
    String wenzi = request.getParameter("wenzi");
    List<ZBookType> types = (List<ZBookType>)session.getAttribute("types");
    int isBookShelf = (int) session.getAttribute("isBookShelf");

%>

        <body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
<div class="main-banner-agile" id="home">


    <!-- header --><header class="header">
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
                <input type="text" class="search-text" placeholder="Seach here..."value="<%= wenzi==null?"":wenzi %>">
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
                    <a href="/user_info?u_id=<%=session.getAttribute("userId")%>" class="app" style="cursor:pointer"><%=session.getAttribute("userName")%></a>
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
    <!-- //header -->

</div>


<!-- about -->
<div class="about" id="about">
    <div class="container">
        <div class="about-agileinfo">
            <div class="col-md-4 about-left ">
                <img src="<%=book.getB_cover()%>" class="img-responsive" alt="" />
            </div>
            <% String typeList=org.apache.commons.lang.StringUtils.strip(book.getTypeList().toString(),"[]");%>

            <div class="col-md-8 about-right wthree">
                <input type="hidden" value="<%=book.getB_id()%>" id="shuji_id" />
                <h3><%=book.getB_name()%></h3>
                <ul class="address">
                    <li>
                        <ul class="agileits-address-text ">
                            <li>
                                <b>作者：</b>
                            </li>
                            <li><%=book.getB_author()%></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="agileits-address-text">
                            <li>
                                <b>类型：</b>
                            </li>
                            <li><%=typeList%></li>
                        </ul>
                    </li>


                </ul>
                <h4>简介：</h4>
                <p><%=book.getB_content()%>
                </p>
            </div>
        </div>
    </div>
</div>
<!-- //about -->

<!-- Stats-->
<div class="stats-w3layouts">
    <div class="container">
        <div class="stats-info">
            <div class="col-xs-3 stats-grid-w3-agile">
                <div class="stats-img">
                    <span class="fa fa-book" aria-hidden="true"></span>
                </div>
                <%--<div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='982' data-delay='.5' data-increment="1">986</div>--%>
                <p onclick="bookShelf()"><%
                    if (isBookShelf==0){
                %>
                    收藏
                    <%
                    }else {
                    %>
                    取消收藏
                    <%
                        }
                    %></p>
            </div>
            <div class="col-xs-3 stats-grid-w3-agile">
                <div class="stats-img">
                    <span class="fa fa-leanpub" aria-hidden="true"></span>
                </div>
                <%--<div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='678' data-delay='.5' data-increment="1">678</div>--%>
                    我的评分：<br>
                    <div class="btn-group">
                <button class="btn btn-default active">1</button>
                <button class="btn btn-default">2</button>
                <button class="btn btn-default">3</button>
                <button class="btn btn-default">4</button>
                <button class="btn btn-default">5</button>
                </div>
            </div>

            <div class="col-xs-3 stats-grid-w3-agile ">
                <div class="stats-img">
                    <span class="fa fa-commenting-o" aria-hidden="true"></span>
                </div>
                <%--<div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='768' data-delay='.5' data-increment="1">768</div>--%>
                <a href="/comment?book_id=<%=book.getB_id()%>"><p>书评区</p></a>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>





<!-- testimonials -->
<div class="testimonials" id="testi">
    <!-- contact -->
    <div class="w3ls_map" id="contact">
        <div class="mail">
            <div class="container">
                <div class="w3l_contact_grids">
                    <form action="#" method="post">
                        <div class="clearfix"> </div>
                        <textarea name="Message" placeholder="Type Message Here...." required id="content"></textarea>
                        <input type="submit" value="Submit Now" onclick="addSC()" />
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- //contact -->
    <div class="container">
        <h3 class="tittle-w3l">What Publications Say</h3>
        <div class="wthree_testimonial_grids">
            <div class="wthree_testimonial_grid_left">
                <% int k=1;
                    for(JShortComm sc:scList){
                        Integer click=sc.getUser_click();
                        Integer totalClick = sc.getClick();
                        if(k%2==1){
                %>
                <div class="w3ls_testimonial_grid_left_grid">
                    <div class="col-xs-4 agileinfo_testimonials_left">
                        <img src="${pageContext.request.contextPath}/static/image/book_infor-image/t1.jpg" alt=" " class="img-people" />
                        <h4><%=sc.getFatie_name()%></h4>
                    </div>
                    <div class="col-xs-8 agileinfo_testimonials_right">
                        <div class="agileits_testimonials_right_grid">
                            <p><%=sc.getFatie_content()%>.</p>
                            <div class="testimonials_time"><%=sc.getFatie_time()%></div>
                            <div class="testimonials_click" >
                                <i id="<%sc.getId();%>" onclick="Click(<%=click%>,<%=sc.getId()%>,<%=totalClick%>)" class="fa <%if(click==0){%>fa-heart-o <%}else{%>fa-heart<%}%>"></i>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <%} else {%>
                <div class="w3ls_testimonial_grid_left_grid w3l_testimonial_grid_left_grid">
                    <div class="col-xs-8 agileinfo_testimonials_right agileits_w3layouts_farm_man">
                        <div class="agileits_testimonials_right_grid w3_testimonials_right_grid">
                            <p><%=sc.getFatie_content() %></p>
                            <div class="testimonials_time"><%=sc.getFatie_time()%></div>
                            <div class="testimonials_click" >
                                <i id="<%=sc.getId()%>" onclick="Click(<%=click%>,<%=sc.getId()%>,<%=totalClick%>)" class="fa <%if(click==0){%>fa-heart-o <%}else{%>fa-heart<%}%>"></i>
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-4 agileinfo_testimonials_left">
                        <img src="${pageContext.request.contextPath}/static/image/book_infor-image/t2.jpg" alt=" " class="img-people" />
                        <h4><%=sc.getFatie_name()%></h4>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <%}
                k++;}
                        %>

            </div>
        </div>
    </div>
</div>

<!-- js -->
<script src="${pageContext.request.contextPath}/static/js/book_infor-js/jquery-2.1.4.min.js"></script>
<!-- //js -->

<!--点赞-->
<%--<script type="text/jscript">--%>
 <%--$(document).ready(function(){--%>
  <%--$('.testimonials_click').find('i').click(function(){$(this).toggleClass('fa-heart-o fa-heart')});--%>
<%--});--%>
<%--</script>--%>
<script>
    function  Click(click,id,totalClick) {
        // alert("点赞方法已被调用");
        if(click==0){
            $.ajax({
                url:'/Dianzan',
                async: false,
                type: 'post',
                data:{"id":id,
                    "totalClick":totalClick,
                },
                success:function () {
                    alert("点赞成功");
                    window.location.reload();
                },error:function () {
                    alert("系统出错");
                }
            })
        }
        if(click==1){
            $.ajax({
                url:'/Quxiao',
                async: false,
                type: 'post',
                data:{"id":id,
                    "totalClick":totalClick,
                },
                success:function () {
                    alert("取消点赞");
                    window.location.reload();
                },error:function () {
                    alert("系统出错");
                }
            })
        }
    }
    function bookShelf() {
        var bookshelf = <%=isBookShelf%>;
        if (bookshelf==0){
            $.ajax({
                url: '/shouCang',
                async:false,
                type: 'post',
                data: {"user_id":<%=session.getAttribute("userId")%>,
                    "book_id":<%=book.getB_id()%>,
                },
                success:function () {
                    alert("收藏成功");
                    location.reload();
                },
                error: function () {
                    alert("系统出错");

                }
            });
        } else {
            $.ajax({
                url: '/quXiaoShouCang',
                async:false,
                type: 'post',
                data: {"user_id":<%=session.getAttribute("userId")%>,
                    "book_id":<%=book.getB_id()%>,
                },
                success:function () {
                    alert("取消收藏成功");
                    location.reload();
                },
                error: function () {
                    alert("系统出错");

                }
            });
        }
    }
</script>



<!--添加评论-->
<script>
    function addSC() {
        var shuji_id =document.getElementById("shuji_id").value;
        var fatiecontent = document.getElementById("content").value;
        // alert (shuji_id);
        $.ajax({
            url: '/JuserIsForbid',
            async: false,
            type: 'post',
            data:{"u_id":<%=session.getAttribute("userId")%>},
            success:function (s) {
                if (s == 0) {
                    $.ajax({
                        url:'/addShortComm',   //requestMapping对应
                        async:false,
                        type:'post',
                        data:{"shuji_id":shuji_id,"fatie_content":fatiecontent},
                        success:function () {
                            alert('评论添加成功');
                            location.reload();
                        },
                        error:function () {
                            alert('添加失败');
                        }
                    })
                }else {
                    alert("你已被禁言");
                    document.getElementById("content").value = "";
                }
            }
        });

    }
</script>

<!-- for bootstrap working -->
<script src="${pageContext.request.contextPath}/static/js/book_infor-js/bootstrap.js"></script>
<!-- //for bootstrap working -->

<!-- stats numscroller-js-file -->
<script src="${pageContext.request.contextPath}/static/js/book_infor-js/numscroller-1.0.js"></script>
<!-- //stats numscroller-js-file -->


<!-- //light box js-->

<!-- flexisel (for special offers) -->
<script src="${pageContext.request.contextPath}/static/js/book_infor-js/jquery.flexisel.js"></script>
<script>
    $(window).load(function () {
        $("#flexiselDemo1").flexisel({
            visibleItems: 3,
            animationSpeed: 1000,
            autoPlay: true,
            autoPlaySpeed: 3000,
            pauseOnHover: true,
            enableResponsiveBreakpoints: true,
            responsiveBreakpoints: {
                portrait: {
                    changePoint: 480,
                    visibleItems: 1
                },
                landscape: {
                    changePoint: 640,
                    visibleItems: 2
                },
                tablet: {
                    changePoint: 768,
                    visibleItems: 2
                }
            }
        });

    });
</script>
<!-- //flexisel (for special offers) -->


<script>
    $(document).ready(function () {
        $('.popup-with-zoom-anim').magnificPopup({
            type: 'inline',
            fixedContentPos: false,
            fixedBgPos: true,
            overflowY: 'auto',
            closeBtnInside: true,
            preloader: false,
            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in'
        });

    });
</script>
<!-- //pricing-tablel -->


<script>
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({
                scrollTop: $(this.hash).offset().top
            }, 1000);
        });
    });
</script>
<!-- start-smoth-scrolling -->

<!-- smooth scrolling-bottom-to-top -->
<script>
    $(document).ready(function () {
        /*
            var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
            };
        */
        $().UItoTop({
            easingType: 'easeOutQuart'
        });
    });
</script>
<%--<a href="#" id="toTop" style="display: block;">--%>
    <%--<span id="toTopHover" style="opacity: 1;"> </span>--%>
<%--</a>--%>
<!-- //smooth scrolling-bottom-to-top -->

</body>

</html>