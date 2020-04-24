<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String notiType=request.getParameter("notiType");
	String notiTitle=request.getParameter("notiTitle");
	String notiCont=request.getParameter("notiCont");
%>
<jsp:useBean id="dao" class="noti.data.NotiDao"/>
<jsp:useBean id="dto" class="noti.data.NotiDto"/>
<jsp:setProperty name="dto" property="*"/>


<%
	dao.updateNoti(dto);
	//목록이동 
	response.sendRedirect("../form/notiupdate.jsp");
%>