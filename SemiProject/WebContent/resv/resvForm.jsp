<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<head>
<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Quick Box</title>

<!-- Bootstrap -->
<link href="../plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="../plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- Owl Carousel -->
<link href="../plugins/slick-carousel/slick/slick.css" rel="stylesheet">
<link href="../plugins/slick-carousel/slick/slick-theme.css" rel="stylesheet">
<!-- Fancy Box -->
<link href="../plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet">
<link href="../plugins/jquery-nice-select/css/nice-select.css" rel="stylesheet">
<link href="../plugins/seiyria-bootstrap-slider/dist/css/bootstrap-slider.min.css" rel="stylesheet">
<!-- CUSTOM CSS -->
<link href="../css/style.css" rel="stylesheet">

<!-- JAVASCRIPTS -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="../plugins/jquery/dist/jquery.min.js"></script>
<script src="../plugins/tether/js/tether.min.js"></script>
<script src="../plugins/raty/jquery.raty-fa.js"></script>
<script src="../plugins/bootstrap/dist/js/popper.min.js"></script>
<script src="../plugins/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../plugins/seiyria-bootstrap-slider/dist/bootstrap-slider.min.js"></script>
<script src="../plugins/slick-carousel/slick/slick.min.js"></script>
<script src="../plugins/jquery-nice-select/js/jquery.nice-select.min.js"></script>
<script src="../plugins/fancybox/jquery.fancybox.pack.js"></script>
<!-- <script src="plugins/smoothscroll/SmoothScroll.min.js"></script> -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>

<style>
</style>
<script type="text/javascript">
$(function(){
	$(".resvBtn").on("click",function(){
		$(".resvBtn").css("background-color","#dc3545");
		$(".resvBtn").css("color","#fff");
		$(this).css("background-color","white");
		$(this).css("color","black");
	});
});
</script>
</head>
<body class="body-wrapper">
	<!-- 상단헤더고정 -->
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<nav class="navbar navbar-expand-lg  navigation">
						<a class="navbar-brand" href="../index.jsp"> 
							<img src="../images/main_logo.png" style="width: 196px; height: 52px;" alt="">
						</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav ml-auto main-nav ">
								<li class="nav-item">
									<a class="nav-link" href="../index.jsp"><b>Home</b></a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="../resv/resvForm.jsp">예약</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#">조회</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="../user/mypage.jsp">마이페이지</a>
								</li>
								<li class="nav-item dropdown dropdown-slide">
									<a class="nav-link dropdown-toggle" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">고객센터 
										<span><i class="fa fa-angle-down"></i></span>
									</a> <!-- Dropdown list -->
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item" href="../cscenter/faq.jsp">자주묻는질문</a> 
										<a class="dropdown-item" href="../cscenter/qna.jsp">Q&A</a> 
										<a class="dropdown-item" href="../cscenter/review.jsp">사용후기</a> 
									</div>
								</li>
							</ul>
							<ul class="navbar-nav ml-auto mt-10">
								<li class="nav-item">
									<a class="nav-link login-button" href="#" data-toggle="modal" data-target="#joinModal">JoinUs</a>
								</li>
								<li class="nav-item">
									<a class="nav-link login-button" href="#" data-toggle="modal" data-target="#loginModal">Login</a>
								</li>
							</ul>
						</div>
					</nav>  
				</div>
			</div>
		</div>
	</section>   
	<!-- 상단헤더고정 -->
	
	<section class="hero-area bg-1 text-center overly">
		<!-- Container Start -->
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- Header Contetnt -->
					<div class="content-block">
						<h1>RESERVATION</h1>
						<p>Quick Box - 보관함, 택배, 반값예약서비스</p>
						
					</div>
					<!-- Advance Search -->
					<div class="advance-search">
						<form action="#">
							<div class="row">
								<!-- Store Search -->
								<div class="col-lg-12 col-md-12">
									<div class="block d-flex">
										<button type="button" class="btn btn-danger resvBtn" style="margin: auto; width: 30%;">보관함서비스</button>
										<button type="button" class="btn btn-danger resvBtn" style="margin: auto; width: 30%;">택배서비스</button>
										<button type="button" class="btn btn-danger resvBtn" style="margin: auto; width: 30%;">반값예약서비스</button>
									</div>
								</div>
							</div>
						</form>

					</div>

				</div>
			</div>
		</div>
		<!-- Container End -->
	</section>

<!--===================================
=            Client Slider            =
====================================-->



<!--==========================================
=            All Category Section            =
===========================================-->

	<section class=" section">
		<!-- Container Start -->
		<div class="container">
			
		</div>
	</section>

<!--============================
=            Footer            =
=============================-->

	<footer class="footer section section-sm">
		<!-- Container Start -->
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-7 offset-md-1 offset-lg-0">
					<!-- About -->
					<div class="block about">
						<!-- footer logo -->
						<img src="../images/main_logo2.png" alt="" style="width: 200px;">
						<!-- description -->
						<p class="alt-color">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit, sed do eiusmod tempor incididunt ut labore et
							dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
							exercitation ullamco laboris nisi ut aliquip ex ea commodo
							consequat.</p>
					</div>
				</div>
				<!-- Link list -->
				<div class="col-lg-2 offset-lg-1 col-md-3">
					<div class="block">
						<h4>Site Pages</h4>
						<ul>
							<li><a href="#">Boston</a></li>
							<li><a href="#">How It works</a></li>
							<li><a href="#">Deals & Coupons</a></li>
							<li><a href="#">Articls & Tips</a></li>
							<li><a href="#">Terms of Services</a></li>
						</ul>
					</div>
				</div>
				<!-- Link list -->
				<div class="col-lg-2 col-md-3 offset-md-1 offset-lg-0">
					<div class="block">
						<h4>Admin Pages</h4>
						<ul>
							<li><a href="#">Boston</a></li>
							<li><a href="#">How It works</a></li>
							<li><a href="#">Deals & Coupons</a></li>
							<li><a href="#">Articls & Tips</a></li>
							<li><a href="#">Terms of Services</a></li>
						</ul>
					</div>
				</div>
				<!-- Promotion -->
				<div class="col-lg-4 col-md-7">
					<!-- App promotion -->
					<div class="block-2 app-promotion">
						<a href=""> <!-- Icon --> <img
							src="../images/footer/phone-icon.png" alt="mobile-icon">
						</a>
						<p>Get the Dealsy Mobile App and Save more</p>
					</div>
				</div>
			</div>
		</div>
		<!-- Container End -->
	</footer>
	<!-- Footer Bottom -->
	<footer class="footer-bottom">
		<!-- Container Start -->
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-12">
					<!-- Copyright -->
					<div class="copyright">
						<p>Copyright © 2016. All Rights Reserved</p>
					</div>
				</div>
				<div class="col-sm-6 col-12">
					<!-- Social Icons -->
					<ul class="social-media-icons text-right">
						<li><a class="fa fa-facebook" href=""></a></li>
						<li><a class="fa fa-twitter" href=""></a></li>
						<li><a class="fa fa-pinterest-p" href=""></a></li>
						<li><a class="fa fa-vimeo" href=""></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Container End -->
		<!-- To Top -->
		<div class="top-to">
			<a id="top" class="" href=""><i class="fa fa-angle-up"></i></a>
		</div>
	</footer>
</body>

</html>
