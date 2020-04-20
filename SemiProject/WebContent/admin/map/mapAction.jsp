<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String preBoxCode=request.getParameter("boxCode");
String boxCode;
%>
<jsp:useBean id="dao" class="map.data.CreateTbMapDao"></jsp:useBean>
<jsp:useBean id="dto" class="map.data.CreateTbMapDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
dao.insertTbPlace(dto);
dao.insertTbMap(dto);
for(int i=1;i<=20;i++){
	if(i<10){
		boxCode=preBoxCode+0+0+i;
	}else{
		boxCode=preBoxCode+0+i;
	}
// 	System.out.println(boxCode);
// 	System.out.println(dto.getPlaceCode());
	dao.createBoxes(boxCode, dto.getPlaceCode());
}
response.sendRedirect("getMap.jsp");
%>
