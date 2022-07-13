<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<!--sweet alert  -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.wrap {
	font-family: 'Noto Sans KR', sans-serif;
	text-decoration: none;
	border-collapse: collapse;
	/* margin: 0px;  */
	padding: 0px;
	color: #000;
	margin-right: 80px;
	cursor: pointer;
	
}

.nav {
	display:flex;
	width: 100%;
	justify-content:space-around;
	line-height: 80px;
	color: black;
	margin-bottom: 0px;
	list-style: none;
	font-weight: 700;
	
	
}

.nav>li {
	/* margin-left: 40px; */
	font-size: 21px;
	
	
}

.nav>li>a {
	/* margin-left:50px; */
	color: black;
	text-decoration: none;
	 transform: scale(1.2);
	  display: block;
	  transition: 0.6s;
	  background-color: #fff;
	  -webkit-background-clip: text;
      -moz-background-clip: text;
      background-clip: text;
}

.nav>li>a:hover{

	  transition: 0.1s;
	  transform: scale(1);
	  background-color: #1c445e;
	  color: transparent;
	  text-shadow: 2px 2px 3px rgba(255,255,255,0.5);
	  -webkit-background-clip: text;
      -moz-background-clip: text;
       background-clip: text;

}


.mypage{

	display:flex;
	width: 100%;
	justify-content:flex-end;
	line-height:30px;
	color: black;
	margin: 0;
	list-style: none;
	font-weight: normal;


}

.mypage>li{
/* 
	display:flex;
	justify-content:space-between;
	color: black;
	margin-bottom: 30px;
	list-style: none;  */
	margin-left: 30px;
	margin-right: 20px;
}

.mypage>li>a {
	text-decoration: none;
	color: black;
	font-weight: 300;
}


</style>
<script type="text/javascript">
	function login(){
		
		/*로그인 상태체크  */
		if("${empty user}" == "true"){
			
			if (confirm("마이페이지는 로그인 후 이용 가능합니다\n 로그인 하시겠습니까?")==false)return;
			
			alert(location.href);
			
			
			location.href="member/login_form.do"
			
			return;
			
		}	
		
		
	}
	
	
	
	$(document).ready(function(){
		
			$("#btn_login_form").click(function(){
				
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
								
								url: 'member/login.do',
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
						
						
						//console.log('id',id,'pwd',pwd);
						
						//Swal.fire('Hi!!');
					  
					}); 
			});
	
			
	});
	




</script>
</head>
<body>

	<div class="wrap">
		<ul class="nav">
			<li><a href="#link_header">HOME</a></li>
			<li><a href="#link_main_text0">REVIEW</a></li>
			<li><a href="#link_main_text1">CARPOOL</a></li>
			<li><a href="#link_main_text1">MARKET</a></li>
			<li><a href="#link_main_text2">WHEATHER</a></li>
			<li><a href="#" id="btn_login_form" >MYPAGE</a></li>
			<!--로그인 되어있으면 보여주라  -->
			
		</ul>
			<c:if test="${not empty user }">
			
					<ul class="mypage">
						<li><a href="#">${user.grade_idx}</a></li>
						<li><a href="#">${user.mem_nickname}님</a></li>
						<li><a href="#">쪽지함</a></li>
						<li><a href="#">로그아웃</a></li>
					</ul>
			
			</c:if>
	</div>
</body>
</html>