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
		padding-bottom: 100px
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
	
	.submitBtn{
		position : fixed;
		width : 100%;
		bottom : 0px;
		cursor : pointer;
		background: green;
		text-align: center;
	}
	
	.submitBtn > h3{
		font-size: 12px;
		color: white;
	}
	
	.header{
		width : 100%;
		height : 25px;
		text-align: center;
		background-color: #d3d3d3;
		padding-top: 3px;
	}
	
	.header > h3{
		font-size: 15px;
		font-family: sans-serif;
	}
	
	.select2{
		 width: 300px;
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
	
	.lostCity, .detailSpecies{
		display: inline-block;
	}
	
	#file{
		display: none;
	}
	
	.input-file-button{
  		padding: 6px 25px;
 		background-color: green;
 		border-radius: 4px;
 		color: white;
  		cursor: pointer;
	}
	
</style>


</head>

<body>
	<div class="header"><span>기본정보<span></div>
	<div class="body">
	<form name="popupForm" id="frm" action="./lostUpdate" method="post" enctype="multipart/form-data">
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
    	<input type="date" class="date form-control" id="date" name="date" value="${dto.lostDate}">
    </div>
    
    <hr>
    
    <h3 class="formTitle">지역</h3>
    <div class="lostLocation">
	    <select class="select2" id="lostProvince" name="lostProvince">
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
	    <input class="inputText" placeholder="구체적인 장소를 적어주세요." type="text" name="lostLocation" value="${dto.lostLocation}">
    </div>
    
    <hr>
    
    <div class="phone">
    	<h3 class="formTitle">연락처</h3>
    	<input class="inputText" placeholder="연락처를 남겨주세요." type="text" value="${dto.phone}" name="phone">
    </div>
    
    <div class="Species">
    	<h3 class="formTitle">품종</h3>
    	<select class="select2" id="animalSpecies" name="animalSpecies">
    		<option value="">모든 동물</option>
	    	<option value="개">개</option>
	    	<option value="고양이">고양이</option>
	    	<option value="기타">기타</option>
    	</select>
    	<div class="detailSpecies">
    	</div>
    </div>
    
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
      <input class="inputText" placeholder="무늬나 털색을 적어주세요." type="text" value="${dto.color}" id="color" name="color">
    </div>
    
    <hr>
    
    <div class="feature">
      <h3 class="formTitle">특징</h3>
      <input class="inputText" placeholder="눈에 띄는 특징을 적어주세요." type="text" value="${dto.feature}" id="feature" name="feature">
    </div>
    
    <hr>
    
    <div class="contents">
      <h3 class="formTitle">상세한 내용</h3>
      <input class="inputText" placeholder="상세한 내용을 작성해주세요." type="text" value="${dto.contents}" id="contents" name="contents">
    </div>
    
    <hr>
    
    <input type="hidden" value="${dto.num}" name="num">
    <input type="hidden" value="wlgns" name="id">
    <div class="files">
    	<label class="input-file-button" for="file">업로드</label>
    	<input type="file" id="file" name="file" onchange="fileUpload(this)"><br/>
    	<div class="ficture" id="fileResult1"></div>
    	<div class="ficture" id="fileResult2"></div>
    	<div class="ficture" id="fileResult3"></div>
    </div>
    
  </form>
  </div>
  <div id="formbtn" class="submitBtn"><h3>등록하기</h3></div>
</body>

<script type="text/javascript">
	init();
	lc();
	species();
	
	var fictureNum = 0;

	function init(){
		$("#state").val("${dto.state}").prop("selected", true);
		$("#lostProvince").val("${dto.lostProvince}").prop("selected", true);
		$("#animalSpecies").val("${dto.animalSpecies}").prop("selected", true);
		$("input:radio[name='gender']:radio[value='${dto.gender}']").prop('checked', true);
		$("#age").val("${dto.age}").prop("selected", true);
	}
	
	
	function fileUpload(){
		var formData = new FormData();
		fictureNum += 1;
		formData.append("num", "${dto.num}");
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
	
	$("#lostProvince").blur(lc);
	
	$("#animalSpecies").blur(species);
	
	function lc(){
			var province = $("#lostProvince option:selected").val();
			var hml = "<select class='select2' id='City' name='lostCity'>";
			hml += "<option value=''>전체</option>";
			if(province == "제주특별자치도"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='제주특별자치도'>제주특별자치도</option>";
			}else if(province == "서울특별시"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='강남구'>강남구</option>";
				hml += "<option value='강동구'>강동구</option>";
				hml += "<option value='강북구'>강북구</option>";
				hml += "<option value='강서구'>강서구</option>";
				hml += "<option value='관악구'>관악구</option>";
				hml += "<option value='광진구'>광진구</option>";
				hml += "<option value='구로구'>구로구</option>";
				hml += "<option value='금천구'>금천구</option>";
				hml += "<option value='노원구'>노원구</option>";
				hml += "<option value='도봉구'>도봉구</option>";
				hml += "<option value='동대문구'>동대문구</option>";
				hml += "<option value='동작구'>동작구</option>";
				hml += "<option value='마포구'>마포구</option>";
				hml += "<option value='서대문구'>서대문구</option>";
				hml += "<option value='서초구'>서초구</option>";
				hml += "<option value='성동구'>성동구</option>";
				hml += "<option value='성북구'>성북구</option>";
				hml += "<option value='송파구'>송파구</option>";
				hml += "<option value='양천구'>양천구</option>";
				hml += "<option value='영등포구'>영등포구</option>";
				hml += "<option value='용산구'>용산구</option>";
				hml += "<option value='은평구'>은평구</option>";
				hml += "<option value='종로구'>종로구</option>";
				hml += "<option value='중구'>중구</option>";
				hml += "<option value='중랑구'>중랑구</option>";
			}else if(province == "부산광역시"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='강서구'>강서구</option>";
				hml += "<option value='금정구'>금정구</option>";
				hml += "<option value='기장군'>기장군</option>";
				hml += "<option value='남구'>남구</option>";
				hml += "<option value='동구'>동구</option>";
				hml += "<option value='동래구'>동래구</option>";
				hml += "<option value='부산진구'>부산진구</option>";
				hml += "<option value='북구'>북구</option>";
				hml += "<option value='사상구'>사상구</option>";
				hml += "<option value='사하구'>사하구</option>";
				hml += "<option value='서구'>서구</option>";
				hml += "<option value='수영구'>수영구</option>";
				hml += "<option value='연제구'>연제구</option>";
				hml += "<option value='영도구'>영도구</option>";
				hml += "<option value='중구'>중구</option>";
				hml += "<option value='해운대구'>해운대구</option>";
			}else if(province == "대구광역시"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='남구'>남구</option>";
				hml += "<option value='달서구'>달서구</option>";
				hml += "<option value='달성군'>달성군</option>";
				hml += "<option value='동구'>동구</option>";
				hml += "<option value='북구'>북구</option>";
				hml += "<option value='서구'>서구</option>";
				hml += "<option value='수성구'>수성구</option>";
				hml += "<option value='중구'>중구</option>";
			}else if(province == "인천광역시"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='강화군'>강화군</option>";
				hml += "<option value='계양구'>계양구</option>";
				hml += "<option value='남동구'>남동구</option>";
				hml += "<option value='동구'>동구</option>";
				hml += "<option value='미추홀구'>미추홀구</option>";
				hml += "<option value='부평구'>부평구</option>";
				hml += "<option value='서구'>서구</option>";
				hml += "<option value='연수구'>연수구</option>";
				hml += "<option value='옹진군'>옹진군</option>";
				hml += "<option value='중구'>중구</option>";
			}else if(province == "광주광역시"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='광산구'>광산구</option>";
				hml += "<option value='남구'>남구</option>";
				hml += "<option value='동구'>동구</option>";
				hml += "<option value='북구'>북구</option>";
				hml += "<option value='서구'>서구</option>";
			}else if(province == "세종특별자치시"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='세종특별자치시'>세종특별자치시</option>";
			}else if(province == "대전광역시"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='대덕구'>대덕구</option>";
				hml += "<option value='동구'>동구</option>";
				hml += "<option value='서구'>서구</option>";
				hml += "<option value='유성구'>유성구</option>";
				hml += "<option value='중구'>중구</option>";
			}else if(province == "울산광역시"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='남구'>남구</option>";
				hml += "<option value='동구'>동구</option>";
				hml += "<option value='북구'>북구</option>";
				hml += "<option value='울주군'>울주군</option>";
				hml += "<option value='중구'>중구</option>";
			}else if(province == "경기도"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='가평군'>가평군</option>";
				hml += "<option value='고양시'>고양시</option>";
				hml += "<option value='과천시'>과천시</option>";
				hml += "<option value='광명시'>광명시</option>";
				hml += "<option value='광주시'>광주시</option>";
				hml += "<option value='구리시'>구리시</option>";
				hml += "<option value='군포시'>군포시</option>";
				hml += "<option value='김포시'>김포시</option>";
				hml += "<option value='남양주시'>남양주시</option>";
				hml += "<option value='동두천시'>동두천시</option>";
				hml += "<option value='부천시'>부천시</option>";
				hml += "<option value='성남시'>성남시</option>";
				hml += "<option value='수원시'>수원시</option>";
				hml += "<option value='시흥시'>시흥시</option>";
				hml += "<option value='안산시'>안산시</option>";
				hml += "<option value='안성시'>안성시</option>";
				hml += "<option value='안양시'>안양시</option>";
				hml += "<option value='양주시'>양주시</option>";
				hml += "<option value='양평군'>양평군</option>";
				hml += "<option value='여주시'>여주시</option>";
				hml += "<option value='연천군'>연천군</option>";
				hml += "<option value='오산시'>오산시</option>";
				hml += "<option value='용인시'>용인시</option>";
				hml += "<option value='용인시기흥구'>용인시기흥구</option>";
				hml += "<option value='의왕시'>의왕시</option>";
				hml += "<option value='의정부시'>의정부시</option>";
				hml += "<option value='이천시'>이천시</option>";
				hml += "<option value='파주시'>파주시</option>";
				hml += "<option value='평택시'>평택시</option>";
				hml += "<option value='포천시'>포천시</option>";
				hml += "<option value='하남시'>하남시</option>";
				hml += "<option value='화성시'>화성시</option>";
			}else if(province == "강원도"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='강릉시'>강릉시</option>";
				hml += "<option value='고성군'>고성군</option>";
				hml += "<option value='동해시'>동해시</option>";
				hml += "<option value='삼척시'>삼척시</option>";
				hml += "<option value='속초시'>속초시</option>";
				hml += "<option value='양구군'>양구군</option>";
				hml += "<option value='양양군'>양양군</option>";
				hml += "<option value='영월군'>영월군</option>";
				hml += "<option value='원주시'>원주시</option>";
				hml += "<option value='인제군'>인제군</option>";
				hml += "<option value='정선군'>정선군</option>";
				hml += "<option value='철원군'>철원군</option>";
				hml += "<option value='춘천시'>춘천시</option>";
				hml += "<option value='태백시'>태백시</option>";
				hml += "<option value='평창군'>평창군</option>";
				hml += "<option value='홍천군'>홍천군</option>";
				hml += "<option value='화천군'>화천군</option>";
				hml += "<option value='횡성군'>횡성군</option>";
			}else if(province == "충청북도"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='괴산군'>괴산군</option>";
				hml += "<option value='단양군'>단양군</option>";
				hml += "<option value='보은군'>보은군</option>";
				hml += "<option value='영동군'>영동군</option>";
				hml += "<option value='옥천군'>옥천군</option>";
				hml += "<option value='음성군'>음성군</option>";
				hml += "<option value='제천시'>제천시</option>";
				hml += "<option value='증평군'>증평군</option>";
				hml += "<option value='진천군'>진천군</option>";
				hml += "<option value='청주시'>청주시</option>";
				hml += "<option value='충주시'>충주시</option>";
			}else if(province == "충청남도"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='계룡시'>계룡시</option>";
				hml += "<option value='공주시'>공주시</option>";
				hml += "<option value='금산군'>금산군</option>";
				hml += "<option value='논산시'>논산시</option>";
				hml += "<option value='당진시'>당진시</option>";
				hml += "<option value='보령시'>보령시</option>";
				hml += "<option value='부여군'>부여군</option>";
				hml += "<option value='서산시'>서산시</option>";
				hml += "<option value='서천군'>서천군</option>";
				hml += "<option value='아산시'>아산시</option>";
				hml += "<option value='연기군'>연기군</option>";
				hml += "<option value='예산군'>예산군</option>";
				hml += "<option value='천안시'>천안시</option>";
				hml += "<option value='청양군'>청양군</option>";
				hml += "<option value='태안군'>태안군</option>";
				hml += "<option value='홍성군'>홍성군</option>";
			}else if(province == "전라북도"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='고창군'>고창군</option>";
				hml += "<option value='군산시'>군산시</option>";
				hml += "<option value='김제시'>김제시</option>";
				hml += "<option value='남원시'>남원시</option>";
				hml += "<option value='무주군'>무주군</option>";
				hml += "<option value='부안군'>부안군</option>";
				hml += "<option value='순창군'>순창군</option>";
				hml += "<option value='완주군'>완주군</option>";
				hml += "<option value='익산시'>익산시</option>";
				hml += "<option value='임실군'>임실군</option>";
				hml += "<option value='장수군'>장수군</option>";
				hml += "<option value='전주시'>전주시</option>";
				hml += "<option value='정읍시'>정읍시</option>";
				hml += "<option value='진안군'>진안군</option>";
			}else if(province == "전라남도"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='강진군'>강진군</option>";
				hml += "<option value='고흥군'>고흥군</option>";
				hml += "<option value='곡성군'>곡성군</option>";
				hml += "<option value='광양시'>광양시</option>";
				hml += "<option value='구례군'>구례군</option>";
				hml += "<option value='나주시'>나주시</option>";
				hml += "<option value='담양군'>담양군</option>";
				hml += "<option value='목포시'>목포시</option>";
				hml += "<option value='무안군'>무안군</option>";
				hml += "<option value='보성군'>보성군</option>";
				hml += "<option value='순천시'>순천시</option>";
				hml += "<option value='신안군'>신안군</option>";
				hml += "<option value='여수시'>여수시</option>";
				hml += "<option value='영광군'>영광군</option>";
				hml += "<option value='영암군'>영암군</option>";
				hml += "<option value='완도군'>완도군</option>";
				hml += "<option value='장성군'>장성군</option>";
				hml += "<option value='장흥군'>장흥군</option>";
				hml += "<option value='진도군'>진도군</option>";
				hml += "<option value='함평군'>함평군</option>";
				hml += "<option value='해남군'>해남군</option>";
				hml += "<option value='화순군'>화순군</option>";
			}else if(province == "경상북도"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='경산시'>경산시</option>";
				hml += "<option value='경주시'>경주시</option>";
				hml += "<option value='고령군'>고령군</option>";
				hml += "<option value='구미시'>구미시</option>";
				hml += "<option value='군위군'>군위군</option>";
				hml += "<option value='김천시'>김천시</option>";
				hml += "<option value='문경시'>문경시</option>";
				hml += "<option value='봉화군'>봉화군</option>";
				hml += "<option value='상주시'>상주시</option>";
				hml += "<option value='성주군'>성주군</option>";
				hml += "<option value='안동시'>안동시</option>";
				hml += "<option value='영덕군'>영덕군</option>";
				hml += "<option value='영양군'>영양군</option>";
				hml += "<option value='영주시'>영주시</option>";
				hml += "<option value='영천시'>영천시</option>";
				hml += "<option value='예천군'>예천군</option>";
				hml += "<option value='울릉군'>울릉군</option>";
				hml += "<option value='울진군'>울진군</option>";
				hml += "<option value='의성군'>의성군</option>";
				hml += "<option value='청도군'>청도군</option>";
				hml += "<option value='청송군'>청송군</option>";
				hml += "<option value='칠곡군'>칠곡군</option>";
				hml += "<option value='포항시'>포항시</option>";
			}else if(province == "경상남도"){
				$(this).removeClass("select").addClass("select2");
				hml += "<option value='거제시'>거제시</option>";
				hml += "<option value='거창군'>거창군</option>";
				hml += "<option value='고성군'>고성군</option>";
				hml += "<option value='김해시'>김해시</option>";
				hml += "<option value='남해군'>남해군</option>";
				hml += "<option value='밀양시'>밀양시</option>";
				hml += "<option value='사천시'>사천시</option>";
				hml += "<option value='산청군'>산청군</option>";
				hml += "<option value='양산시'>양산시</option>";
				hml += "<option value='의령군'>의령군</option>";
				hml += "<option value='진주시'>진주시</option>";
				hml += "<option value='창녕군'>창녕군</option>";
				hml += "<option value='창원마산합포회원구'>창원마산합포회원구</option>";
				hml += "<option value='창원의창성산구'>창원의창성산구</option>";
				hml += "<option value='창원진해구'>창원진해구</option>";
				hml += "<option value='통영시'>통영시</option>";
				hml += "<option value='하동군'>하동군</option>";
				hml += "<option value='함안군'>함안군</option>";
				hml += "<option value='함양군'>함양군</option>";
				hml += "<option value='합천군'>합천군</option>";
			}
			
			hml += "</select>"
			$(".lostCity").html(hml);
		}
	
	function species(){
		var species = $("#animalSpecies option:selected").val();
		var hml = "<select class='select2' id='detailSpecies' name='detailSpecies'>";
		hml += "<option value=''>전체</option>";
		
		if(species == "개"){
			$(this).removeClass("select").addClass("select2");
			hml += "<option value='골든리트리버'>골든리트리버</option>";
			hml += "<option value='그레이하운드'>그레이하운드</option>";
			hml += "<option value='그레이트덴'>그레이트덴</option>";
			hml += "<option value='그레이트피레니즈'>그레이트피레니즈</option>";
			hml += "<option value='기타'>기타</option>";
			hml += "<option value='꼬똥드뚤레아'>꼬똥드뚤레아</option>";
			hml += "<option value='네오폴리탄마스티프'>네오폴리탄마스티프</option>";
			hml += "<option value='노리치테리어'>노리치테리어</option>";
			hml += "<option value='뉴펀들랜드'>뉴펀들랜드</option>";
			hml += "<option value='닥스훈트'>닥스훈트</option>";
			hml += "<option value='달마시안'>달마시안</option>";
			hml += "<option value='댄디딘몬트테리어'>댄디딘몬트테리어</option>";
			hml += "<option value='도고까니리오'>도고까니리오</option>";
			hml += "<option value='도고아르젠티노'>도고아르젠티노</option>";
			hml += "<option value='도베르만'>도베르만</option>";
			hml += "<option value='도사'>도사</option>";
			hml += "<option value='동경견'>동경견</option>";
			hml += "<option value='라브라도리트리버'>라브라도리트리버</option>";
			hml += "<option value='라사압소'>라사압소</option>";
			hml += "<option value='라이카'>라이카</option>";
			hml += "<option value='래빗닥스훈드'>래빗닥스훈드</option>";
			hml += "<option value='랫테리어'>랫테리어</option>";
			hml += "<option value='레이크랜드테리어'>레이크랜드테리어</option>";
			hml += "<option value='로디지안리즈백'>로디지안리즈백</option>";
			hml += "<option value='로트바일러'>로트바일러</option>";
			hml += "<option value='롯트와일러'>롯트와일러</option>";
			hml += "<option value='마리노이즈'>마리노이즈</option>";
			hml += "<option value='마스티프'>마스티프</option>";
			hml += "<option value='말라뮤트'>말라뮤트</option>";
			hml += "<option value='말티즈'>말티즈</option>";
			hml += "<option value='믹스견'>믹스견</option>";
			hml += "<option value='푸들'>푸들</option>";
		}else if(species == "고양이"){
			$(this).removeClass("select").addClass("select2");
			hml += "<option value='미분류'>미분류</option>";
			hml += "<option value='기타'>기타</option>";
			hml += "<option value='노르웨이숲'>노르웨이숲</option>";
			hml += "<option value='데본렉스'>데본렉스</option>";
			hml += "<option value='러시안블루'>러시안블루</option>";
			hml += "<option value='레그돌-라가머핀'>레그돌-라가머핀</option>";
			hml += "<option value='맹크스'>맹크스</option>";
			hml += "<option value='먼치킨'>먼치킨</option>";
			
		}
		
		hml += "</select>"
		$(".detailSpecies").html(hml);
	};
	
	
</script>

</html>