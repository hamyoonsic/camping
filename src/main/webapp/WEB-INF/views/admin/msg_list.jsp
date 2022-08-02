<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<style type="text/css">
   #box{
       width: 500px;
       margin: auto;
       margin-top: 10px;
       
       
       
   }
   
   #title{
       font-weight: bold;
       font-size: 30px;
       font-family: 휴먼옛체,굴림체,궁서체;
       text-align: center;
       text-shadow: 1px 1px 1px black;
       color: #3366ff;
   }
   
   .content_type{
      
      padding: 5px;
      min-height: 60px;
      
      border: 1px solid gray;
      box-shadow: -1px -1px 1px #555555;
      text-shadow: none;
      color: black;
      
      overflow: hidden;
   
   }
   
</style>

<script type="text/javascript">
   
   function del(f){ // f =this.form
	   
	   var msg_idx   = f.msg_idx.value; //게시물번호
      
	   if(confirm("정말 삭제하시겠습니까?")==false)return;
	   
	   //삭제수행
	   location.href='msg_delete.do?msg_idx=' + msg_idx;
    	 
   }

 
   function search() {
	
	   var search 		= $("#search").val();
	   var search_text	= $("#search_text").val().trim();
	   var mem_nickname = 123;
	   //전체검색이 아닌경우
	   if(search != 'all' && search_text==''){
		   
		   alert('검색어를 입력하세요.');
		   $("#search_text").val('');
		   $("#search_text").focus();
		   return;
	   }
	   
	   //검색내용을 parameter로 목록보기(list.do)로 요청
	   location.href="msg_list.do?mem_nickname="+ mem_nickname +"&search="+ search + "&search_text=" + encodeURIComponent(search_text);
	   //location.href=""; <- 리프레시 효과
	   
}
   
   
</script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		if("${ not empty param.search }"=="true"){
			$("#search").val('${param.search}');
		}
		
		//전체검색 실행시 검색어 지우기
		if("${ param.search == 'all' }"=="true"){
			$("#search_text").val('');
		}
		
		
	});
	
</script>

  
  
</head>
<body>
	<div id="box">
	
	   <h1 id="title">쪽지함</h1>
	   <div style="margin-top: 10px; margin-bottom: 10px; text-align: right;">
	      <input class="btn btn-primary"  type="button" value="쪽지보내기" 
	             onclick="location.href='msg_insert_form.do'">
	   </div>
	   
	   <!-- 검색메뉴 -->
	   <div style="text-align: center;  margin: 10px;">
	      <select id="search" value="${param.search}">
	          <option value="all">전체</option>
	          <option value="msg_sender">이름</option>
	          <option value="msg_content">내용</option>
	          <option value="name_content">이름+내용</option>
	      </select>   
	      <input id="search_text" value="${param.search_text}">
	      <input type="button"  value="검색"  onclick="search();">
	   </div>
	   
	   
	   <!-- 게시물이 없으면 -->
	   <c:if test="${ empty list }">
	      <div id="empty_message">쪽지가 없습니다</div>
	   </c:if>
	   
	   <!-- 데이터가 있으면-->
	   <!-- for(VisitVo vo : list) -->
	   <c:forEach var="vo"  items="${ list }">
	       
	      <form>
	        <input type="hidden"  name="msg_idx"  value="${ vo.msg_idx }"> 
	        
	        <div class="panel panel-primary">
		      <div class="panel-heading"><h4>${ vo.msg_sender }님이 보내신 쪽지</h4></div>
		      <div class="panel-body">
		         <div class="content_type">${ vo.msg_content }</div>
		         <div class="regdate_type">보낸날짜 : ${ fn:substring(vo.msg_sendtime,0,16) }
		         
		                     <input class="btn btn-danger btn-xs" type="button"   value="삭제" 
		                            onclick="del(this.form);">  
		         </div>
		      </div>
		    </div>
	      </form>
	       
	   </c:forEach>
	   
	   
	   
	</div>
</body>
</html>



