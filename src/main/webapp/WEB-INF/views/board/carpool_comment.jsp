<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

	
	
	
	
	
	
	
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
		margin	:	auto;
		height	:	400px;
		/* border	:	1px solid	red; */
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
	
	
	
	
	
	
	#comment_write{
		
		width	:	800px;
		margin	:	auto;
		height	:	100px;
		border:  1px solid  #cccccc ;
		box-shadow: 1px 1px 2px black;
		border-radius: 15px 15px;
		
	
	}
	
	#comment_write_box{
		margin-top	:	15px;
		margin-left	:	15px;
		width	:	70%;
		height	:	70px;
		/* border	:	1px solid blue; */
		display	:	inline-block;
	}
	
	#carpool_reply_content{
		width:100%;
		height:100%;
		resize: none;
		border	:	none;
	}
	
	#comment_write_pic{
		margin-top	:	15px;
		margin-left	:	15px;
		width	:	70px;
		height	:	70px;
		/* border	:	1px solid green; */
		display	:	inline-block;
		border-radius: 70%;
    	overflow: hidden;
	}
	
	
	
	
</style>

<script type="text/javascript">



	$(function(){
		carpool_reply_list("${param.page}");
		
		$("#carpool_idx").val("${param.carpool_idx}");
		
		/* $("#comment_btn").click(function(){
		
			$("#comment_box").toggle();
			
		}); */
		
	});
	
	//댓글작성
	function carpool_reply_insert(){
		
		
		if("${empty user }"=="true"){
			
			alert("댓글작성은 로그인이 필요합니다");
			return;
		}
		
		var carpool_reply_content = $("#carpool_reply_content").val().trim();
		
		if(carpool_reply_content==''){
			
			alert('내용을 입력하세요');
			carpool_reply_content.focus();
			return;
			
		}
		
		$.ajax({
			
			url		:	'carpool_reply_insert.do',
			data	:	{	'mem_idx':"${user.mem_idx}",
							'mem_nickname':"${user.mem_nickname}",
							"carpool_reply_content":carpool_reply_content,
							"carpool_idx":"${param.carpool_idx}"
						},
			success	:	function(res_data){
				
				if(res_data.result){
					$("#carpool_reply_content").val("");
					carpool_reply_list(1);
				}
				
				
				/* location.reload(); */
				/* location.hret='board/post/list.do'; */
				
			},
			error	:	function(err){
				alert(err.responseText);
				
			}
		});
	}//end : carpool_reply_insert

	//댓글목록 가져오기
	var	global_page=1;
	function carpool_reply_list(reply_page){
		
			$.ajax({
				
				url			:	"carpool_reply_list.do",
				data		:	{"carpool_idx":"${param.carpool_idx}" , "page":reply_page},
				success		:	function(res_data){
					
					$("#comment_box").html(res_data);
					
					
				},
				error		:	function(err){
					alert(err.responseText);
					
				}
			});
			
		}//end : carpool_reply_list
		
		
	
	

</script>


</head>
<body>
	
			<input type="hidden" id="mem_nickname" value="${user.mem_nickname}">
			<input type="hidden" id="reivew_idx" value="${carpool_idx}">
			<div id="comment_write">
				<div id="comment_write_box">
					<textarea id="carpool_reply_content" placeholder="댓글을 작성하세요"></textarea>
				</div>
				<div id="comment_write_pic">
					<img src="${pageContext.request.contextPath}/resources/images/unsplash_people/people2.jpg" id="comment_profile">
				</div>
				<input  type="button" value="댓글 작성" onclick="carpool_reply_insert();">
			</div>
		
		
		
		
		<!-- <input id="comment_btn" type="button" value="댓글 3"> -->
		
		
			<div id="comment_box">
		
			</div>
		
	
	
</body>
</html>