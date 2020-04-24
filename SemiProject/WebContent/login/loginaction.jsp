<?xml version="1.0" encoding="UTF-8"?>
<%@page import="user.data.UserDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//userid, userpwd, idsave
	String userId=request.getParameter("userId");
	String userPwd=request.getParameter("userPwd");
	String idsave=request.getParameter("userIdSave");
	
	System.out.println(userId);
	System.out.println(userPwd);
	
	//dao선언
	UserDao dao=new UserDao();
	
	//isLogin 메서드 호출
	boolean bLogin=dao.isLogin(userId,userPwd);
	if(bLogin){
		Cookie cookie=new Cookie("login",userId);
		//유지 시간 지정-테스트이므로 아주 짧게 주기
		cookie.setMaxAge(-1);//10초
		//저장될 경로 지정
		cookie.setPath("/");
		//브라우저에 쿠키 추가
		response.addCookie(cookie);
	}

	System.out.println(bLogin?"yes":"no");
%>
<data><%=bLogin?"yes":"no"%></data>

