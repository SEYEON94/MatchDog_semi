
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/chattingRoom.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 처리를 위한 라이브러리 -->
<style>

	a, a:link, a:visited, a:active, a:hover {
			text-decoration: none;
			color: var(--black);
		}
		
	/* admin페이지 side bar 메뉴 아이콘 */
	.bi-gear-fill, .bi-reception-3,  .bi-people-fill, 
	.bi-person-gear, .bi-person-x-fill, .bi-door-open-fill {
		position:relative;
		color: var(--black) ;
		font-size: 22px;
		margin-right:10px;
	}
	
	/* 본인 페이지 것으로 변경하기  */
	.btn_gnb .bi-person-x-fill, .btn_gnb.comp{
	    color: var(--white);
	    background-color: var(--green);
	}
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
	.btn_gnb:hover .bi-gear-fill,
	.btn_gnb:hover .bi-reception-3,
	.btn_gnb:hover .bi-people-fill,
	.btn_gnb:hover .bi-person-gear,
	/* .btn_gnb:hover .bi-person-x-fill, */
	.btn_gnb:hover .bi-door-open-fill {
	    background-color: var(--light);
	}
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
	.btn_gnb.home:hover,
	.btn_gnb.dash:hover,
	.btn_gnb.user:hover, 
	.btn_gnb.auth:hover,
	/* .btn_gnb.comp:hover, */
	.btn_gnb.service:hover{
		background-color: var(--light);
	}

	#modalContent{
		width: 500px;
		height: 500px;
		text-align: left; 
	}

    #modalContent{
    	width: 500px;
    	height: 500px;
    	text-align: left; 
    }

	.card {
	  width: 100%;
	  display: grid;
	}
	
	.row1,.row2,.row3,.row4,.row5 {
	  display: grid;
	  grid-template-columns: repeat(4, 1fr);
	  border: 1px solid var(--light);
	  border-bottom:none;
	}
	.row6 {
	   	display: grid;
	  	grid-template-columns: repeat(6, 1fr);
		border: 1px solid var(--light);
		border-bottom:none;
	}
	.row7 {
	   display: grid;
	 	grid-template-columns: repeat(2, 1fr);
		border: 1px solid var(--light);
		border-bottom:none;
	}
	.row8 {
	  	display: grid;
	  	grid-template-columns: repeat(2, 1fr);
		border: 1px solid var(--light);
		border-bottom:none;
	}
	.row9 {
	   	display: grid;
	  	grid-template-columns: repeat(2, 1fr);
	 	border: 1px solid var(--light);
	 	border-bottom:none;
	}
	.row10 {
	   	display: grid;
	  	grid-template-columns: repeat(2, 1fr);
	  	border: 1px solid var(--light);
	}
	
	.row12{
		border: 1px solid var(--light);
	}
	
	 input[name="comp_handleContent"]{
	 height: 200px;
	}
	
	p{
		border-left:1px solid var(--light);
		padding:20px;
		margin: 0;
	}
	
	textarea{
		resize: none;
	}
	
	.content{
		flex-direction: column;
		padding: 40px 0 40px 60px;
		justify-content: flex-start;
	}
	
	.text{
	    height: 2.125rem;
	    font-family: Pretendard;
	    font-size: 16px;
	    border: 1px solid var(--light);
	    border-radius: 4px;
	    padding-left: 8px;
	}
	
	.comment{
		width:100%;
		height:6.125rem;
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
	
	.buttons{
		margin-top:3.125rem;
		display:flex;
		justify-content: center;
		
	}
	
	.table-left{
		border-left:none; 
		background-color:#eceff1;
	}
	
	.table-right{
		background-color:#eceff1;
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
		        <a href="./adminList.go" class="btn_gnb dash">
		        	<span class="bi bi-reception-3"></span>
					<span>DASH BOARD</span>
		        </a>
		        <a href="./memberList.go" class="btn_gnb user">
		        	<span class="bi bi-people-fill"></span>
					<span>회원관리</span>
		        </a>
		        <a href="./authList.do" class="btn_gnb auth">
	                <span class="bi bi-person-gear"></span>
	                <span>권한관리</span>
               </a>
		        <a href="./compList.go" class="btn_gnb comp">
		        	<span class="bi bi-person-x-fill"></span>
					<span>신고관리</span>
		        </a>
		        <a href="./HomeMatchingList.do" class="btn_gnb service">
		        	<span class="bi bi-door-open-fill"></span>
					<span>서비스페이지</span>
		        </a>
			</div>
		</div>
		<div class="content">		
			<div id="alarmContent"></div>
			
	     	 <form action="backCompList">
				<div class = backbutton>
					<h2>신고 상세보기</h2>
				</div>
			</form>
			<form class="card" action="proRegist.do" method="post" id="compForm">
				<input type="hidden" name="comp_idx" value="${cpd.comp_idx}">
				<div class="row1">
					<p class="table-left">신고번호</p>
					<p>${cpd.comp_idx}</p>
					<p class="table-right">신고코드</p>
					<p id="compTypeValue">${cpd.compType_code}</p>
				</div>
				<div class="row2">
					<p class="table-left">신고분류</p>
					<p id ="compLocValue">${cpd.comp_loc}</p>
					<p class="table-right">게시물번호</p>
					<p>${cpd.comp_idfNum}</p>
				</div>
				<div class="row3">
					<p class="table-left">신고자ID</p>
					<p>${mem}</p>
					<p class="table-right">피신고자ID</p>
					<p>${pem}</p>
				</div>
				<div class="row4">
					<p class="table-left">신고처리상태</p>
					<p>
						<select name="comp_handleState" class="text">
							<option value="미처리">미처리</option>
							<option value="처리중">처리중</option>
							<option value="처리완료">처리완료</option>
						</select>
					</p>
					<p class="table-right">블라인드여부</p>
					<p>
						<select name="comp_blindStete" class="text">
							<option value="N">N</option>
							<option value="Y">Y</option>
						</select>
					</p>
				</div>
				<div class="row5">
					<p class="table-left">신고일자</p>
					<p>${cpd.comp_receiveDate}</p>
					<p class="table-right">처리일자</p>
					<p>${cpd.comp_handleDate}</p>
				</div>
				<div class="row6">
					<p class="table-left">로그인 제한 여부</p>
					<p>
						<select name="member_loginLock" class="text">
							<option value="N">N</option>
							<option value="Y">Y</option>
						</select>
					</p>
					<p class="table-right">로그인 제한 시작일</p>
					<p>
						<input class="text" type="date" id="loginLock_sDate" name="loginLock_sDate">
					</p>
					<p class="table-right">로그인 제한 종료일</p>
					<p>
						<input class="text" type="date" id="loginLock_eDate" name="loginLock_eDate">
					</p>
				</div>
				<div class="row7">
					<p class="table-left">신고사유</p>
					<p>${cpd.comp_content}</p>
				</div>
				<div class="row9">
					<p class="table-left">관리자</p>
					<p>${cpd.member_id}</p>
				</div>
				<div class="row10">
					<p class="table-left">관리자 코멘트</p>
					<p>
						<textarea class="text comment"
							name="comp_handleContent" type="text" placeholder="관리자 코맨트">
						</textarea>
					</p>
				</div>
				<div class="buttons">
					<input 
						type="button" onclick="location.href='javascript:history.back()'" 
						value="뒤로가기" id="back" class="button-gray"/>
					<button class="button-green" style="margin-left:16px;">등록하기</button>
				</div>
			</form>
			<h2>신고 히스토리</h2>
		<c:if test="${not empty cpd.comp_handleDate}">
    	<div class="row12" style="overflow:scroll; width:100%; height:150px;">
		        (가장최근에 처리한 히스토리 내용입니다.)<br>
		        신고번호:${cpd.comp_idx}/신고코드:${cpd.compType_code}/신고분류:
		        ${cpd.comp_loc}/게시물번호:${cpd.comp_idfNum}/신고자 ID:${mem}/
		        피신고자 ID:${pem}/로그인 제제여부:${his.member_loginLock}/로그인 제한 시작일:${his.loginLock_sDate}/
		        로그인 제한 종료일:${his.loginLock_eDate},관리자코멘트:${his.comp_handleContent}
    	</div>
		</c:if>
	</div>
	</div>
	</div>
</body>
<script>

function getCompType(compType_code) {
    if (compType_code === "1") {
        return "1(불법)";
    } else if (compType_code === "2") {
        return "2(음란물)";
    } else if (compType_code === "3") {
        return "3(불법정보)";
    } else if (compType_code === "4") {
        return "4(청소년 유해)";
    } else if (compType_code === "5") {
        return "5(욕설/혐오)";
    } else if (compType_code === "6") {
        return "6(정보/노출)";
    } else if (compType_code === "7") {
        return "7(불쾌한 표현)";
    } else {
        return "알 수 없음";
    }
}

function getCompLoc(comp_loc) {
    if (comp_loc === "1") {
        return "게시글";
    } else if (comp_loc === "2") {
        return "댓글";
    } else if (comp_loc === "3") {
        return "채팅방";
    } else {
        return "알 수 없음";
    }
}

document.addEventListener("DOMContentLoaded", function() {
    // DOM이 완전히 로드된 후 실행되도록 변경

    // JavaScript에서 JSP 변수를 사용
    var compTypeCode = "${cpd.compType_code}";
    var compLoc = "${cpd.comp_loc}";

    // compTypeCode 값을 getCompType 함수로 변환
    var compTypeValue = getCompType(compTypeCode);
    var compLocValue = getCompLoc(compLoc);

    // 변환된 값을 HTML 엘리먼트에 적용
    document.getElementById("compTypeValue").textContent = compTypeValue;
    document.getElementById("compLocValue").textContent = compLocValue;

    // 처리 등록하기 버튼 클릭 시 이벤트 핸들러
    document.querySelector('.buttons button').addEventListener('click', function(event) {
        // 관리자 코멘트 값 가져오기
        var compHandleContent = document.querySelector('input[name="comp_handleContent"]').value.trim();

        // 값이 비어있을 경우 alert 띄우고 이벤트 취소
        if (compHandleContent === "") {
            alert("관리자 코멘트를 입력해주세요.");
            event.preventDefault(); // 이벤트 취소
        }
    });
});

</script>

</html>