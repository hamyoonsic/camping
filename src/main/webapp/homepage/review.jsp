<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="nav.jsp" %>

    
<!DOCTYPE html>
<html>
<head>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="review.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body style="margin: 0">

	<div class="wrap2">
		
		<div class="intro_bg2">
			<div class="intro_text2">
				<h1> REVIEW </h1><h3><a href="join.jsp">MORE+</a></h3>
			</div>
				<h2>이 달의 best review를 소개합니다.</h2>
			</div>
		</div>

<div class="row">			
	<div class="col">
		<div class="card" style="width: 25rem;">
		  <img class="big" src="images/rec1.jpg" class="card-img-top" >
		  <div class="card-body">
		    <h5 class="card-title">강아지와 캠핑</h5>
		    <a href="#" class="btn btn-primary">MORE</a>
		  </div>
		    <img class="small" src="images/camping1.png" >
		    <a class="profile" href="#">won</a>
		</div>
	</div>
	<div class="col">
		<div class="card" style="width: 25rem;">
		  <img class="big" src="images/rec2.jpg" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">카풀망했네</h5>
		    <a href="#" class="btn btn-primary">MORE</a>
		  </div>
		  <img class="small" src="images/camping1.png" >
		  <a class="profile" href="#">two</a>
		</div>
	</div>
	<div class="col">
		<div class="card" style="width: 25rem;">
		  <img class="big" src="images/rec3.jpg" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">캠핑카 개시했어요</h5>
		    <a href="#" class="btn btn-primary">MORE</a>
		</div>
		<img class="small" src="images/camping1.png" >
		<a class="profile" href="#">go캠핑</a>
	</div>
	</div>
</div>
</body>
</html>