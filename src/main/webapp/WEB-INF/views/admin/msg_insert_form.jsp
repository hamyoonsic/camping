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

<!-- CKEditor 베이직 CDN -->
<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
  
<script type="text/javascript">

	var toolbar = {
                toolbarGroups : [
                    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
                    { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
                    { name: 'links', groups: [ 'links' ] },
                    { name: 'insert', groups: [ 'insert' ] },
                    '/',
                    { name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
                    { name: 'styles', groups: [ 'styles' ] },
                    { name: 'colors', groups: [ 'colors' ] },
                    { name: 'tools', groups: [ 'tools' ] },
                    { name: 'others', groups: [ 'others' ] },
                    { name: 'about', groups: [ 'about' ] },
                    { name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
                    { name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
                    { name: 'forms', groups: [ 'forms' ] },
                ],

                removeButtons : 'Cut,Copy,Paste,PasteText,PasteFromWord,Find,SelectAll,Scayt,Replace,Save,NewPage,ExportPdf,Print,Templates,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,CreateDiv,Blockquote,BidiLtr,BidiRtl,Language,RemoveFormat,CopyFormatting,Anchor,Flash,PageBreak,About',
            
	}

</script>  
  
  
  
<style type="text/css">
   #box{
      width: 700px;
      margin: auto;
      margin-top: 50px;
   }
   
   textarea {
	  width: 100%;
	  resize: none;
   }
</style>

<script type="text/javascript">

   function send(f){ // f = this.form
	   
	   //입력값 체크...
	   var msg_receiver = f.msg_receiver.value.trim();
	   var msg_sender = f.msg_sender.value.trim();
	   
       //var content = f.content.value.trim();
       //CKEditor 설정 후엔 입력값 체크를 다시 해줘야함
       var msg_content = CKEDITOR.instances.msg_content.getData();
       console.log(msg_receiver);
       
       if(msg_receiver==''){
    	   alert('받으실분의 닉네임을 입력하세요');
    	   f.msg_receiver.value='';
    	   f.msg_receiver.focus();
    	   return;
       }
       if(msg_content==''){
    	   alert('내용을 입력하세요');
    	   f.msg_content.value='';
    	   f.msg_content.focus();
    	   return;
       }
       
	   f.action = "msg_insert.do";
	   f.submit();//전송
	   
	   
   }


</script>  

</head>
<body>

<form>
	<input type="hidden"  name="msg_sender"  value="${ user.mem_nickname }">
    <div id="box">
          <div class="panel panel-primary">
		      <div class="panel-heading"><h4>쪽지보내기</h4></div>
		      <div class="panel-body">
		          <table class="table">
		              <tr>
		                 <th style="width: 200px">받으실 분의 닉네임</th>
		                 <td><input name="msg_receiver"></td>
		              </tr>
		              
		              <tr>
		                 <td colspan="2">
		                	 <textarea name="msg_content" rows="7" cols="50"></textarea>
		                	 <script>
		                		 CKEDITOR.replace('msg_content',toolbar);
               				 </script>
		                 </td>
		              </tr>
		              
		              <tr>
		                 <td colspan="2" align="center">
		                 
		                     <input  class="btn  btn-primary" type="button"  value="보내기"
		                             onclick="send(this.form);">
		                             
		                     <input  class="btn  btn-success" type="button"  value="돌아가기" 
		                             onclick="location.href='msg_list.do'">
		                 </td>
		              </tr>
		              
		          </table>
		      </div>
		    </div>
    </div>
</form>


</body>
</html>