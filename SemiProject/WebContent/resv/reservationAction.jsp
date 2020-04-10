<%@page import="map.data.MapDao"%>
<%@page import="box.data.BoxDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String mapNum=request.getParameter("mapNum");
%>
<jsp:useBean id="dao" class="resv.data.ResvDao"></jsp:useBean>
<jsp:useBean id="dto" class="resv.data.ResvDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	dao.insertResv(dto);
	BoxDao bDao=new BoxDao();
	MapDao mDao=new MapDao();
	mDao.updateMapBoxRemain(mapNum);
	bDao.updateBox(dto.getBoxCode(), "0");
%>