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
<!-- 예약
시작날짜 종료날짜 input type=date
물건 타입-select
물건 수량
비밀번호 설정
 -->
<%
	String mapNum=request.getParameter("mapNum");
	String boxCode=request.getParameter("boxCode");
	String userId;
	if((String)session.getAttribute("userId")==null)
		userId="admin";
	else
		userId=(String)session.getAttribute("userId");
%>
<script>
$(function() {
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + (date.getMonth()+1);
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	
	$("input[type='date']").val(yyyy+"-"+mm+"-"+dd);
});


</script>


<body>
<form action="reservationAction.jsp" method="post">
	<input type="hidden" name="mapNum" value=<%=mapNum %>>
	<input type="hidden" name="userId" value=<%=userId %>>
	<table class="table table-bordered">
		<tr>
			<td><%=Integer.parseInt(boxCode.substring(3))%>번 보관함<input type="hidden" name="boxCode" value=<%=boxCode %>></td><!-- boxCode로 나중에 수정 -->
			<td>시작일자:<input type="date" id="resvStDate" style="width:150px" value="2020-04-10"></td>
			<td>종료일자:<input type="date" id="resvEdDate" name="resvEdDate" style="width:150px"></td>
		</tr>
		<tr>
			<td>
				<select name="resvType">
					<option hidden disabled="disabled" selected="selected">서비스 선택하기</option>
					<option>보관함 예약</option>
					<option>반값 예약</option>
					<option>일반택배 예약</option>
					<option>퀵 예약</option>
				</select>
			</td>
			<td>
				<select name="objType">
					<option hidden disabled="disabled" selected="selected">물건 종류</option>
					<option>옷</option>
					<option>전자기기</option>
					<option>음식류</option>
					<option>서적류</option>
				</select>
			</td>
			<td>
				물건 수량:<input type="number" name="objCnt" value=1>
			</td>
		</tr>
		<tr>
			<td>비밀번호 설정: <input type="password" name="boxPwd"></td>
			<td>사이즈 입력: <input type="text" id="objSize" name="objSize" placeholder="(가로)*(세로)*(높이)로 입력"></td>
			<td>
			
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<button type="submit">예약하기</button><button type="button" onclick="history.back()">취소</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>