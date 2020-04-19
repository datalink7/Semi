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
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}
.starRev{
	height: 20px;
    margin-bottom: 10px;
    text-align: center;
}
.starSet{
    text-align: center;
}
</style>
<script type="text/javascript">
$(function(){
	$('.starRev span').click(function() {
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		return false;
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
						<h1>사용후기</h1>
						<p>Quick Box</p>
					</div>
					<!-- Advance Search -->
					<div class="advance-search" style="display: none;">
						
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
		<div class="row">
			<div class="col-12">
				<!-- Section title -->
				<div class="section-title">
					<h2>QuickBox</h2>
					<p>QuickBOX 실 사용자의 생생한 후기를 만나보세요!</p>
					<button type="button" class="btn btn-defalte" style="margin-top: -15px; margin-bottom: 12px; float: right;" data-toggle="modal" data-target="#reviewModal">후기등록하기</button>
				</div>
				<div class="row">
					<!-- Category list -->
					<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
						<div class="category-block">
							<div class="header">
								<i class="fa fa-laptop icon-bg-1"></i> 
								<h4>택배후기</h4>
							</div>
							<ul class="category-list" >
									<li style="padding-top: 0px;">
										<div class="starSet">
											<span class="starR on">별1</span> 
											<span class="starR on">별2</span>
											<span class="starR on">별3</span> 
											<span class="starR on">별4</span> 
											<span class="starR">별5</span> 
										</div>
									</li>
									<li style="height: 80px;">
										후기입니다후기후기후기!!
									</li>
								<li><a href="#">admin작성<span>2020-04-19</span></a></li>
							</ul>
						</div>
					</div> <!-- /Category List -->
					<!-- Category list -->
					<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
						<div class="category-block">
							<div class="header">
								<i class="fa fa-apple icon-bg-2"></i> 
								<h4>택배후기</h4>
							</div>
							<ul class="category-list" >
									<li style="padding-top: 0px;">
										<div class="starSet">
											<span class="starR on">별1</span> 
											<span class="starR on">별2</span>
											<span class="starR on">별3</span> 
											<span class="starR">별4</span> 
											<span class="starR">별5</span> 
										</div>
									</li>
									<li style="height: 80px;">
										후기입니다후기후기후기!!
									</li>
								<li><a href="#">admin작성<span>2020-04-19</span></a></li>
							</ul>
						</div>
					</div> <!-- /Category List -->
					<!-- Category list -->
					<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
						<div class="category-block">
							<div class="header">
								<i class="fa fa-home icon-bg-3"></i> 
								<h4>퀵서비스 후기</h4>
							</div>
							<ul class="category-list" >
									<li style="padding-top: 0px;">
										<div class="starSet">
											<span class="starR on">별1</span> 
											<span class="starR on">별2</span>
											<span class="starR on">별3</span> 
											<span class="starR on">별4</span> 
											<span class="starR">별5</span> 
										</div>
									</li>
									<li style="height: 80px;">
										후기입니다후기후기후기!!
									</li>
								<li><a href="#">admin작성<span>2020-04-19</span></a></li>
							</ul>
						</div>
					</div> <!-- /Category List -->
					<!-- Category list -->
					<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
						<div class="category-block">
							<div class="header">
								<i class="fa fa-shopping-basket icon-bg-4"></i> 
								<h4>택배후기</h4>
							</div>
							<ul class="category-list" >
									<li style="padding-top: 0px;">
										<div class="starSet">
											<span class="starR on">별1</span> 
											<span class="starR on">별2</span>
											<span class="starR on">별3</span> 
											<span class="starR">별4</span> 
											<span class="starR">별5</span> 
										</div>
									</li>
									<li style="height: 80px;">
										후기입니다후기후기후기!!
									</li>
								<li><a href="#">admin작성<span>2020-04-19</span></a></li>
							</ul>
						</div>
					</div> <!-- /Category List -->
					<!-- Category list -->
					<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
						<div class="category-block">
							<div class="header">
								<i class="fa fa-briefcase icon-bg-5"></i> 
								<h4>택배후기</h4>
							</div>
							<ul class="category-list" >
									<li style="padding-top: 0px;">
										<div class="starSet">
											<span class="starR on">별1</span> 
											<span class="starR on">별2</span>
											<span class="starR on">별3</span> 
											<span class="starR on">별4</span> 
											<span class="starR">별5</span> 
										</div>
									</li>
									<li style="height: 80px;">
										후기입니다후기후기후기!!
									</li>
								<li><a href="#">admin작성<span>2020-04-19</span></a></li>
							</ul>
						</div>
					</div> <!-- /Category List -->
					<!-- Category list -->
					<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
						<div class="category-block">
							<div class="header">
								<i class="fa fa-car icon-bg-6"></i> 
								<h4>퀵서비스 후기</h4>
							</div>
							<ul class="category-list" >
									<li style="padding-top: 0px;">
										<div class="starSet">
											<span class="starR on">별1</span> 
											<span class="starR on">별2</span>
											<span class="starR on">별3</span> 
											<span class="starR on">별4</span> 
											<span class="starR on">별5</span> 
										</div>
									</li>
									<li style="height: 80px;">
										후기입니다후기후기후기!!
									</li>
								<li><a href="#">admin작성<span>2020-04-19</span></a></li>
							</ul>
						</div>
					</div> <!-- /Category List -->
					<!-- Category list -->
					<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
						<div class="category-block">
							<div class="header">
								<i class="fa fa-paw icon-bg-7"></i> 
								<h4>퀵서비스 후기</h4>
							</div>
							<ul class="category-list" >
									<li style="padding-top: 0px;">
										<div class="starSet">
											<span class="starR on">별1</span> 
											<span class="starR">별2</span>
											<span class="starR">별3</span> 
											<span class="starR">별4</span> 
											<span class="starR">별5</span> 
										</div>
									</li>
									<li style="height: 80px;">
										후기입니다후기후기후기!!
									</li>
								<li><a href="#">admin작성<span>2020-04-19</span></a></li>
							</ul>
						</div>
					</div> <!-- /Category List -->
					<!-- Category list -->
					<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
						<div class="category-block">
							<div class="header">
								<i class="fa fa-laptop icon-bg-8"></i> 
								<h4>퀵서비스 후기</h4>
							</div>
							<ul class="category-list" >
									<li style="padding-top: 0px;">
										<div class="starSet">
											<span class="starR on">별1</span> 
											<span class="starR on">별2</span>
											<span class="starR on">별3</span> 
											<span class="starR">별4</span> 
											<span class="starR">별5</span> 
										</div>
									</li>
									<li style="height: 80px;">
										후기입니다후기후기후기!!
									</li>
								<li><a href="#">admin작성<span>2020-04-19</span></a></li>
							</ul>
						</div>
					</div> <!-- /Category List -->
					
					
				</div>
			</div>
		</div>
	</div>
	<!-- Container End -->
</section>

<!-- review Modal -->
<div class="modal fade" id="reviewModal" role="dialog">
	<div class="modal-dialog modal-md" style="top: 5%;">
		<div class="modal-content">     
			<div class="modal-header">
				<h4 class="modal-title">REVIEW</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" style="padding-bottom: 0px;">
				<table class="table">
					<tbody>
						<tr>
							<td style="width: 26%;">후기종류</td>
							<td>
								<select class="form-control"  id="" name="" style="height: 40px; margin-top: 4px;">
									<option value="">택배후기</option>
									<option value="">퀵서비스후기</option>
									<option value="">반값예약후기</option>     
								</select>
							</td>
						</tr>
						<tr>
							<td style="width: 26%;">후기</td>
							<td><textarea class="form-control" rows="5" id="" style="height: 200px;"></textarea></td>
						</tr>  
						<tr>
							<td style="width: 26%;">별점</td>
								<td>
									<div class="starRev">
										<span class="starR on">별1</span>
										<span class="starR">별2</span>
										<span class="starR">별3</span> 
										<span class="starR">별4</span> 
										<span class="starR">별5</span>
									</div>
								</td>
							</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" style="width: 124px; height: 50px; margin-left: auto">후기등록</button>
			</div>
		</div>
	</div>
</div>


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
						<img src="../images/logo-footer.png" alt="">
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
