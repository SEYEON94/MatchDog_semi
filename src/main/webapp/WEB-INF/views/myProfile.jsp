<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/myProfile.css" type="text/css">
<!-- bootstrap 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 처리를 위한 라이브러리 -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<jsp:include page="adminCheck.jsp" />
<style>
	a, a:link, a:visited, a:active, a:hover {
		text-decoration: none;
		color: var(--black);
	}
	
	/* 본인 페이지 것으로 변경하기  */
	.btn_gnb .bi-person-circle, .btn_gnb.myPage{
	    color: var(--white);
	    background-color: var(--green);
	}
	
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
	.btn_gnb:hover .bi-house-door-fill,
	.btn_gnb:hover .bi-chat-dots-fill,
	.btn_gnb:hover .bi-gear-fill,
	.btn_gnb:hover .bi-people-fill,
	/*.btn_gnb:hover .bi-person-circle,*/
	.btn_gnb:hover .bi-list-ul {
	    background-color: var(--light);
	}
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
	.btn_gnb.home:hover,
	.btn_gnb.match:hover,
	.btn_gnb.chatting:hover,
	.btn_gnb.board:hover,
	/*.btn_gnb.myPage:hover,*/
	.btn_gnb.admin:hover,
	.btn_gnb.myPageInfo:hover{
		background-color: var(--light);
	}
	
	.myPageMenu .myProfile{
		color: var(--white);
	    background-color: var(--green);
	}

	.my_profile_h4{
		width: 60px;
	}

	.dog_text.size{
		width: 50px;
	}
	
	.dogDesc.menu{
		display:flex;
		align-items: flex-start;
	}
	
	.dog_text.desc{
		margin-top:10px;
	}
	
	.dog_text.desc.i{
		width:260px;
	}
	

	/* 대표프로필 모달 */
	.RepdoModal {
		display: none;
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.7);
		z-index: 1;
	}
	
	.RepdoModal-content {
		position: absolute;
		width:300px;
		height:180px;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		background-color: #fff;
		padding: 20px;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	}
	
	/* 프로필 생성 모달 */
	.regProfileGoModal {
		display: none;
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.7);
		z-index: 1;
	}
	
	.regProfileGoModal-content {
		position: absolute;
		width:300px;
		height:180px;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		background-color: #fff;
		padding: 20px;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	}
	
	/* 프로필 삭제 모달 */
	.profileDelDoModal {
		display: none;
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.7);
		z-index: 1;
	}
	
	.profileDelDoModal-content {
		position: absolute;
		width:300px;
		height:180px;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		background-color: #fff;
		padding: 20px;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	}
	
	.switch {
		position: relative;
		display: inline-block;
		width: 60px;
		height: 34px;
		vertical-align: middle;
	}
	
	.content {
    	width: 734px;
	    margin: 2.125rem 0 0 4.125rem;
	    font-family: pretendard;
	}
	
	.button-gray {
        display: inline-block;
		position: relative;
		width: 120px;
		height: 32px;
		border: 1px solid var(--light);
		background-color: var(--light);
		color:var(--dark);
		cursor:pointer;
		border-radius: 8px;
		font-family:Pretendard;
		font-size:16px;
		font-weight: 500;
		text-align: center;
    }
    
    .button-gray:hover{
	    background-color: var(--grey);
	    border: 1px solid var(--grey);
	} 
    
    .button-green {
        display: inline-block;
		position: relative;
		width: 120px;
		height: 32px;
		border: 1px solid var(--green);
		background-color: var(--green);
		color:var(--white);
		cursor:pointer;
		border-radius: 8px;
		font-family:Pretendard;
		font-size:16px;
		font-weight: 500;
		text-align: center;
    }
    
    .button-green:hover{
	    background-color: var(--darkGreen);
	    border: 1px solid var(--darkGreen);
	}
	
	.repProfileOne{
		display: inline-block;
		position: relative;
		width: 120px;
		height: 32px;
		padding: 5px 15px;
		border: 1px solid var(--light);
		background-color: #DAA520;
		color:var(--white);
		border-radius: 8px;
		font-family:Pretendard;
		font-weight: 500;
		text-align: center;
	}
	
	.what{
		position:relative;
    	text-align: center;
	    display: flex;
	    align-items: center;
	}
	
	.thumb-up-fill{
		padding:0 0 12px 4px;
		font-size:40px;
		color:var(--green);
	}
	
	.dogScore{
		position:absolute;
		top: 50%;
	    left: 88%;
	    text-align: center;
	    font-family: Pretendard;
	    font-weight: 600;
	    transform: translate(-50%, -50%);
	    color:var(--white);
	}
	
	.profileList{
		border: 1px solid var(--light);
		border-radius: 8px;
		padding: 2.125rem;
		margin-bottom:20px;
		box-shadow: 0 0 8px 1px var(--light);
	}
	
	
	
	/* ON/OFF 슬라이드 */
	.switch input {
		display: none;
	}
	
	.slider {
		position: absolute;
		cursor: pointer;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background-color: #ccc;
		-webkit-transition: .4s;
		transition: .4s;
	}
	
	.slider:before {
		position: absolute;
		content: "";
		height: 26px;
		width: 26px;
		left: 4px;
		bottom: 4px;
		background-color: white;
		-webkit-transition: .4s;
		transition: .4s;
	}
	
	input:checked+.slider {
		background-color: var(--green);
	}
	
	input:focus+.slider {
		box-shadow: 0 0 1px #2196F3;
	}
	
	input:checked+.slider:before {
		-webkit-transform: translateX(26px);
		-ms-transform: translateX(26px);
		transform: translateX(26px);
	}
	
	/* Rounded sliders */
	.slider.round {
		border-radius: 34px;
	}
	
	.slider.round:before {
		border-radius: 50%;
	}

	#randomColorTag {
	        padding: 6px 12px;
	        font-size: 16px;
	        text-align: center;
	        text-decoration: none;
	        background-color: #1abc9c;
	        color: #ffffff;
	        border-radius: 20px;
	}


</style>
</head>
<body>


<div id="wrap">
	<div class="banner">
		<div class="header">
			<h1 class="logo">
				<a href="./HomeMatchingList.do"><img src="./resources/img/logo.png" class="logo_matchDog"/></a>
			</h1>
			<div class="gnb">
				<a id="openAlarm" class="alarm"><span class="bi bi-bell-fill"></span></a>
				<a href="./logout.do"><span class="logout">로그아웃</span></a>
			</div>
		</div>
	</div>
	<div class="mainContainer">
		<div class="side">
			<div class="menu">
				<a href="./HomeMatchingList.do" class="btn_gnb home">
					<span class="bi bi-house-door-fill"></span>
					<span>홈</span>
				</a>
		        <a href="./recvMatchingList.go" class="btn_gnb match">
		        	<span class="bi bi-list-ul"></span>
					<span>매칭리스트</span>
		        </a>
		        <a href="./chattingList.go" class="btn_gnb chatting">
		        	<span class="bi bi-chat-dots-fill"></span>
					<span>채팅</span>
		        </a>
		        <a href="./boardList.go" class="btn_gnb board">
		        	<span class="bi bi-people-fill"></span>
					<span>커뮤니티</span>
		        </a>
		        <a href="./myPageList.do" class="btn_gnb myPage">
		        	<span class="bi bi-person-circle"></span>
					<span>마이페이지</span>
		        </a>
	            <a href="./adminList.go" class="btn_gnb admin">
	            	<span class="bi bi-gear-fill"></span>
					<span>관리자페이지</span>
	            </a>
			</div>
		</div>
		<div class="subSide">
			<div class="my_profile_h3">${myPage.member_name} 님의 마이페이지</div>
			<div><img src="/photo/${repPhotoName}" class="profilePhoto"/></div>
			<span pro_idx="${Profile.pro_idx}"></span>
			<c:url value="/myPage" var="myPageUrl" />
			<div class="myPageMenu">
				<a href="./myPageList.do" class="btn_gnb myPageInfo">
					<span>회원 정보</span>
			    </a>
			    <a href="./myProfileList.do" class="btn_gnb myProfile">
					<span>프로필</span>
			    </a>
		    </div>
		</div>
		
		<div id="alarmContent"></div>
		<div class="content">
		<!-- 프로필 추가 -->
		<div style="display:flex; flex-direction: row-reverse; height: 4.125rem;">
			<c:choose>
			    <c:when test="${myProfile.size() < 3}">
			        <button class="regProfileGo button-green" value="">프로필 추가</button>
			    </c:when>
			    <c:otherwise>
			        <button class="regProfileGo button-green" value="" style="display: none">프로필 추가</button>
			    </c:otherwise>
			</c:choose>
		</div>
		
		<c:forEach items="${myProfile}" var="profile">
		    <input type="hidden" value="${profile.pro_idx}"/>
		</c:forEach>
		
		<!-- 프로필 추가/삭제 모달 -->
		<div id="regProfileGoModal" class="regProfileGoModal">
		  	<div class="regProfileGoModal-content">
				<h2 style="text-align: center;">프로필을 추가로<br/>생성하시겠습니까?</h2>
				<div class="button-container" style="display:flex; justify-content: center;">
					<button class="regProfileGoConfirmYes button-green" value="${Profile.member_idx}">예</button>
					<button class="regProfileGoConfirmNo button-gray" style="margin-left:8px;">아니오</button>
				</div>
			</div>
		</div>
		
		<div id="profileDelDoModal" class="profileDelDoModal">
		  	<div class="profileDelDoModal-content">
		       	<h2 style="text-align: center;">정말 프로필을<br/>삭제하시겠습니까?</h2>
		       	<div style="display:flex; justify-content: center;">
			     	<button class="profileDelDoConfirmYes button-green"  value="Y">예</button>
			       	<button class="profileDelDoConfirmNo button-gray" style="margin-left:8px;">아니오</button>
		       	</div>
		   	</div>
		</div>
		
		<!-- c:forEach 로 돌리는 프로필란... -->
		<c:forEach items="${myProfile}" var="Profile" varStatus="loop">
			<div class="profileList">
				<div><input type="hidden" value="${loop.index}"/></div>
				<c:if test="${Profile.pro_quit == 'N'}"> 
				
					<span class="my_profile_h4">${Profile.pro_dogName}</span>
					<span class="my_profile_h4 black">님의 프로필 페이지</span>
					<!-- 프로필 삭제 버튼  -->
					
					
				    <c:if test="${Profile.pro_rep == 'Y'}">
				    	<span class="repProfileOne" >대표프로필</span>
				    </c:if>
				    <!-- 대표프로필 지정 모달-->
				    <c:if test="${Profile.pro_rep == 'N'}">
				    	<button class="repProfile button-green" id='myProfileRepdo'>대표프로필 지정</button>
				    	<div id="RepdoModal" class="RepdoModal">
					    	<div class="RepdoModal-content">
						        <h2 style="text-align: center;">대표 프로필로<br/>지정하시겠습니까?</h2>
						        <div style="display:flex; justify-content: center;">
							        <button id="RepdoConfirmYes" class="button-green" value="${Profile.pro_idx}">예</button>
							        <button id="RepdoConfirmNo" class="button-gray" style="margin-left:8px;" >아니오</button>
						        </div>
					    	</div>
						</div>
					</c:if>
						
					<form action="myProfileMod.go" method="post">
					    <div pro_idx="${Profile.pro_idx}">
					    
							<c:set var="minPhotoId" value="9999" />
							<c:set var="minFileName" value="" />
							<c:forEach items="${Profile.photoList}" var="photo" varStatus="loop">
								<c:if test="${photo.photo_id < minPhotoId}">
										<c:set var="minPhotoId" value="${photo.photo_id}" />
									<c:set var="minFileName" value="${photo.photo_fileName}" />
								</c:if>
							</c:forEach>
					   		<div style="margin-bottom:3rem">
					   			<img src="/photo/${minFileName}" class="profilePhoto"/>
					   		</div>
					
							<div class="myProfileContent">
								<div class="dogName menu">
									<div class="dog_text">내 강아지 이름</div>
									<div class="dog_text">${Profile.pro_dogName}</div>
								</div>
								
								<div class="dogBreed menu">
									<div class="dog_text">내 강아지 견종</div>
									<div class="dog_text">${Profile.breedType}</div>
								</div>
								
								<div class="dogAge menu">
									<div class="dog_text">내 강아지 나이</div>
									<div class="dog_text size">${Profile.pro_dogAge}</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:if test="${Profile.pro_dogAgeOpen == 'Y'}">
									<label class="switch"> 
									<input type="checkbox" value="${Profile.pro_idx}" id="ageOpen" checked> 
									<span class="slider round"></span>
									</label>
								</c:if>
								<c:if test="${Profile.pro_dogAgeOpen != 'Y'}">
									<label class="switch">
									<input type="checkbox" value="${Profile.pro_idx}" id="ageOpen"> 
									<span class="slider round"></span>
									</label>
								</c:if>
								</div>
								
								<div class="dogGender menu">
									<div class="dog_text">내 강아지 성별</div>
									<div class="dog_text size">${Profile.pro_dogGender}</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:if test="${Profile.pro_dogGenderOpen == 'Y'}">
									<label class="switch"> <input type="checkbox" value="${Profile.pro_idx}" id="genderOpen" checked> 
									<span class="slider round"></span>
									</label>
								</c:if>
								<c:if test="${Profile.pro_dogGenderOpen != 'Y'}">
									<label class="switch"> <input type="checkbox" value="${Profile.pro_idx}" id="genderOpen"> 
									<span class="slider round"></span>
									</label>
								</c:if>
								</div>
								
								<div class="dogCharType menu">
									<div class="dog_text">내 강아지 성향</div>
									<div id="selectedCharTypes">
										<c:forEach items="${Profile.charTypeList}" var="charType" varStatus="loop">
						        			<span id="randomColorTag" class="charTag">${charType.charType}</span>
						        		<c:if test="${!loop.last}">&nbsp;</c:if>
					   					</c:forEach>
									</div>
								</div>
								
								<div class="dogStmt menu" style="height:80px;">
									<div class="dog_text">내 강아지 상태</div>
									<div class="dog_text">
										<span class="what">
										<c:if test="${Profile.pro_dogScore >= 10}">
											<span>매너견이에요!😊</span>
										</c:if>
										<c:if
											test="${Profile.pro_dogScore > 0 && Profile.pro_dogScore < 10}">
											<span>매너견이 되어보세요😮</span>
										</c:if>
										<c:if test="${Profile.pro_dogScore < 0}">
											<span>비매너견이에요😢</span>
										</c:if>
										<!-- 여기에 이미지를 추가하고 싶다면 아래와 같이 추가할 수 있습니다. -->
											<span class="thumb-up-fill"><span class ="bi bi-hand-thumbs-up-fill memberDetail"></span></span>
											<span class="dogScore">${Profile.pro_dogScore}</span>
										</span>
										
									</div>
								</div>
								
								<div class="dogDesc menu">
									<div class="dog_text desc">내 강아지 소개</div>
									<div class="dog_text desc i">${Profile.pro_dogDesc}</div>
								</div>
								
							</div>
						
						</div>
					</form>
					<!-- 프로필 삭제 버튼  -->
					<div style="display:flex; flex-direction: row-reverse;">
						<c:if test="${Profile.pro_quit == 'N' && myProfile.size() == 2 }">
							<button class='profileDelDo button-gray' value="${Profile.pro_idx}" pro_rep="${Profile.pro_rep}">삭제하기</button>
						</c:if>
						<c:if test="${Profile.pro_quit == 'N' && myProfile.size() >= 3}">
							<button class='profileDelDo button-gray' value="${Profile.pro_idx}" pro_rep="${Profile.pro_rep}">삭제하기</button>
							<input type="hidden" value="${Profile.pro_idx}"/>
						</c:if>
						<button 
							class="cancelComp button-green" type="button" 
							onclick="location.href='./myProfileMod.go?pro_idx=${Profile.pro_idx}'" style="margin-right:8px;">
						수정하기
						</button>
					</div>
				</c:if>
			</div>
		</c:forEach>

		</div>
	</div>
</div>
	





</body>


<script>
function getRandomColor() {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

document.addEventListener('DOMContentLoaded', function() {
    // 랜덤 색상 적용
    var charTags = document.querySelectorAll('.charTag');

    charTags.forEach(function(tag) {
        tag.style.backgroundColor = getRandomColor();
    });
});

var profileDelDoModal = $(".profileDelDoModal");
var profileDelDo = $(".profileDelDo");
var profileDelDoConfirmYes = $(".profileDelDoConfirmYes");
var profileDelDoConfirmNo = $(".profileDelDoConfirmNo");
var pro_idx = null;

profileDelDo.on("click", function (e) {
	var pro_rep = $(this).attr("pro_rep");

    console.log("pro_rep:", pro_rep);

    if (pro_rep === 'Y') {
        console.log('대표프로필');
        alert('대표프로필은 삭제할 수 없습니다.');
    } else if (pro_rep === 'N') {
        console.log("삭제");
        pro_idx = $(this).attr("value");
        console.log(pro_idx);
        profileDelDoModal.css("display", "block");
    }
});


profileDelDoConfirmYes.on('click', function(e) {
	var yes = $(this).attr("value");
	console.log(yes);
		// '예'를 선택한 경우, 서버로 전송하는 코드
console.log(pro_idx);
	if (yes == "Y") {
        // pro_idxToDelete 변수에 저장된 pro_idx 값을 서버로 전송
        $.ajax({
            type: 'GET',
            url: 'myProfileDel.do', // 서버 엔드포인트 URL을 지정
            data: {
                "pro_idx": pro_idx
            },
            success : function(data) {
				console.log(data);
				console.log("프로필 삭제 완료");
				location.href = './myProfileList.do';
				if (!data.login) {
					alert('로그인이 필요한 서비스입니다.');
					location.href = './';
				}
			},
            error: function(e) {
                console.log(e);
                // 오류 처리
            }
        });

		profileDelDoModal.css("display", "none");

	};
});

	profileDelDoConfirmNo.click(function() {
		// '아니오'를 선택한 경우, 모달 창 닫기
		profileDelDoModal.css("display", "none");
	});

	/* 프로필 생성 이동 스크립트 */

	var regProfileGoModal = $(".regProfileGoModal");
	$('.regProfileGo').on("click", function(e) {
		console.log("생성");
		var member_idx = $(this).attr("value");
		console.log(member_idx);
		regProfileGoModal.css("display", "block");
	});

	$('.regProfileGoConfirmYes').click(function(e) {
		// '예'를 선택한 경우, 생성 페이지로 이동 후 모달 창 닫기
		var member_idx = $(this).attr("value");
		console.log(member_idx);
		location.href = "./regProfile";
		regProfileGoModal.css("display", "none");
	});

	$('.regProfileGoConfirmNo').click(function() {
		// '아니오'를 선택한 경우, 모달 창 닫기
		regProfileGoModal.css("display", "none");
	});

	// 대표 프로필 설정 스크립트
	var RepdoModal = $("#RepdoModal");
	var myProfileRepdo = $("#myProfileRepdo");
	var RepdoConfirmYes = $("#RepdoConfirmYes");
	var RepdoConfirmNo = $("#RepdoConfirmNo");

	myProfileRepdo.click(function() {
		// 대표 프로필 설정 모달 표시
		RepdoModal.css("display", "block");
	});

	RepdoConfirmYes.click(function(e) {

		var pro_idx = $(this).attr("value");
		console.log(pro_idx);
		// '예'를 선택한 경우, 서버로 전송하는 코드
		$.ajax({
			type : 'get',
			url : 'myProfileRep.do', // 서버로 요청을 보낼 엔드포인트를 지정
			data : {
				"pro_idx" : pro_idx
			},
			success : function(data) {
				console.log(data);
				console.log("대표프로필로 저장되었습니다.");
				location.href = './myProfileList.do';
				if (!data.login) {
					alert('로그인이 필요한 서비스입니다.');
					location.href = './';
				}
			},
			error : function(e) {
				console.log(e)
			}
		});
		/*     location.href='./myProfileRep.do'; */
		// 모달 닫기
		RepdoModal.css("display", "none");

	});

	RepdoConfirmNo.click(function() {
		// '아니오'를 선택한 경우, 모달 창 닫기
		RepdoModal.css("display", "none");
	});

	$('input[type="checkbox"]').on("change", function(e) {
		var pro_idx = $(this).attr('value');
		console.log(pro_idx);
		var isChecked = $(this).is(":checked");
		console.log(isChecked);
		var checkboxId = $(this).attr("id");
		var openType_code = '';

		if (checkboxId == 'ageOpen') {
			openType_code = 1;
		} else if (checkboxId == 'genderOpen') {
			openType_code = 2;
		}
		console.log(openType_code);
		console.log(checkboxId);
		var toggleValue = isChecked ? "Y" : "N";
		console.log(toggleValue);

		$.ajax({
			type : 'get',
			url : 'myProfileOpen.do', // 서버로 요청을 보낼 엔드포인트를 지정
			data : {
				"pro_idx" : pro_idx,
				"openType_code" : openType_code,
				"toggleValue" : toggleValue
			},
			success : function(data) {
				console.log(data);
				console.log("데이터가 서버에 저장되었습니다.");
				if (!data.login) {
					alert('로그인이 필요한 서비스입니다.');
					location.href = './';
				}
			},
			error : function(e) {
				console.log(e)
			}
		});

	});

	$('#myProfileMod').on('click', function() {
		location.href = './myProfileMod.go';
	});
	
	
	$('#openAlarm').click(function (e) {
		   // JSP 파일을 가져와서 모달 창에 표시
		   $.get("./alarmList.go", function(data) {
		   	console.log(data);
		   	console.log("#alarmContent");
		       $("#alarmContent").html(data);
		   });
		});
	
	
	
	
	
	
	
	
</script>
</html>