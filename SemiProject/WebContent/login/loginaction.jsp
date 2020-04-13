<%@page import="user.data.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//userid, userpwd, idsave
	String userId=request.getParameter("userId");
	String userPwd=request.getParameter("userPwd");
	String idsave=request.getParameter("idsave");
	
	System.out.println(userId);
	System.out.println(userPwd);
	
	//dao선언
	UserDao dao=new UserDao();
	
	//isLogin 메서드 호출
	boolean bLogin=dao.isLogin(userId,userPwd);
	//true 면 세션에 loginok,checkok,idok 저장 후
	//이동 : successpage.jsp 를 메인 위치에
	//false 면 스크립트로 경고 후 이전페이지
	
	if(bLogin)
	{
		//세션 유지 시간 지정
		session.setMaxInactiveInterval(10*60);
		//로그인 상태 저장
		session.setAttribute("loginok", "ok");
		//아이디 저장 체크 상태 저장
		if(idsave==null)
			session.setAttribute("checkok", "no");
		else
			session.setAttribute("checkok", "yes");
		//로그인한 page로 이동
		response.sendRedirect("../main/mainform.jsp");
	}else {%>
		<script type="text/javascript">
			alert("아이디 또는 비밀번호가 맞지 않습니다.");
			history.back();
		</script>
	<%}
%>