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
	 	cursor : pointer;
	 }
	 .main{
	 	width: 1000px;
	 	height : 1200px;
	 	margin: 100px auto 0px;
	 }
	 
	 .searchrow{
	 	background-color: #e8e8e8;
	 }
	 
	 .rows{
	  	margin: 100px auto 0px;
	 }
	 
	 .writeIcon{
		position: fixed;
		bottom: 20px;
		right : 250px;
		cursor: pointer;
	}
	
	.tableborder{
		border-top-color: #979797;
		border-top-style: solid;
		border-bottom-width: 1px; 
	}
	
	.pager{
		width : 500px;
		margin: 0px auto;
		text-align: center;
	}
	
	.writeIconfocus {
        border-color: #28a745;
        box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25);
    }
	</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="main">
  
  <table class="tableborder table table-hover">
  	<c:forEach items="${lists}" var="dto">
  		<tr>
  			<td>${dto.num}</td>
  			<td><a href="./${board}Select?num=${dto.num}">
  			<c:catch>
  				<c:forEach begin="1" end="${dto.depth}">
  				--
  				</c:forEach>
  			</c:catch>
  			${dto.title}</a></td>
  			<td>${dto.writer}</td>
  			<td>${dto.regDate}</td>
  			<td>${dto.hit}</td>
  		</tr>
  	</c:forEach>
  </table>
  
  <div class="pager">
  	<c:if test="${pager.startNum gt 1}">
  		 <span class="c1" title="${pager.startNum-1}"}>[이전]</span>
    </c:if>
  	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
  		<span class="c1" title="${i}">${i}</span>
  	</c:forEach>
  	
  	<c:if test="${pager.nextCheck}">
  		<span class="c1" title="${pager.lastNum+1}">[다음]</span>
  	</c:if>
  </div>
  
  <div class="searchrow">
  <div class="rows col-sm-5">
  <form id="searchForm" action="./${board}List">
  	<input type="hidden" name="curPage" id="curPage">
       <div class="input-group">
        <select class="input-group-sm" id="kind" name="kind">
        	<option value="tt">제목</option>
        	<option value="wr">내용</option>
        	<option value="con">작성자</option>
        </select>
        <input id="search" type="text" class="form-control" name="search">
        <div class="input-group-btn">
              <button class="btn btn-light" type="submit">
            	검색
              </button>
        </div>
      </div>
      
  </form>
  </div>
  </div>
  
  <img class="writeIcon" src="../resources/img/lost/write.png" tabindex=0 width="100" height="100" alt="">
</div>

	<script type="text/javascript">
		var kind = '${pager.kind}';
		if(kind == ''){
			kind = "tt";
		}
		var search = '${pager.search}';
		$("#kind").val(kind);
		$("#search").val(search);
		
		$(".c1").click(function(){
			var cur = $(this).attr("title");
			$("#curPage").val(cur);
			$("#kind").val(kind);
			$("#search").val(search);
			$("#searchForm").submit();
		})
		
		$(".writeIcon").click(function(){
			location.href= "./${board}Write";
		});
	
		$(".writeIcon").mouseenter(function(){
			$(this).addClass("writeIconfocus");
		});
	
		$(".writeIcon").mouseleave(function(){
			$(this).removeClass("writeIconfocus");
		});
	</script>
</body>
</html>