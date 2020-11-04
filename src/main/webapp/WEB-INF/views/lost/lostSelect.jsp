<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
	.c1{
		cursor: pointer;
	}
	
	.carousel-inner > .item > img{
		width : 100%;
		height : 500px;
		min-width : 700px;
	}
	
	.main{
		margin : 0px auto;
		min-width : 700px;
		width : 80%;
		height : 1200px;
	}
	
	.description{
		margin-left: 15px;
		margin-top: 50px;
	}
	
	.replytable{
		width : 800px
	}
	
	.del{
		display: inline-block;
		margin-right: 15px;
		color: gray;
		cursor: pointer;
		font-size: 11px;
	}
	
	.replyEmpty{
		display: inline;
		color : white;
		width : 50px;
		height : 50px;
	}
	
	.replyContents{
		display : inline-block;
	}
	
	
	
	.reply{
		display: inline-block;
		color: gray;
		cursor: pointer;
		font-size: 11px;
	}
	
	.replyId{
		display : inline-block;
		margin-right: 50px; 
	}
	
	.replyId > h3{
		font-size: 13px;
	}
	
	.replyDate{
		display : inline-block; 
	}
	
	.replyDate > h3{
		font-size: 13px;
		color: gray;
	}
	
	
	
	
</style>

</head>
<body>
<div class="main">
  <div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="../resources/upload/lost/${files[0].fileName}" style="width:100%;">
      </div>
	   
	  <c:forEach items="${files}" var="file">
	  	<div class="item">
        	<img src="../resources/upload/lost/${file.fileName}" style="width:100%;">
      	</div>
	  </c:forEach>
	 </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<div class="description">
	<div>
		<div>${dto.state}</div>
		<span>${dto.detailSpecies}</span>
	</div>
	
	<div>
		<span>성 별 :</span>
		<span>${dto.gender}</span>
	</div>
	
	<div>
		<span>나 이 :</span>
		<span>${dto.age}</span>
	</div>
	
	<div>
		<span>몸무게 :</span>
		<span>${dto.state}</span>
	</div>
	
	<div>
		<span>털색 :</span>
		<span>${dto.color}</span>
	</div>
	
	<div>
		<span>특징 :</span>
		<span>${dto.feature}</span>
	</div>
	<hr>
	
	<div>
		<span>실종일 :</span>
		<span>${dto.lostDate}</span>
	</div>
	
	<div>
		<span>실종장소 :</span>
		<span>${dto.lostProvince} ${dto.lostCity} ${dto.lostLocation}</span>
	</div>
	
	<div>
		<span>아이디 :</span>
		<span>${dto.id}</span>
	</div>
	
	<div>
		<span>연락처 :</span>
		<span>${dto.phone}</span>
	</div>
	<hr>
	
	<div>
		<span>${dto.contents}</span>
	</div>
	<hr>
	
	<div id="result">
		
	</div>
	
	<form action="../lostReply/lostReplyInsert" method="post">
	  <input type="text" name="contents">
	  <input type="hidden" value="${dto.num}" name="lostNum">
	  <input type="hidden" value="${dto.id}" name="id">
	  <button class="btn btn-warning">댓글</button>
	</form>
	
	<a href="./lostDelete?num=${dto.num}">글삭제</a>
	<a href="./lostUpdate?num=${dto.num}">글수정</a>
</div>
	
	<script type="text/javascript">
	 	var curPage = 1;
	    getList();
		
	    $("#result").on("click", ".c1", function(){
	    	curPage = $(this).attr("title");
	    	alert(curPage);
	    	getList();
	    });
	    
	    $("#result").on("click", ".reply", function(){
	    	var num = $(this).attr("title");
	    	$("#reply"+num).html("<form action='../lostReply/reply' method='get'><span>${dto.id}</span><input type='hidden' value="+num+" name='num'><input type='hidden' value='${dto.id}' name='id'><input type='text' name='contents'><button>등록</button></form>");
	    });
	    
	    $("#result").on("click", ".del", function(){
	    	var num = $(this).attr("title");
	    	var lostNum = "${dto.num}";
	    	location.href="../lostReply/lostReplyDelete?num="+num+"&lostNum="+lostNum;
	    });
	    
		function getList(){
			var num = "${dto.num}";
			$.get("../lostReply/lostReplyList?lostNum="+num+"&curPage="+curPage,function(data) {
				$("#result").html(data);
			});
		}
	</script>
</div>
</body>
</html>