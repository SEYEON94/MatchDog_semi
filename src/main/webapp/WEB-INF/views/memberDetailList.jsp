<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <style>

    button{
	  border: 0;
	  background-color: transparent;
	  cursor : pointer;
	}
	/* 스타일을 추가할 부분 */
	.detailModal {
			display: inline-block;
        	position:absolute;
           	background-color: var(--white);
			top: 120px;
			left: 320px;
			z-index: 1000;
			width: 450px;
			height: 620px;
			border: 1px solid var(--light);
			box-shadow: 0 0 8px 1px var(--light);
			border-radius:10px;
			overflow-y: auto;
        }
	.detailModal .closeButton {
            position: absolute;
			left: 386px;
			top: 10px;
			cursor: pointer;
			font-size: 32px;
			color:var(--white);
        }
	
	.detailModal #image {
		width: 432px;
	    height: 360px;
  		object-fit: cover;
  		box-shadow: 0 0 8px 1px var(--light);
  		text-align: center; 
	}
	
	.detailModal .detail_btn{
		display: inline-block;
		width: 120px;
		height: 32px;
		padding: 8px 15px 0 15px;
		background-color: var(--green);
		border-radius: 20px;
		color:var(--white);
		font-family:Pretendard;
		font-weight: 500;
		font-size:14px;
		text-align: center;
		z-index:100;	
	}
	
	.detailModal .btn_ch{
		display: inline-block;
		position: relative;
		width: 92px;
		height: 28px;
		padding: 6px 15px 0 15px;
		background-color: var(--green);
		border-radius: 14px;
		color:var(--white);
		font-family:Pretendard;
		font-weight: 500;
		font-size:14px;
		text-align: center;
		z-index:100;	
		margin: 2px;
	}
	
	.detailModal .main_text{
			font-size:16px;
			font-family:Pretendard;
			color:var(--dark);
			font-weight: 600;
			margin-bottom:20px;
	}
	
	.detailModal .detail_text{
        	display:inline-block;
        	font-size:16px;
			font-family:Pretendard;
			color:var(--dark);
			font-weight: 600;
			word-break: break-all;
			text-align:left;
        }
	
	.detailModal .main_subject{
        	display:inline-block;
        	font-size:20px;
			font-family:Pretendard;
			color:var(--green);
			font-weight: 800;
			word-break: break-all;
			text-align:left;
			left:294px;
			margin-bottom:20px;
        }
	
	.detailModal #member_dongAddr{
		position:absolute;
		top:20px;
		left:20px;
	}
	
	#member_gender{
	}
	
	.left #pro_dogName{
		font-size:30px;
		color:var(--dark);
		margin:20px;
	}
	
	#pro_dogAge{
	}
	
	#pro_dogGender{
	}
	
	#pro_dogBreed{
	}
	
	.detailModal .ch_flex{
		display:flex;
		flex-wrap: wrap;
		width:200px;
	}
	
	.detailModal .mat_flex{
		position:absolute;
		top:645px;
		left:720px;
		display:flex;
		width:300px;
		justify-content: space-around;
    	align-items: center;
	}
	
	.detailModal .btn_flex{
		position:absolute;
		top: 410px;
    	left: 424px;
		display:flex;
		width:910px;
		justify-content: space-around;
    	align-items: center;
	}

	.detailModal #characteristicsDo{
		margin: 20px 20px 10px 20px;
	}

	.detailModal #pro_dogDesc{
		margin: 20px;
		width:380px;
		word-break: break-all;
		color:var(--dark);
	}
	
	.bi-x-lg, .bi-heart-fill, .bi-chevron-compact-left, .bi-chevron-compact-right{
		font-weight: 900;
		font-size:42px;
	}

	.bi-heart-fill{
		color:var(--red);
	}
	
	.bi-x-lg{
		color:var(--green);
	}
	
	.dogInfo{
		display:flex;
		padding-bottom: 21px;
    	border-bottom: 1px solid var(--light);
	}
	
	.left{
		display:flex;
		flex-direction: column;
	}
	
	.left .dog_name{
		display:flex;
		align-items: center;
	}
	
	.left .dog_age{
		display:flex;
		align-items: center;
	}
	
	.dogInfo .dog_text{
   		text-align: center;
		font-size:16px;
		font-family:Pretendard;
		color:var(--dark);
		font-weight: 600;
	    width: 160px;
	}
	
	.button-green{
		position:absolute;
		top: 60%;
	    left: 50%;
	    text-align: center;
	    font-family: Pretendard;
	    font-weight: 600;
	    transform: translate(-50%, -50%);
	    color:var(--white);
	}
	
	.what{
		position:relative;
    	z-index:3000;
    	text-align: center;
	    display: flex;
	    justify-content: center;
	}
	
	.thumb-up-fill{
		font-size:40px;
		color:var(--green);
	}
	
	.dogInfo #ProdogAge{
		margin: 0 20px;	
	}
	
	.member_flex{
		display: flex;
		justify-content: space-between;
    	align-items: center;
	}
	
	.member_flex .name{
		display:flex;
		align-items: center;
		margin-left:20px;
	}
	
	.member_nickName{
		font-size:24px;
		color:var(--dark);
		margin:20px;
	}
	
	.member_gender{
		margin-right:40px;
	}
	
	 .right{
	 	display:flex;
	 	position:relative;
		width:160px;
		height:100px;
		margin: 20px auto;
		flex-direction: column;
   		justify-content: space-around;
	}
	
	#prevImg{
		font-size:40px;
		color:white;
		position:absolute;
		top:160px;
		left:20px;
		z-index:3000;
	}
	
	#nextImg{
		font-size:40px;
		color:white;
		position:absolute;
		top:155px;
		left:372px;
		z-index:3000;
	}
	
    </style>
</head>
<body>
<div class="detailModal">
	<span class="closeButton" onclick="closeModal()">&times;</span>
	<div>
		<img id="image">
	</div>
	<div class="detail_btn" id="member_dongAddr">${map.member_dongAddr}</div>
    <button id="prevImg" style="display:none;"><span class="bi bi-chevron-left"></span></button>
    <button id="nextImg" style="display:none;"><span class="bi bi-chevron-right"></span></button>
    <div class="dogInfo">
    	<div class="left">
	    <div class="dog_name">
			<div class="detail_text" id="pro_dogName">${map.pro_dogName}</div>
			<div class="detail_btn" id="pro_dogBreed">${map.breed}</div>
		</div>
		<div class="dog_age">
		<div class="detail_text" id="ProdogAge"></div>
		<div class="detail_text" id="ProdogGender"></div>
		</div>
		<div id="characteristicsDo">
			<div class="ch_flex">
				<div class="btnB1 btn_ch"></div>
				<div class="btnB2 btn_ch"></div>
				<div class="btnB3 btn_ch"></div>
				<div class="btnB4 btn_ch"></div>
			</div>
		</div>
		</div>
		<div class="right">
				<c:if test="${map.pro_dogScore >= 10}">
					<span class="dog_text">매너견이에요!😊</span> 
				</c:if>
				<c:if test="${map.pro_dogScore > 0 && map.pro_dogScore < 10}">
					<span class="dog_text">매너견이 되어보세요😮</span>
				</c:if>
				<c:if test="${map.pro_dogScore < 0}">
					<span class="dog_text">비매너견이에요😢</span>
				</c:if>
				<span class="what">
				<span class="thumb-up-fill"><span class ="bi bi-hand-thumbs-up-fill memberDetail"></span></span>
				<span class="button-green">${map.pro_dogScore}</span>
				</span>
		</div>
    </div>
    <div class="memberInfo">
    	<div class="member_flex">
    		<div class="name">
	    		<div class="detail_text">닉네임</div>
	    		<div class="member_nickName detail_text">${map.member_nickName}</div>
    		</div>
    		<div class="member_gender detail_btn">${map.member_gender}</div>
    	</div>
		<div class="detail_text" id="pro_dogDesc">${map.pro_dogDesc}</div>
    
    </div>
    
    
    </div>


    
</body>
<script>
	var matchingPtData = []; // 매칭 데이터 배열
	var currentPtIndex = 0; // 현재 표시 중인 데이터 인덱스
	var pro_idx = ""; 
	var currentPtMatch = "";
	var HiddenAge = "";
	var HiddenGnd = "";
	// 페이지 로딩 시 데이터 가져오기
	matchingPhoto();
	proOpen();
	
	var ch = $('#characteristicsDo');
    var result = '${map.characteristics}';
    var characteristicsArray = result.split(" / ");
    
    console.log(result);
    console.log(characteristicsArray);
    
    var btnB1Element = ch.find('.btnB1');
    var btnB2Element = ch.find('.btnB2');
    var btnB3Element = ch.find('.btnB3');
    var btnB4Element = ch.find('.btnB4');
    
    btnB1Element.text(characteristicsArray[0]);
    btnB2Element.text(characteristicsArray[1]);
    btnB3Element.text(characteristicsArray[2]);
    btnB4Element.text(characteristicsArray[3]);
	
	// 모달창 닫기
    function closeModal() {
        $(".modalcontainer").hide();
    }
    
	// 매칭 리스트
	function matchingPhoto() {
		pro_idx = ${map.pro_idx}
	    $.ajax({
	        type: 'get',
	        url: 'memberDetailPhoto.do',
	        data: {pro_idx: pro_idx},
	        dataType: 'json',
	        success: function (data) {
	            console.log(data);
	            console.log("성공");
	            matchingPtData = data.list;
				console.log("matchingPtData : "+matchingPtData);
	            // 페이지 로딩 시 첫 번째 매칭 데이터 표시
				showmatchingPhotoData(currentPtIndex);	        
	        },
	        error: function (e) {
	            console.log(e);
	            console.log("실패");
	        }
	    });
	}
	
	function showmatchingPhotoData(index) {
		var currentPtMatch = matchingPtData[index];
	    // 데이터가 없는 경우 처리
	    if (!currentPtMatch) {
	        console.log("데이터가 아직 로드되지 않았습니다.");
	        return;
	    }
	    var matchingList = currentPtMatch;
		
	    // 각 데이터에 대한 처리
		$('#image').attr('src', '/photo/' + matchingList.photo_fileName);
	    $('#image').attr('alt', matchingList.photo_fileName);
	    console.log("사진들: " + currentPtMatch);
	    
        if (matchingPtData.length > 1) {
            $('#prevImg').show();
            $('#nextImg').show();
        }
	}
	
	// 다음 버튼 클릭 시 다음 매칭 데이터 표시
	$('#nextImg').click(function (e) {
		e.stopPropagation(); // 모달의 영향을 받지 않도록 이벤트 전파 막기
	    console.log("다음 버튼");
        currentPtIndex = (currentPtIndex + 1) % matchingPtData.length;
        showmatchingPhotoData(currentPtIndex);
	});

	// 이전 버튼 클릭 시 이전 매칭 데이터 표시
	$('#prevImg').click(function (e) {
		e.stopPropagation(); // 모달의 영향을 받지 않도록 이벤트 전파 막기
	    console.log("이전 버튼");
	    currentPtIndex = (currentPtIndex - 1 + matchingPtData.length) % matchingPtData.length;
	    showmatchingPhotoData(currentPtIndex);
	});
	
	function proOpen(){
		pro_idx = ${map.pro_idx}
		
		$.ajax({
		    type: 'get',
		    url: 'MatchingProOpen.do',
		    data: {pro_idx: pro_idx},
		    dataType: 'json',
		    success: function (data) {
		        console.log(data);
		        if (data.list && data.list.length > 0){    	
		            console.log("첫번째 숨김여부"+data.list[0].open_hide);
		            HiddenAge = data.list[0].open_hide;
			        console.log("두번째 숨김여부"+data.list[1].open_hide);
			        HiddenGnd = data.list[1].open_hide;
		        }else{
		        	console.log("데이터가 없습니다");
		        	HiddenAge = "";
		        	HiddenGnd = "";
		        }
		        
		        if (HiddenAge !== "") {
		            if (HiddenAge == 'N') {
		                $('#ProdogAge').text('(비공개)');
		            } else {
		                $('#ProdogAge').text(${map.pro_dogAge}+'살');
		               
		            }
		        } else {
		            $('#ProdogAge').text(${map.pro_dogAge}+'살');
		            
		            var ch = $('#characteristicsDo');
		            var result = '${map.characteristics}';
			        var characteristicsArray = result.split(" / ");
			        
			        console.log(result);
			        console.log(characteristicsArray);
			        
			        var btnB1Element = ch.find('.btnB1');
			        var btnB2Element = ch.find('.btnB2');
			        var btnB3Element = ch.find('.btnB3');
			        var btnB4Element = ch.find('.btnB4');
			        
			        btnB1Element.text(characteristicsArray[0]);
			        btnB2Element.text(characteristicsArray[1]);
			        btnB3Element.text(characteristicsArray[2]);
			        btnB4Element.text(characteristicsArray[3]);
			        // 값 추출 및 배열에 저장

		            
		        }
		        if (HiddenGnd !== "") {
		            if (HiddenGnd == 'N') {
		                $('#ProdogGender').text('(비공개)');
		            } else {
		                $('#ProdogGender').text('${map.pro_dogGender}'+'아');
		            }
		        } else {
		            $('#ProdogGender').text('${map.pro_dogGender}'+'아');
		            
		            
		            var ch = $('#characteristicsDo');
		            var result = '${map.characteristics}';
			        var characteristicsArray = result.split(" / ");
			        
			        console.log(result);
			        console.log(characteristicsArray);
			        
			        var btnB1Element = ch.find('.btnB1');
			        var btnB2Element = ch.find('.btnB2');
			        var btnB3Element = ch.find('.btnB3');
			        var btnB4Element = ch.find('.btnB4');
			        
			        btnB1Element.text(characteristicsArray[0]);
			        btnB2Element.text(characteristicsArray[1]);
			        btnB3Element.text(characteristicsArray[2]);
			        btnB4Element.text(characteristicsArray[3]);
			        // 값 추출 및 배열에 저장

		            
		        }
		    },
		    error: function (e) {
		        console.log(e);
		        console.log("실패");
		    }
		});
	}
	
	function closeModal() {
        $(".detailModal").hide();
    }
	
</script>
</html>
