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
<title>보관함 선택</title>
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
		left:50px;
		top:20px;
		width:500px;
	}
	.boxdisplay tr td{
		border:1px solid black;
		width:50px;
		height:50px;
		margin-right: 5px;
	}
	.box:hover{
		background-image: url('../image/selecteddoor.png');background-size: cover;
	}
	.resvBox{
		position:absolute;
		margin-left:1px;
		left:0px;
		top:80px;
	}
	.select{
		background-image: url('../image/useddoor.png');background-size: cover;
	}
	.box{
		cursor: pointer;
		background-image: url('../image/door.PNG');background-size: cover;
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
	.inputDetail{
		position: absolute;
		left: 300px;
		top:50px; 
		
	}
	table.input{
		border: none;
	}
</style>
<%
	String send=request.getParameter("send");
	String resvType=request.getParameter("resvType");
	String mapNum=request.getParameter("mapNum");
	String placeCode=request.getParameter("placeCode");
	String placeName=request.getParameter("placeName");
	String resvStDate=request.getParameter("resvStDate");
	String resvEdDate=request.getParameter("resvEdDate");
	BoxDao dao=new BoxDao();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	int cntBox=0;
	boolean all=false;
	List<BoxDto> list=dao.selectBox(placeCode,false,resvStDate,resvEdDate);
%>
<%
	String userId;
	if((String)session.getAttribute("userId")==null)
		userId="admin";
	else
		userId=(String)session.getAttribute("userId");
%>

<script type="text/javascript">
$(function() {

	$(document).on("click",".box[usable='사용가능']",function(){
		boxcode=$(this).attr("boxCode");
		boxsize=$(this).attr("boxSize");
		console.log($(this).attr("usable"));
		console.log(boxcode);
		console.log(boxsize);
		
		$("input.boxCode").val(boxcode);
		$("input#objSize").val(boxsize);
		$("span.boxNum").text(parseInt(boxcode.substring(3))+"번 보관함");
		$(".btnAddr").attr("boxAddr","<%=dao.getBoxAddr(mapNum) %> "+parseInt(boxcode.substring(3)) +"번 보관함");
		$(".btnAddr").attr("sendBoxCode",boxcode);
		$(".btnAddr").attr("getBoxCode",boxcode);door
// 		$(".box").removeClass("select");
// 		$(this).addClass("select");
// 		console.log($(".btnAddr").attr("boxAddr"));
	});
	$(".btnSendAddr").click(function() {
		var sendAddr=$(this).attr("boxAddr");
		var sendBoxCode=$(this).attr("sendBoxCode");
		console.log(sendAddr);
		console.log(sendBoxCode);
		$(opener.parent.resvSendAddr).val(sendAddr);
		$(opener.parent.boxCode).val(sendBoxCode);
		window.close();
	});
	$(".btnGetAddr").click(function() {
		var getAddr=$(this).attr("boxAddr");
		var getBoxCode=$(this).attr("getBoxCode");
		$(opener.parent.resvGetAddr).val(getAddr);
		$(opener.parent.getBoxCode).val(getBoxCode);
		$(opener.parent.getStDate).val($(this).attr("getStDate"));
		$(opener.parent.getEdDate).val($(this).attr("getEdDate"));
		window.close();
	});
	<%
	List<BoxDto> list1=dao.ableResv(placeCode, resvStDate, resvEdDate);	
	for(BoxDto dto:list1){
		%>
		$(".box[boxCode='<%=dto.getBoxCode()%>']").css({"background-image":"url('../image/useddoor.png')"}); 	
		$(".box[boxCode='<%=dto.getBoxCode()%>']").attr("usable","사용불가");
		<%
	}
	%>
	$("#resvStDate").val("<%=resvStDate%>");
	$("#resvEdDate").val("<%=resvEdDate%>");
<%-- 	if(<%=resvType%>==1){ --%>
// 		$(".resvType").text("보관함 예약")
// 		$("#resvType").val("보관함 예약");
<%-- 	}else if(<%=resvType%>==2){ --%>
// 		$(".resvType").text("반값 택배 예약")
// 		$("#resvType").val("반값 택배 예약");
<%-- 	}else if(<%=resvType%>==3){ --%>
// 		$(".resvType").text("택배 예약")
// 		$("#resvType").val("택배 예약");
// 	}
	
});

</script>
<body>

<!-- 보관함 4*5 -->
<div class="boxdisplay">
	<table>
		<h3><%=placeName %></h3><span class="resvType"></span>
		<%
			all=true;
			List<BoxDto> allList=dao.selectBox(placeCode,all,resvStDate,resvEdDate);
			cntBox=allList.size();
			if(allList.size()!=0){
		%>
				<caption style="text-align: right;">보관함 총 <%=cntBox %>개 중<br> <%=list.size() %>개 사용가능</caption>
		<%
			}
			for(int i=0;i<allList.size();i++){
				if((i+1)%4==1){%>
					<tr>
				<%}%>
					<!-- 보관함 박스들 -->
					<td align="center" class="box" boxSize=<%=allList.get(i).getBoxSize() %>
					boxCode=<%=allList.get(i).getBoxCode()%> boxUseYn=<%=allList.get(i).getBoxUseYn() %> usable='사용가능'><%=i+1%></td>
				<%
				if((i+1)%4==0){
				%></tr><%
				}
			}
			%>
	</table>
</div>

<div class="inputDetail">
<form action="../../resv/reservationAction.jsp" method="post">
	<input type="hidden" name="mapNum" value=<%=mapNum %>>
	<input type="hidden" name="userId" value=<%=userId %>>
	<br><br>
	<table class="input" style="width:300px">
		<tr><td align="right"><h4><span class="boxNum"></span></h3></td></tr>
		<tr >
			<td><input type="hidden" class="boxCode" name="boxCode" value=''></td>
			<td>
				<input type="hidden" name="resvType" id="resvType" value=<%=resvType %>><span class="resvType"></span>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group">
	   				<span class="input-group-addon">시작일자</span>
					<input type="date" class="form-control" id="resvStDate" name="resvStDate" readonly="readonly">
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group">
	   				<span class="input-group-addon">종료일자</span>
					<input type="date" class="form-control" id="resvEdDate" name="resvEdDate" readonly="readonly">
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<select name="objType" class="form-control">
					<option hidden disabled="disabled" selected="selected">물건 종류</option>
					<option>옷</option>
					<option>전자기기</option>
					<option>음식류</option>
					<option>서적류</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group">
	   				<span class="input-group-addon">물건 수량</span>
					<input type="number" class="form-control" name="objCnt" value=1>
				</div>
			</td>

		</tr>
		
		<tr>
			<td>
				<div class="input-group">
	   				<span class="input-group-addon">사이즈 입력</span>
					<input type="text" class="form-control" id="objSize" name="objSize" placeholder="(가로)*(세로)*(높이) 입력">
				</div>
			</td>
		</tr>
		<tr>
			<%if(!resvType.equals("2")){ %>
			<td>
				<div class="input-group">
	   				<span class="input-group-addon">비밀번호 설정</span>
					<input type="password" class="form-control" name="boxPwd" maxlength="4" placeholder="4자리" required="required">
				</div>
			</td>
		</tr>
		<tr>
			<%} %>
			<td colspan="2" align="center">
			<%
				if(resvType.equals("1")){
				%>
					<button type="submit" class="btn btn-default">예약하기</button>
				<%}else{
					if(send.equals("1")){
				%>
						<BUTTON type="button" class="btnAddr btnSendAddr btn btn-default" boxAddr='' sendBoxCode=''>선택</BUTTON>
					<%}else{ %>
						<BUTTON type="button" class="btnAddr btnGetAddr btn btn-default" boxAddr='' getStDate=<%=request.getParameter("resvStDate") %> getEdDate=<%=request.getParameter("resvEdDate") %> getBoxCode=''>선택</BUTTON>
					<%} %>
				<%} %>
				<button type="button" class="btn btn-default" onclick="window.close()">취소</button>
			</td>
		</tr>
	</table>
</form>

</div>
</body>
</html>