<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(function(){
	$("#userEmail3").change(function(){
		//해당 이메일 주소값 얻기
		var addr=$(this).val();
		//직접 입력하는 경우
		if(addr=='-'){
			//입력된 이메일 주소지우기
			$("#userEmail2").val('');
			//포커스
			$("#userEmail2").focus('');
		}else{
			//선택한 이메일 주소 출력
			$("#userEmail2").val(addr);
		}
	});
	
	$("#btn_pwdfind").click(function(){
		var userId=$("#userId").val();
		var userName=$("#userName").val();
		var userEmail=$("#userEmail1").val()+"@"+$("#userEmail2").val();
		
		if(userId.length==0){
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
			return;
		}else if(userName.length==0){
			alert("이름을 입력해주세요.");
			$("#userPwd").focus();
			return;
		}else if(userEmail.length==0){
			alert("이메일을 입력해주세요.");
			$("#userPwd").focus();
			return;
		}
		
		
		
	});
});
</script>
</head>
<body>
<table>
		<tr>
			<th style="float: left;">아이디를 입력해주세요.</th>
		</tr>
		<tr>
			<td>
				<input type="text" id="userId" size="20" required="required">
			</td>
		</tr>
		<tr>
			<th style="float: left;">이름을 입력해주세요.</th>
		</tr>
		<tr>
			<td>
				<input type="text" id="userName" size="20" required="required">
			</td>
		</tr>
		<tr>
			<th style="float: left;">이메일을 입력해주세요.</th>
		</tr>
		<tr>
			<td>
				<input type="text" size="15" id="userEmail1" name="userEmail1" required="required">
        		<b>@</b>
        		<input type="text" size="15" id="userEmail2" name="userEmail2" required="required">
        		<select style="width: 150px; height: 21px;" id="userEmail3" name="userEmail3">
        			<option value="-">직접입력</option>
            		<option value="gmail.com">구글</option>
            		<option value="naver.com">네이버</option>
            		<option value="daum.net">다음</option>
            		<option value="nate.com">네이트</option>
        		</select>
			</td>
		</tr>
		<tr colspan="2" align="left">
			<td>
				<br>
				<button type="button" id="btn_pwdfind" style="width: 150px;" >비밀번호 찾기</button>
			</td>
		</tr>
		<tr>
			<td>
				<b>입력하신 이메일로 비밀번호가 전송됩니다.</b>
			</td>
		</tr>
	</table>
</body>
</html>