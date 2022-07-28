<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<!--sweet alert  -->
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

   #left{
         margin-top: 30px;
         margin-left: 250px;
         width : 20%;
     /*     border   :   1px solid red; */
         float   :   left;
         
      
   }
   
   #right{
   
         margin-top: 30px ;
         margin-left: 100px;
         width   :   35%;
        /* border   :   1px solid blue; */
        float   :   left;
        
   }
   
   /* #footer{
   
      width   :   1700px;
      height   :   150px;
      border   :   1px solid green; 
      margin   :   auto;
   } */

#mem_profile1{

   width: 300px;
   height: 300px;
   /* display: inline-block; */

 
   border-radius: 70%;
   overflow: hidden;
 
}

#mem_profile1>img{

   width: 100%;
   height:100%;
   
  
   object-fit: cover;
 
}


.mypage_form{
      width: 250px;
      border: none;
       border-radius: 10px 10px 10px 10px;
       box-shadow: 1px 1px 1px 1px #D9D9D9 ;
      height: 30px;



}


#member_form{
  
   
  /* height: 500px; */
 
  
    

 
}



.button{

  
   text-align: center;
   border: none;
  
   
   /* border-bottom: 1px solid gray; */
}


.form_control{
      width:50px;
      height:50px;
      resize: none;
}

</style>
<script type="text/javascript">



function passConfirm() {
   
   
   
      
      var pwd = $("#pwd").val();
      var pwdConfirm = $("#pwdConfirm").val();

      //var correctColor = "#00ff00";   //맞았을 때 출력되는 색깔.
      //var wrongColor ="#ff0000";   //틀렸을 때 출력되는 색깔
      console.log(pwdConfirm);
      if(pwd== pwdConfirm){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
         
         $("#confirmMsg").html("비밀번호 일치").css("color","blue");
      }else{
         
         $("#confirmMsg").html("비밀번호 불일치").css("color","red");
      }
   }//passConfirm

</script>


<script type="text/javascript">

function send(){
   
   var f = document.f;
   
   /* f.action ="mypage/modify.do";
    f.submit(); 
    
    return; */
      
   Swal.fire({
        title: '정말 수정하시겠습니까?',
        html: "<h5>선택한 사용자정보가 수정됩니다</h5>",
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '수정',
        cancelButtonText:  '취소'
      }).then((result) => {
        
         if (result.isConfirmed) {
            
            f.action ="modify.do";
            f.submit();
            
            return;
            
         }
      });
      
   }//send
   

</script>


<script type="text/javascript">


function member_out(){
   /* var f = document.f; */
   var mem_idx = f.mem_idx.val;
   
   Swal.fire({
        title: '정말 탈퇴하시겠습니까?',
        html: "<h5>선택한 사용자정보가 탈퇴됩니다</h5>",
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '탈퇴',
        cancelButtonText:  '취소'
      }).then((result) => {
        
         if (result.isConfirmed) {
            
            f.action ="member_out.do";
            f.submit();
            
            return;
            
         }
      });
      
   }//member_out
   
   
   





</script>



<script type="text/javascript">
  
 /*  $(function(){ */
     
   //Ajax화일업로드...
     function ajaxFileUpload() {
          // 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
          $("#ajaxFile").click();
     }
         
     function ajaxFileChange() {
          // 파일이 선택되면 업로드를 진행한다.
         photo_upload();
     }
 
     
     function photo_upload() {

          //console.log($("#ajaxFile")[0]);   
         //파일선택->취소시
         if( $("#ajaxFile")[0].files[0]==undefined)return;
         
         
         
         var form = $("#ajaxForm")[0];
          var formData = new FormData(form);
          formData.append("mem_idx", '${ user.mem_idx }');
          formData.append("mem_pic", $("#ajaxFile")[0].files[0]); // photo_upload.do?p_idx=5&photo=a.jpg

          $.ajax({
                url : "photo_upload.do", //PhotoUploadAction
                type : "POST",
                data : formData,
                processData : false,
                contentType : false,
                dataType : 'json',
                success:function(result_data) {
                   //result_data = {"p_filename":"aaa.jpb"}
                    
                   //location.href=''; //자신의 페이지를 리로드(refresh)
                   
                   $(".preview").attr("src","../../resources/upload/" + result_data.p_filename);
                   alert("성공");
                },
                error : function(err){
                   alert(err.responseText);
                }
          });
          
          alert("끝");
      }
      
      
     
  /* });//파일 업로드전 미리 보기 */
  
  
 

</script>


</head>
<body>
   <!--화일 업로드용 폼  -->
    <form name="f" method="POST" id="ajaxForm"  enctype="multipart/form-data">
       <input type="file" id="ajaxFile" style="display:none;" name="mem_pic" onChange="ajaxFileChange();">
      
    <input type="hidden" name="mem_idx" value="${user.mem_idx }">   
   <div id="left">
         <!-- 이미지 -->  
      <div id="mem_profile1" >
      <!--기본이미지  -->
         <c:if test="${empty user.mem_pic_filename }">
         <img  name="mem_pic_filename"  onclick="ajaxFileUpload();"  class="preview" src="${ pageContext.request.contextPath }/resources/img/member_profile.png">   
         </c:if>
         <img  name="mem_pic_filename" onclick="ajaxFileUpload();" class="preview" src="${ pageContext.request.contextPath }/resources/upload/${ user.mem_pic_filename }">
      </div>
      
    
   
         <!--자기소개 text box  -->
         <div id="mem_profile_text"   >
           <div style="text-align: center; margin-top: 10px; font-weight: bold;" >${user.mem_nickname }</div><br>
              <div class="form-group">
              <label for="comment"></label>
              <textarea class="form-control" rows="5" id="comment" style="width: 100%;" name="mem_profile">${user.mem_profile }</textarea>
            </div>
         
         </div> 
   </div>

   <div id="right">
      
      
      
      <!-- 개인정보 수정 -->
     
         <div id="member_form">
            <div class="form-group">
             <c:if test="${user.grade_idx eq 1 }">
               <div style="display: inline;" ><img  alt="이미지없음" src="${ pageContext.request.contextPath }/resources/images/grade_bronze.JPG" width="50"></div>
             <a href="#">브론즈</a>
            </c:if>
             <c:if test="${user.grade_idx eq 2 }">
               <div style="display: inline;" ><img  alt="이미지없음" src="${ pageContext.request.contextPath }/resources/images/grade_silver.JPG" width="50"></div>
             <a href="#">실버등급</a>
            </c:if>
             <c:if test="${user.grade_idx eq 3 }">
               <div style="display: inline;" ><img  alt="이미지없음" src="${ pageContext.request.contextPath }/resources/images/grade_gold.JPG" width="50"></div>
             <a href="#">골드등급</a>
            </c:if>
             <c:if test="${user.grade_idx eq 4 }">
               <div style="display: inline;" ><img  alt="이미지없음" src="${ pageContext.request.contextPath }/resources/images/grade_platinum.JPG" width="50"></div>
             <a href="#">플래티넘등급</a>
            </c:if>
             <c:if test="${user.grade_idx eq 5 }">
                      
             <a href="#">관리자</a>
            </c:if>
         </div>
            <div class="form-group">
           <label for="usr">Email:</label>
           <input type="text" class="form-control" id="usr"  value="${user.mem_email }" readonly="readonly" >
         </div>
         <div class="form-group">
           <label for="pwd">비밀번호:</label>
           <input type="password" class="form-control" value="${user.mem_pwd}" id="pwd" name="mem_pwd" >
         </div>
         <div class="form-group">
           <label for="pwd">비밀번호확인:<span id="confirmMsg" ></span></label>
           <input type="password" class="form-control" id="pwdConfirm" onkeyup="passConfirm();">
         </div>
   
         <div style="font-weight: bold;">${fn:substring (user.mem_regdate,0,11)}</div>
         </div>
    
       <div class="container">
        <ul class="list-inline" style=" margin-top: 100px;">
          <li>
            <a href="#" data-toggle="tooltip" data-placement="top" title="Hooray!" id="btn_modify" onclick="send();">수정</a>
               <!-- <input type="button" value="수정"  onclick="send(this.form);"> -->
          </li>
          <li><a href="#" data-toggle="tooltip" data-placement="bottom" title="Hooray!" style="margin-left: 50px;" onclick="location.href='my_page.do'" >취소</a></li>
          <li><a href="#" data-toggle="tooltip" data-placement="right" title="Hooray!" style="margin-left: 50px;" onclick="member_out();">탈퇴</a></li>
      
       </ul>
       </div>
      
         <script>
         $(document).ready(function(){
           $('[data-toggle="tooltip"]').tooltip();   
         });
      </script> 
      
    
      
   </div>
      
     

   <div  id="footer"   >
      
   </div>

   </form>
</body>
</html>