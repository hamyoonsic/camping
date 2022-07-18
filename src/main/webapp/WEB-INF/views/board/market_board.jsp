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

</head>
<body>

<h3 id="title">Market</h3>
<div><a href="">사진리뷰만 보이게 하는 게시판으로 가는 링크</a></div><br>
<div class="top">
	<form method="post" name="search" action="">
		<table class="table_option">
			<tr>
				<td><select class="form-control" name="searchField" style="font-size:16px;">
						<option>전체</option>
						<option>제목</option>
						<option>작성자</option>
				</select></td>
				<td>
				  <input type="text" class="form-control"
					     placeholder="검색어 입력" name="searchText" maxlength="100">
				</td>
				<td>
				  <button type="submit" class="btn-search">검색</button>
				</td>
			</tr>

		</table>
	</form>
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
 <c:forEach var="vo" items="${ list1 }">
		<tr>
			<td>${ vo.market_idx }</td>
			<td class="subject"><a href="#">${ vo.market_title }</td>
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
	 <a class="first" href="carpool_list.do?page=1"></a>
      <a class="prev"  onclick="location.href='?page=${param.page -1}'" ></a> 
          ${ pageMenu }
   	 <a class="next" onclick="location.href='?page=${param.page +1}'"></a> 
   <a class="last" onclick="location.href='?page=${param.page +5}'"></a>
 </div>
 
 
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
   </div>
	
</div>
</body>
</html>