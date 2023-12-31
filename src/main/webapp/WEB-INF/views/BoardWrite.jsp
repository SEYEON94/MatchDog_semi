<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="resources/css/board.css" type="text/css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
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
	.sidebar {
        height: 100%;
        width: 250px;
        position: fixed;
        top: 0;
        left: 0;
        background-color: #255,255,255;
        padding-top: 20px;
    }

    .sidebar h2 {
        color: black;
        text-align: center;
    }

    .sidebar ul {
        list-style: none;
        padding: 0;
    }

    .sidebar ul li {
        padding: 10px;
        text-align: center;
    }

    .sidebar a {
        color: black;
        text-decoration: none;
    }
	.content {
        text-align: center;
    }
    #write{
    	text-align: left;
    }
    #boardContent{
    	resize: none;
    }
    #subject,
    #text
    {
    	text-align: left;
    }
    .button{
    	text-align: right;
    	color: #fff;
    	background-color: #1FBF92;
    }
    .leftSort{
    	text-align: left;
    }
    #openAlarm{
		cursor: pointer;
	}
	th {
    	text-align: right;
	}
	input {
 	   margin: 1px;
	}
	*::-webkit-scrollbar {
		width: 16px;
	}

	*::-webkit-scrollbar-track {
		background: var(--white);
	}

	*::-webkit-scrollbar-thumb {
		background-color: var(--green);
		border-radius: 10px;
		border: 3px solid #ffffff;
	}
	
</style>
</head>
<body>
<div id="wrap">
	<div class="banner">
		<div class="header">
			<h1 class="logo">
				<a href="./HomeMatchingList.do"><img src="/photo/logo.png" class="logo_matchDog"/></a>
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
	<form action="write" method="post" enctype="multipart/form-data" onsubmit="return noContent();">
		<input type="hidden" name="member_idx" value="${sessionScope.loginInfo.member_idx}">
		<h3 id="write">글쓰기</h3>
		<hr>
	<table>
		<tr>
			<td class="leftSort" cols="2">작성자 : &nbsp&nbsp<input id="text" type="text" name="member_nickName" value="${sessionScope.loginInfo.member_nickName}" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="leftSort" cols="2">제목 : <input id="text" type="text" name="board_subject" placeholder="제목을 입력하세요" style="margin-left: 23px;"/></td>
		</tr>
		<tr>
			<td class="leftSort" cols="2"><input type="file" name="photos" multiple="multiple"/></td>
		</tr> 
		<tr>
			<td colspan="2"><textarea rows="15" cols="140" id="boardContent" name="board_content" placeholder="내용을 입력하세요"></textarea></td>
		</tr>
		<tr>
			<th colspan="2">
				<input  class="button" type="button" onclick="location.href='./boardList.go'" value="취소"/>
				<button class="button">작성</button>
			</th>
		</tr>
	</table> 
	</form>
	</div>
	</div>
	</div>
</body>
<script>
function noContent() {
    var title = document.getElementsByName("board_subject")[0].value;
    var content = document.getElementsByName("board_content")[0].value;

    if (title.trim() === "" || content.trim() === "") {
        alert("제목과 내용을 모두 입력해주세요.");
        return false; // 제출을 취소
    }
    return true; // 유효성 검사 통과 시 폼 제출
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
</script>
</html>