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
.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
}

.active, .accordion:hover {
  background-color: #fdd0d0;
}

.panel {
  padding: 0 18px;
  background-color: white;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
}
</style>
<%
Cookie[] cookies=request.getCookies();
String userId="";
if(cookies!=null){//저장된 쿠키 있음
	//배열 형태이므로 반복문
	for(Cookie cookie:cookies){
		//저장된 name얻기
		String name=cookie.getName();
		//저장된 값 얻기
		String value=cookie.getValue();
		//이클립스 콘솔에 출력
// 			System.out.println("name="+name+",value="+value);
		//login에 ok면 이미 로그인중이라는 뜻
		if(name.equals("login")){
			userId=value;
		}
	}
}
%>

<script type="text/javascript">
$(function(){
	var acc = document.getElementsByClassName("accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
	  acc[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var panel = this.nextElementSibling;
	    if (panel.style.maxHeight) {
	      panel.style.maxHeight = null;
	    } else {
	      panel.style.maxHeight = panel.scrollHeight + "px";
	    } 
	  });
	}
	
	$(".btnResv").on("click",function(){
		$(".btnResv").css("background-color","#dc3545");
		$(".btnResv").css("color","#fff");
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
									<a class="nav-link" href="admin.jsp">관리자Home</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="mngResv.jsp"><b>예약 관리</b></a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="mngMap.jsp">지도 관리</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="mngUser.jsp">회원 관리</a>
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
                        	<%Cookie[] cookies1=request.getCookies();
                        	boolean bb=false;
							if(cookies!=null){//저장된 쿠키 있음
								//배열 형태이므로 반복문
								for(Cookie cookie:cookies1){
									//저장된 name얻기
									String name=cookie.getName();
									//저장된 값 얻기
									String value=cookie.getValue();
									//이클립스 콘솔에 출력
						// 			System.out.println("name="+name+",value="+value);
									//login에 ok면 이미 로그인중이라는 뜻
									if(name.equals("login")){
										%><%=value %> <%
										bb=true;
									}
								}
							}
							//bLogin이 true면 로그아웃폼을, false면 로그인폼을 include
							if(!bb){%>
                        <li class="nav-item" id="joinLi" style="display: block;">
                           <a class="nav-link login-button" href="#" data-toggle="modal" data-target="#joinModal">JoinUs</a>
                        </li>
                        
                        <li class="nav-item" id="loginLi" style="display: block;">
                           <a class="nav-link login-button" href="#" data-toggle="modal" data-target="#loginModal">Login</a>
                        </li>
                        <%}else{ %>
                        
                        <li class="nav-item" id="logoutLi" style="display: block;">
                           <a class="nav-link login-button" href="#">Logout</a>
                        </li>
                        <%} %>
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
						<h1>예약 관리</h1>
						
					</div>
					<!-- Advance Search -->
					<div class="advance-search">
						<form action="#">
							<div class="row">
								<!-- Store Search -->
								<div class="col-lg-12 col-md-12">
									<div class="block d-flex">
										<button resvType="" type="button" class="btn btn-danger btnResv" style="margin: auto;">전체예약조회</button>
										<button resvType="1" type="button" class="btn btn-danger btnResv" style="margin: auto;">보관함예약조회</button>
										<button resvType="2" type="button" class="btn btn-danger btnResv" style="margin: auto;">반값예약조회</button>
										<button resvType="3" type="button" class="btn btn-danger btnResv" style="margin: auto;">일반택배예약조회</button>
									
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

<script type="text/javascript">
$(function() {
	$(".btnResv").click(function() {
	<%if(!userId.equals("admin")){%>
		alert("관리자만 접근가능");
		return;
	<%}else{%>
		var resvType=$(this).attr("resvType");
		console.log(resvType);
		$(".em").html("<embed src='resv/allResv.jsp?resvType="+resvType+"' width=100% height=450px>");
	<%}%>

	});
	$(".btnResv").on("click",function(){
		$(".btnResv").css("background-color","#dc3545");
		$(".btnResv").css("color","#fff");
		$(this).css("background-color","white");
		$(this).css("color","black");
	});

});
</script>


<!--==========================================
=            All Category Section            =
===========================================-->

<section class=" section">
	<!-- Container Start -->
	<div class="container em">
		<%if(!userId.equals("admin")){%>
			관리자만 접근가능
		<%}else{%>
			<embed src="resv/allResv.jsp?resvType=" width=100% height=450px>
		<%}%>
			
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
