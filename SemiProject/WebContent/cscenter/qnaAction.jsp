<%@page import="java.util.List"%>
<%@page import="noti.data.RenotiDto"%>
<%@page import="noti.data.RenotiDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="noti.data.NotiDto"%>
<%@page import="noti.data.NotiDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String notiNum=request.getParameter("notiNum");
	System.out.println(notiNum);
	NotiDao nDao=new NotiDao();
	NotiDto nDto=nDao.getData(notiNum);
	nDao.NotiCount(notiNum);
	RenotiDao rDao=new RenotiDao();
	List<RenotiDto> rList=rDao.getRenotiList(notiNum);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm");
	SimpleDateFormat sdf3=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>

<selectdata>
	<data>
		<num><%=nDto.getNotiNum() %></num>
		<title><%=nDto.getNotiTitle() %></title>
		<content><%=nDto.getNotiCont() %></content>
		<userid><%=nDto.getUserId() %></userid>
		<date><%=sdf.format(nDto.getNotiDate()) %></date>
		<time><%=sdf2.format(nDto.getNotiTime()) %></time>
		<type><%=nDto.getNotiType() %></type>
		<cnt><%=nDto.getNotiCnt()%></cnt>
		<%
		if(rList.size()==0){}else{%>
		<re><%
		for(RenotiDto dto:rList){%>
			<renum><%=dto.getNotiNum()%></renum>
			<recont><%=dto.getRenotiCont()%></recont>
			<redate><%=dto.getRenotiDate()%></redate>
		<%}
		%>
		</re>
		<%
		}%>
	</data>

</selectdata>