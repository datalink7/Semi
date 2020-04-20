<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String resvType=request.getParameter("resvType");
%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(function() {
	opener.location.href = "resvMain.jsp";
	$(".closeWindow").click(function() {
		window.close();
	});
	$(".toMyPage").click(function() {
		<%if(resvType.equals("1")){ %>
			opener.location.href = "index.jsp"; //마이페이지 완성시 부모창을 마이페이지로 이동
		<%}else{%>
			window.parent.location.href='../reservation.jsp';
		<%}%>
		window.close();
	});
});
</script>
<style>
	.result{
		position: absolute;
		left: 50%;
		width: 500px;
		height:500px;
		margin-top: 30px;
		margin-left: -250px;
	}
	a{
		cursor: pointer;
	}

</style>
<title>예약 결과</title>
</head>
<body>
	<div class="result" align="center">
		<table>
			<tr>
				<td colspan="2" align="center">
					<h2>예약에 성공</h2>
				</td>
			</tr>
			<tr>
				<td>
				<button class="toMyPage btn btn-default">마이페이지로 이동</button>
				</td>
				<td>
				<%if(resvType.equals("1")){ %>
				<button class="closeWindow btn btn-default">창닫기</button>
				<%}else{ %>
				<button onclick="window.parent.location.href='../reservation.jsp'" class="toHome btn btn-default">처음으로</button>
				<%} %>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
