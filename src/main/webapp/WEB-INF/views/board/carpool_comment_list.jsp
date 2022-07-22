<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	
	
	.content_type{
		min-height: 40px;
	
	}
</style>

<script type="text/javascript">

	function comment_del(carpool_idx){
		
		if(confirm("정말 삭제하시겠습니까?")==false)return;
		
		//Ajax로 삭제
		$.ajax({
			
			url			:	"carpool_reply_delete.do",
			data		:	{"carpool_idx":carpool_idx},
			dataType	:	"json",
			success		:	function(res_data){
				
				if(res_data.result){
					
					carpool_reply_list(global_page);
					
				}
				
			},
			error		:	function(err){
				alert(err.responseText);
			}
			
		});
	}

</script>



</head>
<body>

<hr>
<!-- 페이징 메뉴  -->
<a name="comment_page"></a>
<div style="font-size:18px;">
<a href="#comment_page" onclick="comment_list(1)">1</a>&nbsp;&nbsp;
<a href="#comment_page" onclick="comment_list(2)">2</a>&nbsp;&nbsp;
<a href="#comment_page" onclick="comment_list(3)">3</a>&nbsp;&nbsp;
<a href="#comment_page" onclick="comment_list(4)">4</a>&nbsp;&nbsp;
<a href="#comment_page" onclick="comment_list(5)">5</a>&nbsp;&nbsp;
</div>

<!-- for(CommentVo vo : list) -->
<c:forEach var="vo" items="${list}">

	<div class="panel panel-info">
    	<div class="panel-heading">
		   	<b>${vo.mem_nickname}</b>
		   	<!-- 글쓴이만 삭제 -->
		   	<c:if test="${user.mem_idx eq vo.mem_idx }">
		   		<input type="button" value="x" onclick="comment_del('${vo.carpool_idx }');">
		   	</c:if>
    	</div>
     
	    <div class="panel-body">
	   		<div class="content_type">
	      		${vo.carpool_reply_content}
	      	</div>
	      	<div class="regdate_type">작성일자 : ${fn:substring(vo.carpool_reply_regdate,0,16) }</div>
	    </div>
    </div>
	
</c:forEach>





</body>
</html>