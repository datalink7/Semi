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
	String userId;
	if((String)session.getAttribute("userId")==null)
		userId="admin";
	else
		userId=(String)session.getAttribute("userId");
%>
<script>
$(function() {
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + (date.getMonth()+1);
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	var today=yyyy+"-"+mm+"-"+dd;
// 	$("#resvStDate").val(yyyy+"-"+mm+"-"+dd);
// 	$("#resvEdDate").val(yyyy+"-"+mm+"-"+dd);
	$("input[type='date']").val(yyyy+"-"+mm+"-"+dd);
	$("option[resvType="+<%=resvType%>+"]").attr("selected","selected");
	
	$("#resvStDate").on("change keyup paste", function(){
		var currentVal=$(this).val();
		if(currentVal<today){
			alert("오늘부터 입력가능");
			$(this).val(today);
		}
		$("#resvEdDate").val(currentVal);
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
<form action="reservationAction.jsp" method="post" class="form-inline">
<%-- 	<input type="text" name="mapNum" value=<%=mapNum %>> --%>
	<input type="hidden" name="userId" value=<%=userId %>>
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
	
<!-- 			<td>시작일자:<input type="date" id="resvStDate" name="resvStDate" style="width:150px"></td> -->
<!-- 			<td>종료일자:<input type="date" id="resvEdDate" name="resvEdDate" style="width:150px"></td> -->
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
			
<!-- 			<td> -->
<!-- 				물건 수량:<input type="number" name="objCnt" value=1 style="width: 50px" min="1"> -->
<!-- 			</td> -->
		</tr>
		<tr>
<!-- 			<td>비밀번호 설정: <input type="password" name="boxPwd"></td> -->
			<td colspan="2">
				<div class="input-group">
    				<span class="input-group-addon">사이즈 입력</span>
					<input type="text" class="form-control" id="objSize" name="objSize" placeholder="(가로)*(세로)*(높이)로 입력">
  				</div>
  			</td>
		</tr>
		<tr>
			<td colspan="2" >
				<div class="input-group">
    				<span class="input-group-addon">보낼 사람 주소</span>
					<input type="text" style="width: 350px" class="resvSendAddr form-control" name="resvSendAddr">
					<button type="button" onclick="post1()" class="btn btn-warning">주소 찾기</button>
  				</div>
  			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="input-group">
    				<span class="input-group-addon">받을 사람 주소</span>
					<input type="text" style="width: 350px" class="resvGetAddr form-control" name="resvGetAddr">
					<button type="button" onclick="post2()" class="btn btn-warning">주소 찾기</button>
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
</body>
</html>