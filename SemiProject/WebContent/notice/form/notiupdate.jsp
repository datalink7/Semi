
<%@page import="noti.data.NotiDto"%>
<%@page import="noti.data.NotiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String notiNum=request.getParameter("notiNum");
	
	NotiDao dao = new NotiDao();
	
	NotiDto dto = dao.getData(notiNum);
	
	
%>
</head>
<body>
<form action="../action/updateaction.jsp" method="post">
	<table>
	<caption>QnA수정</caption>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="UserId" readonly="readonly" value="<%=dto.getUserId() %>"></td> 
		<th>글번호</th>
		<td><input type="text" name="NotiNum" readonly="readonly" value="<%=dto.getNotiNum()%>"></td> 
	</tr>
	<tr>
		<td>제목</td>
			<td colspan="3"><input type="text" name="notiTitle" required="required" value="<%=dto.getNotiTitle()%>">
			</td>
		<tr>
			<td>타입</td>
			<td>
			<select name="notiType">
				<option value="퀵문의">퀵서비스문의</option>
				<option value="택배문의">택배문의</option>
				<option value="보관함문의">보관함문의</option>
				<option value="기타서비스문의">기타서비스문의</option>
			</select>
		</td>
		</tr>
		<tr>
			<td>글내용</td>
			<td colspan="3"><textarea name="notiCont" class="notiCont" required="required"><%=dto.getNotiCont() %></textarea></td>
		</tr>
		<tr>
			<td colspan="4">
			<button type="submit" name="update">수정하기</button>	
			</td>
			<td colspan="4">
			<button type="button" name="cancel" onclick="location.href='notilist.jsp'">취소</button>
		</td>
		</tr>
	</table>
</form>
</body>
</html>

