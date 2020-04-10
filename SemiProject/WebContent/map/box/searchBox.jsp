<%@page import="box.data.BoxDto"%>
<%@page import="box.data.BoxDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
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
<style>
	.boxtable{
		position: absolute;
		width: 700px;
		left: 50px;
		top:50px;
	}
	
	.boxtable tr td{
		 text-align:center;
	}
	.boxdisplay{
		position:absolute;
		left:800px;
		top:50px;
		width:500px;
	}
	.boxdisplay tr td{
		border:1px solid black;
		width:50px;
		height:50px;
		margin-right: 5px;
	}
	.box[boxUseYn="0"]:hover{
		background-image: url('../image/selecteddoor.png');background-size: cover;
	}
	.info{
		position:absolute;
		border:1px solid grey;
		background-color: rgba(229,216,92,0.5);
		width: 100px;
		height: 100px;
		left:0px;
		top:0px;		

	}
	.closeinfo{
		position:absolute;
		left:90px;
		top:0px;
		cursor: pointer;
	}
	.resvBox{
		position:absolute;
		margin-left:1px;
		left:0px;
		top:80px;
	}
	
	.box{
		cursor: pointer;
	}
	.box[boxUseYn="0"]{
		background-image: url('../image/door.PNG');background-size: cover;
	}
	.box[boxUseYn="1"]{
		background-image: url('../image/useddoor.png');background-size: cover;
	}
	.boxTable tr th{
		text-align: center;
	}
	.wrapper{
		overflow: scroll;
		height:250px;
		overflow-x:hidden;
		margin-top: -8px;
		margin-left:-8px;
		margin-right: -8px;
	}
</style>
<script type="text/javascript">
$(function() {
// 	$(".box[boxUseYn=1]").css("color","black");
	$(".info").hide();
	$(".box").click(function() {
		$(".info").hide();
		$(".info[boxCode="+$(this).attr("boxCode")+"]").show();
		x = event.pageX;
		y = event.pageY; 
		$(".info").css("top",y-50).css("left",x-800);
    });
	$(".closeinfo").click(function() {
		$(".info").hide();
	});
});
</script>
<%
	String mapNum=request.getParameter("mapNum");
	String placeCode=request.getParameter("placeCode");
	String placeName=request.getParameter("placeName");
	BoxDao dao=new BoxDao();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	int cntBox=0;
	boolean all=false;
	List<BoxDto> list=dao.selectBox(placeCode,false);
%>
<body>
<div>
<table class="boxTable table table-striped" style="width:700px;" >
<caption><h3><%=placeName %></h3></caption>

<tr>
	<th width="50">보관함 번호</th><th width="50">지점명</th><th width="50">예약자명</th><th width="50">보관함 사이즈</th><th width="50">비고</th><td width="50"> </td>
</tr>
<%
	if(list.size()==0){
%>
	<tr>
		<td colspan="7">
			검색 결과 없음
		</td>
	</tr>
		
	<%
	}else{%>
		<tr><td colspan="6"><div class="wrapper"><table class="table table-striped">
	
	
	<%
// 		for(BoxDto dto:list){
		for(int i=0;i<list.size();i++){
		String boxCode=list.get(i).getBoxCode();
		placeCode=list.get(i).getPlaceCode();
		String boxSize=list.get(i).getBoxSize();
		String boxEtc=list.get(i).getBoxEtc();
		String boxUseYn=list.get(i).getBoxUseYn();
		String userId=list.get(i).getUserId();
		int boxIdx=Integer.parseInt(boxCode.substring(3));
	%>
		<tr align="center">
			<td>
				<%=boxIdx%></td><td><%=list.get(i).getPlaceName()%></td><td><%=userId%></td>
				<td><%=boxSize%></td><td><%=boxEtc%></td><td><BUTTON type="button" onclick="location.href='../../resv/reservationForm.jsp?mapNum=<%=mapNum%>&boxCode=<%=boxCode%>'">예약</BUTTON><br>
			</td>
		</tr>
		<%
		}%>
		</table></div></td></tr>
		<%
	}
%>
</table>
</div>
<div class="boxdisplay">
<table>
<%
	all=true;
	List<BoxDto> allList=dao.selectBox(placeCode,all);
	cntBox=allList.size();
	if(allList.size()!=0){
%>
		<caption style="text-align: right;"><span>보관함 총 <%=cntBox %>개 중<br> <%=list.size() %>개 사용가능</span></caption>
<%
	}
	for(int i=0;i<allList.size();i++){
		if((i+1)%4==1){%>
			<tr>
		<%}%>
			<div class="info" boxCode=<%=allList.get(i).getBoxCode()%>>
				<b><%=i+1 %>번 보관함<br>
				크기: <%=allList.get(i).getBoxSize() %><br>
				사용: <%=allList.get(i).getBoxUseYn().equals("1")?"사용불가":"사용가능"%></b>
<!-- 				<span class="resvBox" >예약</span> -->
				<span class="closeinfo">X</span>
			</div>
			<td align="center" class="box" boxCode=<%=allList.get(i).getBoxCode()%> boxUseYn=<%=allList.get(i).getBoxUseYn() %> style=""><%=i+1%></td>
		<%
		if((i+1)%4==0){
		%></tr><%
		}
	}
	%>
</table>
</div>
</body>
</html>