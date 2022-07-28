<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>
#carpool_reply_recontent{
		width:100%;
		height:100%;
		resize: none;
		border	:	none;
}

</style>

<script type="text/javascript">

	function carpool_reply_re(){
		
	if("${empty user }"=="true"){
			
			alert("댓글작성은 로그인이 필요합니다");
			return;
		}
		
		if(carpool_reply_recontent==''){
			
			alert('내용을 입력하세요');
			carpool_reply_recontent.focus();
			return;
			
		}
	var carpool_reply_recontent	=	$("#carpool_reply_recontent").val().trim();
	var	base_idx	=	$("#base_idx").val();
	
	$.ajax({
			
			url		:	'carpool_reply_re.do',
			data	:	{	'mem_idx':"${user.mem_idx}",
							'mem_nickname':"${user.mem_nickname}",
							"carpool_reply_content":carpool_reply_recontent,
							"carpool_reply_idx":base_idx,
							"page":"${param.page}"
						},
			success	:	function(res_data){
				
				if(res_data.result){
					$("#carpool_reply_recontent").val("");
					carpool_reply_list("${param.page}");
					
					check	= false;
					$("#disp").remove();
				}
			},
			error	:	function(err){
				alert(err.responseText);
				
			}
		});
		
		
	}

</script>

</head>
<body>
<div id="comment_write">
<input id="base_idx" type="hidden" value="${base_idx}">
				<div id="comment_write_box">
					<textarea id="carpool_reply_recontent" placeholder="댓글을 작성하세요"></textarea>
				</div>
				<div id="comment_write_pic">
					<img src="${pageContext.request.contextPath}/resources/images/unsplash_people/people2.jpg" id="comment_profile">
				</div>
				<input type="button" value="댓글 작성" onclick="carpool_reply_re();">
</div>
</body>
</html>