<%@page import="user.data.UserDto"%>
<%@page import="java.util.List"%>
<%@page import="user.data.UserDao"%>
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
.map{
	width:1000px;
	position:relative;
	left:50%;
	margin-left:-500px;
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
var asc;
var con;
var val;

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
	list();
// 	$(".faqBtn").on("click",function(){
// 		$(".faqBtn").css("background-color","#dc3545");
// 		$(".faqBtn").css("color","#fff");
// 		$(this).css("background-color","white");
// 		$(this).css("color","black");
// 	});

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
//               console.log(str);
               $("#addr1").val(str);
           }
       }).open();
   }

	$(".faqBtn").on("click",function(){
		$(".faqBtn").css("background-color","#dc3545");
		$(".faqBtn").css("color","#fff");
		$(this).css("background-color","white");
		$(this).css("color","black");
	});

	$(document).on("click",".updatebtn",function() {

		var userId=$(this).attr("userId");
		console.log(userId);
		$.ajax({
			type:"post",
			dataType: "xml",
			data:{"userId":userId},
			url:"user/getUser.jsp",
			success: function(data) {
				var userid=$(data).find("userid").text();
				var username=$(data).find("name").text();
				var usersex=$(data).find("sex").text();
				var phone=$(data).find("phone").text();
				var email1=$(data).find("email1").text();
				var email2=$(data).find("email2").text();
				var addr1=$(data).find("addr1").text();
				var pwd=$(data).find("pwd").text();

				$("#userId").val(userid);
				$("#userName").val(username);
				$(".userSex[value='"+usersex+"']").prop("checked", true);
				$("#userPhone").val(phone);
				$("#userEmail1").val(email1);
				$("#userEmail2").val(email2);
				$("#addr1").val(addr1);
				$("#userPwd").val(pwd);
			}
		});
	});
	$(document).on("click",".delbtn",function() {
		var userId=$(this).attr("userId");
		$.ajax({
			type:"post",
			dataType: "html",
			data:{"userId":userId},
			url:"user/delUser.jsp",
			success: function(data) {
				window.location.reload();
				
			}
		});

	});
	$("button.con").click(function() {
		asc=$(this).attr("asc");
		con=$(this).attr("con");
		val=$(this).attr("val");
		list();
// 		$("a.con").css("color","black").css("font-weight","normal");
// 		$(this).css("color","red").css("font-weight","bold");
	});
	$(".sch").click(function() {
		con="user_name";
		val=$(".iptsch").val();
		list();
		$(".iptsch").val("");
	});
	
});

function list(){
	$.ajax({
		type:"post",
		url:"/SemiProject111111/admin/user/allUser.jsp",
		dataType:"xml",
		data:{"asc":asc,"con":con,"val":val},
		success:function(data){
			var str="";
			str+="<table class='table'>"+"<thead>"+"<tr>"+"<th>아이디</th><th>이름</th><th>성별</th><th>전화번호</th><th>이메일</th><th>주소</th><th>수정/삭제</th>"+"</tr>"+"</thead>";
			var n=0;
			$(data).find("data").each(function(i) {

				var userid=$(this).find("userid").text();
				var username=$(this).find("name").text();
				var usersex=$(this).find("sex").text();
				var phone=$(this).find("phone").text();
				var email1=$(this).find("email1").text();
				var email2=$(this).find("email2").text();
				var addr1=$(this).find("addr1").text();
				var pwd=$(this).find("pwd").text();
				
				str+="<tr>"+"<td>"+userid+"</td><td>"+username+"</td><td>"+usersex+"</td><td>"+phone+"</td><td>"+email1+"@"+email2+"</td><td>"+addr1+"</td><td>"+"<button type='button' class='updatebtn' data-toggle='modal' data-target='#updateModal'  userId="+userid+">수정</button> / <button class='delbtn' userId="+userid+">삭제</button>"+"</td></tr>";
			});
			str+="</table>"
			$(".viewUser").html(str);
		}
	});
}

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
									<a class="nav-link" href="mngResv.jsp">예약 관리</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="mngMap.jsp">지도 관리</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="mngUser.jsp"><b>회원 관리</b></a>
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
						<h1>회원 관리</h1>
<!-- 						<p>Quick Box - FAQ</p> -->
						
					</div>
					<!-- Advance Search -->
					<div class="advance-search">
						<form action="#">
							<div class="row">
								<!-- Store Search -->
								<div class="col-lg-12 col-md-12">
									<div class="block d-flex">
										<button type="button" class="con btn btn-danger faqBtn" style="margin: auto;">전체 검색</button>
										<button type="button" asc="user_name" class="con btn btn-danger faqBtn" style="margin: auto;">이름순</button>
										<button type="button" con="user_sex" val="M" asc="user_name" class="con btn btn-danger faqBtn" style="margin: auto;">남자검색</button>
										<button type="button" con="user_sex" val="F" asc="user_name" class="con btn btn-danger faqBtn" style="margin: auto;">여자검색</button>
										<!-- 여유 있으면 box관리 추가 -->
<!-- 										<button type="button" class="btn btn-danger faqBtn" style="margin: auto;">픽업관련</button> -->
<!-- 										<button type="button" class="btn btn-danger faqBtn" style="margin: auto;">택배보관관련</button> -->
<!-- 										<button type="button" class="btn btn-danger faqBtn" style="margin: auto;">결제관련</button> -->
<!-- 										<button type="button" class="btn btn-danger faqBtn" style="margin: auto;">회원가입/로그인관련</button> -->
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
   <!-- updateModal -->
   <div class="modal fade" id="updateModal" role="dialog">
      <div class="modal-dialog modal-md" style="">
         <div class="modal-content">     
            <div class="modal-header">
               <h4 class="modal-title">회원 수정</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body" style="padding-bottom: 0px;">
               <table class="table">
               <form method="post" action="user/userupdate.jsp">
                  <tbody>
                     <tr>
                        <td style="width: 26%;">아이디</td>
                        <td>
                           <input type="text" class="form-control col-sm-8" id="userId" name="userId" style="height: 30px; float: left" readonly="readonly">
                        </td>
                     </tr>
                     <tr>
                        <td style="width: 26%;">비밀번호</td>
                        <td><input type="password" class="form-control" id="userPwd" name="userPwd" style="height: 30px;"></td>
                     </tr>
                     <tr>
                        <td style="width: 26%;">이름</td>
                        <td><input type="text" class="form-control" id="userName" name="userName" style="height: 30px;"></td>
                     </tr>
                     <tr>
                        <td style="width: 26%;">핸드폰번호</td>
                        <td><input type="text" class="form-control" id="userPhone" placeholder="'-' 를 빼고 입력해주세요." name="userPhone" style="height: 30px;"></td>
                     </tr>
                     <tr>
                        <td style="width: 26%;">성별</td>
                        <td>
                           <div class="radio">
                              <label><input type="radio" class="userSex" name="userSex" value="M" checked>남자</label>
                              <label><input type="radio" class="userSex" name="userSex" value="F">여자</label>
                           </div>
                        </td>
                     </tr>
                     <tr>  
                        <td style="width: 26%;">이메일</td>
                        <td>
                           <input type="text" class="form-control col-sm-5" id="userEmail1" name="userEmail1" style="height: 30px; float: left">&nbsp@
                           <input type="text" class="form-controll col-sm-6" id="userEmail2" name="userEmail2" style="height: 30px;">
                           <select class="form-control"  id="userEmail3" name="userEmail3" style="height: 36px; margin-top: 4px;">
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
                           <input type="text" class="form-control col-sm-8" id="addr1" name="addr1" style="height: 30px; float: left">
                           <button type="button" id="btnaddr" class="btn btn-sm" style="padding: 3px 10px; margin-left: 5px;">주소검색</button>
                           <input type="text" class="form-control" id="addr2" name="addr2" style="height: 30px; margin-top: 4px;">
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
            <div class="modal-footer">
               <button type="submit" class="btn btn-danger" style="width: 124px; height: 50px; margin-left: auto">수정</button>
            </div>
            </form>
         </div>
      </div>
   </div>

<!--===================================
=            Client Slider            =
====================================-->

<script type="text/javascript">
$(function() {
	$(".btnMap").click(function() {
	<%if(!userId.equals("admin")){%>
		alert("관리자만 접근가능");
		return;
	<%}else{%>
		var src=$(this).attr("src");
		$(".map").html("<embed src='"+src+"' width='600px' height='625px'>")
	<%}%>

	});
});
</script>

<!--==========================================
=            All Category Section            =
===========================================-->

<section class=" section">
	<!-- Container Start -->
	<div class="container">
		<div class="map">
		<%if(!userId.equals("admin")){%>
			관리자만 접근가능
		<%}else{%>
			<div class="viewUser"></div><div align="center"><input type="text" class="iptsch" placeholder="이름검색"><button class="sch">검색</button></div>
		<%}%>
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
