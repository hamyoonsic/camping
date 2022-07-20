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
<script type="text/javascript">


   function send(f){
      
      var mem_email = f.mem_email.value.trim();
      var mem_pwd = f.mem_pwd.value.trim();
      
      if(mem_email==''){
         alert('이메일을 입력하세요');
         f.mem_email.value='';
         f.mem_email.focus();
         return;
      }
      
      if(mem_pwd==''){
         alert("패스워드를 입력하세요");
         f.mem_pwd.value='';
         f.mem_pwd.focus();
         return;
         
      }
      
      f.action="login.do";
      f.submit();
      
      
   }
   
   
   
   
   
   
   

   
   
   
   
</script>

<script type="text/javascript">

  $(document).ready(function(){
   
     //0.1초후에 showMessage함수 호출
     setTimeout(showMessage,100);
     
  });
  
  function showMessage(){
     
    // /member/login_form.do?reason=fail_id
    if("${ param.reason eq 'fail_email' }" =="true"){
       alert('이메일이 틀렸습니다');
       return;
    }         
     
    // /member/login_form.do?reason=fail_pwd
    if("${ param.reason eq 'fail_pwd' }" =="true"){
       alert('비밀번호가 틀렸습니다');
       return;
    } 
    
    // /member/login_form.do?reason=session_timeout
    if("${ param.reason eq 'session_timeout' }" =="true"){
       alert('로그아웃 되었습니다');
       return;
    } 
         
     
  }
  

</script>



</head>
<body>
   <form>
   <div id="login" >
      <div  id="imgbok" >
         <img alt="이미지없음" src="${ pageContext.request.contextPath }/resources/img/camp.png">
      </div>
         <h1>login</h1>
      <div id="login_form" >
         <table class="table_login">
            <tr>
               <td><input type="text" id="mem_email" name="mem_email" value="${param.mem_email }"
                     required="required" placeholder="email"/></td>
            </tr>
            
            <tr>
               <td><input type="password" id="mem_pwd" name="mem_pwd" 
                     required="required" placeholder="password"/></td>
            </tr>
             <tr>
                <td ><input  class="btn btn-success "  type="button" id="btn_login" value="login"
                         onclick="send(this.form);">
                <input  class="btn btn-primary "  type="button" id="btn_signup_form" value="signup"></td>
             </tr>
         
         </table>
      </div>
      
   </div>
   </form>
</body>
</html>