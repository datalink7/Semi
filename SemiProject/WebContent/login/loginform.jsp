<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>Insert title here</title>
<style type="text/css">
	table{
		margin-top: 300px;
	}
</style>
</head>
<body>
<form action="#" method="post">
<table style="width: 650px;" align="center" >
	<tr>
		<th style="width: 200px; height: 50px; background-color: orange; font-size: 25pt;" >아이디</th>
		<td>
			<input type="text" id="userId" style="width: 300px; height: 50px; font-size: 25pt;" required="required">
		</td>
		<td rowspan="2">
			<button type="button" id="loginBtn" style="height: 120px; width: 140px;">로그인</button>
		</td>
	</tr>
	<tr>
		<th style="width: 200px; height: 50px; background-color: orange; font-size: 25pt;" >비밀번호</th>
		<td>
			<input type="password" id="userPwd" style="width: 300px; height: 50px; font-size: 25pt;" required="required">
		</td>
	</tr>
	<tr>
		<th></th>
		<td>
			<%if(check) %>
		</td>
	</tr>
</table>
</form>
</body>
</html>