<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style type="text/css">

	
	
	.content_type{
		width		:	450px;;
		display:	inline-block;
		margin-left: 30px;
		margin-bottom: 25px;
	
	}
	
	.box{
		height	:	130px;
		margin	:	auto;
		border:  1px solid  #cccccc ;
		box-shadow: 1px 1px 2px black;
		margin-top: 10px;
		margin-bottom: 10px;
		border-radius: 15px 15px;
	}
	
	.box-heading{
		/* margin-top: 10px;
		margin-left: 10px;
		height		:	20px;
		width		:	20%; 
		
		margin-bottom: 20px;
		*/
		display:	inline-block;
	}
	
	.nickname{
		display:	block;
		margin-top: 10px;
		margin-left: 10px;
	}
	
	.box-body{
		width		:	200px;
		
		display:	inline-block;
		
	}
	
	.regdate_type{
		width		:	100%;
		color		:	gray;
		text-align:right; 
		margin-right:10px;"
		margin-bottom: 10px;
		display:	inline-block;
	}
	.x{
		text-align:right; 
		display:	inline-block;
		
	}
	
</style>

<script type="text/javascript">

	function comment_del(review_reply_idx){
		
		if(confirm("정말 삭제하시겠습니까?")==false)return;
		
		//Ajax로 삭제
		$.ajax({
			
			url			:	"review_reply_delete.do",
			data		:	{"review_reply_idx":review_reply_idx},
			dataType	:	"json",
			success		:	function(res_data){
				
				if(res_data.result){
					
					review_reply_list(global_page);
					
				}
				
			},
			error		:	function(err){
				alert(err.responseText);
			}
			
		});
	}

</script>

<script type="text/javascript">
	var	check	=	0;
	function comment_re(review_reply_idx){
		
		
		
		
		if(check>0){
			
			$('[id*=disp]').empty();
			check	=	0;

		}
		
		if(check==0){
			check++;
			$.ajax({
				
				url			:	"review_comment_form.do",
				data		:	{"review_reply_idx":review_reply_idx,"page":"${param.page}"},
				success		:	function(res_data){
					
					$("#disp"+review_reply_idx).html(res_data);
					
				},
				error		:	function(err){
					alert(err.responseText);
					
				}
			});
			
		}
		
	}
		
	

	

</script>

<script>

	$(function(){
		
	
		
		$('[class*=commment_click1]').css("margin-left","50px");
		$('[class*=commment_click2]').css("margin-left","100px");
		$('[class*=commment_click3]').css("margin-left","150px");
		$('[class*=commment_click4]').css("margin-left","200px");
		$('[class*=commment_click5]').css("margin-left","250px");
		
		
	});
	

</script>


</head>
<body>



<!-- for(CommentVo vo : list) -->
<c:forEach var="vo" items="${list}">

	
	
	<div class="commment_click${vo.review_reply_depth}" onclick="comment_re('${vo.review_reply_idx}');">
		
		<div class="box">
			<b class="nickname">${vo.mem_nickname}</b>
	    	<div class="box-heading">
			   
			   	<div id="comment_write_pic">
			   	
					<img src="${pageContext.request.contextPath}/resources/images/unsplash_people/people2.jpg" id="comment_profile">
				</div>
			   	<!-- 글쓴이만 삭제 -->
			   	<c:if test="${user.mem_idx eq vo.mem_idx }">
			   		<div class="x">
			   			<input type="button" value="x" onclick="comment_del('${vo.review_reply_idx }');">
			   		</div>
			   	</c:if>
	    	</div>
	     
		    <div class="box-body">
		   		<div class="content_type">
		      		${vo.review_reply_content}
		      	</div>
		      	<div class="regdate_type"> 작성일자 : ${fn:substring(vo.review_reply_regdate,0,16) }</div>
		    </div>
	    </div>
	</div>
		<div id="disp${vo.review_reply_idx}">
	</div>
</c:forEach>

<hr>
<!-- 페이징 메뉴  -->
<div style="font-size:18px;">
	${review_pageMenu }
</div>




</body>
</html>