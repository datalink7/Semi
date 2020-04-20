<%@page import="map.data.MapDao"%>
<%@page import="box.data.BoxDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String mapNum=request.getParameter("mapNum");
	String getBoxCode=request.getParameter("getBoxCode");
	String getStDate=request.getParameter("getStDate");
	String getEdDate=request.getParameter("getEdDate");
	String resvType=request.getParameter("resvType");
	System.out.println(resvType+"resvaction");
%>
<jsp:useBean id="dao" class="resv.data.ResvDao"></jsp:useBean>
<jsp:useBean id="dto" class="resv.data.ResvDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
if(resvType.equals("1")){
	dto.setResvType("보관함 예약");
}else if(resvType.equals("2")){
	dto.setResvType("반값 택배 예약");
}else if(resvType.equals("3")){
	dto.setResvType("택배 예약");
}

	dao.insertResv(dto);
	BoxDao bDao=new BoxDao();
	MapDao mDao=new MapDao();
	bDao.updateBox(dto.getBoxCode(),dto.getUserId(), "0");

// 	System.out.println(resvType);
	//getbox
	if(resvType.equals("반값 택배 예약")){
		dto.setBoxCode(getBoxCode);
		dto.setResvStDate(getStDate);
		dto.setResvEdDate(getEdDate);
		dao.insertResv(dto);
	}
// 	System.out.println(dto.getBoxCode()+", "+dto.getResvStDate()+", "+dto.getResvEdDate()+", "+dto.getUserId());
	
	bDao.updateBox(dto.getBoxCode(),dto.getUserId(), "0");
	response.sendRedirect("resvResult.jsp?resvType="+resvType);
%>