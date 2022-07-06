<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="my_page.css" rel="stylesheet" type="text/css">

</head>
<body>
<div class="main_box">

	<!-- 왼쪽 여백에 등급 표시(회원의 등급 가져와서 보여줄것) -->
	<div class="left_side_box">
		<br><br><br>
		<img src="../homepage/images/grade_gold.JPG" width="70px" height="70px">&nbsp;&nbsp;<br>
		<span>등급&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	</div>
	
	<!-- 오른쪽 공백(아무것도 넣지 않음) -->
	<div class="right_side_box">
	</div>
	
	<!-- 누구님, 자기소개 -->
	<div class="top_left_box">
	<h2>MY PAGE</h2>
	<h2>주원님</h2><!-- 누구인지 가져올것 -->
	<span>나랏말싸미 듕국에 달아 서로 사맣디 아니할세<br>어린백성들을 굽어 살피시는 세종이오</span>
	</div>
	
	<!-- 프로필사진,개인정보수정,우편함 -->
	<div class="top_right_box">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="../homepage/images/member_profile.png" width="120px" height="120px"><br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="">개인정보수정</a>
	<img src="../homepage/images/unread_message.png" width="30px" height="30px">
	</div>
	
	<!-- 내가쓴글,내가쓴댓글,좋아요글,좋아요댓글 -->
	<div class="middle_box">
	<br><br><br><br>
	<span>내가 쓴 글</span>&nbsp;&nbsp;
	<span>내가 쓴 댓글</span>&nbsp;&nbsp;
	<span>내가 좋아요한 글</span>&nbsp;&nbsp;
	<span>내가 좋아요한 댓글</span>
	</div>
	
	<!-- 실제 아래에 목록 보여주기 -->
	<div class="bottom_box">
	<span>게시판 테이블 넣어야 할 곳</span>
	</div>
	
	

</div>
</body>
</html>