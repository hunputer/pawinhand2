<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootStrap.jsp"></c:import>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container">
  <h2>${board} reply Form</h2>
  <form id="frm" action="./${board}Reply" method="post" enctype="multipart/form-data">
  	<input type="hidden" name="num" value="${param.num}">
    <div class="form-group">
      <label for="title">Title:</label>
      <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요" name="title">
    </div>
    
    <div class="form-group">
      <label for="writer">Writer:</label>
      <input type="text" class="form-control" id="writer" name="writer">
    </div> 
    
     <div class="form-group">
      <label for="contents">Contents:</label>
      <textarea class="form-control" rows="20" cols="30" id="contents" name="contents"></textarea>
    </div>
 
 	<input type="button" value="FileAdd" id="fileAdd" class="btn btn-info">

	<div id="files">

	</div>  
 
 
 	<div class="form-group">
 	<label></label>
    <button type="submit" class="btn btn-warning form-control">Write</button>
    </div>
  </form>
  
  <div id="f">
  	  <div class="input-group">
        <input id="files" type="file" class="form-control" name="files">
        <span class="input-group-addon del">DEL</span>
      </div>
  </div>
  
</div>
<script type="text/javascript">
	var count=0;
	 $('#contents').summernote({
		 height:300,
		 callbacks:{
			 onImageUpload:function(files, editor, welEditable){
				 var formData = new FormData();	    //가상의 from 태그 작성
				 formData.append('file', files[0]); //파라미터 이름 file
				 
				 $.ajax({
				    data: formData,
				    type: "POST",
				    url: 'summernote',
				    cache: false,
				    contentType: false,
				    enctype: 'multipart/form-data',
				    processData: false,
					 success:function(data){
						 data = data.trim();
						 $("#contents").summernote('editor.insertImage', data);
					 }
				 })
			 },//upload End
			 
			 onMediaDelete:function(files){
				 var fileName = $(files[0]).attr("src");
				 //fileName에서 파일명만 구해오기
				 //s4/resources/upload/qna/sdfa-sdfsdf_iu1.jpg
				fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
				
				$.ajax({
					type:"POST",
					url : "./summernoteDelete",
					data: {
						file:fileName
					},
					success:function(data){
						alert(data);
					}
				
				}); 
			 }
		 }
		
	 });
	 
	
	 
	 $('#btn').click(function() {
		var contents = $('#contents').summernote('code');
		alert(contents);
		
	});
	 
	$('#contents').summernote('code', '${dto.contents}')
	$("#files").on("click", ".del", function() {
		$(this).parent().remove();
		count--;
	});
	
	$("#fileAdd").click(function() {
		
		if(count<5){
			var f = $("#f").html().trim();
			
			$("#files").append(f);
			count++;
		}else {
			alert("첨부파일은 최대 5개")			
		}
	});
</script>




</body>
</html>