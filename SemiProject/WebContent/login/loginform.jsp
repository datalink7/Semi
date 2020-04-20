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
			var userIdSave=$("#userIdSave").is(":checked");
			
			if(userId.length==0){
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return;
			}else if(userPwd.length==0){
				alert("비밀번호를 입력해주세요.");
				$("#userPwd").focus();
				return;
			}
			
			$.ajax({
				type:"post",
				url:"/SemiProject/login/loginaction.jsp",
				dataType:"xml",
				data:{
					"userId":userId,
					"userPwd":userPwd,
					"userIdSave":userIdSave
				},
				success:function(data){
					console.log(data);
					if($(data).text()=='yes'){
						console.log($(data).text());
						$("#loginModal").modal('hide');
						$("#loginLi").css("display", "none");
						$("#joinLi").css("display", "none");
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
<% %>
<body>

<!-- Login Modal -->
<div class="modal-body">
	<form class="form-horizontal">
		<div class="form-group">
			<label class="control-label col-sm-2" for="userId">아이디:</label>
			<div class="col-sm-12">
				<input type="text" class="form-control" id="userId" placeholder="Enter userId" name="userId">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4" for="userPwd">비밀번호:</label>
			<div class="col-sm-12">
				<input type="password" class="form-control" id="userPwd" placeholder="Enter password" name="userPwd">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<div class="checkbox">
					<label><input type="checkbox" id="userIdSave" name="remember"> 아이디 저장</label>
				</div>
			</div>
		</div>
	</form>
</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" style="width: 143px; height: 50px;">아이디 찾기</button>
		<button type="button" class="btn btn-default" style="width: 162px; height: 50px;">비밀번호 찾기</button>
		<button type="button" class="btn btn-danger" id="loginBtn" style="width: 108px; height: 50px; margin-left: auto">로그인</button>
	</div>

	<!-- <div class="modal-body">
		<form class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-2" for="userId">아이디:</label>
				<div class="col-sm-12">
					<input type="email" class="form-control" id="userId"
						placeholder="Enter userId" name="userId">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="userPwd">비밀번호:</label>
				<div class="col-sm-12">
					<input type="password" class="form-control" id="userPwd"
						placeholder="Enter password" name="userPwd">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label><input type="checkbox" name="remember" id="userIdSave"> 아이디
							저장</label>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default"
			style="width: 143px; height: 50px;">아이디 찾기</button>
		<button type="button" class="btn btn-default"
			style="width: 162px; height: 50px;">비밀번호 찾기</button>
		<button type="button" class="btn btn-danger" id="loginBtn"
			style="width: 108px; height: 50px; margin-left: auto">로그인</button>
	</div> -->
</body>
</html>