<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>


<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
	#header{
		
		width	:	1920px;
		height	:	300px;
		/* border	:	1px solid red; */
		margin	:	auto;
	}
	
	#content{
		width	:	1920px;
		height	:	1000px;
		/* border	:	1px solid blue; */
		margin	:	auto;
	}
	
	#footer{
	
		width	:	1920px;
		height	:	150px;
		/* border	:	1px solid green; */
		margin	:	auto;
	
	}
	
	/*--------------------------------------  */
	
	#border_name{
		text-align	:	center;
		margin-top	:	240px;
		font-family:Nanum Gothic;
		font-size: 38px;
		font-weight: 700;
	}
	
	#search{
		text-align	:	center;
		margin-top	:	80px;
	}
	
	#search_bar{
		display	:	inline-block;
		text-align	:	center;
		width: 500px;
        height: 40px;
        border: 1px solid #bcbcbc;
        box-shadow: 3px 3px 3px gray;
        border-radius: 20px 20px;
	}
	
	
	
	#search_btn{
		text-align	:	center;
		width	:50px;
		height	:50px;
		display	:	inline-block;
	}
	
	#write{
		text-align	:	right;
		margin-right:	200px;
		font-family:Nanum Gothic;
		font-size: 20px;
		font-weight: 700;
	}
	
	#photo_check{
		text-align	:	left;
        margin-left: 200px;
        
	}
	
	#photo_only{
		text-align	:	left;
		font-family:Nanum Gothic;
		font-weight: 700;
        font-size: 20px;
	}
	/*---------------------↑header-----------------  */
	
	
	#main_box{
	 	width: 350px;
        height: 430px;
        margin-top: 40px;
        margin-left: 90px;
        margin-right: 15px;
        margin-bottom: 30px;
        float: left;
        border: 1px solid #bcbcbc;
        box-shadow: 3px 3px 3px gray;
        border-radius: 20px 20px;
	}
	
	#photo_box{
		width: 350px;
		height: 310px;
		border-radius: 20px 20px 0px 0px;
		float: left;
	}
	
	#photo{
		width: 351px;
		height: 310px;
		border-radius: 20px 20px 0px 0px;
		float: left;
	}
	
	#like{
		display	:	inline-block;
		width: 350px;
		height: 33px;
		text-align	:	right;
		margin-bottom: :200px;
		float: left;
		
	}
	
	#like_count{
		text-align	:	right;
		display	:	inline-block;
	}
	
	#like_btn{
		text-align	:	right;
		margin-right	:	5px;
		width: 25px;
		height: 30px;
	}
	
	
	/*-------------------------------------  */
	
	
	#text_box{
		
	}
	
	#post_name{
		font-size: 11px;
		margin-top	:	320px;
		margin-left	:	15px;
		font-family:Nanum Gothic;
		font-weight: 600;
        font-size: 20px;
	}
	
	#writer_name{
		font-size: 20px;
		margin-left	:	15px;
		font-family:Nanum Gothic;
		font-weight: 600;
        width	:	90px;
		height	:	30px;
		margin-bottom : 15px;
		display	:	inline-block;
	}
	
	#profile_box{
		margin-top	:	10px;
		margin-left	:	15px;	
		display	:	inline-block;
		width	:	60px;
		height	:	60px;
		border-radius: 70%;
    	overflow: hidden;
    	display	:	inline-block;
	}
	
	
	#writer_profile{
		width: 100%;
    	height: 100%;
    	object-fit: cover;
    	display	:	inline-block;
    	
    	
	}
	
	#post_date{
		width	:	130px;
		height	:	30px;
		text-align	:	right;
		font-size: 15px;
		margin-top	:	15px;
		margin-right:	15px;
		font-family:Nanum Gothic;
		font-weight: 400;
        margin-bottom : 15px;
        color	:	gray;
        display	:	inline-block;
	}
	
	
	/*-------------------------------------  */
	
	
	#page_count{
		width	:	1920px;
		clear: both;
		display	:	inline-block;
		font-family:Nanum Gothic;
		font-weight: 600;
		font-size: 20px;
		text-align: center;
	}
	

</style>


</head>
<body>
	<div id="header">
		<div id="border_name">리뷰게시판/마켓게시판</div>
		
		<div id="search">
			<input type="text" id="search_bar">
			
				<img src="images/search.png" id="search_btn" onclick="">
			
			
		</div>
		
		<div id="write" onclick="">+글쓰기</div>
		<input type="checkbox" id="photo_check" value="" onclick="">
		<span id="photo_only">사진리뷰만</span>
	</div>
	
	<div id="content">
		<c:forEach begin="1" end="8">
			<div id="main_box">
				<div id="photo_box">
					<img id="photo" src="images/unsplash_camp/camp1.jpg">
					<div id="like">
						<div id="like_count">11.123</div>
						<img src="images/like.png" id="like_btn" onclick="">
					</div>
									
				</div>
				<div id="text_box">
					<div id="post_name">글자 들어가는곳</div>
					<div id="profile_box">
						<img src="images/unsplash_people/people1.jpg" id="writer_profile">
					</div>
					<div id="writer_name">작성자님</div>
					<div id="post_date">2022.6.30</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<div id="footer">
		<div id="page_count"> 1 2 3 4 5 6 7 8 9 10 다음</div>
	</div>


</body>
</html>