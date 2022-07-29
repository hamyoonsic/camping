<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

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


<!-- 검색페이징 -->
<script type="text/javascript">
	
	function search() {
		
		var search = $("#search").val();
		var search_text = $("#search_text").val().trim();
		
		//전체검색이 아닌경우
		if(search != 'member_all' && search_text == ''){
			alert('검색어를 입력하세요!!');
			$("#search_text").val('');
			$("#search_text").focus();
			return;
		}
		
		location.href="member_list.do?search=" + search + "&search_text=" + encodeURIComponent(search_text);
		
	
	}

	$(function(){
		
		if("${ not empty param.search }"=="true"){
			$("#search").val('${param.search}');
		}
		
		//전체 검색이 실행시 검색어를 지우기
		if("${ param.search eq 'member_all' }"=="true"){
			$("#search_text").val('');
		}
		
	}); 

</script>

<!-- 등급수정폼 -->   
<script type="text/javascript">

	function change() {
		
		location.href="../admin/grade_change.do";
		
	}



</script>   
  
  <!--베스트리뷰 고르기  -->
<script type="text/javascript">

	function best_list(){
		 $.ajax({
			  
			  url		:	"../admin/admin_best_list.do",
							 
			  
			  success	:	function(res_data){
				  // res_data-> comment_list.jsp의 html 내용
				  $("#disp").html(res_data);
				  
			  },
			  error		:	function(err){
				  alert(err.responseText);
			  }
		  });
		
	}

</script>


</head>

<body>
  <section id="container">

    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="/camping/" class="logo"><b>HOME</b></a>
      <!--logo end-->
      <div class="nav notify-row" id="top_menu">
        <!--  notification start -->
        <ul class="nav top-menu">
          <!-- settings start -->
          <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" >
              <i class="fa fa-tasks">신규회원</i>
              <span class="badge bg-theme">8</span>
              </a>
            <ul class="dropdown-menu extended tasks-bar">
              <div class="notify-arrow notify-arrow-green"></div>
              <li>
                <p class="green">신규회원이 8명 가입했습니다.</p>
              </li>
       
            </ul>
          </li>
          <!-- settings end -->
          <!-- inbox dropdown start-->
          <li id="header_inbox_bar" class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
              <i class="fa fa-envelope-o">등업회원</i>
              <span class="badge bg-theme">3</span>
              </a>
            <ul class="dropdown-menu extended inbox">
              <div class="notify-arrow notify-arrow-green"></div>
              <li>
                <p class="green">등업이 필요한 회원이 3명있습니다.</p>
              </li>
  
        </ul>
        <!--  notification end -->
      </div>
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="login.html">Logout</a></li>
        </ul>
      </div>
    </header>
  
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="profile.html"><img src="../resources/img/ui-sam.jpg" class="img-circle" width="80"></a></p>
          <h5 class="centered">관리자임당</h5>
          <li class="mt">
            <a  href="/camping/admin/admin_page.do">
              <i class="fa fa-dashboard"></i>
              <span>Dashboard</span>
              </a>
          </li>
     
          <li class="sub-menu">
            <a href="carpool_list.do">
              <i class="fa fa-th"></i>
              <span>카풀 게시판</span>
              </a>
          </li>
     
          <li class="sub-menu">
            <a href="market_list.do" >
              <i class="fa fa-th"></i>
              <span>마켓 게시판</span>
              </a>
          </li>
     
          <li class="sub-menu">
            <a href="review_list.do" >
              <i class="fa fa-th"></i>
              <span>리뷰 게시판</span>
              </a>
          </li>
        
          <li class="sub-menu">
            <a href="#" class="active">
              <i class="fa fa-th"></i>
              <span>멤버리스트</span>
              </a>
          </li>
          
          <li class="sub-menu">
            <a href="#" onclick="best_list();">
              <i class="fa fa-th"></i>
              <span>베스트리뷰</span>
              </a>
          </li>
        </ul>
        <!-- sidebar menu end-->
      
      </div>
    </aside>
    <!--sidebar end-->

  <!--main content start-->
<section id="main-content">
 <section class="wrapper">
  <div class="row">
	<div class="container">
		<h1>Member_list</h1>
		<div class="testlist">
			<form id="boardForm" name="boardForm" method="post">
				<table class="table table-hover">
					<colgroup>
						<col width="10%" />
						<col width="28%" />
						<col width="10%" />
						<col width="10%" />
						<col width="15%" />
						<col width="15%" />
						<col width="20%" />
					</colgroup>
					

				   <div class="page_nation">
				    <a href="#" onclick="paging();">
				         ${ pageMenu }
				      </a>   
					 </div>
					<thead>
						<tr>
							<th>number</th>
			                <th>grade</th>
			                <th>nickname</th>
			                <th>e_mail</th>
			                <th>birth</th>
			                <th>regdate</th>
						</tr>
					</thead>
					  <c:if test="${ empty list }">
			             <tr>
			                <td colspan="7" align="center">
			                   검색 회원이 없습니다.
			                </td>
			             </tr>
			          </c:if>
					<c:forEach var="vo" items="${ list }">
					<tr>
						   <td>${ vo.mem_idx }</td>
			               <td>${ vo.grade_idx}</td>
			               <td>${ vo.mem_nickname }</td>
			               <td>${ vo.mem_email }</td>
			               <td>${ vo.mem_birth }</td>
			               <td>${fn:substring(vo.mem_regdate,0,10) }</td>
					</tr>
				</c:forEach>
					<tbody id="dataSection"></tbody>
				</table>
			</form>
		</div>
			<div>
				<button class="btn btn-sm" onclick="change();">회원 정보 수정</button>
			</div>
		</div>
</section>
</section>
	
		<!-- pagination{s} -->
		<div class="pagination1">
			<ul id="paginationBox" class="pagination">
				
			</ul>
		</div>
		<!-- pagination{e} -->

		<!-- search{s} -->

		<div class="form-group row justify-content-center">

			<div class="w100" style="padding-left: 10px">
				<select class="form-control form-control-sm" name="searchField" id="search">
						<option value="member_all">전체보기</option>
						<option value="grade_idx">등급별</option>
						<option value="mem_regdate">가입일자</option>
				</select>
			</div>

			<div class="w300" style="padding-right: 10px">
				<input type="text" class="form-control form-control-sm"
					name="search_text" id="search_text" value="${ param.search_text }">
			</div>

			<div>
				<button class="btn btn-sm btn-primary" name="btnSearch"
					id="btnSearch" onclick="search();">검색</button>
			</div>
		</div>


		
</body>


</html>