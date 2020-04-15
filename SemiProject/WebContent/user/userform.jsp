<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
function post1() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
           var zonecode=data.zonecode;
           var roadAddr = data.address;
           var str="("+zonecode+")"+roadAddr;
//            console.log(str);
            $("#userAddr1").val(str);
        }
    }).open();
}
	$(function(){
		
		var idCheckCnt = 0;
		
		$("#btnaddr").click(function(){
			
		});
		
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
		
		$("#idCheck").click(function(){
			var userId=$("#userId").val();
			
			if(userId.length==0){
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return;
			}else{
				$.ajax({
					type:"post",
					url:"useradd.jsp",
					datatype:"html",
					data:{
						"userId":userId,
						"state":"idCheck"
					},
					success:function(data){
						if($(data).text().trim() == "yes"){
							idCheckCnt++;
							alert("사용가능한 아이디입니다.");
						}else{
							idCheckCnt = 0;
							alert("중복된 아이디입니다.");
							$("#userId").val("");
							$("#userId").focus();
						}
					}
				});
			}
		});
		
		$("#joinBtn").click(function(){
			
			var userId=$("#userId").val();
			var userPwd=$("#userPwd1").val();
			var userPwd2=$("#userPwd2").val();
			var userName=$("#userName").val();
			var userPhone=$("#userPhone").val();
			var userSex=$("input:radio[name=userSex]:checked").val();
			var userEmail=$("#userEmail1").val()+"@"+$("#userEmail2").val();
			var userAddr=$("#userAddr1").val()+" "+$("#userAddr2").val();
			
			//아이디 입력값이 없을 때 알람, 포커스
			if(userId.length==0){
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return;
			}else if($("#userPwd1").length==0){
				alert("비밀번호를 입력해주세요.");
				$("#userPwd").focus();
				return;
			}else if(userName.length==0){
				alert("이름을 입력해주세요.");
				$("#userName").focus();
				return;
			}else if(userPhone.length==0){
				alert("핸드폰 번호를 입력해주세요.");   
				$("#userPhone").focus();
				return;
			}else if(userEmail.length==0){
				alert("이메일을 입력해주세요.");
				$("#userEmail1").focus();
				return;
			}else if(userAddr.length==0){
				alert("주소를 입력해주세요.");
				$("#userAddr1").focus();
				return;
			}
			
			if(userPwd != userPwd2){
				alert("입력한 두 비밀번호가 일치하지 않습니다.");
				$("#userPwd2").val("");
				$("#userPwd2").focus();
				return;
			}
			
			if(idCheckCnt == 0){
				alert("아이디 중복체크를 해주세요");
				return;
			}else{
				$.ajax({
					type:"post",
					url:"useradd.jsp",
					datatype:"html",
					data:{
						"userId":userId,
						"userPwd":userPwd,
						"userName":userName,
						"userPhone":userPhone,
						"userSex":userSex,
						"userEmail":userEmail,
						"userAddr":userAddr,
						"state":"join"
					},
					success:function(data){
						$("#out").html("<b>"+userName+"님 회원가입이 완료되었습니다.</b>");
						location.href = "/SemiProject/main/mainform.jsp"
					}
				});
			}
		});
	});
</script>
</head>
<body>
<table>
	<caption>회원가입</caption>
	<tr>
		<th style="width: 150px; background-color: orange;">아이디</th>
		<td>
			<input type="text" id="userId" size="20" autofocus="autofocus" required="required">
			<button type="button" id="idCheck" style="width: 80px;">중복체크</button>
		</td>
	</tr>
	<tr>
		<th style="width:150px; background-color: orange;">비밀번호</th>
		<td>
			<input type="password" id="userPwd1" size="20" required="required">
		</td>
	</tr>
	<tr>
		<th style="width:150px; background-color: orange;">비밀번호 확인</th>
		<td>
			<input type="password" id="userPwd2" size="20" required="required">
		</td>
	</tr>
	<tr>
		<th style="width: 150px; background-color: orange;">이 름</th>
		<td>
			<input type="text" id="userName" size="20" required="required">
		</td>
	</tr>
	<tr>
		<th style="width: 150px; background-color: orange;">핸드폰</th>
		<td>
			<input type="text" id="userPhone" size="20" placeholder="  - 를 빼고 입력해주세요.">
		</td>
	</tr>
	<tr>
		<th style="width: 150px; background-color: orange;">성 별</th>
		<td>
			<input type="radio" name="userSex" size="20" value="남자" checked>남자
			<input type="radio" name="userSex" size="20" valus="여자">여자
		</td>
	</tr>
	<tr>
		<th style="width: 150px; background-color: orange;">이메일</th>
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
   	<tr>
    	<th style="width: 150px; background-color: orange;">주소</th>
        <td>
        	<input type="text" id="userAddr1" name="addr1" style="width: 200px;" required="required">
            <button type="button" id="btnaddr" onclick="post1()">주소검색</button>
            <br>
            <input type="text" id="userAddr2" name="addr2" style="width: 300px;" required="required">
        </td>
    <tr>
    	<td colspan="2" align="center">
        <button type="button" id="joinBtn" style="width: 150px;">회원가입   </button>
        </td>
    </tr>
</table>
<div id="out" style="color:blue; font-size:20pt;"></div>
</body>
</html>