<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	#box{
		width: 800px;
		margin: auto;
		margin-top: 10px;
		
	}
	
	#subject,#regdate{
	
		border:  1px solid  #cccccc ;
		box-shadow: 1px 1px 2px black;
		padding: 5px;
		margin-bottom: 10px;
		
		 
	}
	
	#content{
	
		border:  1px solid  #cccccc ;
		box-shadow: 1px 1px 2px black;
		padding: 5px;
		
		min-height: 200px;
		margin-bottom: 10px;
		
		overflow-wrap: break-word; 
	}

</style>

<script type="text/javascript">

	function reply_form(){
		
		//로그인 여부
		if("${empty user}"=="true"){
			
			if(confirm("답글쓰기는 로그인후에 이용가능합니다\n로그인 하시겠습니까?")==false)return;
			
			//로그인 폼으로 이동
			location.href="../member/login_form.do?url=" + encodeURIComponent(location.href);
			return;
		}
		//답글쓰기 폼으로 이동(/board/reply_form.do) 
		location.href="reply_form.do?market_idx=${ vo.market_idx }&page=${param.page}";
	}
	
	function del(){
		
		if(confirm("정말 삭제 하시겠습니까?")==false)return;
		
		//확인 누르면 삭제하러 가기
		location.href="delete.do?market_idx=${ vo.market_idx }&page=${ param.page }";
		
	}
	
	
	function modify_form(){
		
		//수정폼 띄우기
		location.href="modify_form.do?market_idx=${ vo.market_idx }&page=${ param.page }";
		
		
	}
	
	
</script>

</head>
<body>

<div id="box">
	<div id="subject">제목:${vo.market_title}</div>
	<div id="content">${vo.market_content }</div>
	<div id="regdate">닉네임 : ${vo.mem_nickname}<br>작성일자 : ${fn:substring(vo.market_regdate,0,10) }</div>
	<div id="job_button"></div>
		<input  class="btn btn-primary" type="button" value="목록보기" 
			onclick="location.href='market_list.do?page=${param.page}';">

		<!--글쓴이인 경우만 보여 주라   -->
		<c:if test="${user.mem_idx  eq vo.mem_idx}">
			<input class="btn btn-info"     type="button" value="수정하기" 
				onclick="modify_form();">
			<input class="btn btn-danger"     type="button" value="삭제하기" 
				onclick="del();">
		</c:if>
</div>

</body>
</html>