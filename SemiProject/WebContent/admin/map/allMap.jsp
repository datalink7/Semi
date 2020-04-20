<%@page import="java.util.List"%>
<%@page import="map.data.CreateTbMapDto"%>
<%@page import="map.data.CreateTbMapDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String placeName;
	if(request.getParameter("placeName")==null){
		placeName="";
	}else{
		placeName=request.getParameter("placeName");
	}
	
	CreateTbMapDao dao=new CreateTbMapDao();
	List<CreateTbMapDto> list=dao.searchPlaces(placeName);

%>
<style>
.del{
	cursor: pointer;
}
</style>
<body>
<div>
	<form action="" method="get">
		<div class = "input-group">
		<span class="input-group-addon">지점명검색</span>
		<input type="text" class="form-control" style="width:200px;" name="placeName" placeholder="지점명검색"><button type="submit" class="btn btn-default">검색</button>
		</div>
	</form>
	<table class="table" style="width:600px;">
		<tr>
			<td>지점코드</td><td>지점명</td><td>지점주소</td><td>삭제</td>
		</tr>
		<%for(CreateTbMapDto dto:list){ %>
		<tr>
			<td><%=dto.getPlaceCode() %></td><td><%=dto.getPlaceName() %></td><td><%=dto.getMapAddr() %></td><td><a href="delMapAction.jsp?placeCode=<%=dto.getPlaceCode()%>"><span class="del glyphicon glyphicon-remove"></span></a></td>
		</tr>
		<%} %>
	</table>
</div>
</body>
</html>