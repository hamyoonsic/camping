<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- Bootstrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">

#signup{
	width:  500px;
	height: 720px;
	margin: auto;
	margin-top: 50px;
 	border-radius: 10px 10px 10px 10px;
 	border:  solid red ;
	
}
#imgbok{
	width: 100%;
	height: 150px;
	/* border: solid green; */
	display: inline-block;
	margin-right: 19px;
	
} 

#imgbok>img{
 width: 100%;
 border-radius: 10px 10px 0px 0px;



}

h1{
	 margin-left: 80px;
	/*  border: 1px solid blue; */
}


#login_form{
	
   display: inline-block;
   text-align: center;
}



.table_login{
	display: inline-block;
}

#mem_email{
	
	width: 350px;
	border: none;
	border-bottom: 1px solid gray;
	margin-left: 80px; 
	margin-top: 20px;
}
.mem_signup_form{

	width: 350px;
	border: none;
	border-bottom: 1px solid gray;
	margin-left: 80px;
 	margin-top: 45px; 
 	
}




#btn_signup{

	display: inline-block;
	margin-top: 60px;
	margin-left: 90px;

}
#btn_cancel{


	display: inline-block;
	margin-top: 60px;
}






</style>
</head>
<body>
	<!-- <form enctype="multipart/form-data" id="ajaxForm" method="post">
    <input type="file" id="ajaxFile" style="display:none;"  onChange="ajaxFileChange();" >파일이 체인지 되었을시 
	</form> -->
	<div id="signup" >
		<div  id="imgbok" >
			<img alt="이미지없음" src="../img/camp.png">
		</div>
			<h1>signup</h1>
		<div id="signup_form" >
			<table class="table_login">
				<tr>
					
					<td><input type="text" id="mem_email" name="mem_email" 
						 required="required" placeholder="  @를 포함한 email주소를 입력하세요."/></td>
					
				</tr>
				
				<tr>
				
					<td><input type="text" class="mem_signup_form"    id="mem_pwd" name="mem_pwd" 
						required="required" placeholder=" password "/></td>
					
				</tr>
				
				<tr>
				
					<td><input type="text" class="mem_signup_form"   id="mem_nickname" name="mem_nickname" 
							required="required" placeholder=" nickname "/></td>
					
				</tr>
				
				<tr>
				
					<td><input type="text" class="mem_signup_form"    id="mem_birth" name="mem_birth" 
							required="required" placeholder="Social Security Number"/></td>
					
				</tr>
				
				<tr>
					
					<td><input type="file"  class="mem_signup_form"  id="mem_pic" name="mem_pic" value="pic"></td>
					
				</tr>
				
				
				
				<tr>
					
					<td><input type="text"  class="mem_signup_form"   id="mem_profile" name="mem_profile" 
							required="required" placeholder="myprofile"/></td>
					
				</tr>
				
				
				
				
			    <tr>
			    	<td ><input  class="btn btn-success "  type="button" id="btn_signup" value="signup">
			    	<input  class="btn btn-primary "  type="button" id="btn_cancel" value="cancel"></td>
			    </tr>
			
			</table>
		</div>
		
	</div>
</body>
</html>