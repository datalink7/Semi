<%@page import="resv.data.ResvDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String resvType=request.getParameter("resvType");
	System.out.println(resvType+"액션");
	
	String resvNum=request.getParameter("resvNum");
	String userId;
	if(request.getParameter("userId")!=null)
	userId=request.getParameter("userId");
	else
		userId="%";
	String cancel=request.getParameter("cancel");
	String end=request.getParameter("end");
	ResvDao rDao=new ResvDao();
	rDao.cancelResv(resvNum,cancel);
	response.sendRedirect("allResv.jsp?userId="+userId+"&resvType="+resvType);
%>