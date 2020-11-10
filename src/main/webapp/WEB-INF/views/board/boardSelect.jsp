<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootStrap.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
  
<div class="container">
  <h3>${board} Select Page</h3>
  <h3 id="num">${dto.num}</h3>
  <h1>Title : ${dto.title}</h1>
  <h1>Writer : ${dto.writer}</h1>
  <h1>Contents : ${dto.contents}</h1>
  <div>
    <img alt="" src="../resources/upload/member/${fileName}">
    <c:forEach items="${files}" var="file">
    	<a href="./fileDown?fileName=${file.fileName}&oriName=${file.oriName}">${file.fileName}</a><br>
    </c:forEach>
  </div>
  <input type="button" title="${dto.num}" value="Delete" id="del" class="btn btn-warning">
  <input type="button" title="${dto.num}" value="Update" id="update" class="btn btn-warning">
  <c:if test="${board != 'notice'}">
  	<a href="./${board}Reply?num=${dto.num}" class="btn btn-info">Reply</a>
  </c:if>
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
</script>

</body>
</html>