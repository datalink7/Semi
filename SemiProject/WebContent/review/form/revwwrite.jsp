<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	list();
	$("#selectdata").hide();
	$("#btnadd").click(function(){
	
	var revwTitle=$("#revwTitle").val();
	var revwCont=$("#revwCont").val();
	var revwPwd=$("#revwPwd").val();
	
	
	});
});

</script>
<style>
.star-input>.input, .star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	display: inline-block;
	vertical-align: middle;
	background: url('img/grade_img.png') no-repeat;
}

.star-input {
	display: inline-block;
	white-space: nowrap;
	width: 225px;
	height: 40px;
	padding: 25px;
	line-height: 30px;
}

.star-input>.input {
	display: inline-block;
	width: 150px;
	background-size: 150px;
	height: 28px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.star-input>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

star-input>.input.focus {
	outline: 1px dotted #ddd;
}

.star-input>.input>label {
	width: 30px;
	height: 0;
	padding: 28px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	background-size: 150px;
	background-position: 0 bottom;
}

.star-input>.input>label:hover ~label{
	background-image: none;
}

.star-input>.input>label[for="p1"] {
	width: 30px;
	z-index: 5;
}

.star-input>.input>label[for="p2"] {
	width: 60px;
	z-index: 4;
}

.star-input>.input>label[for="p3"] {
	width: 90px;
	z-index: 3;
}

.star-input>.input>label[for="p4"] {
	width: 120px;
	z-index: 2;
}

.star-input>.input>label[for="p5"] {
	width: 150px;
	z-index: 1;
}

.star-input>output {
	display: inline-block;
	width: 60px;
	font-size: 18px;
	text-align: right;
	vertical-align: middle;
}
</style>

</head>
<body>
	<div class="row">
	
		<h2 class="text-center">후기</h2>
		<form action="../action/insertaction.jsp" method="post">
			<table>
				<tr>
					<select name="revwType">
						<option>택배후기</option>
						<option>퀵서비스후기</option>
						<option>보관함후기</option>
					</select>
				</tr>
				<br>
				<tr>
					<span class="star-input"> 
					<span class="input"> 
						<input type="radio" name="revwStar" value="1" id="p1"> 
						<label for="p1">1</label> 
						<input type="radio" name="revwStar" value="2" id="p2"> 
						<label for="p2">2</label> 
						<input type="radio" name="revwStar" value="3" id="p3"> 
						<label	for="p3">3</label> 
						<input type="radio" name="revwStar" value="4" id="p4"> 
						<label for="p4">4</label> 
						<input	type="radio" name="revwStar" value="5" id="p5"> 
						<label for="p5">5</label>
					</span> <output for="star-input">
							<b>0</b>점
						</output>
					</span>
					<script src="js/jquery-1.11.3.min.js"></script>
					<script src="js/star.js"></script>
				</tr>
				<tr>
					<td>후기</td>
					<td colspan="3"><textarea name="revwCont"
						required="required"></textarea></td>
				</tr>
				<tr>
					<td colspan="4">
					<button type="submit" name="save" >저장</button>
					</td>
					<td colspan="4">
					<button type="button" name="cancel"	onclick="location.href='revwlist.jsp'">취소</button>
					</td>
				</tr>	
			</table>
		</form>
	</div>
	
	

	
					
</body>
</html>