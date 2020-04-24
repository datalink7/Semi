<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키값들을 얻는다
	Cookie[] cookies=request.getCookies();
	//널값이 아닐경우 login 이 있는지 체크
	//있으면 login 쿠키 삭제
	if(cookies!=null)
	{
		for(Cookie cookie:cookies)
		{
			if(cookie.getName().equals("login"))
			{
				cookie.setMaxAge(0);	//유지시간을 1초로 설정
				cookie.setPath("/");	//저장위치를 루트로 설정
				response.addCookie(cookie);	//다시 브라우저에 쿠키저장
			}
		}
	}
	
	//로그인메인페이지로 이동
	response.sendRedirect("../index.jsp");
%>
