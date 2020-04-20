<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("utf-8");

	String revwType=request.getParameter("revwType");
	String revwCont=request.getParameter("revwCont");
	String revwStar=request.getParameter("revwStar");
	
	System.out.println(revwType);
	System.out.println(revwCont);
	System.out.println(revwStar);
	
%>

<jsp:useBean id="dao" class="review.data.RevwDao"/>
<jsp:useBean id="dto" class="review.data.RevwDto"/>
<jsp:setProperty property="*" name="dto"/>

<%
int revwNum=dto.getRevwNum();
dao.insertReview(dto);
response.sendRedirect("../../cscenter/review.jsp?revwNum="+revwNum);
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>