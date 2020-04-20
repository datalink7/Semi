<%@page import="java.util.Vector"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="resv.data.MyResvDto"%>
<%@page import="java.util.List"%>
<%@page import="resv.data.MyResvDao"%>
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
	String userId="";
	if(request.getParameter("userId")==null){
		userId="%";
	}else{
		userId=request.getParameter("userId");
	}
	
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	Date time = new Date();
	String today = sdf.format(time);
	SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//하루당 초과금액 설정
	int overCharge=500;
	
	//페이징
	int perPage=5;//한페이지당 보여질 방명록 수
	int perBlock=5;//한블럭당 보여질 페이지
	
	int totalCount;//총 글의 갯수
	int currentPage;//현재 페이지
	int totalPage;//총 페이지
	int startPage;//시작 페이지
	int endPage;//끝 페이지
	int start;//시작 글번호
	int end;//끝 글번호
	List<MyResvDto> list=null;
	MyResvDao mDao=new MyResvDao();

	//현재 페이지 읽기(pageNum)
	String pageNum=request.getParameter("pageNum");
	//널일 경우 1페이지
	if(pageNum==null)
		currentPage=1;
	else
		currentPage=Integer.parseInt(pageNum);
	
	//시작페이지 구하기
	//총 갯수
	if(request.getParameter("resvType")==null||request.getParameter("resvType")==""){
		totalCount=mDao.getTotalCount();
	}else{
		String resvType=request.getParameter("resvType");
		System.out.println(resvType);
		if(resvType.equals("1")){
			resvType="보관함 예약";
		}else if(resvType.equals("2")){
			resvType="반값 택배 예약";
		}else if(resvType.equals("3")){
			resvType="일반 택배 예약";
		}
		totalCount=mDao.getTotalCount(resvType);
	}
	//총 페이지 갯수
	totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
	//마지막 페이지에 남은 글 한개를 삭제시 전페이지로 이동
	if(currentPage>totalPage)
		currentPage=totalPage;
	startPage=(currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
	
	//endPage는 totalPage보다 크면 안됨
	if(endPage>totalPage){
		endPage=totalPage;
	}
	
	//각 페이지당 보여질 시작번호(1페이지는 1,2페이지는 4)
	start=(currentPage-1)*perPage+1;
	end=start+perPage-1;
	//마지막 페이지는 남은 데이타 갯수만큼만
	if(end>totalCount)
		end=totalCount;
	//필요한 갯수만큼만 데이타 가져오기
	if(request.getParameter("resvType")==null||request.getParameter("resvType")==""){
		System.out.println(request.getParameter("resvType"));

		list=mDao.getAllDatas(userId, start, end);
	}else{
		String resvType=request.getParameter("resvType");
		if(resvType.equals("1")){
			resvType="보관함 예약";
		}else if(resvType.equals("2")){
			resvType="반값 택배 예약";
		}else if(resvType.equals("3")){
			resvType="일반 택배 예약";
		}
		System.out.println(resvType);
		list=mDao.getAllDatas(userId, resvType,start, end);
	}
	String resvType=request.getParameter("resvType");

%>
<script type="text/javascript">
$(function() {
	$("td.link").click(function() {
		resvNum=$(this).parent().attr("resvnum");
// 		console.log(resvNum);
		location.href=("../../myResv/detailMyResv.jsp?resvNum="+resvNum);
	});
});

</script>
<body>
<table class="table table-striped">
<caption><%=userId=="%"?"전체" :userId %> 주문내역</caption>
<tr>
	<td>예약번호</td>
	<td>예약자</td>
	<td>예약분류</td>
	<td>물건종류</td>
	<td>예약신청일</td>
	<td>초과금액</td><!-- 하루당 500원 설정 위에 overcharge -->
	<td>취소/완료</td>
</tr>
<%
if(list.size()==0){
	%><tr><td colspan="12" align="center">주문내역 없음</td></tr><%
}else{
	for(int i=0;i<list.size();i++){
// 		if(list.get(i).getResvType().equals("반값 택배 예약")&&list.get(i).getResvSendAddr()!=null){
// 			if(list.get(i).getResvSendAddr().equals(list.get(i+1).getResvSendAddr())&&list.get(i).getResvGetAddr().equals(list.get(i+1).getResvGetAddr())){
// 				continue;
// 			}
// 		}
	%>
		<tr resvnum=<%=list.get(i).getResvNum() %>  style="height:40px;">
			<td class="link"><%=list.get(i).getResvNum() %></td>
			<td class="link"><%=list.get(i).getUserId() %></td>
			<td class="link"><%=list.get(i).getResvType() %></td>
			<td class="link"><%=list.get(i).getObjType() %></td>
			<td class="link"><%=sdf1.format(list.get(i).getResvDate()) %></td>
			<td class="link">
				<%if(list.get(i).getResvEdDate()!=null){%>
				<%=(sdf.format(time)).compareTo(sdf.format(list.get(i).getResvEdDate()))>0?(sdf.format(time)).compareTo(sdf.format(list.get(i).getResvEdDate()))*overCharge+"원": "초과안됨" %><%} %></td>
			<td>
				<%if((sdf.format(time)).compareTo(sdf.format(list.get(i).getResvEdDate()))<=0){ %>
					<%if(list.get(i).getResvCancelYn().equals("1")){ %>예약취소됨/<%}else{ %>
						<button class="btnCancelResv btn btn-warning btn-sm" onclick="location.href='resvCancelAction.jsp?resvType=<%=resvType%>&userId=<%=userId%>&resvNum=<%=list.get(i).getResvNum()%>&cancel=1'">취소</button>
					<%} %>
					<%if(list.get(i).getResvEndYn().equals("1")){ %>완료<%}else{ %>
						<button class="btnEndResv btn btn-success btn-sm" onclick="location.href='resvCancelAction.jsp?resvType=<%=resvType%>&userId=<%=userId%>&resvNum=<%=list.get(i).getResvNum()%>&cancel=0'">종료</button>
				<%}}else{ %>
					초과금액 결제 필요
				
				<%} %>
			</td>
		</tr>

<%}} %>
</table>
<div style="width: 100%; text-align:center;">
<ul class="pagination">
	<%
	if(startPage!=1){
		%>
			<li>
				<a href="?userId=<%=userId %>&resvType=<%=resvType %>&pageNum=<%=startPage-1%>">이전</a>
			</li>
		<%
	}
	for(int i=startPage;i<=endPage;i++){
		//현재 페이지와 아닌경우 스타일 다르게 한다
		if(i==currentPage){%>
			<li class="active">
				<a href="?userId=<%=userId %>&resvType=<%=resvType %>&pageNum=<%=i%>"><%=i %></a>
			</li>
		<%}else{ %>
			<li>
				<a href="?userId=<%=userId %>&resvType=<%=resvType %>&pageNum=<%=i%>"><%=i %></a>
			</li>
		<%}
	}
		if(endPage!=totalPage){
		%>
			<li>
				<a href="?userId=<%=userId %>&resvType=<%=resvType %>&pageNum=<%=endPage+1%>">다음</a>
			</li>
		<%
	}
		%>
</ul>
</div>
<div style="width: 100%; text-align:center;">
	<form><input type="hidden" name="resvType" value="<%=resvType%>"><input type="text" name="userId" placeholder="id입력"><button type="submit">검색</button></form><!-- 정확한 id만 검색 -->
</div>
</body>
</html>