<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="box.data.BoxDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>택배 예약</title>
</head>
<style>
/* 	.sendMap{ */
/* 		width:600px; */
/* 		height:400px; */
/* 		position: absolute; */
/* 		left: 50%; */
/* 		margin-left: -300px;  */
/* 	} */
</style>
<!-- 예약
시작날짜 종료날짜 input type=date
물건 타입-select
물건 수량
비밀번호 설정
 -->
<%
	String resvType=request.getParameter("resvType");
	String mapNum=request.getParameter("mapNum");
	String boxCode=request.getParameter("boxCode");
	String resvStDate=request.getParameter("resvStDate");
	String resvEdDate=request.getParameter("resvEdDate");
	String userId;
	if((String)session.getAttribute("userId")==null)
		userId="admin";
	else
		userId=(String)session.getAttribute("userId");
	
%>
<script>
$(function() {
	
	//날짜 입력 관련
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + (date.getMonth()+1);
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	var today=yyyy+"-"+mm+"-"+dd;
	var resvStDate;
	
// 	$("#resvStDate").val(yyyy+"-"+mm+"-"+dd);
// 	$("#resvEdDate").val(yyyy+"-"+mm+"-"+dd);
	$("input[type='date']").val(yyyy+"-"+mm+"-"+dd);
	$("#resvStDate").on("change keyup paste", function(){
		var currentVal=$(this).val();
		if(currentVal<today){
			alert("오늘부터 입력가능");
			$(this).val(today);
		}
		$("#resvEdDate").val(currentVal);
		resvStDate=$("#resvStDate").val();
		var tDate = new Date($("#resvStDate").val());
		tDate.setDate(tDate.getDate()+1);
		year = tDate.getFullYear();
		month = tDate.getMonth()+1 > 9 ? tDate.getMonth()+1 : '0' + (tDate.getMonth()+1)
		day = tDate.getDate() > 9 ? tDate.getDate() : '0' + tDate.getDate();
		console.log(month);
		console.log(day);

	});
	$("#resvEdDate").on("change keyup paste", function(){
		var currentVal=$(this).val();
		if(currentVal<$("#resvStDate").val()){
			alert("시작일보다 이전 입력 불가");
			$(this).val($("#resvStDate").val());

		}
	});
	if(<%=resvType%>==1){
		$(".resvType").text("보관함 예약")
		$("#resvType").val("보관함 예약");
	}else if(<%=resvType%>==2){
		$(".resvType").text("반값 택배 예약")
		$("#resvType").val("반값 택배 예약");
	}else if(<%=resvType%>==3){
		$(".resvType").text("일반 택배 예약")
		$("#resvType").val("일반 택배 예약");
	}
	
	

	
<%-- 	$("option[resvType="+<%=resvType%>+"]").attr("selected","selected"); --%>
	$(".btnSendAddr").click(function() {
<%-- 		window.open('../map/searchMap2.jsp?send=1&resvType=<%=resvType%>&resvStDate='+$("#resvEdDate").val()+'&resvEdDate='+$("#resvEdDate").val(),"","width=600px,height=600px,left=600px,top=100px"); --%>
		$("div.sendMap").html("<embed src='../map/searchMap.jsp?send=1&resvType=<%=resvType%>&resvStDate="+$('#resvStDate').val()+"&resvEdDate="+$('#resvEdDate').val()+"'width='600px' height='400px' style='overflow:hidden !important;'/>");
	});
	$(".btnGetAddr").click(function() {
		//day+1 추가
		var tDate = new Date($("#resvStDate").val());
		tDate.setDate(tDate.getDate()+1);
		year = tDate.getFullYear();
		month = tDate.getMonth()+1 > 9 ? tDate.getMonth()+1 : '0' + (tDate.getMonth()+1)
		day = tDate.getDate() > 9 ? tDate.getDate() : '0' + tDate.getDate();
			
		//day+3 추가	
		var tDate1 = new Date($("#resvStDate").val());
		tDate1.setDate(tDate1.getDate()+3);
		year1 = tDate1.getFullYear();
		month1 = tDate1.getMonth()+1 > 9 ? tDate1.getMonth()+1 : '0' + (tDate1.getMonth()+1)
		day1 = tDate1.getDate() > 9 ? tDate1.getDate() : '0' + tDate1.getDate();
<%-- 		window.open("../map/searchMap2.jsp?send=0&resvType=<%=resvType%>&resvStDate="+year+"-"+month+"-"+(day+1)+"&resvEdDate="+year+"-"+month+"-"+(day+3),"","width=500px,height=500px,left=600px,top=100px"); --%>
		$("div.sendMap").html("<embed src='../map/searchMap.jsp?send=0&resvType=<%=resvType%>&resvStDate="+year+"-"+month+"-"+day+"&resvEdDate="+year1+"-"+month1+"-"+day1+"'width='600px' height='400px'/>");
	});
	$(".btnGetAddr1").click(function() {
<%-- 		location.replace("resvMain2.jsp?send=0&resvType=<%=resvType%>&resvStDate="+year+"-"+month+"-"+(day+1)+"&resvEdDate="+year+"-"+month+"-"+(day+3)); --%>
	});
});
function post1() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            var zonecode=data.zonecode;
        	var roadAddr = data.jibunAddress;
        	var str="("+zonecode+")"+roadAddr;
        	console.log(str);
            $(".resvSendAddr").val(str);
        }
    }).open();
}
function post2() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            var zonecode=data.zonecode;
        	var roadAddr = data.jibunAddress;
        	var str="("+zonecode+")"+roadAddr;
            $(".resvGetAddr").val(str);
        }
    }).open();
}

</script>


<body>
<form action="reservationAction.jsp" method="post">
	<input type="hidden" name="mapNum" value=<%=mapNum %>>
	<input type="hidden" name="userId" value=<%=userId %>>
	<input type="hidden" id="getStDate" name="getStDate" >
	<input type="hidden" id="getEdDate" name="getEdDate">
	<input type="hidden" id="boxCode" name="boxCode" value=<%=boxCode %>>
	<input type="hidden" id="getBoxCode" name="getBoxCode" value=<%=boxCode %>>
	<input type="hidden" name="resvType" id="resvType" value=<%=resvType %>>
	<table class="table" style="width:600px;">
		<tr>
			<td>
				<div class="input-group">
    				<span class="input-group-addon">시작일자</span>
					<input type="date" class="form-control" id="resvStDate" name="resvStDate" style="width:150px">
  				</div>
			</td>
			<td>
				<div class="input-group">
    				<span class="input-group-addon">종료일자</span>
					<input type="date" class="form-control" id="resvEdDate" name="resvEdDate" style="width:150px">
  				</div>
			</td>
		</tr>
		<tr>
			<td>
				<select class="form-control" name="objType" style="width:200px">
					<option hidden disabled="disabled" selected="selected">물건 종류</option>
					<option>옷</option>
					<option>전자기기</option>
					<option>음식류</option>
					<option>서적류</option>
				</select>
			</td>
			<td>
				<div class="input-group">
    				<span class="input-group-addon">물건 수량</span>
    				<input type="number" class="form-control" name="objCnt" value=1 style="width: 80px" min="1">
  				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group">
    				<span class="input-group-addon">비밀번호 설정</span>
					<input type="password" class="form-control" name="boxPwd" style="width: 100px" maxlength="4" placeholder="4자리" required="required">
  				</div>
			<td>
				<div class="input-group">
    				<span class="input-group-addon">사이즈 입력</span>
					<input type="text" class="form-control" id="objSize" name="objSize" placeholder="(가로)*(세로)*(높이)로 입력">
  				</div>
  			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="input-group">
    				<span class="input-group-addon">보낼 보관함</span>
					<input type="text" class="form-control" id="resvSendAddr" class="resvSendAddr" name="resvSendAddr" value='' style="width: 350px">
					<button type="button" class="btnSendAddr btn btn-warning">검색</button>
  				</div>
			</td>
		<tr>
			<td colspan="2">
				<div class="input-group">
    				<span class="input-group-addon">받을 보관함</span>
					<input type="text" class="form-control" id="resvGetAddr" class="resvGetAddr" name="resvGetAddr" value='' style="width: 350px">
					<button type="button" class="btnGetAddr btn btn-warning">검색</button>
  				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-info">예약하기</button>
			</td>
		</tr>
	</table>
</form>
<%-- <%if(resvStDate!=null){%> --%>
<div class="sendMap">
<%-- 	<jsp:include page="../map/searchMap.jsp"> --%>
<%-- 		<jsp:param value="<%=resvType %>" name="resvType"/> --%>
<%-- 		<jsp:param value="<%=resvStDate %>" name="resvStDate" /> --%>
<%-- 		<jsp:param value="<%=resvEdDate %>" name="resvEdDate" /> --%>
<%-- 	</jsp:include> --%>
</div>
<%-- <%} %> --%>
</body>
</html>