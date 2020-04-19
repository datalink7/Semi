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

<script type="text/javascript">
$(function(){
	$(".mypageBtn").on("click",function(){
		$(".mypageBtn").css("background-color","#dc3545");
		$(".mypageBtn").css("color","#fff");
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
								<li class="nav-item active">
									<a class="nav-link" href="../index.jsp"><b>Home</b></a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#">예약</a>
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
						<h1>My Page</h1>
						<p>Quick Box</p>
						
					</div>
					<!-- Advance Search -->
					<div class="advance-search">
						<button type="button" class="btn btn-default" style="margin-bottom: 10px; float: right;" data-toggle="modal" data-target="#myInfoModal">내 정보 수정</button>
						<button type="button" class="btn btn-default" style="margin-bottom: 10px; float: left;" data-toggle="modal" data-target="#byeModal">회원탈퇴</button>
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td style="width: 25%;"><b>아이디</b></td>
									<td style="width: 25%;">ADMIN</td>
									<td style="width: 25%;"><b>이름</b></td>
									<td style="width: 25%;">김승현</td>
								</tr>
								<tr>
									<td><b>핸드폰번호</b></td>
									<td>010-1234-5678</td>
									<td><b>성별</b></td>
									<td>남</td>
								</tr>
							</tbody>
						</table>
						<form action="#">
							<div class="row">
								<!-- Store Search -->
								<div class="col-lg-12 col-md-12">
									<div class="block d-flex">
										<button type="button" class="btn btn-danger mypageBtn" style="margin: auto; width: 30%;">택배예약현황</button>
										<button type="button" class="btn btn-danger mypageBtn" style="margin: auto; width: 30%;">온라인 문의내역</button>
										<button type="button" class="btn btn-danger mypageBtn" style="margin: auto; width: 30%;">주소록관리</button>
										
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
	
	<!-- myInfoModal Modal -->
	<div class="modal fade" id="myInfoModal" role="dialog">
		<div class="modal-dialog modal-md" style="">
			<div class="modal-content">     
				<div class="modal-header">
					<h4 class="modal-title">내 정보 수정</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" style="padding-bottom: 0px;">
					<table class="table">
						<tbody>
							<tr>
								<td style="width: 26%;">아이디</td>
								<td>
									<input type="text" class="form-control" id="" name="" style="height: 30px; float: left" readonly>
								</td>
							</tr>
							<tr>
								<td style="width: 26%;">비밀번호</td>
								<td><input type="password" class="form-control" id="" name="" style="height: 30px;"></td>
							</tr>
							<tr>
								<td style="width: 26%;">비밀번호확인</td>
								<td><input type="password" class="form-control" id="" name="" style="height: 30px;"></td>
							</tr>
							<tr>
								<td style="width: 26%;">이름</td>
								<td><input type="password" class="form-control" id="" name="" style="height: 30px;"></td>
							</tr>
							<tr>
								<td style="width: 26%;">핸드폰번호</td>
								<td><input type="password" class="form-control" id="" name="" style="height: 30px;"></td>
							</tr>
							<tr>
								<td style="width: 26%;">성별</td>
								<td>
									<div class="radio">
										<label><input type="radio" name="" value="M" checked>남자</label>
										<label><input type="radio" name="" value="F">여자</label>
									</div>
								</td>
							</tr>
							<tr>  
								<td style="width: 26%;">이메일</td>
								<td>
									<input type="text" class="form-control col-sm-5" id="" name="" style="height: 30px; float: left">&nbsp@
									<input type="text" class="form-controll col-sm-6" id="" name="" style="height: 30px;">
									<select class="form-control"  id="" name="" style="height: 36px; margin-top: 4px;">
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
									<input type="text" class="form-control col-sm-8" id="" name="" style="height: 30px; float: left">
									<button type="button" id="btnaddr" class="btn btn-sm" style="padding: 3px 10px; margin-left: 5px;">주소검색</button>
									<input type="text" class="form-control" id="" name="" style="height: 30px; margin-top: 4px;">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" style="width: 124px; height: 50px; margin-left: auto">수정하기</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- byeModal Modal -->
	<div class="modal fade" id="byeModal" role="dialog">
		<div class="modal-dialog modal-md" style="">
			<div class="modal-content">     
				<div class="modal-header">
					<h4 class="modal-title">회원탈퇴</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" style="padding-bottom: 0px;">
					<h4 class="modal-title">
						회원 탈퇴를 하실 경우<br>회원님의 모든 정보가 삭제되니 신중하게 결정해주세요.
					</h4><br>
					<p>* 다만 「개인정보보호법」및 「전자상거래 등에서 소비자 보호에 관한 법률」에 따라 귀하의 거래 정보는 법에서 정해진 기간까지 별도로 관리됩니다.</p>
					<p>* 회원탈퇴 후 보유하신 쿠폰은 모두 소멸됩니다.</p>
					<p>* 회원탈퇴 후 회원 전용 서비스는 이용 불가합니다.</p>
					<p>* 회원 탈퇴 후 재가입 시에는 신규 회원으로 가입되며, 탈퇴 전의 거래정보와 쿠폰 등은 복구되지 않습니다.</p>
					<p>* 회원 탈퇴 이후에는 게시글 편집, 삭제 등이 불가능하므로 게시글 편집, 삭제 후 탈퇴하시기 바랍니다.</p>
					</h6>
					<table class="table">
						<tbody>
							<tr>
								<td style="width: 26%;">아이디</td>
								<td>
									<input type="text" class="form-control" id="" name="" style="height: 30px; float: left" readonly>
								</td>
							</tr>
							<tr>
								<td style="width: 26%;">비밀번호</td>
								<td><input type="password" class="form-control" id="" name="" style="height: 30px;"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" style="width: 124px; height: 50px; margin-left: auto">탈퇴하기</button>
				</div>
			</div>
		</div>
	</div>

<!--===================================
=            Client Slider            =
====================================-->



<!--==========================================
=            All Category Section            =
===========================================-->

<section class=" section">
	<!-- Container Start -->
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>글번호</th>
					<th>문의종류</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>작성시간</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>예약관련1</td>
					<td>예약문의좀할게요!!@@!!@@!@!!@</td>
					<td>John</td>
					<td>2020-04-17</td>
					<td>17:40:05</td>
					<td>0</td>
				</tr>
				<tr>
					<td>2</td>
					<td>예약관련2</td>
					<td>예약문의좀할게요!!@@!!@@!@!!@</td>
					<td>Mary</td>
					<td>2020-04-17</td>
					<td>17:40:05</td>
					<td>5</td>
				</tr>
				<tr>
					<td>3</td>
					<td>예약관련3</td>
					<td>예약문의좀할게요!!@@!!@@!@!!@</td>
					<td>July</td>
					<td>2020-04-17</td>
					<td>17:40:05</td>
					<td>41</td>
				</tr>
				<tr>
					<td>4</td>
					<td>예약관련4</td>
					<td>예약문의좀할게요!!@@!!@@!@!!@</td>
					<td>John</td>
					<td>2020-04-17</td>
					<td>17:40:05</td>
					<td>13</td>
				</tr>
				<tr>
					<td>5</td>
					<td>예약관련5</td>
					<td>예약문의좀할게요!!@@!!@@!@!!@</td>
					<td>Mary</td>
					<td>2020-04-17</td>
					<td>17:40:05</td>
					<td>10</td>
				</tr>
				<tr>
					<td>6</td>
					<td>예약관련6</td>
					<td>예약문의좀할게요!!@@!!@@!@!!@</td>
					<td>2020-04-17</td>
					<td>2020-04-17</td>
					<td>17:40:05</td>
					<td>2</td>
				</tr>
			</tbody>
		</table>
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

