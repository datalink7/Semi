<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="resv.data.ResvDao"%>
<%@page import="resv.data.ResvDto"%>
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
	ResvDao rDao=new ResvDao();
	List<ResvDto> list=rDao.getAllDatas();
	
%>
<body>
<div>
	<table class="table table-striped">
		<caption>예약 전체 내역</caption>
		<tr>
			<td>예약자ID</td>
			<td>예약분류</td>
			<td>예약번호</td>
			<td>물건종류</td>
			<td>예약취소</td>
			<td>예약종료</td>
			<td>초과여부</td>
			<td>예약신청일</td>
		</tr>
		<%
		if(list.size()==0){
			%><tr><td colspan="12">주문내역 없음</td></tr><%
		}else{
			for(int i=0;i<list.size();i++){
				if(list.get(i).getResvSendAddr()!=null){
					if(list.get(i).getResvSendAddr().equals(list.get(i+1).getResvSendAddr())&&list.get(i).getResvGetAddr().equals(list.get(i+1).getResvGetAddr())){
						continue;
					}
				}
			%>
				<tr resvnum=<%=list.get(i).getResvNum() %>>
					<td><%=list.get(i).getUserId() %></td>
					<td><%=list.get(i).getResvType() %></td>
					<td><%=list.get(i).getResvNum() %></td>
					<td><%=list.get(i).getObjType() %></td>
					<td><%=list.get(i).getResvCancelYn() %></td>
					<td><%=list.get(i).getResvEndYn() %></td>
					<td><%=list.get(i).getResvOverPrice() %></td>
					<td><%=list.get(i).getResvDate() %></td>
				</tr>
		
		<%}} %>
	
	</table>

</div>

</body>
</html>