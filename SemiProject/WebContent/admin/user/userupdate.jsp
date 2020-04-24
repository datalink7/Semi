<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userEmail1=request.getParameter("userEmail1");
	String userEmail2=request.getParameter("userEmail2");
	String userEmail=userEmail1+"@"+userEmail2;
	String addr1=request.getParameter("addr1");
	String addr2=request.getParameter("addr2");
	String userAddr1=addr1+" "+addr2;
%>
<jsp:useBean id="dao" class="user.data.UserDao"></jsp:useBean>
<jsp:useBean id="dto" class="user.data.UserDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%

dto.setUserEmail(userEmail);
	dto.setUserAddr1(userAddr1);
	dao.updateUser(dto);
	response.sendRedirect("../mngUser.jsp");
%>