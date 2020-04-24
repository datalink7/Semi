
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("utf-8");
	
	//String revwPwd = request.getParameter("notiPwd");
	//String userId = (String)session.getAttribute("userId");	
	
	
	String notiType=request.getParameter("notiType");
	String notiTitle=request.getParameter("notiTitle");
	String notiCont=request.getParameter("notiCont");
	//String userId=request.getParameter("user_id");
	 System.out.println(notiType);
	 System.out.println(notiTitle);
	 System.out.println(notiCont);
%>

<jsp:useBean id="dao" class="noti.data.NotiDao"/>
<jsp:useBean id="dto" class="noti.data.NotiDto"/>
<jsp:setProperty property="*" name="dto"/>
<% 

dao.insertNoti(dto);
int notiNum=dao.getnotiNum();
response.sendRedirect("../../cscenter/qna.jsp?notiNum="+notiNum);
//System.out.println(dto.getNotiNum());

%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>