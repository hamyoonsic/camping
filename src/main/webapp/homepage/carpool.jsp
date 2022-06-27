<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="carpool.css" rel="stylesheet" type="text/css">

</head>
<body>

<h3 id="title">carpool</h3>
<div class="top">
	<form method="post" name="search" action="">
		<table class="table_option">
			<tr>
				<td><select class="form-control" name="searchField">
						<option>선택</option>
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
  <th>작성자</th>
  <th>작성일</th>
</tr>
</thead>

<tbody>
 <tr>
  <td>1</td>
  <td class="subject"><a href="#">7월2일 토요일 서울 출발 동행구해요</a></td>
  <td>13</td>
  <td>캠핑조아</td>
  <td>2022.06.23</td>
 </tr>
 <tr>
  <td>2</td>
  <td class="subject"><a href="#">동행구함</a></td>
  <td>13</td>
  <td>캠핑짱</td>
  <td>2022.06.23</td>
 </tr>
 <tr>
  <td>3</td>
  <td class="subject"><a href="#">같이가실분</a></td>
  <td>15</td>
  <td>캠핑</td>
  <td>2022.06.23</td>
 </tr>
 <!-- 게시글없는경우 -->
 <tr>
  <td colspan="5">현재 게시글이 없습니다.</td>
 </tr>
</tbody>
</table>
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