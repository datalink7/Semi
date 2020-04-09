<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btnaddr").click(function(){
			window.open("postsearch.jsp");
		});
	});
</script>
</head>
<body>
<form action="#" method="post">
	<table>
	<caption>회원가입</caption>
		<tr>
			<th style="width: 150px; background-color: orange;">아이디</th>
			<td>
			<input type="text" size="20" autofocus="autofocus" required="required">
			</td>
		</tr>
		<tr>
			<th style="width: 150px; background-color: orange;">비밀번호</th>
			<td>
			<input type="password" size="20" required="required">
			</td>
		</tr>
		<tr>
			<th style="width: 150px; background-color: orange;">이름</th>
			<td>
			<input type="text" size="20" required="required">
			</td>
		</tr>
		<tr>
			<th style="width: 150px; background-color: orange;">핸드폰 번호</th>
			<td>
			<input type="text" size="20" required="required" placeholder=" - 를 빼고 입력해주세요.">
			</td>
		</tr>
		<tr>
			<th style="width: 150px; background-color: orange;">성별</th>
			<td>
			<input type="checkbox" name="sex" size="20" value="남자" >남자
			<input type="checkbox" name="sex" size="20" value="여자" >여자
			</td>
		</tr>
		<tr>
			<th style="width: 150px; background-color: orange;">이메일</th>
			<td>
			<input type="text" size="15" name="email1" required="required">
			<b>@</b>
			<input type="text" size="15" name="email2" required="required">
			<select style="width: 150px; height: 21px;" name="email3">
				<option value="-">직접입력</option>
				<option value="gmail.com">구글</option>
				<option value="naver.com">네이버</option>
				<option value="daum.net">다음</option>
				<option value="nate.com">네이트</option>
			</select>
			</td>
		</tr>
		<tr>
			<th style="width: 150px; background-color: orange;">주소</th>
			<td>
				<input type="text" name="addr1" style="width: 200px;" required="required" readonly="readonly">
				<button type="button" id="btnaddr">주소검색</button>
				<br>
				<input type="text" name="addr2" style="width: 300px;" required="required">
			</td>
		<tr>
			<td colspan="2" align="center">
			<button type="submit" style="width: 150px;">회원가입	</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>