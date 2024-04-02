<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/board.css" type="text/css">
<!-- bootstrap 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- bootstrap : 디자인을 위한 프레임워크 -->
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
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
	.btn_gnb .bi-people-fill, .btn_gnb.board{
	    color: var(--white);
	    background-color: var(--green);
	}
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
	 .btn_gnb:hover .bi-house-door-fill,
	.btn_gnb:hover .bi-chat-dots-fill,
	.btn_gnb:hover .bi-gear-fill,
  /*.btn_gnb:hover .bi-people-fill, */
	.btn_gnb:hover .bi-person-circle,
	.btn_gnb:hover .bi-list-ul {
	    background-color: var(--light);
	}
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
  .btn_gnb.home:hover,
	.btn_gnb.match:hover,
	.btn_gnb.chatting:hover,	
	/* .btn_gnb.board:hover,*/
	.btn_gnb.myPage:hover,
	.btn_gnb.admin:hover{
		background-color: var(--light);
	}
	
	button {
	    background: none;
	    border: none;
	    padding: 0;
	    margin: 0;
	    /* 기타 다른 스타일 속성을 필요에 따라 추가할 수 있습니다. */
	}
	
	.boardWrite{
		width:100%;
		font-family:Pretendard;
        font-size:16px;
	}
	
	#board_content{
    	width:100%;
    	height:22.625rem;
    	font-family: Pretendard;
	    font-size: 16px;
	    border: 1px solid var(--light);
	    border-radius: 4px;
	    padding: 8px;
    	resize: none;
    }
	
	th, td{
		border-collapse: collapse;
		padding: 8px 0px;
		color:var(--dark);
	}
	
	#text{
		width: 923px;
	    height: 2.125rem;
	    font-family: Pretendard;
	    font-size: 16px;
	    border: 1px solid var(--light);
	    border-radius: 4px;
	    padding-left: 8px;
	}
	
	input[type="file"]{
		font-family: Pretendard;
    	font-size: 14px;
	}
	
	
	.canselButton,
	.writeButton{
		width: 120px;
		height: 2.625rem;
		margin-left:8px;
		cursor:pointer;
		border-radius: 8px;
		font-family:Pretendard;
		font-size:16px;
		font-weight: 500;
		text-align: center;
	}
	
	.canselButton{
		border: 1px solid var(--light);
		background-color: var(--light);
		color:var(--dark);
	}
	
	.canselButton:hover{
		border: 1px solid var(--grey);
		background-color: var(--grey);
	}
	
	.writeButton{
		border: 1px solid var(--green);
		background-color: var(--green);
		color:var(--white);
	}
	
	.writeButton:hover{
		border: 1px solid var(--darkGreen);
		background-color: var(--darkGreen);
	}
	
	.bi-x-circle-fill{
		font-size:22px;
		cursor:pointer;
	}
	
	.content {
        text-align: center;
    }
    
    #write{
    	text-align: left;
    }
   
    #subject,
    #text
    {
    	text-align: left;
    }
    
    .leftSort{
    	text-align: left;
    }

    #openAlarm{
		cursor: pointer;
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
		<div class="content">
		<div id="alarmContent"></div>
	<form action="update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="board_id" value="${board.board_id}"/>
	<input type="hidden" name="delphotoArray" value=""/>
	<h2 id="write" style="color:var(--green); font-weight:600; font-family:Pretendard;">수정하기</h2>
	
	<table class="boardWrite">
		<tr>
			<td class="leftSort">작성자 : &nbsp&nbsp&nbsp${board.member_nickName}</td>
		</tr>
		<tr>
			<td class="leftSort">제&nbsp&nbsp&nbsp&nbsp목 : &nbsp&nbsp<input id="text" type="text" name="board_subject" value="${board.board_subject}"/></td>
		</tr> 
		<tr>
			<td class="leftSort"><input type="file" name="photos" multiple="multiple"/></td>
		</tr>
		<tr>
			<td colspan="2"><textarea id="board_content" name="board_content">${board.board_content}</textarea></td>
		</tr>
		<tr>
			<td class="leftSort">
				<h3 style="color:var(--green); font-weight:600; font-family:Pretendard; margin-bottom:2rem;">첨부된 파일</h3>
				<c:if test="${photos.size() > 0}">
					<c:forEach items="${photos}" var="photo">               
						<div class="photo-item" style="display: inline;">
							<img src="/photo/${photo.photo_fileName}" width="100" height="100" alt="${photo.photo_fileName}"/>
							<button data-photo_id="${photo.photo_id}" class="delphoto">
								<span class="bi bi-x-circle-fill"></span>
							</button>
						</div>
					</c:forEach>
        		</c:if>
			
			</td>
		</tr>
		<tr>
			<th colspan="2" id="button" class="button">
				<input class="canselButton" type="button" id="cancel" value="취소"/>
				<input class="writeButton" type="submit" value="저장"/>
			</th>
		</tr>
	</table>
	</form>
	</div>
	</div>
	</div>
	
</body>
<script>
var hidePhotoArray = [];

$('.delphoto').click(function() {
    event.preventDefault();
    var photoId = $(this).data('photo_id');
    var photoDiv = $(this).parent(); // 이미지를 감싸는 div 요소
	
    photoDiv.hide();
    hidePhotoArray.push(photoId);
    $('[name="delphotoArray"]').val(hidePhotoArray.join(','));
});

$('#cancel').click(function() {
    if (confirm('변경내용이 저장되지않습니다.')) {
        location.href = './detail?board_id=${board.board_id}';
    }
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