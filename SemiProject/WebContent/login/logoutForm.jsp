<%@page import="user.data.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	//세션으로 부터 로그인 상태를 얻는다
	String loginok=(String)session.getAttribute("loginok");
	//세션으로 부터 아이디를 얻는다
	String userId=(String)session.getAttribute("idok");
	//dao 선언
	UserDao dao=new UserDao();
	//아이디에 해당하는 이름을 얻는다.
	String name=dao.getUserName(userId);
%>
<body>
<div style="margin-top: 50px;width: 220px;text-align: center;">
 	<p>환영합니다</p>
 	<b><%=name %>님</b><br><br>
 	<button type="button" class="btn btn-danger btn-md"
 	style="width: 100px;"
 	onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
</div>
</body>
</html>