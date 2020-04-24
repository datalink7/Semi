<%@page import="noti.data.NotiDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
 <%
 	String noti_num=request.getParameter("notiNum");
 	NotiDao dao = new NotiDao();
 	
 	dao.deleteNoti(noti_num);
 	response.sendRedirect("../../cscenter/qna.jsp");

 %>