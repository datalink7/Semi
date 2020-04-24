<%@page import="user.data.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId=request.getParameter("userId");
	UserDao uDao=new UserDao();
	uDao.deleteUser(userId);
%>