<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${ pageContext.request.contextPath }/resources/carpool_board.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
	
	function search() {
		
		var search = $("#search").val();
		var search_text = $("#search_text").val().trim();
		
		//전체검색이 아닌경우
		if(search != 'carpool_all' && search_text == ''){
			alert('검색어를 입력하세요!!');
			$("#search_text").val('');
			$("#search_text").focus();
			return;
		}
		
		location.href="carpool_list.do?search=" + search + "&search_text=" + encodeURIComponent(search_text);
		
	
	}

	$(function(){
		
		if("${ not empty param.search }"=="true"){
			$("#search").val('${param.search}');
		}
		
		//전체 검색이 실행시 검색어를 지우기
		if("${ param.search eq 'carpool_all' }"=="true"){
			$("#search_text").val('');
		}
		
	}); 

</script>


</head>
<body>

<h3 id="title">Carpool</h3>
<div><a href="">사진리뷰만 보이게 하는 게시판으로 가는 링크</a></div><br>
<div class="top">
	<!-- <form method="post" name="search" action=""> -->
		<table class="table_option">
			<tr>
				<td><select class="form-control" id="search" name="searchField" style="font-size:16px;">
						<option value="carpool_all">전체보기</option>
						<option value="carpool_title">제목</option>
						<option value="carpool_content">내용</option>
						<option value="mem_nickname">작성자</option>
						<option value="carpool_title_carpool_content_mem_nickname">제목+작성자+내용</option>
				</select></td>
				<td>
				  <input type="text" class="form-control"
					     placeholder="검색어 입력" name="searchText" id="search_text" value="${ param.search_text }" maxlength="100" >
				</td>
				<td>
				  <button type="button" class="btn-search" value="검색" onclick="search();">검색</button>
				</td>
			</tr>

		</table>
	<!-- </form> -->
  <input class="btn" type="button" value="글쓰기"
		 onclick="location.href='../homepage/main.do'">
  
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
	<%-- <c:forEach var="vo" items="${ list }">
		<tr>
			 <td>${ vo.carpool_no }</td> 
			<td class="subject"><a href="#">${ vo.carpool_title }</td>
			<td>${ vo.carpool_hit_count }</td>
			<td>${ vo.carpool_like_count }</td>
			<td>${ vo.mem_nickname }</td>
			<td>${ fn:substring(vo.carpool_regdate,0,10) }</td>
		</tr>
	</c:forEach> --%>
</table> 

<div>

</div>

 <div class="page_wrap">
   <div class="page_nation">
	 <%-- <a class="first" href="carpool_list.do?page=1"></a>
	  <c:if test="${param.page>1}">
       <a class="prev"  onclick="location.href='?page=${param.page -1}'" ></a> 
      </c:if>
	  <c:if test="${param.page<1}">
       <a class="prev"  href="carpool_list.do?page=1" ></a> 
      </c:if> --%>
         ${ pageMenu }
   	<%--  <a class="next" onclick="location.href='?page=${param.page +1}'"></a> 
   <a class="last" onclick="location.href='?page=${param.page +5}'"></a> --%>
 </div>
</div>


   
</div>
</body>
</html>