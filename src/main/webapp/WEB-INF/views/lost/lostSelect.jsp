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
	.c1{
		cursor: pointer;
	}
	
	.carousel-inner > .carousel-item > img{
		width : 1100px;
		height : 500px;
		min-width : 700px;
	}
	
	.main{
		margin : 110px auto 0px;
		min-width : 700px;
		width : 1100px;
		height : 2000px;
		padding-left: 30px;
	}
	
	.description{
		margin-left: 10px;
		margin-top: 50px;
		width : 1100px;
		height : 1100px;
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
		display: inline-block;
		width : 24px;
		height : 20px;
	}
	
	.replyEmpty > span{
		color : white;
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
	
	.divs{
		margin-top : 20px;
	}
	
	.state{
		display: inline-block;
		margin-right: 10px;
		width : 35px;
		height: 25px;
		padding-left: 2px;
		color: white; 
	}
	
	.titles{
		margin-right : 10px;
		color: gray;
	}
	
	.replyTitle{
		margin-bottom: 20px;
	}
	
	.replyTitles{
		display : inline-block;
		font-size: 14px;
		color : gray;
	}
	
	#lostDelete{
		color : blue;
		margin-right: 5px;
	}
	
	#lostUpdate{
		color : blue;
	}
</style>

</head>

<body>

<c:import url="../template/header.jsp"></c:import>

<div class="main">
  <div class="container">
  <div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
       <img src="../resources/upload/lost/${files[0].fileName}" style="width:100%;">
    </div>
    <c:forEach items="${files}" var="file">
	  	<div class="carousel-item">
        	<img src="../resources/upload/lost/${file.fileName}" style="width:100%;">
      	</div>
	 </c:forEach>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>
</div>
<div class="description">
	<div class="divs">
		<div class="state" title="${dto.state}">${dto.state}</div>
		<span class="detailSpecies">${dto.detailSpecies}</span>
	</div>
	
	<div class="divs">
		<span class="titles">성  별 :</span>
		<span>${dto.gender}</span>
	</div>
	
	<div class="divs">
		<span class="titles">나  이 :</span>
		<span>${dto.age}</span>
	</div>
	
	<div class="divs">
		<span class="titles">몸무게 :</span>
		<span>${dto.state}</span>
	</div>
	
	<div class="divs">
		<span class="titles">털  색 :</span>
		<span>${dto.color}</span>
	</div>
	
	<div class="divs">
		<span class="titles">특  징 :</span>
		<span>${dto.feature}</span>
	</div>
	<hr>
	
	<div class="divs">
		<span class="titles">실 종 일 :</span>
		<span>${dto.lostDate}</span>
	</div>
	
	<div class="divs">
		<span class="titles">실종장소 :</span>
		<span>${dto.lostProvince} ${dto.lostCity} ${dto.lostLocation}</span>
	</div>
	
	<div class="divs">
		<span class="titles">아 이 디 :</span>
		<span>${dto.id}</span>
	</div>
	
	<div class="divs">
		<span class="titles">연 락 처 :</span>
		<span>${dto.phone}</span>
	</div class="divs">
	<hr>
	
	<div class="divs">
		<span>${dto.contents}</span>
	</div>
	<hr>
	
	<div class="replyTitle">
		<h3 class="replyTitles">댓글</h3>
		<h3 class="replyTitles">(${replyCount})</h3>
	</div>
	<div id="result">
		
	</div>
	
	<form action="../lostReply/lostReplyInsert" method="post">
	  <input type="text" name="contents">
	  <input type="hidden" value="${dto.num}" name="lostNum">
	  <input type="hidden" value="${dto.id}" name="id">
	  <button class="btn btn-warning">댓글</button>
	</form>
	
	<a id="lostDelete" href="./lostDelete?num=${dto.num}">글삭제</a>
	<a id="lostUpdate">글수정</a>
</div>
	
	<script type="text/javascript">
	 	var curPage = 1;
	    getList();
	    stateColor();
		
	    $("#lostUpdate").click(function(){
			window.open("./lostUpdate?num=${dto.num}", 'Write Form', 'width=630px, height=700px, scrollbars=yes');
		});
	    
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
		
		function stateColor(){
			var val = $(".state").attr("title");
			if(val == "목격"){
				$(".state").css('background-color','#ffc107');
			}else if(val == "보호"){
				$(".state").css('background-color','#28a745');
			}else if(val == "실종"){
				$(".state").css('background-color','#fd7e14');
			}else if(val == "완료"){
				$(".state").css('background-color','#007bff');
			}
		}
	</script>
</div>
</body>
</html>