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
<script type="text/javascript">
	$(function(){
		$("#loginBtn").click(function(){
			var userId=$("#userId").val();
			var userPwd=$("#userPwd").val();
			var idSave=$("#idSave").is(":checked");
			
			if(userId.length==0){
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return;
			}else if(userPwd.length==0){
				alert("비밀번호를 입력해주세요.")
				$("#userPwd").focus();
				return;
			}
			
			$.ajax({
				type:"post",
				url:"loginaction.jsp",
				datatype:"html",
				data:{
					"userId":userId,
					"userPwd":userPwd,
					"idSave":idSave
				},
				success:function(data){
					idSaveCheck();
				}
			});
		});
	});
</script>
</head>
<%	
	String userId="";	//input의 아이디에 출력해줄 값
	//세션에 들어있는 3개의 값을 구한다.
	String idok=(String)session.getAttribute("idok");
	String checkok=(String)session.getAttribute("checkok");
	
	//로그인시 아이디저장을 체크 안했거나 세션에 아예 없을 경우에는
	//아이디를 출력하지 않기 때문에 초기값 ""그냥 출력
	if(checkok!=null && checkok.equals("yes"))
		userId=idok;

%>
<body>
<table style="width: 650px;" align="center" >
	<tr>
		<th style="width: 200px; height: 50px; background-color: orange; font-size: 25pt;" >아이디</th>
		<td>
			<input type="text" id="userId" name="" style="width: 300px; height: 50px; font-size: 25pt;" required="required">
		</td>
		<td rowspan="2"> 
			<button type="button" id="loginBtn" style="height: 120px; width: 140px;">로그인</button>
		</td>
	</tr>
	<tr>
		<th style="width: 200px; height: 50px; background-color: orange; font-size: 25pt;" >비밀번호</th>
		<td>
			<input type="password" id="userPwd" name="userPwd" style="width: 300px; height: 50px; font-size: 25pt;" required="required">
		</td>
	</tr>
	<tr>
		<th></th>
		<td>
			<input type="checkbox" name="idSave" id="userIdSave">아이디 저장
		</td>
	</tr>
</table>
<div id="out1" style="color:blue; font-size:20pt;"></div>
</body>
</html>