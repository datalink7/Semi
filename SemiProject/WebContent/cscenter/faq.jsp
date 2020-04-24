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
<link href="../plugins/bootstrap/dist/css/bootstrap.min.css"
   rel="stylesheet">
<!-- Font Awesome -->
<link href="../plugins/font-awesome/css/font-awesome.min.css"
   rel="stylesheet">
<!-- Owl Carousel -->
<link href="../plugins/slick-carousel/slick/slick.css" rel="stylesheet">
<link href="../plugins/slick-carousel/slick/slick-theme.css"
   rel="stylesheet">
<!-- Fancy Box -->
<link href="../plugins/fancybox/jquery.fancybox.pack.css"
   rel="stylesheet">
<link href="../plugins/jquery-nice-select/css/nice-select.css"
   rel="stylesheet">
<link
   href="../plugins/seiyria-bootstrap-slider/dist/css/bootstrap-slider.min.css"
   rel="stylesheet">
<!-- CUSTOM CSS -->
<link href="../css/style.css" rel="stylesheet">

<!-- JAVASCRIPTS -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="../plugins/jquery/dist/jquery.min.js"></script>
<script src="../plugins/tether/js/tether.min.js"></script>
<script src="../plugins/raty/jquery.raty-fa.js"></script>
<script src="../plugins/bootstrap/dist/js/popper.min.js"></script>
<script src="../plugins/bootstrap/dist/js/bootstrap.min.js"></script>
<script
   src="../plugins/seiyria-bootstrap-slider/dist/bootstrap-slider.min.js"></script>
<script src="../plugins/slick-carousel/slick/slick.min.js"></script>
<script src="../plugins/jquery-nice-select/js/jquery.nice-select.min.js"></script>
<script src="../plugins/fancybox/jquery.fancybox.pack.js"></script>
<!-- <script src="plugins/smoothscroll/SmoothScroll.min.js"></script> -->
<script
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>

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
<script type="text/javascript">
   $(function() {
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

      $(".faqBtn").on("click", function() {
         $(".faqBtn").css("background-color", "#dc3545");
         $(".faqBtn").css("color", "#fff");
         $(this).css("background-color", "white");
         $(this).css("color", "black");
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
                  <a class="navbar-brand" href="../index.jsp"> <img
                     src="../images/main_logo.png" style="width: 196px; height: 52px;"
                     alt="">
                  </a>
                  <button class="navbar-toggler" type="button"
                     data-toggle="collapse" data-target="#navbarSupportedContent"
                     aria-controls="navbarSupportedContent" aria-expanded="false"
                     aria-label="Toggle navigation">
                     <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                     <ul class="navbar-nav ml-auto main-nav ">
                        <li class="nav-item"><a class="nav-link"
                           href="../index.jsp"><b>Home</b></a></li>
                        <li class="nav-item"><a class="nav-link"
                           href="../resv/resvForm.jsp">예약</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">조회</a></li>
                        <li class="nav-item"><a class="nav-link"
                           href="../user/mypage.jsp">마이페이지</a></li>
                        <li class="nav-item dropdown dropdown-slide"><a
                           class="nav-link dropdown-toggle" href="" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">고객센터 <span><i
                                 class="fa fa-angle-down"></i></span>
                        </a> <!-- Dropdown list -->
                           <div class="dropdown-menu dropdown-menu-right">
                              <a class="dropdown-item" href="../cscenter/faq.jsp">자주묻는질문</a>
                              <a class="dropdown-item" href="../cscenter/qna.jsp">Q&A</a> <a
                                 class="dropdown-item" href="../cscenter/review.jsp">사용후기</a>
                           </div></li>
                     </ul>
                     <ul class="navbar-nav ml-auto mt-10">
                        <li class="nav-item"><a class="nav-link login-button"
                           href="#" data-toggle="modal" data-target="#joinModal">JoinUs</a>
                        </li>
                        <li class="nav-item"><a class="nav-link login-button"
                           href="#" data-toggle="modal" data-target="#loginModal">Login</a>
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
                  <h1>자주묻는질문</h1>
                  <p>Quick Box - FAQ</p>

               </div>
               <!-- Advance Search -->
               <div class="advance-search">
                  <form action="#">
                     <div class="row">
                        <!-- Store Search -->
                        <div class="col-lg-12 col-md-12">


                           <div class="block d-flex">
                              <!-- <button type="button" class="btn btn-danger faqBtn" id="all"style="margin: auto;">전체</button>
                              <button type="button" class="btn btn-danger faqBtn" id="resv" style="margin: auto;">예약관련</button>
                              <button type="button" class="btn btn-danger faqBtn" id="pick" style="margin: auto;">픽업관련</button>
                              <button type="button" class="btn btn-danger faqBtn" id="res" style="margin: auto;">택배보관관련</button>
                              <button type="button" class="btn btn-danger faqBtn" id="pay" style="margin: auto;">결제관련</button>
                              <button type="button" class="btn btn-danger faqBtn" id="log" style="margin: auto;">회원가입/로그인관련</button> -->
                              <h3>고객센터 문의 전 FAQ를 확인하시면 보다 빠르고 정확하게 원하시는 답을 얻으실 수 있습니다.
                                 궁금증이 해결되지 않았을 경우 “Q&A”를 클릭하여 글쓰기를 하시면 담당자가 신속하게 답변해드립니다.</h3>
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
         <button class="accordion">
            <b>Q. 개인결제는 어떻게 하는것인가요?</b>
         </button>
         <div class="panel">
            <p style="margin-top: 0.5rem;">
               <b>A. </b> 카드결제의 경우는 고객님들의 개인정보 보호와 안전거래를 위하여 PG(안심결재 대행사)를 이용하여
               거래가 이루어지고 있습니다. PG사를 통하여 카드사로 취소요청이 접수되고 카드사에서 승인을 완료하는데 평균 5~7일,
               넉넉하게 보름정도가 소요됩니다. 이 취소승인이 처리 완료되는 기간 안에 고객님의 결제일이 있다면, 승인처리가 완료된 것은
               아니기에 결제액이 고지되는 경우가 발생 할 수 있는데요~ 결제액이 고지되었다 하더라도, 취소승인의 처리가 완료되면
               다음달의 결제액에서 차감되거나 고지액이 인출되었던 계좌로 환불되는 등의 처리가 되오니 걱정하지 않으셔도 된답니다.
            </p>
         </div>
         <button class="accordion">
            <b>Q.오늘보내면 언제 배송 되나요?</b>
         </button>
         <div class="panel">
            <p style="margin-top: 0.5rem;">
               <b>A. 퀵박스에 물건을 맡기는 시간에 따라 다릅니다. 택배마감시간 이전에 맡기신 물건에 대해서 익일 배송
                  서비스를 제공하고 있습니다. 택배 마감시간은 평일 17시(시,군,구 일부지역 및 경기 일부지역 15시), 토요일
                  12시로, 배송의물량이 급증한 경우 영업일 기준 1일 더 지연될 수 있습니다. 일요일 및 공휴일은 배송되지 않습니다.
                  또한 받는 지역이 제주도, 도서 및 산간지역인 경우에는 배송이 지연될 수 있습니다.</b>

            </p>
         </div>
         <button class="accordion">
            <b>Q.화물이 분실(파손)되면 어떻게 해야하죠?</b>
         </button>
         <div class="panel">
            <p style="margin-top: 0.5rem;">
               <b>A.화물이 분실 혹은 파손 되었을 경우에는 당사 고객센터(1577-1287)로 문의를 주시거나, 홈페이지
                  고객문의에 사고 접수 하여 주시면 됩니다. 특히, 파손 시에는 화물의 포장상태와 파손내용을 택배사에서 확인할 수 있도록
                  그대로 유지한 상태에서 연락을 주시면, 사진이나 방문확인 등을 통해서 택배표준약관의 기준에 준하여 신속히 처리하여
                  드립니다. 단, 운송장 거짓 작성이나 파손면책 동의 건, 포장이 충분하지 않은 건은 고객님 귀책이 있는 사안으로 빠른
                  처리가 어려울 수 있습니다. </b>

            </p>
         </div>
         <button class="accordion">
            <b>Q.동일권역과 타권역은 어떻게 다른가요?</b>
         </button>
         <div class="panel">
            <p style="margin-top: 0.5rem;">
               <b>A.고객의 편의를 위하여 집배송구역을

                  수도권(서울,인천,경기)/경남권(부산,울산)/경북권(대구)/충남권(대전)/충북권/전남권(광주)/전북권/강원권/제주권
                  으로 나누어 요금기준을 책정하고 있습니다. 동일권은 화물을 보내는 권역과 받는 권역이 같은 경우, 타권역은 화물을
                  보내는 권역과 받는 권역이 다른 경우 입니다. </b>

            </p>
         </div>

      
      <button class="accordion">
         <b>Q.지정한 점포를 잊어버렸는데 어떻게 하나요?</b>
      </button>
      <div class="panel">
         <p style="margin-top: 0.5rem;">
            <b>A. 주문번호로 배송조회 하시면 지정한 퀵박스의 이름, 위치 등을 확인하실 수 있습니다.
         </p>
      </div>

      
      <button class="accordion">
         <b>Q.포장은 직접 해야하나요?</b>
      </button>
      <div class="panel">
         <p style="margin-top: 0.5rem;">
            <b>A.보내실 물건의 포장은 고객님께서 직접하셔야 합니다. 포장 BOX 등은 일부 퀵박스위치에서 고객님의 편의를
               봐 드리고자 제공하는 경우도 있으나, 제공 서비스 사항은 아닙니다. </b>
         </p>
      </div>

      <button class="accordion" >
         <b>Q.군부대로 택배를 보내려고 하는데 어떻게하나요?</b>
      </button>
      <div class="panel">
         <p style="margin-top: 0.5rem;">
            <b>군부대의 경우, 사서함 주소지와 군인이 있는곳이 다르기 때문에 위치 확인을 위하여 개인휴대폰이나 부대 일반
               연락처가 확인 된 경우에 한하여 접수가능하며, 접수가 되더라도 위병소까지만 배달이 된 후 배송완료로 처리 됩니다. 위병소
               전달은 부대사정에 따라 불가능한 경우도 있으며, 이점은 군부대 별로 차이가 있기때문에 물건 접수 시점에는 확인이
               어렵습니다. 이러한 경우에는 우체국택배를 이용하여 보내시면 확실하게 본인에게 전달될 수 있습니다. </b>
         </p>
      </div>
      <button class="accordion">
         <b>Q. 카드결제 후 취소요청 했는데 결제액이 청구되었어요.</b>
      </button>
      <div class="panel">
         <p style="margin-top: 0.5rem;">
            <b>A. 카드결제의 경우는 고객님들의 개인정보 보호와 안전거래를 위하여 PG(안심결재 대행사)를 이용하여 거래가
            이루어지고 있습니다. PG사를 통하여 카드사로 취소요청이 접수되고 카드사에서 승인을 완료하는데 평균 5~7일, 넉넉하게
            보름정도가 소요됩니다. 이 취소승인이 처리 완료되는 기간 안에 고객님의 결제일이 있다면, 승인처리가 완료된 것은 아니기에
            결제액이 고지되는 경우가 발생 할 수 있는데요~ 결제액이 고지되었다 하더라도, 취소승인의 처리가 완료되면 다음달의
            결제액에서 차감되거나 고지액이 인출되었던 계좌로 환불되는 등의 처리가 되오니 걱정하지 않으셔도 된답니다.</b>
         </p>
      </div>

      <button class="accordion">
         <b>Q. 결제방법에는 어떤 종류가 있나요?</b>
      </button>
      <div class="panel">
         <p style="margin-top: 0.5rem;">
            <b>A. 카드결제의 경우는 고객님들의 개인정보 보호와 안전거래를 위하여 PG(안심결재 대행사)를 이용하여 거래가
            이루어지고 있습니다. PG사를 통하여 카드사로 취소요청이 접수되고 카드사에서 승인을 완료하는데 평균 5~7일, 넉넉하게
            보름정도가 소요됩니다. 이 취소승인이 처리 완료되는 기간 안에 고객님의 결제일이 있다면, 승인처리가 완료된 것은 아니기에
            결제액이 고지되는 경우가 발생 할 수 있는데요~ 결제액이 고지되었다 하더라도, 취소승인의 처리가 완료되면 다음달의
            결제액에서 차감되거나 고지액이 인출되었던 계좌로 환불되는 등의 처리가 되오니 걱정하지 않으셔도 된답니다.</b>
         </p>
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
                  <p>Copyright © 2020. 김승현 홍건우 김지윤 최환민 All Rights Reserved</p>
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