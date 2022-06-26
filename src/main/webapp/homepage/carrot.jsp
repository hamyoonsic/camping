<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="carrot.css" rel="stylesheet" type="text/css">

</head>
<body>


<h3 id="title">중고거래장터</h3>
<div class="top">
	<form method="post" name="search" action="">
		<table class="table_option">
			<tr>
				<td><select class="form-control" name="searchField">
						<option>선택</option>
						<option>삽니다</option>
						<option>팝니다</option>
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
	 	<thead>
	 		<tr>
	 		   <th>category</th>
	 		   <th>image</th>
	 		   <th>상품명</th>
	 		   <th>가격</th>
	 		   <th>관심등록</th>
	 		   <th>등록날짜</th>
	 		   <th>닉네임</th>
	 		</tr>
	 	</thead>
	 	
	 	<tbody>
	 		<tr>
	 		  <td>
	 		   <a href="#">
	 		    [팝니다]
	 		    </a>
	 		  </td>
	 		  <td><a href="#">
	 		    <img src="images/sell1.jpg">
	 		    </a>
	 		  </td>
	 		  <td><a href="#">
	 		    의자새거팔아요 재고2개
	 		    </a>
	 		  </td>
	 		  <td>
	 		    150,000웑
	 		  </td>
	 		  <td>
	 		    하트누를수있게..?
	 		  </td>
	 		  <td>
	 		    2022/06/26
	 		  </td>
	 		  <td>
	 		   <a href="#">
	 		    ㅋㅐㅁ핑짱
	 		    </a>
	 		  </td>
	 		</tr>
	 		
	 		<tr>
	 		  <td>
	 		   <a href="#">
	 		    [삽니다]
	 		    </a>
	 		  </td>
	 		  <td>
	 		   <a href="#">
	 		    <img src="images/want1.jpg">
	 		    </a>
	 		  </td>
	 		  <td>
	 		   <a href="#">
	 		    랜턴 흰색상 구해요
	 		     </a>
	 		  </td>
	 		  <td>
	 		    가격제시
	 		  </td>
	 		  <td>
	 		    하트누를수있게..?
	 		  </td>
	 		  <td>
	 		    2022/06/26
	 		  </td>
	 		  <td>
	 		   <a href="#">
	 		    캠핑초보
	 		    </a>
	 		  </td>
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
	



</body>
</html>