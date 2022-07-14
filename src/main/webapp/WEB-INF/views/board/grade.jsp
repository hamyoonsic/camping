<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../homepage/nav.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

#title{

	padding-top:100px;
	margin-top:150px;
	padding-bottom: 70px;
	text-align: center;
	margin: auto;
	font-size: 80px;
	font-weight: lighter;
}

hr{
	width: 80%;
	
}


.grade_table{

	width: 80%;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	
	
}

.grade_table tr{
	
	height: 150px;
	
}

.img{

	text-align: right;

	margin-right: 0;
}

.grade_table th  {
	
/* 	border-top: 1px solid ;*/
	border-bottom: 1px solid #e4e4e4;
	font: bold;
	font-size: 14px;
	height: 33px;
	margin-right: 0;
	width: 28%;
	
}

.grade_table .notext{
	
	text-align:right;
	font-size: 23px;
	border-bottom: 1px solid #e4e4e4;
	padding-right: 50px;

}
.grade_table .text{
	
	text-align:left;
	font-size: 23px;
	border-bottom: 1px solid #e4e4e4;
	padding-left: 50px;
	

}

#notice{

	text-align: center;
	font-size: 30px;
	font-weight: lighter;
	margin-top: 80px;

}

</style>



</head>
<body>

<h2 id="title">MEMBERSHIP</h3>
<hr>

		<table class="grade_table">
			<tr>
				<th > </th>
				<td class="notext"><img class="img" src="images/grade_bronze.JPG"></td>
				<td class="text" >브론즈/가입
				</td>
			</tr>
			<tr>
				<th > </th>
				<td class="notext"><img class="img" src="images/grade_silver.JPG"></td>
				<td class="text">실버/댓글3개 게시글1개
				</td>
			</tr>
			<tr>
				<th > </th>
				<td class="notext"><img class="img" src="images/grade_gold.JPG"></td>
				<td class="text">골드/좋아요10개 댓글5개 게시글1개
				</td>
			</tr>
			<tr>
				<th > </th>
				<td class="notext"><img class="img" src="images/grade_platinum.JPG"></td>
				<td class="text">플래티넘/좋아요15개 댓글6개 게시글3개
				</td>
			</tr>
		
		</table>

			<h5 id="notice">2022.6.8부터 적용 회원등급은 마이페이지에서 확인 가능합니다.</h5>


</body>
</html>