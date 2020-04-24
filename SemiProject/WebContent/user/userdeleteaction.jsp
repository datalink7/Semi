<%@page import="user.data.UserDto"%>
<%@page import="user.data.UserDao"%>
<%@page import="javax.websocket.SendResult"%>
<%@page import="java.io.Console"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 검색</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<style type="text/css">
#side{
        float: center;  width: 300px; height: 500px;
        position: relative;
        left: 300px; top: 300px;
    }
</style>

<script type="text/javascript">
$(function() {
	
	$("#back").click(function() {
		history.back();
	});
	$("#back1").click(function() {
		history.back();
	});
});
</script>
</head>



<%
    String root=request.getContextPath();//프로젝트경로(루트경로)
%>
<body>

<%

	Cookie[] cookies=request.getCookies();
	String userId="";
	if(cookies!=null){//저장된 쿠키 있음
		//배열 형태이므로 반복문
		for(Cookie cookie:cookies){
			//저장된 name얻기
			String name=cookie.getName();
			//저장된 값 얻기
			String value=cookie.getValue();
			//이클립스 콘솔에 출력
	// 			System.out.println("name="+name+",value="+value);
			//login에 ok면 이미 로그인중이라는 뜻
			if(name.equals("login")){
				userId=value;
			}
			else{//임시로 admin 강제
				userId="admin";
			}
		}
	}
	System.out.println(userId);
	UserDao uDao=new UserDao();
	UserDto uDto=uDao.getUserData(userId);
	
	
	
	//myid 를 세션으로부터 얻는다(세션명:idok)
// 	String user_id=request.getParameter("user_id");
// 	System.out.println(user_id);
    //key 값을 읽는데 처음에는 null 값이  나온다
    
    
    /* String email2=request.getParameter("email2");
    System.out.println("user_email2:"+email2);  */
	//String key=request.getParameter("key");
    /* String email_2=request.getParameter("value"); */
    /* System.out.println("email_2="+email_2); */
    String user_pwd=request.getParameter("user_pwd");
    System.out.println(userId);
    System.out.println(user_pwd);
    
    
    boolean check=false;
    System.out.print(uDto.getUserPwd());
    if(user_pwd.equalsIgnoreCase(uDto.getUserPwd()))
    	check=true;
    
    if(check==true)
    {
        //폼태그
%>
            <div>회원탈퇴를 하시겠습니까?</div>
            
            <table class="table table-bordered" 
            style="width: 350px; margin-left: 10px;">
                <tr>
                    <td align="center">                      
                         <button type="submit" class="btn btn-sm btn-danger"
                         style="width: 80px;" id="complete" name="complete" onclick="location.href='/SemiProject111111/user/userdeletecomplete.jsp'">예</button>
						 <button type="submit" class="btn btn-sm btn-danger" style="width: 80px;" id="back1">아니오</button>
                    </td>
                </tr>
            </table>
    <%}else{
        %>
    	<div id="side">비밀번호가 틀렸습니다.
    	<br>
    	<button type="submit" class="btn btn-sm btn-danger"
        style="width: 50px; height: 30px;" id="back">확인</button>
        </div>
        
    <%}
%>

</body>
</html>
