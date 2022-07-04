<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
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
	line-height: 80px;
	color: black;
	margin-bottom: 0px;
	list-style: none;
	font-weight: 700;
	
	
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
			<li><a href="#link_header">HOME</a></li>
			<li><a href="#link_main_text0">REVIEW</a></li>
			<li><a href="#link_main_text1">CARPOOL</a></li>
			<li><a href="#link_main_text1">MARKET</a></li>
			<li><a href="#link_main_text2">WHEATHER</a></li>
			<li><a href="loginForm.jsp">MYPAGE</a></li>
		</ul>
			<ul class="mypage">
				<li><a href="#">(등급)</a></li>
				<li><a href="#">ㅇㅇ님</a></li>
				<li><a href="#">쪽지함</a></li>
			</ul>
	</div>
</body>
</html>