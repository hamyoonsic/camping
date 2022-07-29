<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">

	.best_three{
		width	:	1000px;
	}
	
	.best_pic{
		display	:	inline-block;
		width	:	200px;
		height	:	200px;
		overflow: hidden;
		margin: 0 auto;
		
		border:  1px solid  #cccccc ;
		box-shadow: 1px 1px 2px black;
		border-radius: 15px 15px;
		
	}
	
	.best_pic > img	{
		
  		width: 100%;
  		height:100%;
  		object-fit:cover;
  	
  		
	}
	
</style>

</head>
<body>
<div id="best_review_box">
	<div id="best_review_three">
		<div class="best_three">
			<c:forEach var="review_vo" items="${review_list }">
		
			
				<div class="best_pic">
					<img src="${pageContext.request.contextPath}/resources/upload/${review_vo.review_thumbnail}">
				</div>
			
			
			</c:forEach>
		</div>
	</div>
	
	<div id="best_search"></div>
	
	<div id="best_search_box"></div>
</div>
</body>
</html>