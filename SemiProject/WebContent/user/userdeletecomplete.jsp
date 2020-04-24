<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//엔코딩
	request.setCharacterEncoding("utf-8");
%>

<!-- usebean 으로 dto, dao 선언 -->
<jsp:useBean id="dao" class="user.data.UserDao"></jsp:useBean>
<jsp:useBean id="dto" class="user.data.UserDto"></jsp:useBean>
<!-- setproperty 로  dto 에 데이타 넣기 -->
<jsp:setProperty name="dto" property="*"/>
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
	System.out.println("userId:"+userId);
	dao.deleteNoti(userId);
	dao.deleteUser(userId);
	System.out.println("삭제 완료");
	
	Cookie cookie=new Cookie("login",userId);
	//유지 시간 지정-테스트이므로 아주 짧게 주기
	cookie.setMaxAge(0);
	//저장될 경로 지정
	cookie.setPath("/");
	//브라우저에 쿠키 추가
	response.addCookie(cookie);

	
	
	response.sendRedirect("../index.jsp");
%>
