<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

   #header{
      
      width   :   1920px;
      height   :   100px;
      border   :   1px solid red;
      margin   :   auto;
   }
   
   #content{
      width   :   1920px;
      height   :   1000px;
      border   :   1px solid blue; 
      margin   :   auto;
      
   }
   
   #footer{
   
      width   :   1920px;
      height   :   150px;
      border   :   1px solid green; 
      margin   :   auto;
   
   }

#mem_profile{

	width: 300px;
	height: 300px;
	/* display: inline-block; */
	margin-left: 100px;
	margin-top: 170px;
	border-radius: 70%;
	overflow: hidden;
	float: left;
	
}

#mem_profile>img{

	width: 100%;
	height:100%;
	
	display: inline-block;
	object-fit: cover;
	float: left;
}

.table_mypage{
	border: 1px solid red;
	width: 450px;
	height: 400px;
	
}
.mypage_form{
		width: 250px;
		border: none;
	    border-radius: 10px 10px 10px 10px;
	    box-shadow: 1px 1px 1px 1px #D9D9D9 ;
		height: 30px;



}
.mypage_form_re{
		width: 250px;
		border: none;
	    border-radius: 10px 10px 10px 10px;
	
		height: 30px;



}

#member_form{
	margin-top:180px;
	margin-left:300px;
	text-align:left;
  	width: 50%;
  /* height: 500px; */
  display: inline-block;
  
    float: left;  

 
}



</style>
</head>
<body>
	<!--네이게이션 bar 부분  -->
	<div id="header"></div>

	<div id="content">
		<div id="mem_profile" >
			<img alt="이미지 없음" src="../img/member_profile.png">
		</div>
		<div id="member_form">
			<table class="table_mypage" >
			<tr>
				<td colspan="2" ><input id="grade_icon" class="mypage_form_re" value="grade" readonly="readonly"></td>
			</tr>
			<tr>
				<td colspan="2" ><input class="mypage_form_re"  id="mem_email" value="email" readonly="readonly"></td>
			</tr>
			<tr>
				<td style="width:100px; " >pwd</td>
				<td><input type="password"  class="mypage_form"  name="mem_pwd" id="mem_pwd"></td>
			</tr>
			<tr>
				<td>pwdcheck</td>
				<td><input type="password" class="mypage_form"  name="mem_pwd" id="mem_pwd"></td>
			</tr>
			
			
			<tr>
				
				<td colspan="2"><input type="text" class="mypage_form_re"  name="mem_regdate" id="mem_regdate" value="2022.07.04"></td>
			</tr>
			
			
			</table>
		
		</div>
		
	</div>
		

	<div  id="footer"	>
		
	</div>


</body>
</html>