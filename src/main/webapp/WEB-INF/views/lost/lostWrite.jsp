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
	.ficture{
		display: inline-block;
		margin-right: 10px;
		margin-bottom: 10px;
	}
	
	.formTitle{
		font-family : sans-serif;
		font-size: 15px;
		font-weight: bold;
	}
	
	.select{
		 width: 600px;
		 padding: .8em .5em; 
		 font-family: inherit; 
		 background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; 
		 border: 1px solid #999;
		 border-color : #ffffff; 
		 border-radius: 0px; /* iOS 둥근모서리 제거 */ 
		 webkit-appearance: none; 
		 moz-appearance: none;
		 appearance: none;
	}
	
	.body{
		margin-left : 10px;
	}
	
	.inputText{
		width : 600px;
		height : 30px;
		border: 1px solid #999;
		border-top-color: white;
		border-left-color: white;
		border-right-color: white;
		border-bottom-color: gray;
	}
	
	.date{
		width : 600px;
	}
	
</style>
</head>

<body>
	<div class="body">
	<form id="frm" action="./lostWrite" method="post" enctype="multipart/form-data">
    <h3 class="formTitle">구분</h3>
    <select class="select" id="state" name="state">
    	<option value="">전체</option>
    	<option value="실종">실종</option>
    	<option value="보호">보호</option>
    	<option value="목격">목격</option>
    	<option value="완료">완료</option>
    </select>
    
    <hr>
    
    <div id="lostDate" class="lostDate">
    	<h3 class="formTitle">날짜</h3>
    	<input type="date" class="date form-control" id="date" name="date">
    </div>
    
    <hr>
    
    <div class="lostLocation">
    	<h3 class="formTitle">지역</h3>
	    <select class="select" id="lostProvince" name="lostProvince">
	    	<option value="">전체</option>
	    	<option value="서울특별시">서울특별시</option>
	    	<option value="부산광역시">부산광역시</option>
	    	<option value="대구광역시">대구광역시</option>
	    	<option value="인천광역시">인천광역시</option>
	    	<option value="광주광역시">광주광역시</option>
	    	<option value="세종특별자치시">세종특별자치시</option>
	    	<option value="대전광역시">대전광역시</option>
	    	<option value="울산광역시">울산광역시</option>
	    	<option value="경기도">경기도</option>
	    	<option value="강원도">강원도</option>
	    	<option value="충청북도">충청북도</option>
	    	<option value="충청남도">충청남도</option>
	    	<option value="전라북도">전라북도</option>
	    	<option value="경상북도">경상북도</option>
	    	<option value="경상남도">경상남도</option>
	    	<option value="제주특별자치도">제주특별자치도</option>
	    </select>
	    <div class="lostCity">
	    </div>
	    <input class="inputText" placeholder="구체적인 장소를 적어주세요." type="text" name="lostLocation">
    </div>
    
    <hr>
    
    <div class="phone">
    	<h3 class="formTitle">연락처</h3>
    	<input class="inputText" placeholder="연락처를 남겨주세요." type="text" name="phone">
    </div>
    
    <div class="Species">
    	<h3 class="formTitle">품종</h3>
    	<select class="select" id="animalSpecies" name="animalSpecies">
    		<option value="">모든 동물</option>
	    	<option value="개">개</option>
	    	<option value="고양이">고양이</option>
	    	<option value="기타">기타</option>
    	</select>
    	<div class="detailSpecies">
    	</div>
    </div>
    
    <hr>
    
    <div class="gender">
      <h3 class="formTitle">성별</h3>
      <div>
      	<input type="radio" name="gender" value="미확인">미확인
	  	<input type="radio" name="gender" value="수컷">수컷
	  	<input type="radio" name="gender" value="암컷">암컷
	  </div>
    </div>
    
    <hr>
    
    <div class="age">
    	<h3 class="formTitle">나이</h3>
    	<select class="select" id="age" name="age">
    		<option value="1년미만">1년미만</option>
    		<c:forEach var="i" begin="1" end="30">
    			<option value="${i}년">${i}년</option>
    		</c:forEach>
    	</select>
    </div>
    
    <hr>
    
    <div class="color">
      <h3 class="formTitle">털색</h3>
      <input class="inputText" placeholder="무늬나 털색을 적어주세요." type="text" id="color" name="color">
    </div>
    
    <hr>
    
    <div class="feature">
      <h3 class="formTitle">특징</h3>
      <input class="inputText" placeholder="눈에 띄는 특징을 적어주세요." type="text" id="feature" name="feature">
    </div>
    
    <hr>
    
    <div class="contents">
      <h3 class="formTitle">상세한 내용</h3>
      <input class="inputText" placeholder="상세한 내용을 작성해주세요." type="text" id="contents" name="contents">
    </div>
    
    <hr>
    
    <input type="hidden" value="wlgns" name="id">
    <input type="hidden" value="강북구" name="lostCity">
    <input type="hidden" value="푸들" name="detailSpecies">
    <div class="files">
    	<input type="file" class="custom-file-input" id="file" name="file" onchange="fileUpload(this)"><br/>
    	<div class="ficture" id="fileResult1"></div>
    	<div class="ficture" id="fileResult2"></div>
    	<div class="ficture" id="fileResult3"></div>
    </div>
    
 	<input type="button" id="formbtn">등록하기</a>
  </form>
  </div>
</body>

<script type="text/javascript">
	fileUpload();
	
	var fictureNum = 0;
	
	function fileUpload(){
		var formData = new FormData();
		fictureNum += 1;
		formData.append("file", $("#file")[0].files[0]);
		if(fictureNum <= 3){
			$.ajax({
				type: 'POST',
				url: './lost/fileSave',
				processData: false, // 필수
				contentType: false, // 필수
				data: formData,
				success: function(data) {
					alert(fictureNum);
					$("#fileResult"+fictureNum).html(data);
				}
			});
		}
	}
	
	$("#formbtn").click(function(){
		  $("#frm").submit();
	});
	
</script>

</html>