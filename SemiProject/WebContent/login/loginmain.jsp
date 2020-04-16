<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//loginok 세션 얻기
	//로그인을 안한상태라면 null 값을 가지고 있다.
	String loginok=(String)session.getAttribute("loginok");
	if(loginok==null){%>
		<jsp:include page="loginform.jsp"></jsp:include>
	<%}else{%>
		<jsp:include page="logoutForm.jsp"></jsp:include>
	<%}
%>