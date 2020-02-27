<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<head>
    <title>书籍信息</title>
    <!-- custom-theme -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content="" />
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- default-css-files -->
    <link href="${pageContext.request.contextPath}/static/css/book_infor-css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="${pageContext.request.contextPath}/static/css/book_infor-css/font-awesome.css" rel="stylesheet">
    <!-- default-css-files -->
    <!-- style-css-file -->
    <link href="${pageContext.request.contextPath}/static/css/book_infor-css/style.css" rel='stylesheet' type='text/css' />
    <!-- //style-css-file -->
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/book_infor-css/lightbox.css">--%>
    <!-- For-Gallery-CSS -->
    <!-- web fonts -->
    <link href="http://fonts.googleapis.com/css?family=Alex+Brush&amp;subset=latin-ext" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i&amp;subset=cyrillic,latin-ext,vietnamese"
          rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800&amp;subset=latin-ext" rel="stylesheet">
    <!-- //web fonts -->
    <!--导航栏-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/book_infor-css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/book_infor-css/index.css">
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
<div class="main-banner-agile" id="home">


    <!-- header -->

    <header class="header">
        <div class="header-inner body-width">
            <a href="#" class="logo"></a>
            <div class="category">
                <a class="category-link">分类</a>
                <i class="icon-arrow"></i>
                <div class="drop_con">
                    <a>哈哈哈哈</a>
                    <a>hhhhh</a>
                </div>
                <div class="category-result"></div>
                <!-- 边框 -->
                <span class="btn-border"></span>
                <span class="result-border"></span>
                <span class="neck-border"></span>
            </div>
            <div class="search">
                <input type="text" class="search-text" placeholder="Seach here...">
                <button class="search-btn"><i class="icon-search"></i></button>
            </div>
            <nav class="header-nav">
                <ul>
                    <li>
                        <span class="line"></span>
                        <a href="#" class="dreamer">悦读</a>
                        <i class="icon-text__pink icon-new">new</i>
                    </li>
                    <li>
                        <span class="line"></span>
                        <a href="#" class="icon-text__pink register">注册</a>
                    </li>
                    <li>
                        <span class="line"></span>
                        <a href="#">登录</a>
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
                <img src="${pageContext.request.contextPath}/static/image/book_infor-image/ab.jpg" class="img-responsive" alt="" />
            </div>
            <div class="col-md-8 about-right wthree">
                <h3>书名</h3>
                <ul class="address">
                    <li>
                        <ul class="agileits-address-text ">
                            <li>
                                <b>作者：</b>
                            </li>
                            <li>xxxx</li>
                        </ul>
                    </li>
                    <li>
                        <ul class="agileits-address-text">
                            <li>
                                <b>类型：</b>
                            </li>
                            <li>aa</li>
                        </ul>
                    </li>


                </ul>
                <h4>简介：</h4>
                <p>Alison Lee was born in Hampshire, UK, and now lives in the United States. As a child she discovered his love of books,
                    reading, and stories. cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
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
                <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='982' data-delay='.5' data-increment="1">986</div>
                <p>收藏</p>
            </div>
            <div class="col-xs-3 stats-grid-w3-agile">
                <div class="stats-img">
                    <span class="fa fa-leanpub" aria-hidden="true"></span>
                </div>
                <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='678' data-delay='.5' data-increment="1">678</div>
                <p>开始阅读</p>
            </div>
            <div class="col-xs-3 stats-grid-w3-agile ">
                <div class="stats-img">
                    <span class="fa fa-commenting-o" aria-hidden="true"></span>
                </div>
                <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='768' data-delay='.5' data-increment="1">768</div>
                <a href="${pageContext.request.contextPath}/view/comment.jsp"><p>书评区</p></a>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>





<!-- testimonials -->
<div class="testimonials" id="testi">
    <div class="container">
        <h3 class="tittle-w3l">What Publications Say</h3>
        <div class="wthree_testimonial_grids">
            <div class="wthree_testimonial_grid_left">
                <div class="w3ls_testimonial_grid_left_grid">
                    <div class="col-xs-4 agileinfo_testimonials_left">
                        <img src="${pageContext.request.contextPath}/static/image/book_infor-image/t1.jpg" alt=" " class="img-people" />
                        <h4>John Crisp</h4>
                    </div>
                    <div class="col-xs-8 agileinfo_testimonials_right">
                        <div class="agileits_testimonials_right_grid">
                            <p>consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
                                veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="w3ls_testimonial_grid_left_grid w3l_testimonial_grid_left_grid">
                    <div class="col-xs-8 agileinfo_testimonials_right agileits_w3layouts_farm_man">
                        <div class="agileits_testimonials_right_grid w3_testimonials_right_grid">
                            <p>consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
                                veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        </div>
                    </div>

                    <div class="col-xs-4 agileinfo_testimonials_left">
                        <img src="${pageContext.request.contextPath}/static/image/book_infor-image/t2.jpg" alt=" " class="img-people" />
                        <h4>Thomus Carl</h4>
                    </div>
                    <div class="clearfix"> </div>
                </div>

                <div class="w3ls_testimonial_grid_left_grid">
                    <div class="col-xs-4 agileinfo_testimonials_left">
                        <img src="${pageContext.request.contextPath}/static/image/book_infor-image/t3.jpg" alt=" " class="img-people" />
                        <h4>John Crisp</h4>
                    </div>
                    <div class="col-xs-8 agileinfo_testimonials_right">
                        <div class="agileits_testimonials_right_grid">
                            <p>consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
                                veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //testimonials -->


<!-- contact -->
<div class="w3ls_map" id="contact">
    <div class="mail">
        <div class="container">
            <div class="w3l_contact_grids">
                <form action="#" method="post">
                    <div class="clearfix"> </div>
                    <textarea name="Message" placeholder="Type Message Here...." required></textarea>
                    <input type="submit" value="Submit Now" />
                </form>
            </div>
        </div>
    </div>
</div>
<!-- //contact -->




<!-- js -->
<script src="js/book_infor-js/jquery-2.1.4.min.js"></script>
<!-- //js -->

<!-- for bootstrap working -->
<script src="js/book_infor-js/bootstrap.js"></script>
<!-- //for bootstrap working -->

<!-- stats numscroller-js-file -->
<script src="js/book_infor-js/numscroller-1.0.js"></script>
<!-- //stats numscroller-js-file -->

<!--  light box js -->
<script src="js/book_infor-js/lightbox-plus-jquery.min.js"></script>
<!-- //light box js-->

<!-- flexisel (for special offers) -->
<script src="js/book_infor-js/jquery.flexisel.js"></script>
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

<!-- pricing-tablel -->
<script src="js/book_infor-js/jquery.magnific-popup.js"></script>
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

<!-- smooth scrolling -->
<script src="js/book_infor-js/SmoothScroll.min.js"></script>
<!-- //smooth scrolling -->

<!-- start-smoth-scrolling -->
<script src="js/book_infor-js/move-top.js"></script>
<script src="js/book_infor-js/easing.js"></script>
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
<a href="#" id="toTop" style="display: block;">
    <span id="toTopHover" style="opacity: 1;"> </span>
</a>
<!-- //smooth scrolling-bottom-to-top -->

</body>

</html>
