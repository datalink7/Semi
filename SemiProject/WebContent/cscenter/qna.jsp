<%@page import="noti.data.RenotiDto"%>
<%@page import="noti.data.RenotiDao"%>
<%@page import="noti.data.NotiDto"%>
<%@page import="java.util.List"%>
<%@page import="noti.data.NotiDao"%>
<%@page import="java.text.SimpleDateFormat"%>
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
   
   $(".qnaBtn").on("click",function(){
      $(".qnaBtn").css("background-color","#dc3545");
      $(".qnaBtn").css("color","#fff");
      $(this).css("background-color","white");
      $(this).css("color","black");
   });
   
   
   $(".openModal").on("click",function(){
       $("#qnaviewModal").modal("show");
       var notiNum=$(this).attr("notiNum");
       $.ajax({
         type:"get",
         data:{"notiNum":notiNum},
         dataType:"xml",
         url:"qnaAction.jsp",
         success:function(data){
            var notinum=$(data).find("num").text();
            var notititle=$(data).find("title").text();
            var noticontent=$(data).find("content").text();
            var notiuserid=$(data).find("userid").text();
            var notidate=$(data).find("date").text();
            var notitime=$(data).find("time").text();
            var notitype=$(data).find("type").text();
            var noticnt=$(data).find("cnt").text();
            $(".notiNum").val(notinum);
            $(".notitype").text(notitype);
            $(".noticnt").text(noticnt);
            $(".notititle").text(notititle);
            $(".noticont").text(noticontent);
            $("#btndelete").attr("notiNum",notinum);
//                alert(notinum);

         }
       });//ajax(출력)over
       
       $("#btndelete").click(function(){

         var notiNum=$(this).attr("notiNum");
/*          alert(notiNum+"noti"); */
         window.location.href="../notice/action/deleteaction.jsp?notiNum="+notiNum;
       });
       
       
//        $(".openModal").on("click",function(){
//           $("#qnareviewModal").modal("show");
//           var notinum=$(data).find("renum").text();
//           var renoticont=$(data).find("recont").text();
//           var renotidate=$(data).find("redate").text();
//           $(".notinum").text(notinum);
//           $(".renoticont").text(renoticont);
          
//        });//ajax(리뷰출력)over
       
       
   });
   
   $(".close").click(function() {
      window.location.reload();
   });
   
   //수정모달
   $('#qnaTable').on('click', 'btnupdate', function () {
          $("#qnaModal").modal("show");

         var notititle=$(data).find("title").text();
         var noticont=$(data).find("content").text();
         var notitype=$(data).find("type").text();
            console.log(noticnt);
            $(".notitype").text(notitype);
            $(".notititle").text(notititle);
            $(".noticont").text(noticontent);
//           var data = otable.row( this ).data();
//           var col1 = data.col1;
//           var col2 = data.col2;
      }); //수정 모달 over
});//function over
</script>
<%
String NotiNum=request.getParameter("NotiNum");
NotiDao dao=new NotiDao();
NotiDto dto=new NotiDto();
dao.NotiCount(NotiNum);
dto=dao.getData(NotiNum);
System.out.println(NotiNum+"asd");
%>
<%
   String userId="admin";
   RenotiDao rDao=new RenotiDao();
   List<RenotiDto> reList=rDao.getRenotiList(NotiNum);

%>
<%
   NotiDao dao2=new NotiDao();
   List<NotiDto> lista=dao.getaNotiList();
   List<NotiDto> list=dao.getNotiList();
%>
   <!-- 페이징 처리!! -->

   <% 
   //db선언
   NotiDao db=new NotiDao();
   
   //변수
   int perPage=5;
   int perBlock=5;
   int totalCount;
   int currentPage;
   int totalPage;
   int startPage;
   int endPage;
   int start;
   int end;
   List<NotiDto> list2=null;
   
   String pageNum=request.getParameter("pageNum");
   if(pageNum==null)
      currentPage=1;
   else
   currentPage=Integer.parseInt(pageNum);
   totalCount=db.getTotalCount();
   totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
   if(currentPage>totalPage)
      currentPage=totalPage;
   
   startPage=(currentPage-1)/perBlock*perBlock+1;
   endPage=startPage+perBlock-1;
   
   if(endPage>totalPage)
      endPage=totalPage;
   start=(currentPage-1)*perPage+1;
   end=start+perPage-1;
   if(end>totalCount)
      end=totalCount;
   list=db.getPageDatas(start, end);
%>

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
                  <h1>Q & A</h1>
                  <p>Quick Box</p>
                  
               </div>
               <!-- Advance Search -->
               <!-- <div class="advance-search">
                  <form action="#">
                     <div class="row">
                        Store Search
                        <div class="col-lg-12 col-md-12">
                           <div class="block d-flex">
                              <button type="button" class="btn btn-danger qnaBtn" style="margin: auto; ">전체</button>
                              <button type="button" class="btn btn-danger qnaBtn" style="margin: auto;" value="1">예약관련</button>
                              <button type="button" class="btn btn-danger qnaBtn" style="margin: auto;" value="2">픽업관련</button>
                              <button type="button" class="btn btn-danger qnaBtn" style="margin: auto;" value="3">택배보관관련</button>
                              <button type="button" class="btn btn-danger qnaBtn" style="margin: auto;" value="4">결제관련</button>
                              <button type="button" class="btn btn-danger qnaBtn" style="margin: auto;" value="5">회원가입/로그인관련</button>
                           </div>
                        </div>
                     </div> 
                  </form>

               </div>-->

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
         <button type="button" class="btn btn-defalte"
            style="margin-top: -15px; margin-bottom: 12px; float: right;"
            data-toggle="modal" data-target="#qnaModal">문의하기</button>
         <table class="table table-hover">
            <thead>
               <tr>
                  <th>NO.</th>
                  <th>분류</th>
                  <th>글제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>작성시간</th>
                  <th>조회수</th>
               <tr>
            </thead>
            <tbody>

                  <%
                     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//날짜
                     SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm:ss");//시간

                     for (int j = 0; j < lista.size(); j++) {
                        NotiDto dtl = lista.get(j);
                  %>
               
               <tr>
                  <td align="center"><%=dtl.getNotiNum()%></td>
                  <td><%=dtl.getNotiType()%></td>
                  <%-- <td><a href="../cscenter/qna.jsp?notiNum=<%=dtl.getNotiNum()%>"><%=dtl.getNotiTitle() %></a></td> --%>
                  <td><a class="openModal" notiNum=<%=dtl.getNotiNum()%>><%=dtl.getNotiTitle()%></a></td>


                  <td><%=dtl.getUserId()%></td>
                  <td><%=sdf.format(dtl.getNotiDate())%></td>
                  <td><%=sdf2.format(dtl.getNotiTime())%></td>
                  <td><%=dtl.getNotiCnt()%></td>
               </tr>
               <%
                  }

                  for (int i = 0; i < list.size(); i++) {
                     NotiDto dtl = list.get(i);
               %>
               <tr>
                  <td align="center" style=background-color: black;"><%=dtl.getNotiNum()%></td>
                  <td><%=dtl.getNotiType()%></td>
                  <%--          <td><a href="../cscenter/qna.jsp?notiNum=<%=dtl.getNotiNum()%>"><%=dtl.getNotiTitle() %></a></td> --%>
                  <td><a class="openModal" notiNum=<%=dtl.getNotiNum()%>><%=dtl.getNotiTitle()%></a></td>

                  <td><%=dtl.getUserId()%></td>
                  <td><%=sdf.format(dtl.getNotiDate())%></td>
                  <td><%=sdf2.format(dtl.getNotiTime())%></td>
                  <td><%=dtl.getNotiCnt()%></td>
               </tr>
               <%
                  }
               %>
         </tbody>
         </table>
         <div style="width:100%; text-align:center; display:inline-block; ">
            <ul class="pagination" style="width: 100%;" text-align="center;" display="inline-block;">
               <%
                  //이전
                  if (startPage > 1) {
               %>
               <li>
                  <!-- page 주소 다시처리 --> <a
                  href="cscenter/qna.jsp?pageNum=<%=startPage - 1%>">이전</a>
               </li>
               <%
                  }

               
                  for (int i = startPage; i <= endPage; i++) {
                     //현재 페이지와 아닌경우 스타일 다르게 해야한다
                     if (i == currentPage) {
               %>
               <li class="active"><a
                  href="../cscenter/qna.jsp?pageNum=<%=i%>"><%=i%></a></li>
               <%
                  } else {
               %>
               <li><a href="../cscenter/qna.jsp?pageNum=<%=i%>"><%=i%></a></li>
               <%
                  }
                  }

                  //다음
                  if (endPage < totalPage) {
               %>
               <li><a href="cscenter/qna.jsp?pageNum=<%=endPage + 1%>">다음</a></li>
               <%
                  }
               %>
            </ul>
         </div>
      </div>
      <!-- 페이지 번호 출력 -->

      <!-- Container End -->
   </section>

   <!-- Q&A Modal -->
   <div class="modal fade" id="qnaModal" role="dialog">
      <div class="modal-dialog modal-md" style="top: 5%;">
         <div class="modal-content">     
            <div class="modal-header">
               <h4 class="modal-title">Q&A</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body" style="padding-bottom: 0px;">
               <form action="../notice/action/insertaction.jsp" method="post">
                  <table class="table">
                     <h2 class="text-center">Q&A</h2>
                     <tbody>
                        <%
                           String UserId = "admin";
                        %>

                        >
                        <tr>
                           <td style="width: 26%;">문의종류</td>
                           <td><select class="form-control" id="notiType"
                              name="notiType" style="height: 40px; margin-top: 4px;">
                                 <%
                                    if (userId.equals("admin")) {
                                 %>
                                 <option>공지사항</option>
                                 <%
                                    }
                                 %>
                                 <option>예약관련</option>
                                 <option>픽업관련</option>
                                 <option>택배보관관련</option>
                                 <option>결제관련</option>
                                 <option>회원가입/로그인관련</option>
                           </select></td>
                        </tr>
                        <tr>
                           <td style="width: 26%;">제목</td>
                           <td><input type="text" class="form-control" id="notiTitle"
                              name="notiTitle" style="height: 36px;"></td>
                        </tr>
                        <tr>
                           <td style="width: 26%;">글내용</td>
                           <td><textarea class="form-control" rows="5" id="notiCont" name="notiCont"
                                 class="notiCont" style="height: 200px;"></textarea></td>
                        </tr>
                        <tr>
                           <td style="width: 26%;">패스워드</td>
                           <td><input type="password" class="form-control"
                              id="notiPwd" name="notiPwd" style="height: 36px;"></td>
                        </tr>
                     </tbody>
                  </table>
            </div>
            <div class="modal-footer">
               <button type="submit" name="save" class="btn btn-danger" style="width: 124px; height: 50px; margin-left: auto">문의등록</button>
               </form>
            </div>
         </div>
      </div>
   </div>
   <!-- 출력화면 -->
   <div class="modal fade" id="qnaviewModal" role="dialog">
      <div class="modal-dialog modal-md" style="top: 5%;">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title">Q&A</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body" style="padding-bottom: 0px;">
                  <table class="table">
                     <h2 class="text-center">Q&A</h2>
                     
                     <tbody>
                     
                        <tr>
                           <td>분류: <span class="notitype"></span></td>
                           <td>조회수: <span class="noticnt"></span></td>
                        </tr>
                        <tr>
                           <td>제목</td>
                           <td><span class="notititle"></span></td>
                        </tr>
                        <tr>
                           <td>내용</td>
                           <td><span class="noticont"></span></td>
                        </tr>
                        <tr>
                           <td><button type="button" id="btndelete" notiNum="" class="btn btn-info">삭제</button></td>
<%--                                  onclick="location.href='../notice/action/deleteaction.jsp?notiNum=<%=NotiNum%>'" --%>
                                 
                           <td><button type="button" id="btnupdate" class="btn btn-info
                                 onclick="location.href='../notice/form/qna.jsp?notiNum=<%=NotiNum%>'">수정</button></td>
                           <%
                              if (userId.equals("admin")) {
                           %>
                           <form action="../notice/action/ReNotiinsert.jsp" method="get" id="qnareviewmodal">
                              <input type="hidden" class="notiNum" name="notiNum" value="">
                              
                        </tr>
                        <tr>
                           <td colspan="5"><textarea cols="32" rows="5" 
                           name="renotiCont"  style="resize: none;"></textarea></td>
                           </form>
                           
                           <%
                              }
                           %>
                        </tr>
                        <%
                           if (reList.size() == 0) {
                        %>
                        <tr>
                           <td colspan="4">답글 없음</td>
                           <td><button type="submit" id="btnRpl" class="btn btn-danger">답글달기</button></td>
                           
                        </tr>
                        <%
                           } else {
                              for (RenotiDto reDto : reList) {
                        %>
                        <tr>
                           <td colspan="2"><span class="renum"></span></td>
                           <td><span class="recont"></span></td>
                           <td><span class="redate"></span></td>
                           <td><a
                              href="../notice/action/ReNotidelete.jsp?renotiNum=<%=reDto.getRenotiNum()%>&notiNum=<%=NotiNum%>">
                                 <span class="glyphicon glyphicon-remove"></span>
                           </a></td>
                           
                           
                        </tr>
                        <%
                           }
                           }
                        %>


                     </tbody>
                  </table>
            </div>
            <div class="modal-footer"></div>
         </div>
      </div>
   </div>
   
   <!-- 수정화면 -->
   <div class="modal fade" id="qnaupdateModal" role="dialog">
      <div class="modal-dialog modal-md" style="top: 5%;">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title">Q&A</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body" style="padding-bottom: 0px;">
               <form action="../notice/action/updateaction.jsp" method="post">
                  <table class="table">
                     <h2 class="text-center">Q&A</h2>
                     <tbody>
                     <caption>QnA수정</caption>
                     <tr>
                        <th>작성자</th>
                        <td><input type="text" name="UserId" readonly="readonly"
                           value="<%=dto.getUserId()%>"></td>
                        <th>글번호</th>
                        <td><input type="text" name="NotiNum" readonly="readonly"
                           value="<%=dto.getNotiNum()%>"></td>
                     </tr>
                     <tr>
                        <td>제목</td>
                        <td colspan="3"><input type="text" name="notiTitle"
                           required="required" value="<%=dto.getNotiTitle()%>"></td>
                     <tr>
                        <td>타입</td>
                        <td style="width: 26%;">문의종류</td>
                           <td><select class="form-control" id="notiType"
                              name="notiType" style="height: 40px; margin-top: 4px;">
                                 <%
                                    if (userId.equals("admin")) {
                                 %>
                                 <option>공지사항</option>
                                 <%
                                    }
                                 %>
                                 <option>예약관련</option>
                                 <option>픽업관련</option>
                                 <option>택배보관관련</option>
                                 <option>결제관련</option>
                                 <option>회원가입/로그인관련</option>
                           </select></td>
                     </tr>
                     <tr>
                        <td>글내용</td>
                        <td colspan="3"><textarea name="notiCont" class="notiCont"
                              required="required"><%=dto.getNotiCont()%></textarea></td>
                     </tr>
                     <tr>
                        <td colspan="4">
                           <button type="submit" name="update">수정하기</button>
                        </td>
                     </tr>

                     </tbody>
                  </table>
               </form>
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