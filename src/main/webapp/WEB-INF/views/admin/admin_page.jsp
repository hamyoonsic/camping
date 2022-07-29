<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
 <!--  <title>Dashio - Bootstrap Admin Template</title> -->

  
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


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<script type="text/javascript">

	$(function(){
		 $.ajax({
			  
			  url		:	"dashboard.do",
			  
			  success	:	function(res_data){
				  // res_data-> comment_list.jsp의 html 내용
				  $("#disp").html(res_data);
				  
			  },
			  error		:	function(err){
				  alert(err.responseText);
			  }
		  });
		
		
	});

</script>



<!-- 카풀 -->
<script type="text/javascript">

function carpool_list(carpool_page){
	  
	  $.ajax({
		  
		  url		:	"../admin/carpool_list.do",
		  data		:	{"carpool_no":"${ vo.carpool_no }",
						 "carpool_title" :"${vo.carpool_title}",
						 "carpool_hit_count":"${vo.carpool_hit_count}",
						 "carpool_like_count":"${vo.carpool_like_count}",
						 "mem_nickname":"${mem_nickname}",
						 "carpool_regdate":"${carpool_regdate}",
						 "page":carpool_page
						 
		  },
		  success	:	function(res_data){
			  // res_data-> comment_list.jsp의 html 내용
			  $("#disp").html(res_data);
			  
		  },
		  error		:	function(err){
			  alert(err.responseText);
		  }
	  });
}// end:

</script>

<!-- 마켓 -->
<script type="text/javascript">

function market_list(market_page){
	  
	  $.ajax({
		  
		  url		:	"../admin/market_list.do",
		  data		:	{"market_no":"${ vo.market_no }",
						 "market_title" :"${vo.market_title}",
						 "market_hit_count":"${vo.market_hit_count}",
						 "market_like_count":"${vo.market_like_count}",
						 "mem_nickname":"${mem_nickname}",
						 "market_regdate":"${market_regdate}",
						 "page":market_page
						 
		  },
		  success	:	function(res_data){
			  // res_data-> comment_list.jsp의 html 내용
			  $("#disp").html(res_data);
			  
		  },
		  error		:	function(err){
			  alert(err.responseText);
		  }
	  });
}// end:

</script>

<!-- 리뷰 -->
<script type="text/javascript">

function review_list(review_page){
	  
	  $.ajax({
		  
		  url		:	"../admin/review_list.do",
		  data		:	{"review_no":"${ vo.review_no }",
						 "review_title" :"${vo.review_title}",
						 "review_hit_count":"${vo.review_hit_count}",
						 "review_like_count":"${vo.review_like_count}",
						 "mem_nickname":"${mem_nickname}",
						 "review_regdate":"${review_regdate}",
						 "page":review_page
						 
		  },
		  success	:	function(res_data){
			  // res_data-> comment_list.jsp의 html 내용
			  $("#disp").html(res_data);
			  
		  },
		  error		:	function(err){
			  alert(err.responseText);
		  }
	  });
}// end:

</script>


<!-- 멤버 -->
<script type="text/javascript">

function member_list(member_page){
	  
	  $.ajax({
		  
		  url		:	"../admin/member_list.do",
		  data		:	{"member_no":"${ vo.mem_idx }",
						 "member_title" :"${vo.member_title}",
						 "member_hit_count":"${vo.member_hit_count}",
						 "member_like_count":"${vo.member_like_count}",
						 "mem_nickname":"${mem_nickname}",
						 "member_regdate":"${member_regdate}",
						 "page":member_page
						 
		  },
		  success	:	function(res_data){
			  // res_data-> comment_list.jsp의 html 내용
			  $("#disp").html(res_data);
			  
		  },
		  error		:	function(err){
			  alert(err.responseText);
		  }
	  });
}// end:

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
             <!--  <li>
                <a href="index.html#">
                  <div class="task-info">
                    <div class="desc">Dashio Admin Panel</div>
                    <div class="percent">40%</div>
                  </div>
                  <div class="progress progress-striped">
                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                      <span class="sr-only">40% Complete (success)</span>
                    </div>
                  </div>
                </a>
              </li>
              <li>
                <a href="index.html#">
                  <div class="task-info">
                    <div class="desc">Database Update</div>
                    <div class="percent">60%</div>
                  </div>
                  <div class="progress progress-striped">
                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                      <span class="sr-only">60% Complete (warning)</span>
                    </div>
                  </div>
                </a>
              </li>
              <li>
                <a href="index.html#">
                  <div class="task-info">
                    <div class="desc">Product Development</div>
                    <div class="percent">80%</div>
                  </div>
                  <div class="progress progress-striped">
                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                      <span class="sr-only">80% Complete</span>
                    </div>
                  </div>
                </a>
              </li>
              <li>
                <a href="index.html#">
                  <div class="task-info">
                    <div class="desc">Payments Sent</div>
                    <div class="percent">70%</div>
                  </div>
                  <div class="progress progress-striped">
                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                      <span class="sr-only">70% Complete (Important)</span>
                    </div>
                  </div>
                </a>
              </li> 
              <li class="external">
                <a href="#">See All Tasks</a>
              </li>-->
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
             <!--  <li>
                <a href="index.html#">
                  <span class="photo"><img alt="avatar" src="img/ui-zac.jpg"></span>
                  <span class="subject">
                  <span class="from">Zac Snider</span>
                  <span class="time">Just now</span>
                  </span>
                  <span class="message">
                  Hi mate, how is everything?
                  </span>
                  </a>
              </li>
              <li>
                <a href="index.html#">
                  <span class="photo"><img alt="avatar" src="img/ui-divya.jpg"></span>
                  <span class="subject">
                  <span class="from">Divya Manian</span>
                  <span class="time">40 mins.</span>
                  </span>
                  <span class="message">
                  Hi, I need your help with this.
                  </span>
                  </a>
              </li>
              <li>
                <a href="index.html#">
                  <span class="photo"><img alt="avatar" src="img/ui-danro.jpg"></span>
                  <span class="subject">
                  <span class="from">Dan Rogers</span>
                  <span class="time">2 hrs.</span>
                  </span>
                  <span class="message">
                  Love your new Dashboard.
                  </span>
                  </a>
              </li>
              <li>
                <a href="index.html#">
                  <span class="photo"><img alt="avatar" src="img/ui-sherman.jpg"></span>
                  <span class="subject">
                  <span class="from">Dj Sherman</span>
                  <span class="time">4 hrs.</span>
                  </span>
                  <span class="message">
                  Please, answer asap.
                  </span>
                  </a>
              </li>
              <li>
                <a href="index.html#">See all messages</a>
              </li>
            </ul>
          </li>
          inbox dropdown end
          notification dropdown start
          <li id="header_notification_bar" class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
              <i class="fa fa-bell-o"></i>
              <span class="badge bg-warning">7</span>
              </a>
            <ul class="dropdown-menu extended notification">
              <div class="notify-arrow notify-arrow-yellow"></div>
              <li>
                <p class="yellow">You have 7 new notifications</p>
              </li>
              <li>
                <a href="index.html#">
                  <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                  Server Overloaded.
                  <span class="small italic">4 mins.</span>
                  </a>
              </li>
              <li>
                <a href="index.html#">
                  <span class="label label-warning"><i class="fa fa-bell"></i></span>
                  Memory #2 Not Responding.
                  <span class="small italic">30 mins.</span>
                  </a>
              </li>
              <li>
                <a href="index.html#">
                  <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                  Disk Space Reached 85%.
                  <span class="small italic">2 hrs.</span>
                  </a>
              </li>
              <li>
                <a href="index.html#">
                  <span class="label label-success"><i class="fa fa-plus"></i></span>
                  New User Registered.
                  <span class="small italic">3 hrs.</span>
                  </a>
              </li>
              <li>
                <a href="index.html#">See all notifications</a>
              </li>
            </ul>
          </li> -->
          <!-- notification dropdown end -->
        </ul>
        <!--  notification end -->
      </div>
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="login.html">Logout</a></li>
        </ul>
      </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="profile.html"><img src="../resources/img/ui-sam.jpg" class="img-circle" width="80"></a></p>
          <h5 class="centered">관리자임당</h5>
          <li class="mt">
            <a class="active" href="/camping/admin/admin_page.do">
              <i class="fa fa-dashboard"></i>
              <span>Dashboard</span>
              </a>
          </li>
     
          <li class="sub-menu">
            <a href="#" onclick="carpool_list();">
              <i class="fa fa-th"></i>
              <span>카풀 게시판</span>
              </a>
          </li>
     
          <li class="sub-menu">
            <a href="#" onclick="market_list();">
              <i class="fa fa-th"></i>
              <span>마켓 게시판</span>
              </a>
          </li>
     
          <li class="sub-menu">
            <a href="#" onclick="review_list();">
              <i class="fa fa-th"></i>
              <span>리뷰 게시판</span>
              </a>
          </li>
        
          <li class="sub-menu">
            <a href="#" onclick="member_list();">
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

    <div id="disp"></div>
 <!--    <div id="market"></div>
    <div id="review"></div>
    <div id="mamber"></div> -->


<%-- <%@ include file="admin_dashbord.jsp" %> --%>
<div><%@ include file="admin_footer.jsp" %></div>
 

</body>

</html>
