<?xml version="1.0" encoding="UTF-8"?>
<%@page import="user.data.UserDao"%>
<%@page import="user.data.UserDto"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글 엔코딩
	request.setCharacterEncoding("utf-8");

	//데이터 불러오기
	String userId=request.getParameter("userId");
	String userPwd=request.getParameter("userPwd");
	String userName=request.getParameter("userName");
	String userPhone=request.getParameter("userPhone");
	String userSex=request.getParameter("userSex");
	String userEmail=request.getParameter("userEmail");
	String userAddr1=request.getParameter("userAddr");
	String state = request.getParameter("state");
	
	System.out.println(userId);
	System.out.println(userPwd);
	System.out.println(userName);
	System.out.println(userPhone);
	System.out.println(userSex);
	System.out.println(userEmail);
	System.out.println(userAddr1);
	System.out.println(state);
	
	//dto 생성
	UserDto dto=new UserDto();
	
	//dto에 값 설정
	dto.setUserId(userId);
	dto.setUserPwd(userPwd);
	dto.setUserName(userName);
	dto.setUserPhone(userPhone);
	dto.setUserSex(userSex);
	dto.setUserEmail(userEmail);
	dto.setUserAddr1(userAddr1);
	
	//dao생성
	UserDao db=new UserDao();
	
	//insert 메서드 호출
	boolean find = db.isEqualId(dto, state); 
	
	System.out.println(find);
%>
<data><%=find?"no":"yes"%></data>