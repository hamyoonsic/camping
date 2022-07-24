<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">





*{
	font-family: 'Noto Sans KR', sans-serif;
/* 	list-style: none; */
	text-decoration: none;
	border-collapse: collapse;
	margin: 0px;
	padding: 0px;
	color: #000;
}


.wrap2{
	
	text-align: center;
	margin-bottom: 80px;
	margin-left: 20px;
}



.intro_text2 {
	margin-bottom: 40px;
	margin-top:300px;
}

.intro_text2 h1 {
  font-size:50px; 
  font-weight:700;  
  width:100%; 
  text-align:center; 
  margin:auto; 
  padding-bottom:13px;
}


.intro_text2>h3>a{
	
	/* float: right; */ 
	margin-right: 100px;
	color: black;
	font-size: 20d/*  */px;
	
	}

.intro_bg2 h2 {
	
	font-weight: lighter;
	color: #636363;
	font-size: 20px;
	text-align: center;
	margin-top: 80px;
	
	}

#more{
	float: right;  
	margin-right: 80px;
	color: black;
	font-size: 20px;

}


.icons {
	display: flex;
	justify-content:flex-end;
	/* width: 1280px; */
	width: 90%;
	margin: auto;
	text-align: center;
	

}



.icons>li {
	flex: 1;
	height: 200px;
	margin-top: 49px;
	background: white;
	text-align: center;
	list-style: none;
}


.icons>li>.icon_img {
	margin-top: 10px;
	

}


.card-title{
	font-weight: bold;
	color: black;
	margin-bottom: 15px;
}

.big{
	width:33rem;
	border-radius: 15px;
	height: 430px;
	margin-bottom: 10px;
}



.small{
	/* margin-top:100px; */
	margin:auto;
	border-radius: 70%;
    overflow: hidden;
    width: 100px;
    height: 100px;
  /*   margin-bottom: 15px; */
    text-align: center;
   
}

.profile{
	color: black;
	font-size: 20px;
	/* text-decoration: none; */
	text-align: center;
	margin-bottom: 100px; 
}



.more {
	width: 100px;
	height: 30px;
	color: white;
	background: #2F7AF4;
	font-size: 12px;
	line-height: 30px;
	margin: 25px auto;
/* 	margin-bottom: 100px;  */
	

}

.more1{
	color: white;
	text-align:center;
}

.pro{

	width: 100px;
	height: 40px;
	color: white;

	margin: 25px auto;
	margin-bottom: 100px; 
	

}






</style>


</head>
<body style="margin: 0">
	<div id="review2_main_box">
		<div class="wrap2">
			<div class="intro_bg2">
				<div class="intro_text2">
					<h1>REVIEW</h1>
					<h3 id="more"><a href="/camping/board/review_list.do">MORE+</a></h3>
				</div>
					<h2>이 달의 best review를 소개합니다.</h2>
				</div>
			</div>
	
		<div class="row">
			<ul class="icons">
				<li>
					<div class="card">
						<a href="https://blog.naver.com/minororo/222758255231">
							<img class="big" src="${ pageContext.request.contextPath }/resources/images/camping2.png">
						</a>	
					</div>
					<div class="card-title">태안 어은돌 힐링 아영장을 다녀왔어요.</div>
					<div class="more">
						<a class="more1" href="https://blog.naver.com/minororo/222758255231">
							MORE
						</a>
					</div>
		
					<div class="pro">
						<img class="small" src="${ pageContext.request.contextPath }/resources/images/slideimg01.jpg" >
			   			<a class="profile" href="#">won</a>
			   		</div>
				</li>
				
				<li>
					<div class="card">
						<a href="https://blog.naver.com/minororo/222758255231">
						<img class="big" src="${ pageContext.request.contextPath }/resources/images/rec4.jpg"></a>	
					</div>
					<div class="card-title">나의 첫번째 캠핑이야기</div>
					<div class="more">
						<a class="more1" href="https://blog.naver.com/minororo/222758255231">
							MORE
						</a>
					</div>
					<div class="pro">
						<img class="small" src="${ pageContext.request.contextPath }/resources/images/slideimg01.jpg" >
			   			<a class="profile" href="#">캠핑</a>
			   		</div>
				</li>
				
				<li>
					<div class="card">
						<a href="https://blog.naver.com/minororo/222758255231">
						<img class="big" src="${ pageContext.request.contextPath }/resources/images/camping1.png"></a>	
					</div>
					<div class="card-title">강아지와 캠핑</div>
					<div class="more">
						<a class="more1" href="https://blog.naver.com/minororo/222758255231">
						MORE
						</a>
					</div>
					<div class="pro">
						<img class="small" src="${ pageContext.request.contextPath }/resources/images/rec2.jpg" >
			   			<a class="profile" href="#">강아지</a>
			   		</div>
				</li>
			</ul>
		
	
		</div>
	</div>


</body>
</html>