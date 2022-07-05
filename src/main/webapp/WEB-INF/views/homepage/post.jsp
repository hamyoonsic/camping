<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

	#header{
		width	:	1920px;
		height	:	200px;
		/* border	:	1px solid red; */
		margin	:	auto;
	}
	
	#content{
		width	:	1920px;
		height	:	1200px;
		/* border	:	1px solid blue; */
		margin	:	auto;
	}
	
	
	
	/*-----------------------------------------------  */
	
	#title{
		margin-top	:	150px;
		font-family:Nanum Gothic;
		font-size: 35px;
		font-weight: 700;
		text-align	:	center;
	}
	
	
	#post_profile_box{
		margin-top	:	50px;
		margin-left	:	500px;	
		width	:	60px;
		height	:	60px;
		border-radius: 70%;
    	overflow: hidden;
    	display	:	inline-block;
	}
	
	#post_writer_profile{
		width: 100%;
    	height: 100%;
    	object-fit: cover;
    	display	:	inline-block;
	}
	
	#subject{
		width	:200px;	
		height	:60px;
		font-family:Nanum Gothic;
		font-size: 20px;
		font-weight: 600;
		display	:	inline-block;
	}

	/*-----------------------------------------------  */
	
	#main_content_size{	
		width	:	100%;
		height	:	700px;
	}
	
	#main_content{
		width: 800px;
        height: 600px;
        margin-top: 40px;
        margin-left: 560px;
        margin-right: 15px;
        margin-bottom: 30px;
        float: left;
        border: 1px solid #bcbcbc;
        border-radius: 20px 20px;	
	}
	
	#views_like_count{
		margin-left:580px;
		width	:	680px;
		height: 50px;
		display	:	inline-block;
		text-align:left;
		font-family:Nanum Gothic;
		font-size: 15px;
		font-weight: 500;
	}
	
	#comment_btn{
		width	:100px;
		height: 50px;
		display	:	inline-block;
		text-align:center;
		border: 1px solid #bcbcbc;
        border-radius: 20px 20px;
        background-color: white;
	}
	
	
	#comment_box{
		width	:	800px;
		height	:	400px;
		/* border	:	1px solid	red; */
		margin-left: 560px;
		display	:	inline-block;
	}
	
	#comment{
		width	:	800px;
		height	:	120px;
		/* border	:	1px solid	blue; */
		margin-top: 10px;
		float: left;
	}
	
	#comment_profile_box{
		margin-top	:	20px;
		margin-left	:	20px;
		margin-bottom	:	20px;
		width	:	70px;
		height	:	70px;
		border-radius: 70%;
    	overflow: hidden;
    	float: left;
	}
	
	#comment_profile{
		width: 100%;
    	height: 100%;
    	object-fit: cover;
    	float: left;
	}
	
	#comment_writer{
		font-family:Nanum Gothic;
		font-size: 15px;
		font-weight: 500;
		float: left;
		margin-top: 30px;
		margin-left: 30px;
	}
	
	#comment_content{
		font-family:Nanum Gothic;
		font-size: 15px;
		font-weight: 500;
		float: left;
		margin-top: 80px;
	}
	
	#like_count{
		
		margin-top: 50px;
		float: left;
	}
	
	#like_btn{
		margin-left:50px;
		margin-top: 40px;
		width: 	40px;
    	height: 40px;
		float: left;
	}
	
</style>


</head>
<body>

	<div id="header">
		<div id="title">단양 캠핑 다녀왔어요</div>
		<div id="post_profile_box">
			<img src="images/unsplash_people/people1.jpg" id="post_writer_profile">
		</div>
		<div id="subject"> 김주원 / 2022.6.30</div>
	</div>
	
	<div id="content">
		<div id="main_content_size">
			<div id="main_content">글+ 사진 들어갈 곳</div>
		</div>
		<div id="views_like_count"> 조회수 112 좋아요 72</div>
		
		<input id="comment_btn" type="button" value="댓글 4">
		
		<%-- <c:if test=""> --%>
			<div id="comment_box">
				<c:forEach begin="1" end="3">
					<hr>
					<div id="comment">
						<div id="comment_profile_box">
							<img src="images/unsplash_people/people2.jpg" id="comment_profile">
						</div>
						
						<div id="comment_writer">김일성 Dec10.2016 <br><br>혹시 그 요리웹툰 더블피에와 똑딱쿠킹 아니였나요?ㅋㅋㅋ저도 학생때 엄청 많이 봤어요!</div>
						<div id="comment_content"></div>
						<div id="comment_like">
							<img src="images/like.png" id="like_btn" onclick="">
							<div id="like_count">15</div>
						</div>					
					</div>
				</c:forEach>
			</div>
		
		
		<%-- </c:if> --%>
		
	
	</div>
</body>
</html>