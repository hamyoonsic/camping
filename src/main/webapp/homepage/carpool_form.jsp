<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="carpool_form.css" rel="stylesheet" type="text/css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- CKEditor -->
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
        };

</script>
	
	

<style type="text/css">
	#box{
		margin: auto;
		margin-top: 30px;
		width: 800px;
	}
	textarea {
	width: 100%;
	resize: none;
}
	
</style>

</head>
<body>

<h3 id="title">carpool</h3>
	<form>
		<div id="box">
			<div class="panel">
				<div class="panel-heading">
					<h4 class="write_h4">글작성하기</h4>
					<select class="form_category">
					  <option>게시판선택하기</option>
					  <option>review게시판</option>
					  <option>carpool게시판</option>
					  <option>carrot게시판</option>
					  <option>게시판선택하기</option>
					</select>
				</div>
				<div class="panel-body">
					<table class="table">
						<tr>
							<td><input type="text" name="name" placeholder="제목을 입력하세요." 
								       style="width:300px; font-size:20px; font-weight: bold; "></td>
						</tr>
						<tr>
							<td><input type="text" name="name" cols="70" placeholder="닉네임(자동으로들어오게!!수정못하게)" style="width:300px;font-size:15px;"></td>
						</tr>
						<tr>
							
							<td><textarea name="content"  rows="5" cols="70" placeholder="내용을 입력하세요." ></textarea></td>
							<script>
                       			 CKEDITOR.replace('content',toolbar);
                			</script>
						</tr>
						<tr>
							<td><input type="password" name="pwd1" placeholder="비밀번호를 입력하세요."style="width:300px;font-size:15px;"></td>
						</tr>
						<tr>
							<td><input type="password" name="pwd2" placeholder="비밀번호를 입력하세요."style="width:300px;font-size:15px;"></td>
						</tr>
						
						<tr>
							<td colspan="2" align="center" >
								<input class="btn"  type="button" value="글올리기"
								onclick="send(this.form);">
		
								<input class="btn" type="button" value="목록보기"
								onclick="carpool.jspo'">
							</td>
						</tr>
						
						
					</table>
					</div>

				</div>
			</div>


	
	</form>

</body>
</html>