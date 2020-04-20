<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String placeCode=request.getParameter("placeCode");
%>
<jsp:useBean id="dao" class="map.data.CreateTbMapDao"></jsp:useBean>
<%
dao.deleteTbPlace(placeCode);
// System.out.println(placeCode);

response.sendRedirect("allMap.jsp");
%>
