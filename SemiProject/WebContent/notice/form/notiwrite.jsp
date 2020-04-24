<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	list();
	$("#selectdata").hide();
	$("#btnadd").click(function(){
	
	var notiTitle=$("#notiTitle").val();
	var notiCont=$("#notiCont").val();
	var notiPwd=$("#notiPwd").val();
	
	
	});
});

</script>


</head>
<body>
<%String userId="admin"; %>
<div class="row">
	<h2 class="text-center">Q&A</h2>
	<form action="../notice/action/insertaction.jsp" method="post">
	<table>
	<tr>
		<select name="notiType">
		<% 
			if(userId.equals("admin")){%>
			<option >공지사항</option>
			<%}
			%>
			<option>예약관련</option>
			<option>픽업관련</option>
			<option>택배보관관련</option>
			<option>결제관련</option>
			<option>회원가입/로그인관련</option>	
		</select>
	<tr>
		<td>제목</td>
		<td colspan="3"><input type="text" name="notiTitle" required="required"></td>
	</tr>
	<tr>
		<td>패스워드</td>
		<td colspan="3"><input type="password" name="notiPwd" required="required"></td>
	</tr>
	<tr>
		<td>글내용</td>
		<td colspan="3"><textarea name="notiCont" class="notiCont" required="required"></textarea></td>
	</tr>
	
		
	<tr>
		<td colspan="4">
		<button type="submit" name="save" >저장</button>
		</td>
		<td colspan="4">
		<button type="button" name="cancel" onclick="location.href='notilist.jsp'">취소</button>
		</td>
	</tr>	
			
	</table>	
	</form>
</div>	
</body>
</html>