<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

#login{
	width:  500px;
	height: 500px;
	margin: auto;
	margin-top: 50px;
 	border:  solid red;	 
	border-radius: 10px 10px 10px 10px;
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
#mem_pwd{

	width: 350px;
	border: none;
	border-bottom: 1px solid gray;
	margin-left: 80px;
	margin-top: 60px;
}




#btn_login{

	display: inline-block;
	margin-top: 60px;
	margin-left: 90px;

}
#btn_signup_form{


	
	margin-top: 60px;
}






</style>
</head>
<body>
	<div id="login" >
		<div  id="imgbok" >
			<img alt="이미지없음" src="../img/camp.png">
		</div>
			<h1>login</h1>
		<div id="login_form" >
			<table class="table_login">
				<tr>
					<td><input type="text" id="mem_email" name="mem_email" 
							required="required" placeholder="email"/></td>
				</tr>
				
				<tr>
					<td><input type="text" id="mem_pwd" name="mem_pwd" 
							required="required" placeholder="password"/></td>
				</tr>
			    <tr>
			    	<td ><input  class="btn btn-success "  type="button" id="btn_login" value="login">
			    	<input  class="btn btn-primary "  type="button" id="btn_signup_form" value="signup"></td>
			    </tr>
			
			</table>
		</div>
		
	</div>
</body>
</html>