<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<!--sweet alert  -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.wrap {
	font-family: 'Noto Sans KR', sans-serif;
	text-decoration: none;
	border-collapse: collapse;
	/* margin: 0px;  */
	padding: 0px;
	color: #000;
	margin-right: 80px;
	cursor: pointer;
	
}

.nav {
	display:flex;
	width: 100%;
	justify-content:space-around;
	line-height: 50px;
	color: black;
	margin-bottom: 150px;
	list-style: none;
	font-weight: 700;
	
	margin-top: -50px;
	padding-top: 0px;
	

	
}

.nav>li {
	/* margin-left: 40px; */
	font-size: 21px;
	
	
}

.nav>li>a {
	/* margin-left:50px; */
	color: black;
	text-decoration: none;
	 transform: scale(1.2);
	  display: block;
	  transition: 0.6s;
	  background-color: #fff;
	  -webkit-background-clip: text;
      -moz-background-clip: text;
      background-clip: text;
}

.nav>li>a:hover{

	  transition: 0.1s;
	  transform: scale(1);
	  background-color: #1c445e;
	  color: transparent;
	  text-shadow: 2px 2px 3px rgba(255,255,255,0.5);
	  -webkit-background-clip: text;
      -moz-background-clip: text;
       background-clip: text;

}


.mypage{

	display:flex;
	width: 100%;
	justify-content:flex-end;
	line-height:30px;
	color: black;
	margin: 0;
	list-style: none;
	font-weight: normal;


}

.mypage>li{
/* 
	display:flex;
	justify-content:space-between;
	color: black;
	margin-bottom: 30px;
	list-style: none;  */
	margin-left: 30px;
	margin-right: 20px;
}

.mypage>li>a {
	text-decoration: none;
	color: black;
	font-weight: 300;
}


</style>

</head>
<body>

	<div class="wrap">
		<ul class="nav">
			<li><a href="/camping/">HOME</a></li>
			<li><a href="/camping/board/review_list.do">REVIEW</a></li>
			<li><a href="/camping/board/carpool_list.do">CARPOOL</a></li>
			<li><a href="/camping/board/market_list.do">MARKET</a></li>
			<li><a href="#" id="btn_login_form" >MYPAGE</a></li>
			<!--로그인 되어있으면 보여주라  -->
			
		</ul>
			<c:if test="${not empty user }">
			
					<ul class="mypage">
						
						<li><a href="#">
							<c:if test="${user.grade_idx eq 1 }">
								<img alt="이미지없음" src="${ pageContext.request.contextPath }/resources/images/grade_bronze.JPG" width="30">
							</c:if>
							
							<c:if test="${user.grade_idx eq 2 }">
								<img alt="이미지없음" src="${ pageContext.request.contextPath }/resources/images/grade_silver.JPG" width="30">
							</c:if>
							
							<c:if test="${user.grade_idx eq 3 }">
								<img alt="이미지없음" src="${ pageContext.request.contextPath }/resources/images/grade_gold.JPG" width="30">
							</c:if>
							
							<c:if test="${user.grade_idx eq 4 }">
								<img alt="이미지없음" src="${ pageContext.request.contextPath }/resources/images/grade_platinum.JPG" width="30">
							</c:if>
							
							<c:if test="${user.grade_idx eq 5 }">
								관리자
							</c:if>
							</a></li>
							
						<li><a href="#">${user.mem_nickname}님</a></li>
						<li><a href="#">쪽지함</a></li>
						<li><a href="#" onclick="logout();">로그아웃</a></li>
					</ul>
			
			</c:if>
	</div>
</body>
</html>