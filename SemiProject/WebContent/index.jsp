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
<link href="plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- Owl Carousel -->
<link href="plugins/slick-carousel/slick/slick.css" rel="stylesheet">
<link href="plugins/slick-carousel/slick/slick-theme.css" rel="stylesheet">
<!-- Fancy Box -->
<link href="plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet">
<link href="plugins/jquery-nice-select/css/nice-select.css" rel="stylesheet">
<link href="plugins/seiyria-bootstrap-slider/dist/css/bootstrap-slider.min.css" rel="stylesheet">
<!-- CUSTOM CSS -->
<link href="css/style.css" rel="stylesheet">

<!-- JAVASCRIPTS -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="plugins/jquery/dist/jquery.min.js"></script>
<script src="plugins/tether/js/tether.min.js"></script>
<script src="plugins/raty/jquery.raty-fa.js"></script>
<script src="plugins/bootstrap/dist/js/popper.min.js"></script>
<script src="plugins/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="plugins/seiyria-bootstrap-slider/dist/bootstrap-slider.min.js"></script>
<script src="plugins/slick-carousel/slick/slick.min.js"></script>
<script src="plugins/jquery-nice-select/js/jquery.nice-select.min.js"></script>
<script src="plugins/fancybox/jquery.fancybox.pack.js"></script>
<!-- <script src="plugins/smoothscroll/SmoothScroll.min.js"></script> -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnaddr").on("click",function(){
		post1();
	});
	
	function post1() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	           var zonecode=data.zonecode;
	           var roadAddr = data.address;
	           var str="("+zonecode+")"+roadAddr;
//	            console.log(str);
	            $("#userAddr1").val(str);
	        }
	    }).open();
	}
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
						<a class="navbar-brand" href="index.jsp"> 
							<img src="images/main_logo.png" style="width: 196px; height: 52px;" alt="">
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
									<a class="nav-link" href="index.jsp"><b>Home</b></a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="resv/resvForm.jsp">예약</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#">조회</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="user/mypage.jsp">마이페이지</a>
								</li>
								<li class="nav-item dropdown dropdown-slide">
									<a class="nav-link dropdown-toggle" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">고객센터 
										<span><i class="fa fa-angle-down"></i></span>
									</a> <!-- Dropdown list -->
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item" href="cscenter/faq.jsp">자주묻는질문</a> 
										<a class="dropdown-item" href="cscenter/qna.jsp">Q&A</a> 
										<a class="dropdown-item" href="cscenter/review.jsp">사용후기</a> 
									</div>
								</li>
							</ul>
							<ul class="navbar-nav ml-auto mt-10">
								<li class="nav-item" id="joinLi" style="display: block;">
									<a class="nav-link login-button" href="#" data-toggle="modal" data-target="#joinModal">JoinUs</a>
								</li>
								<li class="nav-item" id="loginLi" style="display: block;">
									<a class="nav-link login-button" href="#" data-toggle="modal" data-target="#loginModal">Login</a>
								</li>
								<li class="nav-item" id="logoutLi" style="display: block;">
									<a class="nav-link login-button" href="#">Logout</a>
								</li>
							</ul>
						</div>
					</nav>  
				</div>
			</div>
		</div>
	</section>   
	<!-- 상단헤더고정 -->
	
	<!-- Join Modal -->
	<div class="modal fade" id="joinModal" role="dialog">
		<div class="modal-dialog modal-md" style="">
			<div class="modal-content">     
				<div class="modal-header">
					<h4 class="modal-title">JOIN US</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" style="padding-bottom: 0px;">
					<table class="table">
						<tbody>
							<tr>
								<td style="width: 26%;">아이디</td>
								<td>
									<input type="text" class="form-control col-sm-8" id="joinUserId" name="joinUserId" style="height: 30px; float: left">
									<button type="button" id="idCheck" class="btn btn-sm" style="padding: 3px 10px; margin-left: 5px;">중복확인</button>
								</td>
							</tr>
							<tr>
								<td style="width: 26%;">비밀번호</td>
								<td><input type="password" class="form-control" id="joinUserPwd" name="joinUserPwd" style="height: 30px;"></td>
							</tr>
							<tr>
								<td style="width: 26%;">비밀번호확인</td>
								<td><input type="password" class="form-control" id="joinUserPwdChk" name="joinUserPwdChk" style="height: 30px;"></td>
							</tr>
							<tr>
								<td style="width: 26%;">이름</td>
								<td><input type="password" class="form-control" id="joinUserName" name="joinUserName" style="height: 30px;"></td>
							</tr>
							<tr>
								<td style="width: 26%;">핸드폰번호</td>
								<td><input type="password" class="form-control" id="joinUserPhone" placeholder="'-' 를 빼고 입력해주세요." name="joinUserPhone" style="height: 30px;"></td>
							</tr>
							<tr>
								<td style="width: 26%;">성별</td>
								<td>
									<div class="radio">
										<label><input type="radio" name="joinUserSex" value="M" checked>남자</label>
										<label><input type="radio" name="joinUserSex" value="F">여자</label>
									</div>
								</td>
							</tr>
							<tr>  
								<td style="width: 26%;">이메일</td>
								<td>
									<input type="text" class="form-control col-sm-5" id="joinUserEmail1" name="joinUserEmail1" style="height: 30px; float: left">&nbsp@
									<input type="text" class="form-controll col-sm-6" id="joinUserEmail2" name="joinUserEmail2" style="height: 30px;">
									<select class="form-control"  id="joinUserEmail3" name="joinUserEmail3" style="height: 36px; margin-top: 4px;">
										<option value="-">직접입력</option>
										<option value="gmail.com">구글</option>
										<option value="naver.com">네이버</option>
										<option value="daum.net">다음</option>     
										<option value="nate.com">네이트</option>
								</select>
								</td>
							</tr>
							<tr>   
								<td style="width: 26%;">주소</td>
								<td>
									<input type="text" class="form-control col-sm-8" id="joinUserAdd1" name="joinUserAdd1" style="height: 30px; float: left">
									<button type="button" id="btnaddr" class="btn btn-sm" style="padding: 3px 10px; margin-left: 5px;">주소검색</button>
									<input type="text" class="form-control" id="joinUserAdd2" name="joinUserAdd2" style="height: 30px; margin-top: 4px;">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" style="width: 124px; height: 50px; margin-left: auto">회원가입</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Login Modal -->
	<div class="modal fade" id="loginModal" role="dialog">
		<div class="modal-dialog modal-md" style="top: 20%;">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">LOGIN</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="control-label col-sm-2" for="userId">아이디:</label>
							<div class="col-sm-12">
								<input type="text" class="form-control" id="loginUserId" placeholder="Enter userId" name="userId">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for="userPwd">비밀번호:</label>
							<div class="col-sm-12">
								<input type="password" class="form-control" id="loginUserPwd" placeholder="Enter password" name="userPwd">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label><input type="checkbox" name="remember"> 아이디 저장</label>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" style="width: 143px; height: 50px;">아이디 찾기</button>
					<button type="button" class="btn btn-default" style="width: 162px; height: 50px;">비밀번호 찾기</button>
					<button type="button" class="btn btn-danger" style="width: 108px; height: 50px; margin-left: auto">로그인</button>
				</div>
			</div>
		</div>
	</div>

	<section class="hero-area bg-1 text-center overly">
	<!-- Container Start -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- Header Contetnt -->
				<div class="content-block">
					<p style="font-size:30px;">바쁜 일상 속,<br>
					 내 택배는 무사히 도착했을까?<br>
					 도난 당하지는 않았을까?</p>
					<p style="font-size:35px;"><b>안전한 통합 택배서비스 <br><b style="color: lightcoral;">QuickBox</b>가 해결해드립니다.</b></p>
					
				</div>
				<!-- Advance Search -->
				<div class="advance-search" style="display: none;">
					<form action="#">
						<div class="row">
							<!-- Store Search -->
							<div class="col-lg-6 col-md-12">
								<div class="block d-flex">
									<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="search" placeholder="Search for store">
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


<!--===========================================
=            Popular deals section            =
============================================-->

	<section class="popular-deals section bg-gray" style="padding-top: 60px; padding-bottom: 0px;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<div class="section-title">
						<img src="images/image1.PNG" alt="">
					</div>
				</div>
			</div>
			
		</div>
	</section>



	<!--==========================================
=            All Category Section            =
===========================================-->

<section class=" section" style="padding-top: 60px;">
	<!-- Container Start -->
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Section title -->
				<div class="section-title">
					<h2>QuickBox란?</h2>
					<p>빠르고 간편한 통합 배송 서비스 <br> 기존의 배송보다 편리함과 간편함을 더한 새로운 배송 플랫폼의 시작</p>
				</div>
				<div class="row">
					<!-- offer 01 -->
					<div class="col-sm-12 col-lg-4">
						<!-- product card -->
						<div class="product-item bg-light">
							<div class="card">
								<div class="thumb-content" style="text-align: center; margin-top: 32px;">
									<p style="font-size: 23px; color: black;"><b>간편한 비대면<br>안심 서비스</b></p>
									<img class="card-img-top img-fluid" src="images/image2.jpg" style="width: 250px; heigth: 300px;" alt="Card image cap">
								</div>
								<div class="card-body" style="text-align: center;">
									<p style="margin-bottom: 0; font-size: 16px; color: black;">도난, 분실 및 도난방지 <br>개별 패스워드 설정을<br>통한 보안강화</p>
								</div>
							</div>
						</div>
					</div>
					<!-- offer 01 -->
					<div class="col-sm-12 col-lg-4">
						<!-- product card -->
						<div class="product-item bg-light">
							<div class="card">
								<div class="thumb-content" style="text-align: center; margin-top: 32px;">
									<p style="font-size: 23px; color: black;"><b>배송비 50%<br>할인 서비스</b></p>
									<img class="card-img-top img-fluid" src="images/image3.png" style="width: 250px; padding: 29px 0;" alt="Card image cap">
								</div>
								<div class="card-body" style="text-align: center;">
									<p style="margin-bottom: 0; font-size: 16px; color: black;">QuickBox 지점간<br>배송서비스 이용 시<br>배송비 50% 절감</p>
								</div>
							</div>
						</div>
					</div>
					<!-- offer 01 -->
					<div class="col-sm-12 col-lg-4">
						<!-- product card -->
						<div class="product-item bg-light">
							<div class="card">
								<div class="thumb-content" style="text-align: center; margin-top: 32px;">
									<p style="font-size: 23px; color: black;"><b>기존 배송 서비스<br>불편 사항 개선</b></p>
									<img class="card-img-top img-fluid" src="images/image4.png" style="width: 250px; padding: 12px 0;" alt="Card image cap">
								</div>
								<div class="card-body" style="text-align: center;">
									<p style="margin-bottom: 0; font-size: 16px; color: black;">택배 이용고객과 <br>택배기사 모두를 만족시키는 <br>새로운 플랫폼</p>
								</div>
							</div>
						</div>
					</div>
					<!-- offer 01 -->
					<div class="col-sm-12 col-lg-4">
						<!-- product card -->
						<div class="product-item bg-light">
							<div class="card">
								<div class="thumb-content" style="text-align: center; margin-top: 32px;">
									<p style="font-size: 23px; color: black;"><b>개인정보 보안</b></p>
									<img class="card-img-top img-fluid" src="images/image5.png" style="width: 250px; padding: 30px 0;" alt="Card image cap">
								</div>
								<div class="card-body" style="text-align: center;">
									<p style="margin-bottom: 0; font-size: 16px; color: black;">택배 박스에 부착 된  <br>송장번호 노출 가능성 <br>ZERO</p>
								</div>
							</div>
						</div>
					</div>
					<!-- offer 01 -->
					<div class="col-sm-12 col-lg-4">
						<!-- product card -->
						<div class="product-item bg-light">
							<div class="card">
								<div class="thumb-content" style="text-align: center; margin-top: 32px;">
									<p style="font-size: 23px; color: black;"><b>사칭 및 범죄예방</b></p>
									<img class="card-img-top img-fluid" src="images/image6.jpg" style="width: 250px; heigth: 300px;" alt="Card image cap">
								</div>
								<div class="card-body" style="text-align: center;">
									<p style="margin-bottom: 0; font-size: 16px; color: black;">택배기사 사칭범죄 예방 및 <br>1인 가구 안심<br>택배 서비스</p>
								</div>
							</div>
						</div>
					</div>
					<!-- offer 01 -->
					<div class="col-sm-12 col-lg-4">
						<!-- product card -->
						<div class="product-item bg-light">
							<div class="card">
								<div class="thumb-content" style="text-align: center; margin-top: 32px;">
									<p style="font-size: 23px; color: black;"><b>365일 24시간<br>연중무휴</b></p>
									<img class="card-img-top img-fluid" src="images/image7.jpg" style="width: 250px; padding: 17px 0;" alt="Card image cap">
								</div>
								<div class="card-body" style="text-align: center;">
									<p style="margin-bottom: 0; font-size: 16px; color: black;">365일, 24시간 <br>언제 어디서나!<br>간편하게!</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Container End -->
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
						<img src="images/logo-footer.png" alt="">
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
							src="images/footer/phone-icon.png" alt="mobile-icon">
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

