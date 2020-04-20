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
	//true 면 세션에 loginok,checkok,idok 저장 후
	//이동 : successpage.jsp 를 메인 위치에
	//false 면 스크립트로 경고 후 이전페이지 
	System.out.println(bLogin?"yes":"no");
%>
<data><%=bLogin?"yes":"no"%></data>

