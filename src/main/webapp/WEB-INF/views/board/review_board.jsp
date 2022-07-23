<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
    
<%@include file="../homepage/nav.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${ pageContext.request.contextPath }/resources/review_board.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 새글쓰기 -->
<script type="text/javascript">

  function  review_insert_form(){
	  
	  //로그인여부
	  if("${ empty user }" == "true"){
		  
		  if(confirm("글쓰기는 로그인후에 가능합니다\n로그인 하시겠습니까?")==false)return;
		  
		  //로그인폼으로 이동
		  location.href="../member/insert_form.do";
		  
		  return;
	  }
	  
	  //글쓰기 폼으로 이동( /board/carpool_insert_form.do )	  
	  location.href="review_insert_form.do";
  }
</script>  

<!-- 검색페이징 -->
<script type="text/javascript">
	
	function search() {
		
		var search = $("#search").val();
		var search_text = $("#search_text").val().trim();
		
		//전체검색이 아닌경우
		if(search != 'review_all' && search_text == ''){
			alert('검색어를 입력하세요!!');
			$("#search_text").val('');
			$("#search_text").focus();
			return;
		}
		
		location.href="review_list.do?search=" + search + "&search_text=" + encodeURIComponent(search_text);
		
	
	}

	$(function(){
		
		if("${ not empty param.search }"=="true"){
			$("#search").val('${param.search}');
		}
		
		//전체 검색이 실행시 검색어를 지우기
		if("${ param.search eq 'review_all' }"=="true"){
			$("#search_text").val('');
		}
		
	}); 

</script>


</head>
<body>

<h3 id="title">Review</h3>
<div><a href="">사진리뷰만 보이게 하는 게시판으로 가는 링크</a></div><br>
<div class="top">
	<!-- <form method="post" name="search" action=""> -->
		<table class="table_option">
			<tr>
				<td><select class="form-control" id="search" name="searchField" style="font-size:16px;">
						<option value="review_all">전체보기</option>
						<option value="review_title">제목</option>
						<option value="review_content">내용</option>
						<option value="mem_nickname">작성자</option>
						<option value="review_title_review_content_mem_nickname">제목+작성자+내용</option>
				</select></td>
				<td>
				  <input type="text" class="form-control"
					     placeholder="검색어 입력" name="searchText" id="search_text" value="${ param.search_text }" maxlength="100">
				</td>
				<td>
				  <button type="button" class="btn-search" value="검색" onclick="search();">검색</button>
				</td>
			</tr>

		</table>
	<!-- </form> -->
  <input class="btn" type="button" value="글쓰기"
		 onclick="review_insert_form();">
  
</div>
<table  class="table_list">
<colgroup>
<col width="60px">
<col width="*">
<col width="100px">
<col width="150px">
<col width="200px">
</colgroup>
<thead>
<tr>
  <th>번호</th>
  <th>제목</th>
  <th>조회수</th>
  <th>좋아요</th>
  <th>작성자</th>
  <th>작성일</th>
</tr>
</thead>

<tbody>
	<c:forEach var="vo" items="${ list }">
		<tr>
			<td>${ vo.review_no }</td>
			<td class="subject"><a href="review_view.do?review_idx=${vo.review_idx }&page=${ empty param.page ? 1 : param.page}">${ vo.review_title }</td>
			<td>${ vo.review_hit_count }</td>
			<td>${ vo.cnt }</td>
			<td>${ vo.mem_nickname }</td>
			<td>${ fn:substring(vo.review_regdate,0,10) }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

 <div class="page_wrap">
   <div class="page_nation">

          ${ pageMenu }
 
 </div>

</div>
</body>
</html>