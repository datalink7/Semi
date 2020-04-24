<%@page import="java.text.SimpleDateFormat"%>
<%@page import="user.data.UserDto"%>
<%@page import="user.data.UserDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userId=request.getParameter("userId");
	UserDao uDao=new UserDao();
	UserDto uDto=uDao.getUserData(userId);
	String[] email=uDto.getUserEmail().split("@");
	System.out.println(uDto.getUserId());
%>
<selectdata>
	<data>
		<userid><%=uDto.getUserId()%></userid>
		<name><%=uDto.getUserName() %></name>
		<sex><%=uDto.getUserSex()%></sex>
		<phone><%=uDto.getUserPhone()%></phone>
		<email1><%=email[0]%></email1>
		<email2><%=email[1]%></email2>
		<addr1><%=uDto.getUserAddr1() %></addr1>
		<pwd><%=uDto.getUserPwd() %></pwd>
	</data>
</selectdata>		
