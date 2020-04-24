<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
System.out.println("insert1");
%>
<jsp:useBean id="dao" class="noti.data.RenotiDao"/>
<jsp:useBean id="dto" class="noti.data.RenotiDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	System.out.println(dto.getNotiNum()+"insert");
   dao.insertRenoti(dto);
   response.sendRedirect("../../cscenter/qna.jsp?notiNum="+dto.getNotiNum());
%>