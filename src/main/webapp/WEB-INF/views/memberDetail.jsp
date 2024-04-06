<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/chattingList.css" type="text/css">
<!-- bootstrap 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<!-- bootstrap : 디자인을 위한 프레임워크 -->
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
	.btn_gnb .bi-people-fill, .btn_gnb.user{
	    color: var(--white);
	    background-color: var(--green);
	}
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
	.btn_gnb:hover .bi-gear-fill,
	.btn_gnb:hover .bi-reception-3,
	/* .btn_gnb:hover .bi-people-fill, */
	.btn_gnb:hover .bi-person-gear,
	.btn_gnb:hover .bi-person-x-fill,
	.btn_gnb:hover .bi-door-open-fill {
	    background-color: var(--light);
	}
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
	.btn_gnb.home:hover,
	.btn_gnb.dash:hover,
	/* .btn_gnb.user:hover, */
	.btn_gnb.auth:hover,
	.btn_gnb.comp:hover,
	.btn_gnb.service:hover{
		background-color: var(--light);
	}
	
	table{
		width :100%;
		border-collapse: collapse;	
		table-layout: fixed;
	}
	
	th,td{
		border: 1px solid var(--grey);
		border-collapse: collapse;
		padding: 16px 8px;
		text-align:center;
		font-size:16px;
	}
	
	th{
		background-color:#eceff1;
	}
	
	.content{
		padding: 40px 0 40px 60px;
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
		margin:4px;
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
		margin:4px;
    }
    
    .button-green:hover{
	    background-color: var(--darkGreen);
	    border: 1px solid var(--darkGreen);
	}
	
	.text{
	    height: 2.125rem;
	    font-family: Pretendard;
	    font-size: 16px;
	    border: 1px solid var(--light);
	    border-radius: 4px;
	    padding-left: 8px;
	}
	
	.button{
		display:flex;
		margin-top:2.125rem;
		justify-content: center;
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
			<form action="memberDetail" method="get">
			<input type="hidden" name="member_idx" value="${dto.member_idx}"/>
			<h2>회원상세보기</h2>
			<table>
				<tr>
					<th>회원번호</th>
					<td>${dto.member_idx}</td>
					<th>아이디</th>
					<td>${dto.member_id}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${dto.member_name}</td>
					<th>닉네임</th>
					<td>${dto.member_nickName}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${dto.member_email}</td>
					<th>전화번호</th>
					<td>${dto.member_phone}</td>
				</tr>
				<tr>
					<th>지번주소</th>
					<td>${dto.member_parcelAddr}</td>
					<th>도로명주소</th>
					<td>${dto.member_roadAddr}</td>
				</tr>
				<tr>
					<th>동주소</th>
					<td>${dto.member_dongAddr}</td>
					<th>생년월일</th>
					<td>${dto.member_birth}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${dto.member_gender}</td>
					<th>가입일</th>
					<td>${dto.member_regDate}</td>
				</tr>
				<tr>
					<th>구독여부</th>
					<td>${dto.member_subs}</td>
					<th>구독연장여부</th>
					<td>${dto.member_renew}</td>
				</tr>
				<tr>
					<th>구독시작일자</th>
					<td>${dto.subsHistory_start}</td>
					<th>구독만료일자</th>
					<td>${dto.subsHistory_exp}</td>
				</tr>
				<tr>
					<th>구독등급</th>
					<td>${dto.subsType_code}</td>
					<th>탈퇴여부</th>
					<td>${dto.member_quit}</td>
				</tr>
				<tr>
					<th>제재여부</th>
					<td>${dto.member_loginLock}</td>
					<th>권한수정</th>
					<td>
						<select id="subsType_code" name="subsType_code" class="text">
							<option value="1">일반회원</option>
							<option value="2">플러스</option>
							<option value="3">프리미엄</option>
							<option value="4">관리자</option>
						</select>
					</td>
				</tr>	
			</table>			
			<div class="button">
				<input class="button-gray" type="button" onclick="location.href='./memberList.go'" value="회원목록으로"/>
				<input class="button-gray" type="button" onclick="location.href='./subsHistory.do?member_idx=${dto.member_idx}'" value="구독이력보기"/>
				<input class="button-gray" type="button" onclick="location.href='./sancHistoryList.do?member_idx=${dto.member_idx}'" value="제재이력보기"/>
				<input class="button-green" type="button" name="memberAuthMod" value="저장하기"/>
			</div>
			</form>
		</div>
	</div>	
</div>
</body>
<script>
$('input[name="memberAuthMod"]').on('click', function(){
	if(confirm("수정하시겠습니까?")==true){
		updateAuthLevel();
		alert('수정되었습니다.');
	}else{
		return;
	}	
});

function updateAuthLevel(subsType_code) {
	var subsType_code = $('#subsType_code').val();
    var member_idx = "${dto.member_idx}"
    
    $.ajax({
        type: "get",
        url: "memberAuthMod",
        data: {
            subsType_code: subsType_code,
            member_idx: member_idx
        },
        success: function(data) {
            location.href = './memberDetail?member_idx=${dto.member_idx}';
        },
        error: function() {
            alert("권한 레벨 업데이트에 실패했습니다.");
        }
    });
}

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

$('#openAlarm').click(function (e) {
	   // JSP 파일을 가져와서 모달 창에 표시
	   $.get("./alarmList.go", function(data) {
	   	console.log(data);
	   	console.log("#alarmContent");
	       $("#alarmContent").html(data);
	   });
	});
	
	
// 현재 구독 등급이 선택되어있게 하기
var subscode = ${dto.subsType_code};
$('#subsType_code').val(subscode).prop("selected",true);

</script>
</html>