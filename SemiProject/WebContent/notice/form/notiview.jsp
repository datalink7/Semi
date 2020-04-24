<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("utf-8");
	//String revwPwd = request.getParameter("revwPwd");
	//String userId = (String)session.getAttribute("userId");	
	
	
	String notiType=request.getParameter("notiType");
	String notiTitle=request.getParameter("notiTitle");
	//String revwStar=request.getParameter("revw_star");
	String notiCont=request.getParameter("notiCont");
	//String userId=request.getParameter("user_id");
	 
%>

<jsp:useBean id="dao" class="noti.data.NotiDao"/>
<jsp:useBean id="dto" class="noti.data.NotiDto"/>
<jsp:setProperty property="*" name="dto"/>
<% 
dao.insertNoti(dto);
response.sendRedirect("notilist.jsp");
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>