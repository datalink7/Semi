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
      
      $("#userEmail3").change(function(){
    	 //해당 이메일 주소값 얻기
    	 var addr=$(this).val();
    	 //직접 입력하는 경우
    	 if(addr=='-'){
    		 //입력된 이메일 주소 지우기
    		 $("#userEmail2").val('');
    		 //포커스
    		 $("#userEmail2").focus('');
    	 }else{
    		 //선택한 이메일 주소 출력
    		 $("#userEmail2").val(addr);
    	 }
      });
      
      $("#joinBtn").click(function(){
    	  var userId=$("#userId").val();
    	  var userPwd=$("#userPwd").val();
    	  var userName=$("#userName").val();
    	  var userPhone=$("#userPhone").val();
    	  var userSex=$("input:radio[name='userSex']:checked").val();
    	  var userEmail=$("#userEmail1").val()+"@"+$("#userEmail2").val();
    	  var userAddr=$("#userAddr1").val()+" "+$("#userAddr2").val();
    	  
    	  //아이디 입력값이 없을 때 알람,포커스
    	  if(userId.length==0){
    		  alert("아이디를 입력해주세요.");
    		  $("#userId").focus();
    		  return;
    	  }else if(userPwd.length==0){
    		  alert("패스워드를 입력해주세요.");
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
    	  
    	  $.ajax({
    		 url:"useradd.jsp",
    		 type:"post",
    		 datatype:"html",
    		 data:{
    			 "userId":userId,
    			 "userPwd":userPwd,
    			 "userName":userName,
    			 "userPhone":userPhone,
    			 "userSex":userSex,
    			 "userEmail":userEmail,
    			 "userAddr":userAddr
    		 },
    		 success:function(data){
    			 
    		 }
    	  });
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
         </td>
      </tr>
      <tr>
         <th style="width: 150px; background-color: orange;">비밀번호</th>
         <td>
         <input type="password" id="userPwd" size="20" required="required">
         </td>
      </tr>
      <tr>
         <th style="width: 150px; background-color: orange;">이름</th>
         <td>
         <input type="text" id="userName" size="20" required="required">
         </td>
      </tr>
      <tr>
         <th style="width: 150px; background-color: orange;">핸드폰 번호</th>
         <td>
         <input type="text" id="userPhone" size="20" required="required" placeholder=" - 를 빼고 입력해주세요.">
         </td>
      </tr>
      <tr>
         <th style="width: 150px; background-color: orange;">성별</th>
         <td>
         <input type="radio" name="userSex" size="20" value="남자" checked>남자
         <input type="radio" name="userSex" size="20" value="여자" >여자
         </td>
      </tr>
      <tr>
         <th style="width: 150px; background-color: orange;">이메일</th>
         <td>
         <input type="text" size="15" id="userEmail1" name="useremail1" required="required">
         <b>@</b>
         <input type="text" size="15" id="userEmail2" name="useremail2" required="required">
         <select style="width: 150px; height: 21px;" id="userEmail3" name="useremail3">
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
            <input type="text" id="userAddr1" name="addr" style="width: 200px;" required="required">
            <button type="button" id="btnaddr">주소검색</button>
            <br>
            <input type="text" id="userAddr2" name="addr2" style="width: 300px;" required="required">
         </td>
      <tr>
         <td colspan="2" align="center">
         <button type="button" id="joinBtn" style="width: 150px;">회원가입   </button>
         </td>
      </tr>
   </table>
</body>
</html>