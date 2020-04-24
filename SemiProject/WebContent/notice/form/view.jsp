
<%@page import="noti.data.RenotiDto"%>
<%@page import="noti.data.RenotiDao"%>
<%@page import="noti.data.NotiDto"%>
<%@page import="noti.data.NotiDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String NotiNum=request.getParameter("notiNum");
NotiDao dao=new NotiDao();
NotiDto dto=new NotiDto();
dao.NotiCount(NotiNum);
dto=dao.getData(NotiNum);
System.out.println(NotiNum);
%>
<style type="text/css">
a{
   cursor: pointer;

}
</style>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
   String userId="admin";
   RenotiDao rDao=new RenotiDao();
   List<RenotiDto> reList=rDao.getRenotiList(NotiNum);

%>


<table class="table">
   <tr>
      <td>분류: <%=dto.getNotiType() %></td>
      <td>조회수: <%=dto.getNotiCnt() %></td>
   </tr>
   <tr>
      <td>제목</td>   
      <td><%=dto.getNotiTitle() %></td>
   </tr>
   <tr>
      <td>내용</td>
      <td><%=dto.getNotiCont() %></td>
   </tr>
   <tr>
      <td><button type="button" id="btndelete" 
      onclick="location.href='../action/deleteaction.jsp?notiNum=<%=NotiNum%>'">삭제</button></td>
      <td><button type="button" id="btnupdate"
      onclick="location.href='../form/notiupdate.jsp?notiNum=<%=NotiNum%>'">수정</button></td>
      <td><button type="button" id="btnlist" onclick="location.href='notilist.jsp'">뒤로가기</button></td>
   <%if(userId.equals("admin")){ %>
      <form action="../action/ReNotiinsert.jsp" method="post">
      <input type="hidden" name="notiNum" value="<%=NotiNum%>">
      <td><button type="submit" id="btnRpl">답글달기</button></td>
   </tr>
   <tr>
   <td colspan="4"><textarea rows="3" cols="" name="renotiCont"></textarea></td>
   </form>
      <%} %>
   </tr>
   <%
   if(reList.size()==0){%>
   <tr>   
      <td colspan="4">답글 없음</td>
   </tr>      
      <%
   }else{
      for(RenotiDto reDto:reList){
      %>
      <tr>
         <td colspan="2"><%=reDto.getRenotiCont() %></td>
         <td><%=reDto.getRenotiDate() %></td>
         <td><a href="../action/ReNotidelete.jsp?renotiNum=<%=reDto.getRenotiNum()%>&notiNum=<%=NotiNum%>">
         <span class="glyphicon glyphicon-remove"></span></a></td>
      </tr>
      <%}
   } %>
</table>




</body>
</html>