<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>예약 선택</title>
</head>
<style>
/* 	div{ */
/* 		border: 1px solid grey; */
/* 		text-align:center; */
/* 		border: none; */
/* 	} */
/* 	div.main{ */
/* 		height:200px; */
/* 		width:900px; */
/* 		position:absolute; */
/* 		margin-left:-450px; */
/* 		left:50%; */
/* 	} */
 	div.main{ 
 		height:500px; 
 		width:900px; 
 		position:absolute; 
 		margin-left:-450px; 
 		left:50%; 
	} 

/* 	.sel{ */
/* 		background-color: #BDBDBD; */
/* 	} */
/* 	div.main .sel:hover{ */
/* 		background-color: grey; */
/* 	} */
/* 	div.sel1{ */
/* 		position: absolute;  */
/* 		left: 0px; */
/* 		top:50px; */
/* 		width:300px; */
/* 		height:50px; */
/* 		padding-top:15px; */
/* 	} */
/* 	div.sel2{ */
/* 		position: absolute;  */
/* 		left: 300px; */
/* 		top:50px; */
/* 		width:300px; */
/* 		height:50px; */
/* 		padding-top:15px; */
/* 	} */
/* 	div.sel3{ */
/* 		background-color:#E5D85C; */
/* 		padding-top:40px; */
/* 		position: absolute;  */
/* 		left: 600px; */
/* 		top:50px; */
/* 		width:300px; */
/* 		height:50px; */
/* 		padding-top:15px; */
		
/* 	} */
/* 	.content{ */
/* 		font-weight: bold; */
/* 		font-size: 10pt; */
/* 		position: absolute;  */
/* 		height: 10%; */
/* 		margin: auto; */
/* 		top: 0; */
/* 		bottom: 0; */
/* 		left: 0; */
/* 		right: 0; */
/* 		border:none; */
/* 	} */
	.searchDate{
		position: absolute;
		left: 50%;
		width: 500px;
		height:100px;
		margin-top: 30px;
		margin-left: -300px;
	}
</style>
<body>
<div class="main">
<!-- 	<a href="resvMain.jsp"><div class="sel sel1"><div class="content">단순예약</div></div></a> -->
<!-- 	<a href="resvMain2.jsp"><div class="sel sel2"><div class="content">반값예약</div></div></a> -->
<!-- 	<a href="resvMain3.jsp"><div class="sel sel3"><div class="content">택배예약</div></div></a> -->
	<div class="searchDate">
		<jsp:include page="resvForm3.jsp">
			<jsp:param value="3" name="resvType"/>
		</jsp:include>
	</div>
</div>
</body>
</html>