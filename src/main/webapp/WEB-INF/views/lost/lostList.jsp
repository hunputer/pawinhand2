<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.main{
		margin : 110px auto 0px;
		min-width : 700px;
		width : 1100px;
		height : 2000px;
		padding-left: 30px;
	}
	
	.lostList{
		width : 270px;
		height : 400px;
		margin : 0px 50px 50px 0px;
		float: left;
		border: 1px gray solid;
		cursor: pointer;
	}
	
	.lostImage{
		display : inline-block;
		width : 270px;
		height : 275px;
	}
	
	.lostMain{
		margin-top: 15px;
		margin-left: 10px;
		width : 260px;
		height : 60px;
	}
	
	.detailSpecies{
		margin-bottom: 10px;
	}
	
	.detailSpecies > h3{
		font-size: 18px;
	}
	
	.shortInfo{
	
	}
	
	.shortInfo > h3{
		font-size: 12px;
	}
	
	.lostSub{
		width : 270px;
		height: 55px;
		border-top-width : 1px;
		border-top-color : gray;
		border-top-style : solid; 
		padding-top: 5px;
		padding-left: 10px;
	}
	
	.lostSub > h3{
		font-size: 12px;
	}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="main">
	<ul>
		<c:forEach items="${lists}" var="list">
			<li class="lostList" title="${list.num}">
				<div class="lostImage">
					<img src="../resources/upload/lost/${list.fileName}" width="270" height="270" alt="">
					<div class="lostMain">
						<div class="detailSpecies">
							<h3>${list.detailSpecies}</h3>
						</div>
						<div class="shortInfo">
							<h3>${list.gender}/${list.color}/${list.age}</h3>
						</div>
					</div>
					<div class="lostSub">
						<h3>${list.lostDate}</h3>
						<h3>${list.lostProvince} ${list.lostCity} ${list.lostLocation}</h3>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>

</div>


</body>

<script type="text/javascript">
	$(".lostList").click(function(){
		var num = $(this).attr("title");
		location.href="./lostSelect?num="+num;
	})
	
	
</script>


</html>