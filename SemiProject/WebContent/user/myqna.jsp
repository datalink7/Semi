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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>Insert title here</title>
</head>


<%
response.setCharacterEncoding("utf-8");
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
// NotiDto nDto=nDao.getDatas(userId);
System.out.println(userId+"myqna.jsp");
	NotiDao dao=new NotiDao();
	List<NotiDto> list=dao.getNotiList(userId);
	System.out.println(list.size()+"myqna list");
%>


	<!-- 페이징 처리!! -->

	<% 
	//db선언
	NotiDao db=new NotiDao();
	
	//변수
	int perPage=5;
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
	totalCount=db.getTotalCount(userId);
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
	list=db.getPageDatas(userId, start, end);
			
%>
<body>
	<div class="row" align="center"  style="width:1100px;">              
		<form action="*" method="post">
		<table class="table table-hover" id="notilist" style="width:900px;">
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
		if(list.size()==0){
			%>
			<tr>
				<td colspan="7" align="center">문의 내역 없음</td>
			
			
			</tr>
			<%
			
		}else{
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
		}
		%>
		</table>
		</form>
	</div>
	<br>
<!-- 	<button type="submit" name="write" onclick="location.href='"../index.jsp?main=notiwrite.jsp">작성하기</button> -->
	
	


<!-- 페이지 번호 출력 -->
	<div style="width: 100%;text-align: center;">
	<ul class="pagination">
		<%
		//이전
		if(startPage>1)
		{%>
			<li>
			<a href="myqna.jsp?pageNum=<%=startPage-1%>">이전</a>
			</li>
		<%}
		
		for(int i=startPage;i<=endPage;i++)
		{
			//현재 페이지와 아닌경우 스타일 다르게 해야한다
			if(i==currentPage)
			{%>
				<li class="active">
					<a href="myqna.jsp?pageNum=<%=i%>"><%=i%></a>
				</li>
			<%}else{%>
				<li>
					<a href="myqna.jsp?pageNum=<%=i%>"><%=i%></a>
				</li>
			<%}
		}
		
		//다음
		if(endPage<totalPage)
		{%>
			<li>
			<a href="myqna.jsp?pageNum=<%=endPage+1%>">다음</a>
			</li>
		<%}
		%>
	</ul>
	</div>
	
</body>
</html>



