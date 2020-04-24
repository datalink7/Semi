<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="user.data.UserDto"%>
<%@page import="user.data.UserDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String con="",val="",asc="";
	
	if(request.getParameter("con")==null) {
		con="user_id!";
		val=" ";
	}else{
		con=request.getParameter("con");
		val=request.getParameter("val");
	}
	if(request.getParameter("asc")==null) {
		asc="user_id";
	}else{
		asc=request.getParameter("asc");
	}
// 	System.out.println(con+", "+val+", "+asc);
	String userId=request.getParameter("userId");
	UserDao uDao=new UserDao();
	List<UserDto> list=uDao.getAllUserData(con, val, asc);
%>
<selectdata>
	<%
	for(UserDto uDto:list){
	String[] email=uDto.getUserEmail().split("@");
	%>

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
	<%} %>
</selectdata>		
