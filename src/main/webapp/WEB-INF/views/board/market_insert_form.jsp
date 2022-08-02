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

<!-- CKEditor -->
<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
  
<style type="text/css">
   #box{
      width: 700px;
      margin: auto;
      margin-top: 50px;
   }

   textarea {
      width: 100%;
      min-height: 300px;
      resize: none;
   }
</style>

<script type="text/javascript">
   
   function send(f){
	
      
  
	var market_title = f.market_title.value.trim();
		
	var market_content = CKEDITOR.instances.market_content.getData().trim();
		
	var s = document.getElementById("market_buy_sell");
	
	var market_buy_sell = s.options[s.selectedIndex].value;

		
		if (market_title == '') {
		
			alert('제목을 입력하세요!!');
			
			f.market_title.value = '';
			
			f.market_title.focus();
			
			return;
		}

		if (market_content == '') {
			
			alert('내용을 입력하세요!!');

			return;
		}

		f.action = "market_insert.do";
		f.submit();

	}
</script>


</head>
<body>

<form>
    <input type="hidden"  name="mem_idx"  value="${ user.mem_idx }">
	<div id="box">
	    <div class="panel panel-primary">
	      <div class="panel-heading"><h3>새글쓰기</h3></div>
	      <div class="panel-body">
	         <table class="table table-striped">
	            <tr>
	               <th width="15%">작성자</th>
	               <td><input name="mem_nickname" value="${ user.mem_nickname }" readonly="readonly">
	            </tr>
	            <tr>
	            <select name="market_buy_sell" id="market_buy_sell" style="font-size:16px;">
						<option value="팝니다">팝니다</option>
						<option value="삽니다">삽니다</option>
						<option value="나눔">나눔</option>
	            </select>
	            </tr>
	            <tr> 
	               <th>제목</th>
	               <td><input style="width:100%;" name="market_title"></td>
	            </tr>
	            
	            <tr>
	               <td colspan="2">
	                   <textarea name="market_content"  rows="" cols=""></textarea>
	                   <script>
							// Replace the <textarea id="editor1"> with a CKEditor
							// instance, using default configuration.
							CKEDITOR.replace( 'market_content', {
							     filebrowserUploadUrl: '${pageContext.request.contextPath}/ckeditorImageUpload.do'	
							});
								
							CKEDITOR.on('dialogDefinition', function( ev ){
						            var dialogName = ev.data.name;
						            var dialogDefinition = ev.data.definition;
						          
						            switch (dialogName) {
						                case 'image': //Image Properties dialog
								              //dialogDefinition.removeContents('info');
								              dialogDefinition.removeContents('Link');
								              dialogDefinition.removeContents('advanced');
								              break;
							    }
							 });
						</script>
	                   
	               </td>
	            </tr>
	            
	            <tr>
	               <td colspan="2" align="center">
	                    <input class="btn btn-primary"  type="button"  value="글올리기"
	                           onclick="send(this.form);">
	                    <input class="btn btn-success"  type="button"  value="목록보기"
	                           onclick="location.href='market_list.do?page=${param.page}&search=${ param.search }&search_text=${ param.search_text}';">
	               </td>
	            </tr>
	            
	         </table>
	      </div>
	    </div>
	</div>
 
</form>


</body>
</html>