<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>
#market_reply_recontent{
		width:100%;
		height:100%;
		resize: none;
		border	:	none;
}

</style>

<script type="text/javascript">

	function market_reply_re(){
		
	if("${empty user }"=="true"){
			
			alert("댓글작성은 로그인이 필요합니다");
			return;
		}
		
		if(market_reply_recontent==''){
			
			alert('내용을 입력하세요');
			market_reply_recontent.focus();
			return;
			
		}
	var market_reply_recontent	=	$("#market_reply_recontent").val().trim();
	var	base_idx	=	$("#base_idx").val();
	
	$.ajax({
			
			url		:	'market_reply_re.do',
			data	:	{	'mem_idx':"${user.mem_idx}",
							'mem_nickname':"${user.mem_nickname}",
							"market_reply_content":market_reply_recontent,
							"market_reply_idx":base_idx,
							"page":"${param.page}"
						},
			success	:	function(res_data){
				
				if(res_data.result){
					$("#market_reply_recontent").val("");
					market_reply_list("${param.page}");
					
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
					<textarea id="market_reply_recontent" placeholder="댓글을 작성하세요"></textarea>
				</div>
				<div id="comment_write_pic">
					<img src="${pageContext.request.contextPath}/resources/images/unsplash_people/people2.jpg" id="comment_profile">
				</div>
				<input type="button" value="댓글 작성" onclick="market_reply_re();">
</div>
</body>
</html>