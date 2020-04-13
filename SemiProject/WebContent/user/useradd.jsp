<%@page import="user.data.UserDao"%>
<%@page import="user.data.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	db.isEqualId(dto);
%>