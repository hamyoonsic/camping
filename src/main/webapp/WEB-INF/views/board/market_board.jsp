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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<!-- 새글쓰기 -->
<script type="text/javascript">

  function  market_insert_form(){
	
	  location.href="market_insert_form.do";
  }
</script>  

 
<!-- 로그아웃 -->
<script type="text/javascript">
	function logout(){
		
		const swalWithBootstrapButtons = Swal.mixin({
			  customClass: {
			    confirmButton: 'btn btn-success',
			    cancelButton: 'btn btn-danger'
			  },
			  buttonsStyling: false
			})

			swalWithBootstrapButtons.fire({
			  title: '로그아웃 하시겠습니까?',
			  text: "버튼을 눌러주세요!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonText: 'Yes!',
			  cancelButtonText: 'No, cancel!',
			  reverseButtons: true
			}).then((result) => {
			  if (result.isConfirmed) {
			    swalWithBootstrapButtons.fire(
			      'logout',
			      '되었습니다!',
			      'success'
			  	
			    ).then(function(){
			    	location.href="${pageContext.request.contextPath}/member/logout.do";
			    });
			  } else if (
			    /* Read more about handling dismissals below */
			    result.dismiss === Swal.DismissReason.cancel
			  ) {
			    swalWithBootstrapButtons.fire(
			      'Cancelled',
			      '취소되었습니다;)',
			      'error'
			    )
			  }
			});
	}	
</script>

<!--  로그인 -->
<script type="text/javascript">

  function  market_login_form(){
	  
	  $(document).ready(function(){
			
			//$("#btn_login_form").click(function(){

			  //로그인 안되었을 시
					if("${empty user}"=="true"){
						Swal.fire({
							  title: 'Login Form',
							  html: `<input type="text" id="login" class="swal2-input" placeholder="Username">
							  <input type="password" id="password" class="swal2-input" placeholder="Password">`,
							  showDenyButton: true,	
							  confirmButtonText: 'Sign in',
							 /*  cancelButtonText:'회원가입', */
							  denyButtonText: '회원가입',
							  focusConfirm: false,
							  preConfirm: () => {
								  
							    const login = Swal.getPopup().querySelector('#login').value
							    const password = Swal.getPopup().querySelector('#password').value
							    if (!login || !password) {
							      Swal.showValidationMessage(`Please enter login and password`)
							    }
							    return { email: login, pwd: password }
							  }
							}).then((result) => {
							  
								if (result.isConfirmed) {
									//console.log(result.value.login)
									var email = result.value.email;
									var pwd= result.value.pwd;
									
									$.ajax({
										
										url: '../member/login.do',
										data:{'mem_email':email,'mem_pwd':pwd},
										dataType:'json',
										success:function(result_data){
											
											// result_data = {'result': 'success'}
											// result_data = {'result': 'fail_email'}
											// result_data = {'result': 'fail_pwd'}
											
											if(result_data.result=='fail_email'){
												Swal.fire('로그인실패!',"email이 존재하지 않습니다",'warning');
												return;
											}else if (result_data.result=='fail_pwd'){
												Swal.fire('로그인 실패!',"passwore가 틀립니다",'error');
												return;
											}else if (result_data.result=='fail_mem_out'){
										
												Swal.fire('로그인 실패!',"탈퇴한 회원입니다.",'error');
												return;
											}
											
											if(result_data.result=='success'){
												Swal.fire({
										            icon: 'success',                         
										            title: result_data.mem_nickname +"님"  ,        
										            text: '환영합니다!'
										        }).then(function(){
										        	location.href="";
										        	
										        });
												
											}
											
										}
									});
								}else if(result.isDenied){
									
									location.href="member/insert_form.do";
								}
								
								
							}); 
						}
					
					});
  			}
</script>


 <!-- 새글쓰기 -->
<script type="text/javascript">

  function  market_insert_form(){
	  
	  if("${ empty user }" != "true"){	
	    
		 location.href="market_insert_form.do"; 	
	
	 
	  } 
	   
  }//end function
  
</script>  




<!-- 검색페이징 -->
<script type="text/javascript">
	
	function search() {
		
		var search = $("#search").val();
		var search_text = $("#search_text").val().trim();
		
		//전체검색이 아닌경우
		if(search != 'market_all' && search_text == ''){
			alert('검색어를 입력하세요!!');
			$("#search_text").val('');
			$("#search_text").focus();
			return;
		}
		
		location.href="market_list.do?search=" + search + "&search_text=" + encodeURIComponent(search_text);
		
	
	}

	$(function(){
		
		if("${ not empty param.search }"=="true"){
			$("#search").val('${param.search}');
		}
		
		//전체 검색이 실행시 검색어를 지우기
		if("${ param.search eq 'market_all' }"=="true"){
			$("#search_text").val('');
		}
		
	}); 

</script>

</head>
<body>
<%@include file="../homepage/nav.jsp" %> 
<h3 id="title">Market</h3>
<div><a href="">사진리뷰만 보이게 하는 게시판으로 가는 링크</a></div><br>
<div class="top">
	<!-- <form method="post" name="search" action=""> -->
		<table class="table_option">
			<tr>
				<td><select class="form-control" id="search" name="searchField" style="font-size:16px;">
						<option value="market_all">전체보기</option>
						<option value="market_title">제목</option>
						<option value="market_content">내용</option>
						<option value="mem_nickname">작성자</option>
						<option value="market_title_market_content_mem_nickname">제목+작성자+내용</option>
				</select></td>
				<td>
				  <input type="text" class="form-control"
					     placeholder="검색어 입력" name="searchText" id="search_text" value="${ param.search_text }" maxlength="100">
				</td>
				<td>
				  <button type="button" class="btn-search" onclick="search();">검색</button>
				</td>
			</tr>

		</table>
	<!-- </form> -->
	
	
<!-- 로그인 안되었을 시 -->	
<c:if test="${ empty user }">
  <input class="btn" type="button" value="글쓰기"
		 onclick="market_login_form();">
</c:if>

<!-- 로그인 되었을 시 -->	
<c:if test="${ not empty user }">		
  <input class="btn" type="button" value="글쓰기"
		 onclick="market_insert_form();">
</c:if> 
		 
		 
  
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
 <c:forEach var="vo" items="${ list }">
		<tr>
			<td>${ vo.market_no }</td>
			<td class="subject"><a href="market_view.do?market_idx=${vo.market_idx }&page=${ empty param.page ? 1 : param.page}&search=${ param.search }&search_text=${ param.search_text}">${ vo.market_title }</td>
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
          ${ pageMenu }
   </div>
</div>
</body>
</html>