<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userEmail1=request.getParameter("userEmail1");
	String userEmail2=request.getParameter("userEmail2");
	String userEmail=userEmail1+"@"+userEmail2;
	System.out.println(userEmail+"1");
%>
<jsp:useBean id="dao" class="user.data.UserDao"></jsp:useBean>
<jsp:useBean id="dto" class="user.data.UserDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	dto.setUserEmail(userEmail);
	dao.updateUser(dto);
	
	response.sendRedirect("mypage.jsp");
	System.out.println(userEmail+"2");

%>