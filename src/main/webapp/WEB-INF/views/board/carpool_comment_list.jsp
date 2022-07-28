<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

   
   
   .content_type{
      width      :   450px;;
      display:   inline-block;
      margin-left: 30px;
      margin-bottom: 25px;
   
   }
   
   .box{
      height   :   130px;
      margin   :   auto;
      border:  1px solid  #cccccc ;
      box-shadow: 1px 1px 2px black;
      margin-top: 10px;
      margin-bottom: 10px;
      border-radius: 15px 15px;
   }
   
   .box-heading{
      /* margin-top: 10px;
      margin-left: 10px;
      height      :   20px;
      width      :   20%; 
      
      margin-bottom: 20px;
      */
      display:   inline-block;
   }
   
   .nickname{
      display:   block;
      margin-top: 10px;
      margin-left: 10px;
   }
   
   .box-body{
      width      :   200px;
      
      display:   inline-block;
      
   }
   
   .regdate_type{
      width      :   100%;
      color      :   gray;
      text-align:right; 
      margin-right:10px;"
      margin-bottom: 10px;
      display:   inline-block;
   }
   .x{
      text-align:right; 
      display:   inline-block;
      
   }
   
</style>

<script type="text/javascript">

   function comment_del(carpool_reply_idx){
      
      if(confirm("정말 삭제하시겠습니까?")==false)return;
      
      //Ajax로 삭제
      $.ajax({
         
         url         :   "carpool_reply_delete.do",
         data      :   {"carpool_reply_idx":carpool_reply_idx},
         dataType   :   "json",
         success      :   function(res_data){
            
            if(res_data.result){
               
               carpool_reply_list(global_page);
               
            }
            
         },
         error      :   function(err){
            alert(err.responseText);
         }
         
      });
   }

</script>

<script type="text/javascript">
   var   check   =   0;
   function comment_re(carpool_reply_idx){
      
      
      
      
      if(check>0){
         
         $('[id*=disp]').empty();
         check   =   0;

<<<<<<< HEAD
      }
      
      if(check==0){
         check++;
         $.ajax({
            
            url         :   "carpool_comment_form.do",
            data      :   {'carpool_reply_idx':carpool_reply_idx, "page":"${param.page}"},
            success      :   function(res_data){
               
               $("#disp"+carpool_reply_idx).html(res_data);
               
            },
            error      :   function(err){
               alert(err.responseText);
               
            }
         });
         
      }
      
   }
    var mem_idx = "${user.mem_idx}";
    var carpool_reply_idx = "${vo.carpool_reply_idx}";
    var carpool_reply_like_idx = "${vo.carpool_reply_like_idx}";
   function updatelike(carpool_reply_idx){
        
        $.ajax({
            type : "POST",  
            url : "carpool_reply_insertlike.do",       
            dataType : "json",   
            data : {  'mem_idx' : mem_idx,'carpool_reply_idx' : carpool_reply_idx},
            success : function(data) {
                   location.reload();
            },
            error : function(){
               alert("로그인 하셔야 합니다.");
            }
        });  
        //console.log(mem_idx);
        //console.log(carpool_idx);
    }
   
   function deletelike(carpool_reply_idx){
      
        $.ajax({
            type : "POST",  
            url : "carpool_reply_deletelike.do",       
            dataType : "json",   
            data : {  'mem_idx' : mem_idx,'carpool_reply_idx' : carpool_reply_idx},
            success : function(data) {
                   location.reload();
            },
            error : function(){
               alert("로그인 하셔야 합니다.");
            }
        });  
        //console.log(mem_idx);
        //console.log(carpool_idx);
    }
=======
		}
		
		if(check==0){
			check++;
			$.ajax({
				
				url			:	"carpool_comment_form.do",
				data		:	{'carpool_reply_idx':carpool_reply_idx, "page":"${param.page}"},
				success		:	function(res_data){
					
					$("#disp"+carpool_reply_idx).html(res_data);
					
				},
				error		:	function(err){
					alert(err.responseText);
					
				}
			});
			
		}
		
	}
		
	
>>>>>>> db2d10f6d017efec9a5d6a4c4ffbb87001cf90eb

   

</script>

<script>

   $(function(){
      
   
      
      $('[class*=commment_click1]').css("margin-left","50px");
      $('[class*=commment_click2]').css("margin-left","100px");
      $('[class*=commment_click3]').css("margin-left","150px");
      $('[class*=commment_click4]').css("margin-left","200px");
      $('[class*=commment_click5]').css("margin-left","250px");
      
      
   });
   

</script>


</head>
<body>



<!-- for(CommentVo vo : list) -->
<c:forEach var="vo" items="${list}">

<<<<<<< HEAD


   <div class="commment_click${vo.carpool_reply_depth}"
      onclick="comment_re('${vo.carpool_reply_idx}');">

      <div class="box">
         <b class="nickname">${vo.mem_nickname}</b>
         <div class="box-heading">

            <div id="comment_write_pic">

               <img
                  src="${pageContext.request.contextPath}/resources/images/unsplash_people/people2.jpg"
                  id="comment_profile">
            </div>
            <!-- 글쓴이만 삭제 -->
            <c:if test="${user.mem_idx eq vo.mem_idx }">
               <div class="x">
                  <input type="button" value="x"
                     onclick="comment_del('${vo.carpool_reply_idx }');">
               </div>
            </c:if>
         </div>

         <div class="box-body">
            <div class="content_type">${vo.carpool_reply_content}</div>
            <div class="regdate_type">작성일자 :
               ${fn:substring(vo.carpool_reply_regdate,0,16) }</div>
            <div>
               <c:if test="${(empty user.mem_idx) or (vo.heart_flag eq 0)}">
                  <td><button type="button"
                        style="background: none; border: none;"
                        onclick="updatelike('${ vo.carpool_reply_idx }');">
                        <img
                           src="${ pageContext.request.contextPath }/resources/images/heart-0.png"
                           width="20px" height="20px">
               </c:if>
               <c:if test="${vo.heart_flag eq 1 }">
                  <td><button type="button"
                        style="background: none; border: none;"
                        onclick="deletelike('${ vo.carpool_reply_idx }');">
                        <img
                           src="${ pageContext.request.contextPath }/resources/images/heart-1.png"
                           width="20px" height="20px">
               </c:if>
               </button>
               </td>
               <td style="width: 8%; text-align: center;">&nbsp;&nbsp;${ vo.cnt }&nbsp;&nbsp;</td>
            </div>
         </div>
      </div>
   </div>
   <div id="disp${vo.carpool_reply_idx}"></div>
=======
	
	
	<div class="commment_click${vo.carpool_reply_depth}" onclick="comment_re('${vo.carpool_reply_idx}');">
		
		<div class="box">
			<b class="nickname">${vo.mem_nickname}</b>
	    	<div class="box-heading">
			   
			   	<div id="comment_write_pic">
			   	
					<img src="${pageContext.request.contextPath}/resources/images/unsplash_people/people2.jpg" id="comment_profile">
				</div>
			   	<!-- 글쓴이만 삭제 -->
			   	<c:if test="${user.mem_idx eq vo.mem_idx }">
			   		<div class="x">
			   			<input type="button" value="x" onclick="comment_del('${vo.carpool_reply_idx }');">
			   		</div>
			   	</c:if>
	    	</div>
	     
		    <div class="box-body">
		   		<div class="content_type">
		      		${vo.carpool_reply_content}
		      	</div>
		      	<div class="regdate_type"> 작성일자 : ${fn:substring(vo.carpool_reply_regdate,0,16) }</div>
		    </div>
	    </div>
	</div>
		<div id="disp${vo.carpool_reply_idx}">
	</div>
>>>>>>> db2d10f6d017efec9a5d6a4c4ffbb87001cf90eb
</c:forEach>

<hr>
<!-- 페이징 메뉴  -->
<div style="font-size: 18px;">${carpool_pageMenu }</div>




</body>
</html>