<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 3.x -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">

.btn {
  transition: all 0.3s ease;
  background-color: #E3C9D7;
  color: white;
  font: bold;
}
.btn:hover {
   box-shadow:
   -7px -7px 20px 0px #fff9,
   -4px -4px 5px 0px #fff9,
   7px 7px 20px 0px #0002,
   4px 4px 5px 0px #0001;
}


#box {
	width: 800px;
	margin: auto;
	margin-top: 10px;
}

#subject, #regdate {
	border: 1px solid #cccccc;
	box-shadow: 1px 1px 2px black;
	padding: 5px;
	margin-bottom: 10px;
}

#content {
	border: 1px solid #cccccc;
	box-shadow: 1px 1px 2px black;
	padding: 5px;
	min-height: 200px;
	margin-bottom: 10px;
	overflow-wrap: break-word;
}

</style>

<script type="text/javascript">
	function del() {

		if (confirm("정말 삭제 하시겠습니까?") == false)
			return;

		//확인 누르면 삭제하러 가기
		location.href = "carpool_delete.do?carpool_idx=${ vo.carpool_idx }&page=${ param.page }&search=${ param.search }&search_text=${ param.search_text}";

	}

	function modify_form() {

		//수정폼 띄우기
		location.href = "carpool_modify_form.do?carpool_idx=${ vo.carpool_idx }&page=${ param.page }&search=${ param.search }&search_text=${ param.search_text}";

	}
</script>

</head>
<body>
<%@include file="../homepage/nav.jsp" %>
<div id="box">
	<div id="subject">제목:${vo.carpool_title}</div>
	<div id="content">${vo.carpool_content }</div>
	<div id="regdate">닉네임 : ${vo.mem_nickname}<br>작성일자 : ${fn:substring(vo.carpool_regdate,0,10) }</div>
     <div id="holder">
		<button class="btn" 
			onclick="location.href='carpool_list.do?page=${param.page}&search=${ param.search }&search_text=${ param.search_text}';">목록보기</button>
		<!--글쓴이인 경우만 보여 주라   -->
		<c:if test="${user.mem_idx  eq vo.mem_idx}">
			<input class="btn btn-info" type="button" value="수정하기" 
				onclick="modify_form();">
			<input class="btn btn-danger" type="button" value="삭제하기" 
				onclick="del();">
		</c:if>
</div>
</div>
<%@include file="carpool_comment.jsp" %>

</body>
</html>