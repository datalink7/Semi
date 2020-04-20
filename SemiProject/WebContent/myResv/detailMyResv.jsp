<%@page import="java.text.SimpleDateFormat"%>
<%@page import="resv.data.MyResvDto"%>
<%@page import="resv.data.MyResvDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>Insert title here</title>
</head>
<%
	String resvNum=request.getParameter("resvNum");
	MyResvDao myDao=new MyResvDao();
	MyResvDto myDto=new MyResvDto();
	myDto=myDao.getData(resvNum);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
<table class="table table-striped">
<tr><td>예약번호 :
<%=myDto.getResvNum() %>
</td></tr>
<tr><td>예약 날짜 : 
<%=sdf1.format(myDto.getResvDate()) %>
</td></tr>
<tr><td>예약 분류 : 
<%=myDto.getResvType() %>
</td></tr>
<tr><td>보낸 주소 : 
<%=myDto.getResvSendAddr()==null?"해당 사항 없음":myDto.getResvSendAddr() %>
</td></tr>
<tr><td>받은 주소 :
<%=myDto.getResvGetAddr()==null?"해당 사항 없음":myDto.getResvGetAddr() %>
</td></tr>
<tr><td>보내는 곳 보관함 시작일 :
<%=myDto.getResvStDate()==null?"해당 사항 없음":sdf.format(myDto.getResvStDate()) %>
</td></tr>
<tr><td>보내는 곳 보관함 종료일 : 
<%=myDto.getResvEdDate()==null?"해당 사항 없음":sdf.format(myDto.getResvEdDate()) %>
</td></tr>
<tr><td align="right">
<button type="button" class="btn btn-default btn-sm" onclick="history.back()">뒤로</button>
</td></tr>
</table>
</body>
</html>