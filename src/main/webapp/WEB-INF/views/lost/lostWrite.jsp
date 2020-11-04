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
</head>

<body>
	<form id="frm" action="./lostWrite" method="post" enctype="multipart/form-data">
    <h3>구분</h3>
    <select id="state" name="state">
    	<option value="">전체</option>
    	<option value="실종">실종</option>
    	<option value="보호">보호</option>
    	<option value="목격">목격</option>
    	<option value="완료">완료</option>
    </select>
    
    <div id="lostDate" class="lostDate">
    	<h3>날짜</h3>
    	<input type="date" class="form-control" id="date" name="date">
    </div>
    
    <h3>지역</h3>
    <div class="lostLocation">
	    <select id="lostProvince" name="lostProvince">
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
	    <input type="text" name="lostLocation">
    </div>
    
    <div class="phone">
    	<h3>연락처</h3>
    	<input type="text" name="phone">
    </div>
    
    <div class="Species">
    	<h3>품종</h3>
    	<select id="animalSpecies" name="animalSpecies">
    		<option value="">모든 동물</option>
	    	<option value="개">개</option>
	    	<option value="고양이">고양이</option>
	    	<option value="기타">기타</option>
    	</select>
    	<div class="detailSpecies">
    	</div>
    </div>
    
    <div class="gender">
      <h3>성별</h3>
      <div>
      	<input type="radio" name="gender" value="미확인">미확인
	  	<input type="radio" name="gender" value="수컷">수컷
	  	<input type="radio" name="gender" value="암컷">암컷
	  </div>
    </div>
    
    <div class="age">
    	<h3>나이</h3>
    	<select id="age" name="age">
    		<option value="1년미만">1년미만</option>
    		<c:forEach var="i" begin="1" end="30">
    			<option value="${i}년">${i}년</option>
    		</c:forEach>
    	</select>
    </div>
    
    <div class="color">
      <h3>털색</h3>
      <input type="text" id="color" name="color">
    </div>
    
    <div class="feature">
      <h3>특징</h3>
      <input type="text" id="feature" name="feature">
    </div>
    
    <div class="contents">
      <h3>상세한 내용</h3>
      <input type="text" id="contents" name="contents">
    </div>
    
    <input type="hidden" value="wlgns" name="id">
    <input type="hidden" value="강북구" name="lostCity">
    <input type="hidden" value="푸들" name="detailSpecies">
    <div class="files">
    	<input type="file" class="custom-file-input" id="file" name="file" onchange="fileUpload(this)"><br/>
    	<div id="fileResult1"></div>
    	<div id="fileResult2"></div>
    	<div id="fileResult3"></div>
    </div>
    
 	<button>등록하기</button>
  </form>
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
	
</script>

</html>