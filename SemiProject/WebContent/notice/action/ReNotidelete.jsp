
<%@page import="noti.data.RenotiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String renotiNum=request.getParameter("renotiNum");
   String notiNum=request.getParameter("notiNum");
   RenotiDao dao=new RenotiDao();
   dao.deleteRenoti(renotiNum);
   response.sendRedirect("../../cscenter/qna.jsp?notiNum="+notiNum);
%>