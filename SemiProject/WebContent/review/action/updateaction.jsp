<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String revwType=request.getParameter("revwType");
	String revwCont=request.getParameter("revwCont");
	String revwStar=request.getParameter("revwStar");
			
%>
<jsp:useBean id="dao" class="review.data.RevwDao"/>
<jsp:useBean id="dto" class="review.data.RevwDto"/>
<jsp:setProperty name="dto" property="*"/>

<%
	dao.updateReview(dto);
	response.sendRedirect("../form/revwlist.jsp");
%>