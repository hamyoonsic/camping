<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
    
<html>

<head>
<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<link href="/css/test/test.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <!-- Bootstrap core CSS -->
  <link href="../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="../resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="../resources/css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="../resources/lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="../resources/css/style.css" rel="stylesheet">
  <link href="../resources/css/style-responsive.css" rel="stylesheet">
  <script src="../resources/lib/chart-master/Chart.js"></script>
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