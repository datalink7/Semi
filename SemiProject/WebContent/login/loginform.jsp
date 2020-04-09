<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			<input type="text" style="width: 300px; height: 50px; font-size: 25pt;">
		</td>
		<td rowspan="2">
			<input type="submit" style="height: 120px; width: 140px;">
		</td>
	</tr>
	<tr>
		<th style="width: 200px; height: 50px; background-color: orange; font-size: 25pt;" >비밀번호</th>
		<td>
			<input type="password" style="width: 300px; height: 50px; font-size: 25pt;">
		</td>
	</tr>
	<tr>
		<th></th>
		<td>
			<input type="checkbox" name="idcheck"  style="width: 30px; height: 30px; "><span style="font-size: 17pt;">아이디 저장</span>
		</td>
	</tr>
</table>
</form>
</body>
</html>