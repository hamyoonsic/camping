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

#main_box{
	width	:	100%;
	background-color: #14870c;

}


#signup{
	width:  500px;
	height: 720px;
	margin: auto;
	/* margin-top: 50px; */
 	border-radius: 10px 10px 10px 10px;
 	/* border:  solid red ; */
 	background-color: white;
	
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
	
	width: 230px;
	border: none;
	border-bottom: 1px solid gray;
	margin-left: 80px; 
	margin-top: 20px;
}
.mem_signup_form{

	width: 250px;
	border: none;
	border-bottom: 1px solid gray;
	margin-left: 80px;
 	margin-top: 25px; 
 	
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

.badge{
	
	margin-top: 100px;
	
}




</style>

<script type="text/javascript">

var regular_email =/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
var regular_nickname = /^[.]{1,20}$/ ;

$(document).ready(function(){
	
	
	$("#mem_email").keyup(function(event){
		
		var mem_email =$(this).val();
		console.log(mem_email);
		
		if(regular_email.test(mem_email)==false){
			
			$("#email_msg").html("@가 들어가야 합니다")
		    .css("color","red");

			//가입하기 버튼 비활성화
			$("#btn_signup").attr("disabled",true);
			
			
			return;
						
			
		}
		
	 	$.ajax({
				url		:'check_email.do',
				data	:{'mem_email':mem_email},
				dataType:'json',
				success :function(res_data){
				if(res_data.result){
					$("#email_msg").html("사용가능한 이메일입니다")
					.css("color","blue");
					
					$("#btn_signup").attr("disabled",false);
					
				}else{
					
					$("#email_msg").html("이미 사용중이 이메일입니다")
					.css("color","red");
					$("#btn_signup").attr("disabled",true);
				}
			
	 	},
	 	 error:function(err){
	 		 alert(err.responseText);
	 	 }
			
		});
	 	
	});
	 	
//-------------------------------------------------------------------------------------------
		$("#mem_nickname").keyup(function(event){
			
			var mem_nickname =$(this).val();
			console.log(mem_nickname);
			
			if(regular_nickname.test(mem_nickname)==false){
				
				$("#nickname_msg").html("1~20자 이내 사용가능")
			    .css("color","red");

				//가입하기 버튼 비활성화
				$("#btn_signup").attr("disabled",true);
				
				
				return;
							
				
			}
			
			 	$.ajax({
						url		:'check_nickname.do',
						data	:{'mem_nickname':mem_nickname},
						dataType:'json',
						success :function(res_data){
						if(res_data.result_nickname){
							$("#nickname_msg").html("사용가능한 닉네임입니다")
							.css("color","blue");
							
							$("#btn_signup").attr("disabled",false);
							
						}else{
							
							$("#nickname_msg").html("이미 사용중이 닉네임입니다")
							.css("color","red");
							$("#btn_signup").attr("disabled",true);
						}
					
			 	},
			 	 error:function(err){
			 		 alert(err.responseText);
			 	 }
			 	
					
			});
	});		 	
		
//------------------------------------------------------------------------------------------		
	
	$(".badge").click(function(){
		
		$("#imageFile").click();
	});
	
	
	$("#imageFile").on("change", function(event) {

	    var file = event.target.files[0];

	    var reader = new FileReader(); 
	    reader.onload = function(e) {

	        $("#preview").attr("src", e.target.result);
	    }

	    reader.readAsDataURL(file);
	});
	


});	
	

</script>	


<script type="text/javascript">	
/* 체크  */
function send(f) {
		
		var regular_birth = /[0-9]{4}(0?[1-9]|1[012])(0?[1-9]|[12][0-9]|3[01])/;
	
		//입력값 체크(이름/비번/우편번호/주소)
		var mem_email 	  		= f.mem_email.value.trim();
		var mem_pwd	  			= f.mem_pwd.value.trim();
		var mem_nickname 		= f.mem_nickname.value.trim();
		var mem_birth	  		= f.mem_birth.value.trim();
		var mem_pic          	= f.mem_pic.value; 
		var mem_profile 		= f.mem_profile.value.trim();
		
		if(mem_email == ''){
			alert('email을 입력하세요');
			f.mem_email.value='';
			f.mem_email.focus();
			return;
		}
		
		
		if(mem_pwd == ''){
			alert('비밀번호를 입력하세요');
			f.mem_pwd.value='';
			f.mem_pwd.focus();
			return;
		}
		
		
		if(mem_nickname == ''){
			alert('닉네임을 입력하세요');
			f.mem_nickname.value='';
			f.mem_nickname.focus();
			return;
		}
		
		if(!regular_birth.test(mem_birth)){
			alert('생년월일 8자리를  입력하세요');
			f.mem_birth.value='';
			f.mem_birth.focus();
			return;
		}
		
		
		/* if(mem_pic_filename == ''){
			alert('사진을 넣어주세요');
			
			return;
		}
		 */
		
		if(mem_profile == ''){
			alert('내용을 넣어주세요');
			f.mem_profile.value='';
			f.mem_profile.focus();
			return;
		}
		
		
		f.action = "insert.do"; // MemberInsertAction
		f.submit(); 
	}
	
</script>


</head>
<body>
<div id="main_box">
	<!-- <form enctype="multipart/form-data" id="ajaxForm" method="post">
    <input type="file" id="ajaxFile" style="display:none;"  onChange="ajaxFileChange();" >파일이 체인지 되었을시 
	</form>  -->
	
	<div id="signup" >
		<div  id="imgbok" >
			<img alt="이미지없음" src="${ pageContext.request.contextPath }/resources/img/camp.png" >
			
		</div>
		<div class="container">         
			  <img id="preview"  src="${ pageContext.request.contextPath }/resources/images/unsplash_people/people1.jpg" class="img-circle" alt="Cinque Terre"  width="124" height="116">
			  <span class="badge"><img src="${ pageContext.request.contextPath }/resources/images/heart-1.png" width="20px" height="20px"></span>
			</div>
					
		      <!--  <a href="#">News <span class="badge">5</span></a><br> -->
		<form method="POST"  enctype="multipart/form-data">
		 <input type="file" id="imageFile" style="display:none;" name="mem_pic" onChange="ajaxFileChange();">
			
			<h1>signup</h1>
		<div id="signup_form" >
			<table class="table_login">
				<tr>
					
					<td><input type="text" id="mem_email" name="mem_email" 
						 required="required" placeholder="email주소를 입력하세요.">
						<span id="email_msg"></span>						
						 </td>
					
				</tr>
				
				<tr>
				
					<td><input type="password" class="mem_signup_form"    id="mem_pwd" name="mem_pwd" 
						required="required" placeholder=" password "/></td>
					
				</tr>
				
				<tr>
				
					<td><input type="text" class="mem_signup_form"   id="mem_nickname" name="mem_nickname" 
							required="required" placeholder=" nickname "><span id="nickname_msg"></span>		
							</td>
					
				</tr>
				
				<tr>
				
					<td><input type="text"  class="mem_signup_form"    id="mem_birth" name="mem_birth" 
							required="required" placeholder="Social Security Number"/></td>
					
				</tr>
				<!-- 
				<tr>
					
					<td><input type="file"  class="mem_signup_form"  id="mem_pic" name="mem_pic" value="pic"></td>
					
				</tr>
				 -->
				
				
				<tr>
					
					<td><textarea  class="mem_signup_form"   id="mem_profile" name="mem_profile" 
							required="required" placeholder="myprofile"></textarea></td>
					
				</tr>
				
				
				
				
			    <tr>
			    	<td ><input  class="btn btn-success "  type="button" id="btn_signup" value="signup" 
			    				disabled="disabled"	onclick="send(this.form);">
			    	<input  class="btn btn-primary "  type="button" id="btn_cancel" value="cancel"></td>
			    </tr>
			
			</table>
		</div>
	  </form>
	</div>
</div>
</body>
</html>