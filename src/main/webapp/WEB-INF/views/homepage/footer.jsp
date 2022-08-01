<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>footer</title>
<style type="text/css">

footer {
		vertical-align: middle;
		height	:	300px;
		/* width: 100%; */
        clear: both;
       /*  padding: 20px; */
        /* border: 1px solid #bcbcbc; */
        background-color: #dcdcdc;
        /* position : absolute; */
		/* bottom : 0; */
		
  }	
  
.footer-pro{
	display: flex;
	justify-content:flex-end;
	/* width: 1280px; */
	width: 100%;
	margin: auto;
	text-align: center;
	

}  
  
.footer-pro>li {
	flex: 1; 
	height: 20px;
	margin-top: 20px;
	text-align: center;
	list-style: none;
}


.footer-pro>li>img {
	margin-top: 10px;
	margin-bottom: 20px;
	

}

.pro>b{
	margin-top: 20px;
}
	
.pro{

color: black;
}		
    
</style>
</head>
<body>
    <footer class="site-footer">
            <span>회사소개 · 개인정보보호정책 · 위치 · 고객센터</span><br>    
            <span>Copyright Camp_Us Corp. All rights reserved.</span>
    			<ul class="footer-pro">
				<li>
					<div class="pro">
						<img class="small" src="${ pageContext.request.contextPath }/resources/images/pro_miyoung.jfif" >
			   			<b>최미영</b><br>
			   			git:https://github.com/choimiyoung<br>
			   			contact:gksrlfaldud@naver.com<br>
			   		</div>
				</li>
				<li>
					<div class="pro">
						<img class="small" src="${ pageContext.request.contextPath }/resources/images/pro_yunsic.jfif" >
			   			<b>함윤식</b><br>
			   			git:https://github.com/hamyoonsic<br>
			   			contact:hys1198@gmail.com<br>
			   		</div>
				</li>
				<li>
					<div class="pro">
						<img class="small" src="${ pageContext.request.contextPath }/resources/images/pro_wonyoung.jfif" >
			   			<b>최원영</b><br>
			   			git:https://github.com/evenoahchoi<br>
			   			contact:eorkfclsrn@naver.com<br>
			   		</div>
				</li>
				<li>
					<div class="pro">
						<img class="small" src="${ pageContext.request.contextPath }/resources/images/pro_juwon.jpg" >
					<b>김주원</b><br>
			   			&nbsp;git:https://github.com/juwonkeem<br>
			   			contact:thddms5341@naver.com<br>
			   		</div>
				</li>
				</ul>
			
    </footer>
     		
</body>
</html>