<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
<style type="text/css">
	
	body{ 
		margin:0; 
		
		font-family:'맑은 고딕', verdana;
	    padding:80px;
	}
	
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
	
	
	.btn {
		float:right;
	
	 }
	
	section> #container { 
		padding:20px 0; 
		border-top:2px solid #eee; 
		border-bottom:2px solid #eee;
		
		margin-left: auto;
		margin-right: auto;
		
		 }
	 
	 aside { 
	 	float:left; 
	 	width:200px; 
	 	}
	
	 div#container_box { 
	 	float:right; 
	 	width:calc(100% - 200px - 20px); 
	 
	 	}
	 	
	 
	 aside>ul>li { 
		 text-align:center; 
		 margin-bottom:10px; 
		
		 }
		 
	
	li { 
			
			font-size:20px; 
			text-align:center; 
			padding:15px;
			
			
			
			}
			
	#category { font-size:30px; 
	 	 		margin-bottom:20px; 
	 	  		text-align:center; 
	 	  		width: 20%;}
	
	li a { 
			color:#000; 
			display:block; 
			padding:10px 0; 
			text-decoration: none;
			}
	
	li a:hover { 
			text-decoration:none; 
			background:#eee; 
			}
			
	.table_list{
	
	
		margin-left: auto;
		margin-right: auto;
		width: 100%;
		
		
	}
	.table_list th {
		font-size:  20px;
		font-weight: bold;
		text-align: center;
		padding: 10px;
		border-bottom: 2px solid #666;
		
	}
	
	
	.table_list tbody td{
		
		text-align:center;
		font-size: 12px;
		border-bottom: 1px solid #e4e4e4;
		
	}
	
	
	.table_list tbody td a  {
		
		text-align:left;
		font-size: 12px;
		height: 33px;
		text-decoration: none;
		color: black;
		
	}
	
	.table_list tbody td a:hover  {
		
		text-decoration: underline;
		
	}
	
	.table_list tbody td img  {
		
		width: 100px;
		
	}
	
	
	#title{
	
		padding-bottom: 70px;
		text-align: center;
		margin: auto;
		font-size: 80px;
	}
	
	
	.page_wrap {
		padding-top: 100px;
		text-align:center;
		font-size:0;
	 }
	 
	
	.page_nation {
		display:inline-block;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation a {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	
	
	.page_nation {
		border:1px solid #ccc;
	}
	.page_nation .first {
		background:#f8f8f8 url('images/page_pprev.png') no-repeat center center;
		margin-left:0;
	}
	.page_nation .prev {
		background:#f8f8f8 url('images/page_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.page_nation .next {
		background:#f8f8f8 url('images/page_next.png') no-repeat center center;
		margin-left:7px;
	}
	.page_nation .last {
		background:#f8f8f8 url('images/page_nnext.png') no-repeat center center;
		margin-right:0;
	}
	.page_nation a:hover, 
	.page_nation a.active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
	
</style>
	
	
	</head>
	<body>
	
	
	<h id="title">member list</h5>
	<div class="top">
		<form method="post" name="search" action="">
			<table class="table_option">
				<tr>
					<td><select class="form-control" name="searchField">
							<option>선택</option>
							<option>등급순</option>
							<option>가입일자</option>
							
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
	
	  
	</div>
	
		 <table  class="table_list">
		 	<thead>
		 		<tr>
		 		   <th>number</th>
		 		   <th>grade</th>
		 		   <th>nickname</th>
		 		   <th>e_mail</th>
		 		   <th>age</th>
		 		   <th>ragdate</th>
		 		</tr>
		 	</thead>
		 	
		 	<tbody>
			 		<c:if test="${empty list }">
			 		<tr>
			 			<td colspan="6" align="center">
			 				<font color="red">등록된 회원이 없습니다</font>
			 			</td>
			 		</tr> 
			 		</c:if>
		 	</tbody>
		 		
		 	<tbody>
		 	   <c:forEach items="${list}" var="vo1">
		
				<tr>
				
					<td>${ vo1.idx }</td>
					<td></td>
					<td>${ vo1.lev_no }</td>
					<td>${ vo1.name }</td>
					<td>${ vo1.id }</td>
					<td>${ vo1.pwd }</td>
					<td>${ vo1.age }</td>
					<td>${ vo1.gender }</td>
					<td style="text-align:center;">${ vo1.email }</td>
					<td>${fn:substring(vo1.regdate,0,10) }</td>
					<td>
						 <div style="text-align:center;"> 
						 <button class="btn btn-outline-dark" onclick="update(this.form);">수정</button>
						 <button class="btn btn-outline-dark" onclick="del('${vo1.id}');">삭제</button>
						</div>
					</td>
				</tr>
		
			    </c:forEach>		
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