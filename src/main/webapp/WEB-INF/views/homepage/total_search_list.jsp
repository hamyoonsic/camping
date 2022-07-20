<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="nav.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">


.top{
 	width: 100%;
 	margin-bottom: 40px;
  	display:block;
 }

.table_option{
	float: left;
	margin-bottom: 0px;
	margin-left: 10px;
	
}

.lotation{
	
	text-align:right;
	font-size: 12px;
	height: 33px;
	text-decoration: none;
	color: black;

}

.btn {
	float:right;

 }

.table_list{

	width: 100%;
	margin-left: auto;
	margin-right: auto;
	
	
}

.table_list thead th  {
	
	border-top: 1px solid ;
	border-bottom: 1px solid;
	font: bold;
	font-size: 14px;
	height: 33px;
	
}

.table_list tbody td{
	
	text-align:center;
	font-size: 12px;
	border-bottom: 1px solid #e4e4e4;
	
}

.table_list tbody td.subject{
	
	text-align:left;
	font-size: 12px;
	height: 33px;
	padding-left: 15px;
	
}

.table_list tbody td.subject a  {
	
	text-align:left;
	font-size: 12px;
	height: 33px;
	text-decoration: none;
	color: black;
	
}

.table_list tbody td.subject a:hover  {
	
	text-decoration: underline;
	
}





</style>



</head>
<body>


<h3 id="title">Carpool</h3>
<div><a class="lotation" href="">+게시판이동</a></div><br>

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
	<c:if test="${ empty map.carpool_list }">
		<td rowspan="6" colspan="6">검색결과가 없습니다.</td>
	</c:if>

    <!-- for(CarpoolVo vo : map.carpool_list) -->
	<c:forEach var="vo" begin="0" end="4" step="1" items="${ map.carpool_list }">
		<tr>
			<td>${ vo.carpool_no }</td>
			<td class="subject"><a href="#">${ vo.carpool_title }</td>
			<td>${ vo.carpool_hit_count }</td>
			<td>${ vo.carpool_like_count }</td>
			<td>${ vo.mem_nickname }</td>
			<td>${ fn:substring(vo.carpool_regdate,0,10) }</td>
		</tr>
	</c:forEach>
	
</table>
<div>

</div>


<h3 id="title">Market</h3>
<div><a class="lotation" href="">+게시판이동</a></div><br>

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
	<c:if test="${ empty map.market_list }">
		<td rowspan="6" colspan="6">검색결과가 없습니다.</td>
	</c:if>
	
	<c:forEach var="vo" begin="0" end="4" step="1" items="${ map.market_list }">
		<tr>
			
			<td>${ vo.market_no }</td>
			<td class="subject"><a href="#">${ vo.market_title }</td>
			<td>${ vo.market_hit_count }</td>
			<td>${ vo.market_like_count }</td>
			<td>${ vo.mem_nickname }</td>
			<td>${ fn:substring(vo.market_regdate,0,10) }</td>
		</tr>
	</c:forEach>
</table>


<h3 id="title">Review</h3>
<div><a class="lotation" href="">+게시판이동</a></div><br>

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
	
	<c:if test="${ empty map.review_list }">
		<td rowspan="6" colspan="6">검색결과가 없습니다.</td>
	</c:if>

	<c:forEach var="vo" begin="0" end="4" step="1" items="${ map.review_list }" >
		<tr>
			
			<td>${ vo.review_no }</td>
			<td class="subject"><a href="#">${ vo.review_title }</td>
			<td>${ vo.review_hit_count }</td>
			<td>${ vo.review_like_count }</td>
			<td>${ vo.mem_nickname }</td>
			<td>${ fn:substring(vo.review_regdate,0,10) }</td>
		</tr>
	</c:forEach>
</table>




</body>
</html>