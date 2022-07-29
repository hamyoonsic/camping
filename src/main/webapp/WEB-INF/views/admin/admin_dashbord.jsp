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
              <h3>6개월간 방문자 수</h3>
            </div>
            <div class="custom-bar-chart">
              <ul class="y-axis">
                <li><span>500</span></li>
                <li><span>400</span></li>
                <li><span>300</span></li>
                <li><span>200</span></li>
                <li><span>100</span></li>
                <li><span>0</span></li>
              </ul>
              <div class="bar">
                <div class="title">2월</div>
                <div class="value tooltips" data-original-title="8.500" data-toggle="tooltip" data-placement="top">85%</div>
              </div>
              <div class="bar">
                <div class="title">3월</div>
                <div class="value tooltips" data-original-title="8.500" data-toggle="tooltip" data-placement="top">85%</div>
              </div>
              <div class="bar ">
                <div class="title">4월</div>
                <div class="value tooltips" data-original-title="5.000" data-toggle="tooltip" data-placement="top">50%</div>
              </div>
              <div class="bar ">
                <div class="title">5월</div>
                <div class="value tooltips" data-original-title="6.000" data-toggle="tooltip" data-placement="top">60%</div>
              </div>
              <div class="bar ">
                <div class="title">6월</div>
                <div class="value tooltips" data-original-title="4.500" data-toggle="tooltip" data-placement="top">45%</div>
              </div>
              <div class="bar">
                <div class="title">7월</div>
                <div class="value tooltips" data-original-title="3.200" data-toggle="tooltip" data-placement="top">32%</div>
              </div>
              <div class="bar ">
                <div class="title">8월</div>
                <div class="value tooltips" data-original-title="6.200" data-toggle="tooltip" data-placement="top">62%</div>
              </div>
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
                        <name>공지</name>
                        전 회원에게 쪽지보내기
                      </p>
                      <form class="form-inline" role="form">
                        <div class="form-group">
                          <input type="text" class="form-control" id="exampleInputText" placeholder="내용을 입력하세요.">
                        </div>
                        <button type="submit" class="btn btn-default">Send</button>
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
	  </section>
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
  

<%@ include file="admin_footer.jsp" %>  
</body>
</html>