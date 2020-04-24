

<%@page import="noti.data.NotiDao"%>
<%@page import="noti.data.NotiDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	String notiType = request.getParameter("notiType");
	String notiTitle= request.getParameter("notiTitle");
	String notiCont = request.getParameter("notiCont");
	String notiPwd = request.getParameter("notiPwd");
	String userId = request.getParameter("userId");

	
	NotiDto dto = new NotiDto();
	dto.setNotiType(notiType);
	dto.setNotiTitle(notiTitle);
	dto.setNotiCont(notiCont);
	dto.setNotiPwd(notiPwd);
	dto.setUserId(userId);
	
	
	NotiDao dao = new NotiDao();
	
	dao.insertNoti(dto);


%>