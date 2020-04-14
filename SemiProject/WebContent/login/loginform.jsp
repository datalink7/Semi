<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function(){
		idSaveCheck();
		
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
				url:"/SemiProject/login/loginaction.jsp",
				datatype:"xml",
				data:{
					"userId":userId,
					"userPwd":userPwd,
					"idSave":idSave
				},
				success:function(data){
					//alert($(data).text());
					if($(data).text()=='yes'){
						location.href='/SemiProject/index.jsp';
					}else{
						alert("로그인 정보를 정확히 입력해주세요.");
						history.back();
					}
				}
			});
		});
		
		function idSaveCheck(){
			var inputUserId=getCookie("inputUserId");
			$("#userId").val(inputUserId);
			
			if($("#userId").val()!=""){
				$("#userIdSave").attr("checked",true);
			}
			
			$("#userIdSave").change(function(){
				if($("#userIdSave").is(":checked")){
					var inputUserId=$("#userId").val();
					setCookie("inputUserId", inputUserId,7);
				}else{
					deleteCookie("inputUserId");
				}
			});
			
			$("#userId").keyup(function(){
				if($("#userIdSave").is(":checked")){
					var inputUserId=$("#userId").val();
					setCookie("inputUserId", inputUserId,7);
				}
			});
		}
		
		/*쿠키저장*/
		function setCookie(cookieName,value,exdays){
			var exdate=new Date();
			exdate.setDate(exdate.getDate()+exdays);
			var cookieValue=escape(value)+((exdays==null)?"":";expires="+exdate.toGMTString());
			document.cookie=cookieName+"="+cookieValue;
		}
		/*쿠키삭제*/
		function deleteCookie(cookieName){
			var expireDate=new Date();
			expireDate.setDate(expireDate.getDate()-1);
			document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		/*쿠키가져오기*/
		 function getCookie(cookieName) {
          cookieName = cookieName + '=';
          var cookieData = document.cookie;
          var start = cookieData.indexOf(cookieName);
          var cookieValue = '';
          if(start != -1){
              start += cookieName.length;
              var end = cookieData.indexOf(';', start);
              if(end == -1)end = cookieData.length;
              cookieValue = cookieData.substring(start, end);
          }
          return unescape(cookieValue);
      }
	});
</script>
</head>
<body>

	<form method="post" id="authForm"
		action="https://www.tistory.com/auth/login">
		<input type="hidden" name="redirectUrl"
			value="https://blogpack.tistory.com/manage">
		<fieldset>
			<legend class="screen_out">로그인 정보 입력폼</legend>
			<div class="box_login">
				<div class="inp_text">
					<label for="loginId" class="screen_out">아이디</label> <input
						type="text" id="userId" name="userId" placeholder="ID">
				</div>
				<div class="inp_text">
					<label for="loginPw" class="screen_out">비밀번호</label> <input
						type="password" id="userPwd" name="userPwd" placeholder="Password">
				</div>
			</div>
			<button type="button" id="loginBtn" class="btn_login">로그인</button>
			<div class="login_append">
				<div class="inp_chk">
					<!-- 체크시 checked 추가 -->
					<input type="checkbox" id="userIdSave" class="inp_radio" name="keepLogin"> 
					<label for="keepLogin" class="lab_g">아이디 저장</label>
				</div>
				<span class="txt_find"> 
				<a href="/SemiProject/user/userform.jsp" class="link_find">회원가입</a>
				</span>
			</div>
		</fieldset>
	</form>
	
</body>
</html>