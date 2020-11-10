<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootStrap.jsp"></c:import>
<style type="text/css">
	.main{
		width: 800px;
		margin: 0px auto;
		margin-top: 100px;
	}
	.titles{
		width: 800px;
		height: 60px;
		border-top-color: #979797;
		border-top-style: solid;
		border-top-width: 1px;
		padding-top: 15px;
	}
	
	.title{
		display : inline-block;
		width : 600px;
		font-size: 15px;
		font-family: sans-serif;
		font-weight: bold;
		height: 50px;
	}
	
	.writer{
		display : inline-block;
		width : 100px;
		font-size: 15px;
		font-family: sans-serif;
		font-weight: bold;
		height: 50px;
		color: gray;
	}
	
	.regDate{
		display : inline-block;
		font-size: 15px;
		font-family: sans-serif;
		font-weight: bold;
		height: 50px;
		color: gray;
	}
	
	.files{
		border-top-color: #d3d3d3;
		border-top-style: solid;
		border-top-width: 1px;
		border-bottom-color: #d3d3d3;
		border-bottom-style: solid;
		border-bottom-width: 1px;
	}
	
	.fileTitle{
		display : inline-block;
		font-size: 8px;
		font-family: sans-serif;
		font-weight: bold;
		height: 20px;
		color: gray;
	}
	
	.fileName{
		display : inline-block;
		font-size: 6px;
		margin-right: 4px;
	}
	
	.contents{
		padding-left: 30px;
		padding-top: 50px;
		padding-bottom: 50px;
		padding-right: 30px;
		font-size: 15px;
		border-bottom-color: #d3d3d3;
		border-bottom-style: solid;
		border-bottom-width: 1px;
	}
	
	.buttons{
		text-align: left;
	}
	
	.button{
		float : right;
		margin-left: 5px;
	}
	
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="main">
  <div class="titles">
  	<h1 class="title">${dto.title}</h1><h1 class="writer">${dto.writer}</h1><h1 class="regDate">${dto.regDate}</h1>
  </div>
  <div class="files">
  <h3 class="fileTitle">첨부파일:</h3>
  <c:forEach items="${files}" var="file">
    	<a class="fileName" href="./fileDown?fileName=${file.fileName}&oriName=${file.oriName}">${file.fileName}</a>
  </c:forEach>
  </div>
  <h1 class="contents">${dto.contents}</h1>
  <div>
    <img alt="" src="../resources/upload/member/${fileName}">
  </div>
  <div class="buttons">
  	  <input type="button" value="목록" id="list" class="button btn btn-light">
  	  <c:if test="${board != 'notice'}">
	  	<a href="./${board}Reply?num=${dto.num}" class="button btn btn-light">답글</a>
	  </c:if>
	  <input type="button" title="${dto.num}" value="갱신" id="update" class="button btn btn-light">
	  <input type="button" title="${dto.num}" value="삭제" id="del" class="button btn btn-light">
  </div>
</div>

<script type="text/javascript">
	$("#del").click(function(){
		var num = $("#del").attr("title");
		alert(num);
		location.href="./${board}Delete?num="+num;
	});
	
	$("#update").click(function(){
		var num = $("#del").attr("title");
		alert(num);
		location.href="./${board}Update?num="+num;
	});
	
	$("#list").click(function(){
		location.href="./${board}List"
	});
</script>

</body>
</html>