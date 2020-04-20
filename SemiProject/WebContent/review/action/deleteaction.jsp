
<%@page import="review.data.RevwDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    

<%
	String revw_num=request.getParameter("revwNum");
	System.out.println(revw_num);
	RevwDao dao = new RevwDao();
	
	dao.deleteReview(revw_num);
	
	response.sendRedirect("../form/revwlist.jsp");
%>
