
<%@page import="review.data.RevwDto"%>
<%@page import="review.data.RevwDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String revwNum = request.getParameter("revwNum");
	
	RevwDao dao= new RevwDao();
	RevwDto dto= dao.getData(revwNum);
	
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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




</style>
</head>
<body>
	<form action="../action/updateaction.jsp" method="post">
		<table>
			<caption>리뷰 수정</caption>
			<tr>
				<td>타입</td>
				<input type="hidden" name="revwNum" value="<%=revwNum%>"></input>
				<td><select name="revwType">
						<option value="퀵서비스후기">퀵서비스후기</option>
						<option value="택배후기">택배후기</option>
						<option value="보관함후기">보관함후기</option>
				</select></td>
			</tr>
	 	<tr>
 		<td>
   <script type="text/javascript">
      $(function() {
          $('span.starR[value=<%=dto.getRevwStar()%>]').addClass("on").prevAll('span').addClass('on');
          $('.starRev span').click(function(){
        	  $(this).parent().children('span').removeClass('on');
        	  $(this).addClass('on').prevAll('span').addClass('on');
        	   var star=$(this).attr("value");
        	  $("#revwStars").val(star);
        	  $("#revwStars").prev().html(star);

        	  return false;
        	});
      });
   </script>
   <div class="starRev" value=<%=dto.getRevwStar()%>>
   	<span class="input">
     <span class="starR on" value="1" id="p1">별1</span>
     <span class="starR" value="2" id="p2">별2</span>
     <span class="starR" value="3" >별3</span>
     <span class="starR" value="4" >별4</span>
     <span class="starR" value="5" >별5</span>
     </span>
     <script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/star.js"></script>
   </div>
   	</td>
 		<td><%=dto.getRevwStar() %></td>
 		<input id="revwStars" name="revwStar" type="hidden">
 	</tr>	
			<tr>
				<td>내용</td>
				<td><textarea name="revwCont" required="required"><%=dto.getRevwCont()%></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit" name="update">수정하기</button>
				</td>
				<td>
					<button type="button" name="cancel"
						onclick="location.href='revwlist.jsp'">취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>