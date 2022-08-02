<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script type="text/javascript">

   function send(f){ // f = this.form
	   

       //var content = f.content.value.trim();
       //CKEditor 설정 후엔 입력값 체크를 다시 해줘야함
       var msg_content = document.getElementById('InputText').value;

       if(msg_content==''){
    	   alert('내용을 입력하세요');
    	   f.msg_content.value='';
    	   f.msg_content.focus();
    	   return;
       }
       
	   f.action = "all_msg_insert.do";
	   f.submit();//전송
	   
	   
   }


</script>  
</head>
<body>
 
    
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-9 main-chart">
            <!--CUSTOM CHART START -->
            <div class="border-head">
              <h3>최근 7일간 방문자 수</h3>
            </div>
            <div class="custom-bar-chart">
              <ul class="y-axis">
                <li><span>25</span></li>
                <li><span>20</span></li>
                <li><span>15</span></li>
                <li><span>10</span></li>
                <li><span>5</span></li>
                <li><span>0</span></li>
              </ul>
             <c:forEach var="vo" items="${ list }" begin="0" end="6">
	              <div class="bar">
	                <div class="title">${vo.visit_time}</div>
	                <div class="value tooltips" data-original-title='${vo.cnt}' data-toggle="tooltip" data-placement="top">${vo.cnt*4}%</div>
	              </div>
             </c:forEach>
            
              </div>
             
         
            <div class="row">
              <!-- WEATHER PANEL -->
              <div class="col-md-4 mb">
                <div class="weather pn">
                  <i class="fa fa-cloud fa-4x"></i>
                  <h2>28º C</h2>
                  <h4>서울</h4>
                </div>
              </div>
              <!-- /col-md-4-->
              <!-- DIRECT MESSAGE PANEL -->
              <div class="col-md-8 mb">
                <div class="message-p pn">
                  <div class="message-header">
                    <h5>전체메세지 보내기</h5>
                  </div>
                  <div class="row">
                   
                    <div class="col-md-9">
                      <p>
                       <p>공지<p>
                        전 회원에게 쪽지보내기
                      </p>
                      <form class="form-inline" role="form">
                        <div class="form-group">
                          <input type="text" class="form-control" id="InputText" placeholder="내용을 입력하세요.">
                        </div>
                         <input  class="btn  btn-default" type="button"  value="보내기"
		                             onclick="send(this.form);">
                      </form>
                    </div>
                  </div>
                </div>
                <!-- /Message Panel-->
              </div>
              <!-- /col-md-8  -->
            </div>
            <div class="row">
             
              </div>
              <!-- /col-md-4 -->
          
            </div>
            </div>
	  </section>
	    </section>
    <!--main content end-->
     <!-- js placed at the end of the document so the pages load faster -->
  <script src="../resources/lib/jquery/jquery.min.js"></script>

  <script src="../resources/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="../resources/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="../resources/lib/jquery.scrollTo.min.js"></script>
  <script src="../resources/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="../resources/lib/jquery.sparkline.js"></script>
  <!--common script for all pages-->
  <script src="../resources/lib/common-scripts.js"></script>
  <script type="text/javascript" src="../resources/lib/gritter/js/jquery.gritter.js"></script>
  <script type="text/javascript" src="../resources/lib/gritter-conf.js"></script>
  <!--script for this page-->
  <script src="../resources/lib/sparkline-chart.js"></script>
  <script src="../resources/lib/zabuto_calendar.js"></script>
  


</body>
</html>