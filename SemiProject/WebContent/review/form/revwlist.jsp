<%@page import="review.data.RevwDto"%>
<%@page import="review.data.RevwDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String revwNum=request.getParameter("revwNum");
	RevwDao dao=new RevwDao();
	RevwDto dto=new RevwDto();
	dao.ReviewCount(revwNum);
	dto=dao.getData(revwNum);
	
	
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}

</style>
</head>

<%
 	
	List<RevwDto> list=dao.getReviewList(); 


%>


<!-- 페이징처리 -->
<%
	//db선언
	RevwDao db=new RevwDao();

	//변수 
	int perPage=6;
	int perBlock=5;
	int totalCount;
	int currentPage;
	int totalPage;
	int startPage;
	int endPage;
	int start;
	int end;
	List<RevwDto> list2=null;
	
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
		list2=db.getPageDatas(start, end);

%>
<body>
 	<div class="table">
 	<form action="*" method="post">
 	<table id="revwlist" > 
 	<caption>후기</caption>
 	<%
 	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 	
 	for(int i=0; i<list.size(); i++)
 	{
 		RevwDto dt=list.get(i);
 	%>
 	<tr>
 		<td align="center"><%=dt.getRevwNum()%></td>
 		<td><%=dt.getRevwType()%></td>
 	</tr>
 	<tr>
 		<td>
   <script type="text/javascript">
      $(function() {
          $('span.starR[value=<%=dt.getRevwStar()%>][name=<%=dt.getRevwNum()%>]').addClass("on").prevAll('span').addClass('on');
      });
   </script>
   <div class="starRev">
     <span class="starR on" value="1" name=<%=dt.getRevwNum()%>>별1</span>
     <span class="starR" value="2" name=<%=dt.getRevwNum()%>>별2</span>
     <span class="starR" value="3" name=<%=dt.getRevwNum()%>>별3</span>
     <span class="starR" value="4" name=<%=dt.getRevwNum()%>>별4</span>
     <span class="starR" value="5" name=<%=dt.getRevwNum()%>>별5</span>
   </div>
   	</td>
 		<td><%=dt.getRevwStar() %></td>
 		
 	</tr>	
 	<tr>
 		<td><%=dt.getRevwCont() %></td>
 	</tr>
 	<tr>	
 		<td><%=dt.getUserId() %></td>
 		<td><%=sdf.format(dt.getRevwDate())%></td>
	</tr>
	<tr>
	 <td><button type="button" id="btndelete" 
		onclick="location.href='../action/deleteaction.jsp?revwNum=<%=dt.getRevwNum()%>'">삭제</button></td>
	<td><button type="button" id="btnupdate"
		onclick="location.href='../form/revwupdate.jsp?revwNum=<%=dt.getRevwNum()%>'">수정</button></td>
	</tr>
	<% 
	}
 	%>
 	</table>
 	</form>
 	</div>
 	<br>
 	<button type="submit" name="write" onclick="location.href='revwwrite.jsp'">후기작성</button>
	
 	
 	<!-- 페이지 번호 출력 -->
 	<div style="width: 600px;text-align: center;">
	<ul class="pagination">
		<%
		//이전
		if(startPage>1)
		{%>
			<li>
			<a href="revwlist.jsp?pageNum=<%=startPage-1%>">이전</a>
			</li>
		<%}
		
		for(int i=startPage;i<=endPage;i++)
		{
			//현재 페이지와 아닌경우 스타일 다르게 해야한다
			if(i==currentPage)
			{%>
				<li class="active">
					<a href="revwlist.jsp?pageNum=<%=i%>"><%=i%></a>
				</li>
			<%}else{%>
				<li>
					<a href="revwlist.jsp?pageNum=<%=i%>"><%=i%></a>
				</li>
			<%}
		}
		
		//다음
		if(endPage<totalPage)
		{%>
			<li>
			<a href="revwlist.jsp?pageNum=<%=endPage+1%>">다음</a>
			</li>
		<%}
		%>
</body>
</html>