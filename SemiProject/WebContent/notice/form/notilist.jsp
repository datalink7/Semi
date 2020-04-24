
<%@page import="noti.data.NotiDto"%>
<%@page import="noti.data.NotiDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<%
	NotiDao dao=new NotiDao();
	List<NotiDto> lista=dao.getaNotiList();
	List<NotiDto> list=dao.getNotiList();
%>


	<!-- 페이징 처리!! -->

	<% 
	//db선언
	NotiDao db=new NotiDao();
	
	//변수
	int perPage=7;
	int perBlock=5;
	int totalCount;
	int currentPage;
	int totalPage;
	int startPage;
	int endPage;
	int start;
	int end;
	List<NotiDto> list2=null;
	
	String pageNum=request.getParameter("pageNum");
	if(pageNum==null)
		currentPage=1;
	else
	currentPage=Integer.parseInt(pageNum);
	totalCount=db.getTotalCount();
	totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
	if(currentPage>totalPage)
		currentPage=totalPage;
	
	startPage=(currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
	
	if(endPage>totalPage)
		endPage=totalPage;
	start=(currentPage-1)*perPage+1;
	end=start+perPage-1;
	if(end>totalCount)
		end=totalCount;
	list=db.getPageDatas(start, end);
%>
<body>
	<div class="row">              
		<form action="*" method="post">
		<table id="notilist" width="800" border="3">
		<caption>문의 사항</caption>
		<tr>
			<th>글번호</th>
			<th>분류</th>
			<th>제목</th>
			<th>이름</th>
			<th>작성일</th>
			<th>작성시간</th>
			<th>조회수</th>
		</tr>
		<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//날짜
		SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm:ss");//
		

		for(int j=0; j<lista.size(); j++)
		{
			NotiDto dto=lista.get(j);
			%>
			<tr>
				<td align="center"><%=dto.getNotiNum()%></td>
				<td><%=dto.getNotiType()%></td>
				<td><a href="view.jsp?notiNum=<%=dto.getNotiNum()%>"><%=dto.getNotiTitle() %></a></td>
				<td><%=dto.getUserId()%></td>
				<td><%=sdf.format(dto.getNotiDate())%></td>
				<td><%=sdf2.format(dto.getNotiTime())%></td>
				<td><%=dto.getNotiCnt() %></td>
			</tr>
			<%
			}
			
			
		for(int i=0; i<list.size(); i++)
		{
			NotiDto dto=list.get(i);
			
		%>
		<tr>
			<td align="center"><%=dto.getNotiNum()%></td>
			<td><%=dto.getNotiType()%></td>
			<td><a href="view.jsp?notiNum=<%=dto.getNotiNum()%>"><%=dto.getNotiTitle() %></a></td>
			<td><%=dto.getUserId()%></td>
			<td><%=sdf.format(dto.getNotiDate())%></td>
			<td><%=sdf2.format(dto.getNotiTime())%></td>
			<td><%=dto.getNotiCnt() %></td>
		</tr>
		<%
		}
		%>
		</table>
		</form>
	</div>
	<br>
	<button type="submit" name="write" onclick="location.href='"../index.jsp?main=notiwrite.jsp">작성하기</button>
	
	


<!-- 페이지 번호 출력 -->
	<div style="width: 600px;text-align: center;">
	<ul class="pagination">
		<%
		//이전
		if(startPage>1)
		{%>
			<li>
			<a href="notilist.jsp?pageNum=<%=startPage-1%>">이전</a>
			</li>
		<%}
		
		for(int i=startPage;i<=endPage;i++)
		{
			//현재 페이지와 아닌경우 스타일 다르게 해야한다
			if(i==currentPage)
			{%>
				<li class="active">
					<a href="notilist.jsp?pageNum=<%=i%>"><%=i%></a>
				</li>
			<%}else{%>
				<li>
					<a href="notilist.jsp?pageNum=<%=i%>"><%=i%></a>
				</li>
			<%}
		}
		
		//다음
		if(endPage<totalPage)
		{%>
			<li>
			<a href="notilist.jsp?pageNum=<%=endPage+1%>">다음</a>
			</li>
		<%}
		%>
	</ul>
	</div>
	
	
	
</body>
</html>