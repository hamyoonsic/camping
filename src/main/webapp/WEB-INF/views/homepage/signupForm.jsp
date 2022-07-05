<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">

body{
  background-color: #F5F5F5;
}


#wrap {
	width: 460px;
	margin: auto;
	align-content: center;
}

#footer {
	
	height: 100px;
	margin: auto;
	align-content: center;
}

.sign_in{
	width: 460px;
	height: 60px;
	text-align: center;
	/* background-color: #00C73C; */
	border: 0px;
	outline: 0px;
	font-size: 20px;
	color: white;
}

.bir_wrap{
	width: 100%;
	margin-bottom: 15px;
}

.bir_yy{
	width: 144px;
	display:inline-block;


}
.bir_mm{
	width: 154px;	
	display:inline-block;
	padding-left: 10px;
	
}
.bir_dd{
	width: 154px;	
	display:inline-block;
	padding-left: 10px;
}

#header {
	text-align: center;
	margin-top: 70px;

}

#content {
	margin-top: 50px;
}

h6{
	display: inline-block;
	color: gray;
}

</style>
</head>
<body>


<div id="wrap">
	<form>
		<div id="header">	
		
		</div>
		
		<div id="content">
			<div class="form-group">
			    <label for="inputlg">아이디</label>
			    <input class="form-control input-lg" id="id" type="text">
			</div>
			<div class="form-group">
				<label for="inputlg">비밀번호</label>
				<input class="form-control input-lg" id="pwd" type="password">
			</div>
			<div class="form-group">
				<label for="inputlg">비밀번호 재확인</label>
				<input class="form-control input-lg" id="c_pwd" type="password">
			</div>		
			<br>
			
			<div class="form-group">
			    <label for="inputlg">이름</label>
			    <input class="form-control input-lg" id="name" type="text">
			</div>
			
			<!-- 생년월일 랩 -->
			<label for="inputlg">생년월일</label>
			<div class="bir_wrap">
			
				<div class="bir_yy">
				    <input class="form-control input-lg" id="yy" type="text">
				</div>
				
				<div class="bir_mm">
				    <select class="form-control input-lg" id="mm">
				    	<option>월</option>
				        <option>1</option>
				        <option>2</option>
				        <option>3</option>
				        <option>4</option>
				        <option>5</option>
				        <option>6</option>
				        <option>7</option>
				        <option>8</option>
				        <option>9</option>
				        <option>10</option>
				        <option>11</option>
				        <option>12</option>
					</select>
				</div>
				
				<div class="bir_dd">	
				    <input class="form-control input-lg" id="dd" type="text">
				</div>
			
			</div>
			<!-- 생년월일 랩 -->
			
			<div class="form-group">
	      		<label for="sel3">성별</label>
		    	<select class="form-control input-lg" id="gender">
			        <option>성별</option>
			        <option>남자</option>
			        <option>여자</option>
			        <option>선택안함</option>
				</select>
			</div>
			
			<div class="form-group">
			    <label for="inputlg">본인 확인 이메일</label><h6>(선택)</h6>
			    <input class="form-control input-lg" id="email" type="text" placeholder="선택입력"x>
			</div>
			
			<div class="form-group">
	      		<label for="sel3">휴대전화</label>
		    	<select class="form-control input-lg" id="loc_no">
			        <option>대한민국 +82</option>
			        <option>가나 +233</option>
			        <option>일본 +81</option>
			        <option>안드로메다 +2020</option>
				</select>
			</div>
			
			<div class="form-group">
			    <input class="form-control input-lg" id="tel" type="text" placeholder="전화번호입력">
			</div>
			
			<div>
				<input class="sign_in" type="button" value="가입하기"
					onclick="location.href='memberList.jsp';">
			</div>
			
		</div>
	
	</form>
	
	
	<div id="footer"></div>
</div>


</body>
</html>
