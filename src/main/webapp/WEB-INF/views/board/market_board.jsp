<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${ pageContext.request.contextPath }/resources/market_board.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
	
	function search() {
		
		var search = $("#search").val();
		var search_text = $("#search_text").val().trim();
		
		//전체검색이 아닌경우
		if(search != 'market_all' && search_text == ''){
			alert('검색어를 입력하세요!!');
			$("#search_text").val('');
			$("#search_text").focus();
			return;
		}
		
		location.href="market_list.do?search=" + search + "&search_text=" + encodeURIComponent(search_text);
		
	
	}

	$(function(){
		
		if("${ not empty param.search }"=="true"){
			$("#search").val('${param.search}');
		}
		
		//전체 검색이 실행시 검색어를 지우기
		if("${ param.search eq 'market_all' }"=="true"){
			$("#search_text").val('');
		}
		
	}); 

</script>

</head>
<body>
<%@include file="../homepage/nav.jsp" %> 
<h3 id="title">Market</h3>
<div><a href="">사진리뷰만 보이게 하는 게시판으로 가는 링크</a></div><br>
<div class="top">
	<!-- <form method="post" name="search" action=""> -->
		<table class="table_option">
			<tr>
				<td><select class="form-control" id="search" name="searchField" style="font-size:16px;">
						<option value="market_all">전체보기</option>
						<option value="market_title">제목</option>
						<option value="market_content">내용</option>
						<option value="mem_nickname">작성자</option>
						<option value="market_title_market_content_mem_nickname">제목+작성자+내용</option>
				</select></td>
				<td>
				  <input type="text" class="form-control"
					     placeholder="검색어 입력" name="searchText" id="search_text" value="${ param.search_text }" maxlength="100">
				</td>
				<td>
				  <button type="button" class="btn-search" onclick="search();">검색</button>
				</td>
			</tr>

		</table>
	<!-- </form> -->
  <input class="btn" type="button" value="글쓰기"
		 onclick="location.href=#">
  
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
<tr >
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
			<td>${ vo.market_no }</td>
			<td class="subject"><a href="market_view.do?market_idx=${vo.market_idx }&page=${ empty param.page ? 1 : param.page}">${ vo.market_title }</td>
			<td>${ vo.market_hit_count }</td>
			<td>${ vo.cnt }</td>
			<td>${ vo.mem_nickname }</td>
			<td>${ fn:substring(vo.market_regdate,0,10) }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>


 <div class="page_wrap">
   <div class="page_nation">
	<%--  <a class="first" href="carpool_list.do?page=1"></a>
      <a class="prev"  onclick="location.href='?page=${param.page -1}'" ></a>  --%>
          ${ pageMenu }
   	<%--  <a class="next" onclick="location.href='?page=${param.page +1}'"></a> 
   <a class="last" onclick="location.href='?page=${param.page +5}'"></a> --%>
 </div>
 
<!--  
=======
	 <a class="first" href="carpool_list.do?page=1"></a>
      <a class="prev"  onclick="location.href='?page=${param.page -1}'" ></a> 
          ${ pageMenu }
   	 <a class="next" onclick="location.href='?page=${param.page +1}'"></a> 
   <a class="last" onclick="location.href='?page=${param.page +5}'"></a>
 </div>
 
 
>>>>>>> adf2b26f6bd2cd91200544bd2bc2b7c2e8afaaf4
<div class="page_wrap">
   <div class="page_nation">
      <a class="first" href="#"></a>
      <a class="prev" href="#"></a>
      <a href="#" class="active">1</a>
      <a href="#">2</a>
      <a href="#">3</a>
      <a href="#">4</a>
      <a href="#">5</a>
      <a href="#">6</a>
      <a href="#">7</a>
      <a href="#">8</a>
      <a href="#">9</a>
      <a href="#">10</a>
      <a class="next" href="#"></a>
      <a class="last" href="#"></a>
   </div> -->
	
</div>
</body>
</html>