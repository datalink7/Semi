<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>날짜 입력</title>
</head>
<script type="text/javascript">
$(function() {
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + (date.getMonth()+1);
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	var today=yyyy+"-"+mm+"-"+dd;
// 	$("#resvStDate").val(yyyy+"-"+mm+"-"+dd);
// 	$("#resvEdDate").val(yyyy+"-"+mm+"-"+dd);
	$("input[type='date']").val(yyyy+"-"+mm+"-"+dd);

	$("#resvStDate").on("change keyup paste", function(){
		var currentVal=$(this).val();
		if(currentVal<today){
			alert("오늘부터 입력가능");
			$("input[type='date']").val(yyyy+"-"+mm+"-"+dd);
		}else{
			$("#resvEdDate").val(currentVal);
		}
	});
	$("#resvEdDate").on("change keyup paste", function(){
		var currentVal=$(this).val();
		if(currentVal<$("#resvStDate").val()){
			alert("시작일보다 이전 입력 불가");
			$(this).val($("#resvStDate").val());
		}
	});
});
</script>
<%
	String resvType=request.getParameter("resvType");

	//오늘날짜 구하기
	SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd");
	Date time = new Date();
	String today = sdf.format(time);
	
	
	
	String resvStDate="";
	if(request.getParameter("resvStDate")==null){
		resvStDate=today;
	}else{
		resvStDate=request.getParameter("resvStDate");
	}
	String resvEdDate="";
	if(request.getParameter("resvEdDate")==null){
		resvEdDate=today;
	}else{
		resvEdDate=request.getParameter("resvEdDate");
	}

%>
<body>
<%if(resvType.equals("1")){%>
<form action="../map/searchMap.jsp" method="get">
<%}else if(resvType.equals("2")){%>
<form action="../resv/resvForm2.jsp" method="get">
<%}else if(resvType.equals("3")){%>
<form action="../resv/resvForm2.jsp" method="get">
<%} %>
	<table>
	<input type="hidden" name="resvType" value=<%=resvType %>>
		<tr>
			<td>시작일자:<input type="date" id="resvStDate" name="resvStDate" style="width:150px" value="<%=resvStDate%>"></td>
			<td>종료일자:<input type="date" id="resvEdDate" name="resvEdDate" style="width:150px" value="<%=resvEdDate%>"></td>
			<td><button type="submit" class="btn btn-info sd">날짜 입력</button></td>
		</tr>
	</table>
</form>
</body>
</html>