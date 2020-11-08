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
		height : 420px;
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
		padding-top: 7px;
		padding-left: 10px;
	}
	
	.lostSub > div > h3{
		display : inline-block;
		font-size: 12px;
	}
	
	.dropdowns{
		margin-bottom: 100px;
		margin-left: 30px;
	}
	
	.drops {
		width: 930px;
		height : 38px;
		padding-right: 110px;
	}
	
	.dropdown-menu {
		width: 930px;
	}
	
	.dropContents{
		display: inline-block;
		width: 900px;
		height : 24px;
		background-color: white;
	}
	
	.dropSearch{
		display: inline-block;
		width: 900px;
		height: 24px;
		font-size: 11px;
		letter-spacing: 2px;
		color: #ffc107;
	}
	
	.selectForm{
		margin-left: 10px;
	}
	
	.lostProvince{
		display: inline-block;
		margin-top : 15px;
		width: 840px;
		height: 60px;
	}
	
	.lostProvinceTitle, .animalSpeciesTitle{
		display: inline-block;
		font-size: 15px;
	}
	
	.animalSpecies{
		margin-top: 15px;
	}
	
	.writeIcon{
		position: fixed;
		bottom: 20px;
		right : 250px;
		cursor: pointer;
	}

	
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="main">
	<div class="dropdowns">
	 	 <button type="button" class="drops btn btn-warning" data-toggle="dropdown">
		    	<div class="dropContents">
			    	<h3 class="dropSearch">
			    		<c:choose>
				    		<c:when test="${lostDTO.lostProvince == ''}">
				    			모든 지역
				    		</c:when>
				    		<c:otherwise>
				    			${lostDTO.lostProvince}
				    		</c:otherwise>
			    		</c:choose>
			    		|
			    		<c:choose>
				    		<c:when test="${lostDTO.animalSpecies == ''}">
				    			모든 동물
				    		</c:when>
				    		<c:otherwise>
				    			${lostDTO.animalSpecies}
				    		</c:otherwise>
			    		</c:choose>
			    	</h3>
		    	</div>
		  </button>
		  <div class="dropdown-menu">
		  	<div class="selectForm">
			    <form action="./lostList" method="get">
			    	<div>
			    		기간 : <input type="date" name="sDate"> ~ <input type="date" name="eDate"><br>
			    	</div>
				    <div class="lostProvince">
				    	<h3 class="lostProvinceTitle">지역 :</h3>
				    	<input type="radio" name="lostProvince" value="">전체
				    	<input type="radio" name="lostProvince" value="서울특별시">서울특별시
		  				<input type="radio" name="lostProvince" value="부산광역시">부산광역시
		  				<input type="radio" name="lostProvince" value="대구광역시">대구광역시
		  				<input type="radio" name="lostProvince" value="인천광역시">인천광역시
		  				<input type="radio" name="lostProvince" value="광주광역시">광주광역시
		  				<input type="radio" name="lostProvince" value="세종특별자치시">세종특별자치시
		  				<input type="radio" name="lostProvince" value="대전광역시">대전광역시
		  				<input type="radio" name="lostProvince" value="울산광역시">울산광역시
		  				<input type="radio" name="lostProvince" value="경기도">경기도
		  				<input type="radio" name="lostProvince" value="강원도">강원도
		  				<input type="radio" name="lostProvince" value="충청북도">충청북도
		  				<input type="radio" name="lostProvince" value="충청남도">충청남도
		  				<input type="radio" name="lostProvince" value="충청남도">충청남도
		  				<input type="radio" name="lostProvince" value="전라북도">전라북도
		  				<input type="radio" name="lostProvince" value="전라남도">전라남도
		  				<input type="radio" name="lostProvince" value="경상북도">경상북도
		  				<input type="radio" name="lostProvince" value="경상남도">경상남도
		  				<input type="radio" name="lostProvince" value="제주특별자치도">제주특별자치도
		  			</div>
		  			<div class="animalSpecies">
				    	<h3 class="animalSpeciesTitle">품종 :</h3>
				    	<input type="radio" name="animalSpecies" value="">전체
		  				<input type="radio" name="animalSpecies" value="개">개
		  				<input type="radio" name="animalSpecies" value="고양이">고양이
		  				<input type="radio" name="animalSpecies" value="기타">기타
		  			</div>
		  			<button>검색하기</button>		
			    </form>
		    </div>
	  	  </div>
	</div>
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
						<div>
							<img src="../resources/img/lost/time.jpg" width="20" height="20" alt="">
							<h3>${list.lostDate}</h3>
						</div>
						<div>
							<img src="../resources/img/lost/map.jpg" width="20" height="20" alt="">
							<h3>${list.lostProvince} ${list.lostCity} ${list.lostLocation}</h3>
						</div>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
	<img class="writeIcon" src="../resources/img/lost/write.png" width="100" height="100" alt="">
</div>


</body>

<script type="text/javascript">
	$(".lostList").click(function(){
		var num = $(this).attr("title");
		location.href="./lostSelect?num="+num;
	})
	
	$(".writeIcon").click(function(){
		window.open("./lostWrite", 'Write Form', 'width=630px, height=700px, scrollbars=yes');
	});
	
</script>


</html>