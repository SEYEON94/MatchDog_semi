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
	
 
    #reply_content,
    #boardContent,
   	.editContent {
    	resize: none;
    }
    #replySubmit{
    	margin-left: 10px;
    }
    
    .board-details{
    	font-family: pretendard;
    }

    .boardContent {
	    min-height: 300px;
	    width: 100%;
	    font-family: pretendard;
	}
	
	.button-container {
		display: flex;
		justify-content: center;
		align-items: center; /* 가운데 정렬 추가 */
		font-family:Pretendard;
		border-bottom:1px solid var(--light);
		padding:2rem;
	}

	.button-container div {
		margin-left: 10px;
		margin-right: 10px; /* 왼쪽, 오른쪽 여백 추가 */
		font-family:Pretendard;
	}
	
	.content{
		padding: 40px 0px 0px 46px;
	}
	
	button {
	    background: none;
	    border: none;
	    padding: 0;
	    margin: 0;
	    /* 기타 다른 스타일 속성을 필요에 따라 추가할 수 있습니다. */
	}
	
	.bi-chevron-left{
		cursor:pointer;
		font-size:24px;
	}
	
	.details-row {
        display: flex;
        align-items: center; /* 세로 가운데 정렬 */
        margin-bottom: 2rem;
        color:var(--dark);
        justify-content: space-between;
    }
	
	.details-row img,
	#replyInfo img{
		width: 48px;
	    height: 48px;
	    margin-right: 12px;
	    border-radius: 50%;
	    object-fit: cover;
	}
	
	.boardInfoTotal{
		display:flex;
	}
	
	.boardInfo{
		display:flex;
		flex-direction: column;
		justify-content: space-evenly;
	}
	
	.nickName{
		font-size:18px;
		font-weight:600;
		margin-bottom:4px;
	}
	
	.button-green {
        cursor: pointer;
	    background-color: var(--light);
	    border: 1px solid var(--light);
	    border-radius: 6px;
	    color: var(--dark);
	    font-family: Pretendard;
	    font-size: 16px;
	    font-weight: 500;
	    text-align: center;
	    width:4rem;
	    height: 2.125rem;
	    margin: 4px;
    } 
    
    .like-hate-button{
    	display:flex;
    	align-items: center;
    }
    
    #likeButton,
	#hateButton{
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
	
	#hateButton{
		border: 1px solid var(--light);
		background-color: var(--light);
		color:var(--dark);
	}
	
	#hateButton:hover{
		border: 1px solid var(--grey);
		background-color: var(--grey);
	}
	
	#likeButton{
		border: 1px solid var(--green);
		background-color: var(--green);
		color:var(--white);
	}
	
	#likeButton:hover{
		border: 1px solid var(--darkGreen);
		background-color: var(--darkGreen);
	}
	
	#likeCount, #hateCount{
		width:3rem;
		text-align:center;
	}
	
	.boardPhoto{
		display:flex;
		flex-direction: column;
	}
	
	.boardPhoto img{
		width:10rem;
		margin-bottom:1rem;
	}
	
	.replyWrite{
		padding:2rem 0;
		display:flex;
	}
	
	#reply_content{
		width:100%;
		height: 4rem;
	    font-family: Pretendard;
	    font-size: 16px;
	    border: 1px solid var(--light);
	    border-radius: 4px;
	    padding: 8px;
	}
	
	#replySubmit{
		border: 1px solid var(--green);
		background-color: var(--green);
		color:var(--white);
		width: 120px;
		height: 4rem;
		margin-left:8px;
		cursor:pointer;
		border-radius: 8px;
		font-family:Pretendard;
		font-size:16px;
		font-weight: 500;
		text-align: center;
	}
	
	#replySubmit:hover{
		border: 1px solid var(--darkGreen);
		background-color: var(--darkGreen);
	}
	
	#replyList{
		font-family:Pretendard;
		display: flex;
    	flex-direction: column;
	}
	
	#replyInfo{
		display:flex;
		align-items: center;
		justify-content: space-between;
		margin: 1.125rem;
	}
	
	#replyList input[type="button"]{
		cursor: pointer;
	    background-color: var(--light);
	    border: 1px solid var(--light);
	    border-radius: 6px;
	    color: var(--dark);
	    font-family: Pretendard;
	    font-size: 16px;
	    font-weight: 500;
	    text-align: center;
	    width: 4rem;
	    height: 2.125rem;
	    margin: 4px;
	}
	
	.reply-content{
		height: 5.625rem;
    	padding: 0.625rem 1.125rem;
		border-bottom:1px solid var(--light);
	}
	
	.editContent{
		width: 100%;
	    height: 4rem;
	    font-family: Pretendard;
	    font-size: 16px;
	    border: 1px solid var(--light);
	    border-radius: 4px;
	    padding: 8px;
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
		<div id="boardContent"></div>
		<div id="commendContent"></div>
		
		<form action="detail" method="post">
		
	    	<div class="board-details">
	        	<div class="details-row">
	    			<button onclick="location.href='./boardList.go'; event.preventDefault();">
					  <span class="bi bi-chevron-left"></span>
					</button>
				</div>
				
	        	<div class="details-row">
	        		<div class="boardInfoTotal">
			            <c:forEach items="${boardPro}" var="boardPro">
			                <img src="/photo/${boardPro.photo_fileName}" width="50" height="50" alt="${boardPro.photo_fileName}"/>
			            </c:forEach>
			            <div class="boardInfo">
				            <span class="nickName">${board.member_nickName}</span>
				            <div style="font-size:14px; color:var(--grey);">
				            	<span style="margin-right:0.625rem;">${board.board_regDate}</span>
					            <span class="bi bi-eye"></span>
					            <span >${board.board_bHit}</span>
				            </div>            
			            </div>
	        		</div>
		            <c:if test="${board.member_idx == sessionScope.loginInfo.member_idx}">
				        <div class="button-group">
				            <input type="button" class="button-green" onclick="confirmDelete(${board.board_id})" value="삭제"/>
				            <input type="button" class="button-green" onclick="location.href='./updateForm?board_id=${board.board_id}'" value="수정"/>
				        </div>
				    </c:if>
		            <c:if test="${board.member_idx != sessionScope.loginInfo.member_idx}">
		                <input class="button-green" type="button" id="openBoardComp" value="신고"/>
		            </c:if>
		        </div>
		        
		        <h2>${board.board_subject}</h2>
		        <div class="boardContent">
		            <div id="boardContent">${board.board_content}</div>
			        <c:if test="${photos.size()>0}">
			            <div class="boardPhoto">
			                <c:forEach items="${photos}" var="photo">
			                    <img src="/photo/${photo.photo_fileName}" alt="${photo.photo_fileName}"/>
			                </c:forEach>
			            </div>
			        </c:if>
	        	</div>
	        	
	            
	    	</div>
	
		    <div class="button-container">
		        <form id="recommendLike">
		            <div class="like-hate-button">
		                <input type="button" id="likeButton" onclick="like('${board.board_id}')" value="좋아요👍"/>
		                <span id="likeCount" style="font-weight: bold;">0</span>
		            </div>
		        </form>
		
		        <form id="recommendHate">
		            <div class="like-hate-button">
		                <input type="button" id="hateButton" onclick="hate('${board.board_id}')" value="싫어요👎"/>
		                <span id="hateCount" style="font-weight: bold;">0</span>
		            </div>
		        </form>
		    </div>
		</form>
		
	    <form id="replyForm">
	    	<div class="replyWrite">
		    	<input type="hidden" name="member_idx" value="${sessionScope.loginInfo.member_idx}">
		       	<textarea id="reply_content" placeholder="댓글을 입력하세요"></textarea>
		       	<c:if test="${not empty sessionScope.loginInfo.member_idx}">
		       		<input id="replySubmit" type="submit" value="댓글 작성"/>
		       	</c:if>
	    	</div>
	    </form>
	    
	    <div>
				<div id="replyList">		
				</div>
	    </div>
	    
    </div>
    </div>
    </div>
</body>
<script>
loadReplyList();
recommendLike();
recommendHate();

var obj = {};

$('#replyForm').submit(function() {
	event.preventDefault(); // 기본 폼 제출 동작을 중지
	
	var memberIdx = $('[name="member_idx"]').val();
    var replyContent = $('#reply_content').val();
    var boardId = '${board.board_id}';
    
    if (replyContent.trim() === "") {
        alert("댓글 내용을 입력하세요."); // 내용이 비어있을 경우 알림을 표시
        return; // 작성을 중지
    }

    $.ajax({
        type: 'POST',
        url: 'replyWrite', // 실제 서버 URL로 대체해야 합니다.
        data: {
            member_idx: memberIdx,
            reply_content: replyContent,
            board_id: boardId
        },
        dataType: 'json',
        success: function(data) {
            console.log('댓글 작성 성공:', data);
            
            // 댓글 작성 후, 댓글 목록을 다시 불러오는 함수 호출
            loadReplyList();
            $('#reply_content').val('');
        },
        error: function(e) {
            console.log('댓글 작성 실패:', e);
        }
    });
});

function loadReplyList() {
    $.ajax({
        type: 'GET',
        url: 'replyList',
        dataType: 'json',
        data: {'boardId': ${board.board_id}},
        success: function(data) {
            obj = data; // 불러온 데이터를 obj에 할당
            // console.log(obj);
            drawList(obj);
        },
        error: function(e) {
            console.log(e);
        }
    });
}

function drawList(obj) {
    var replyList = '';
    if (obj) {
        obj.replyList.forEach(function(item) {
            replyList += '<div>';
            
            replyList += '<div id="replyInfo">';
            replyList += '<div style="display:flex; align-items: center;">';

            // getReplyPro 함수를 동기적으로 호출하여 데이터를 가져옴
            var poto = getReplyProSync(item.reply_id);
            drawphoto(poto);
			
            replyList += replyphoto; // replyphoto를 replyList에 추가
            replyList += '<div>';
            replyList += '<div>'+item.member_nickName + '</div>';
            replyList += '<div style="font-size:14px; color:var(--grey);">' + item.reply_regDate + '</div>';
            replyList += '</div>';
            if (item.editing) {
            	replyList += '</div>';
                replyList += '<div><input type="button" onclick="saveEdit(' + item.reply_id + ')" value="저장" />';
                replyList += '<input type="button" onclick="cancelEdit(' + item.reply_id + ')" value="취소" /></div>';
                replyList += '</div>';
                replyList += '<div class="reply-content">';
                replyList += '<textarea class="editContent" id="editContent' + item.reply_id + '">' + item.reply_content + '</textarea>';
                replyList += '</div>';
            } else {
	            replyList += '</div>';
                if (item.member_idx === ${sessionScope.loginInfo.member_idx}) {
                	replyList += '<div style="display:flex;">';
                    replyList += '<input type="button" onclick="deleteReply(' + item.reply_id + ')" value="삭제"/>';
                    replyList += '<input type="button" onclick="editReply(' + item.reply_id + ')" value="수정"/>';
                    replyList += '</div>';
                    replyList += '</div>';
                } else {
                    replyList += '<div><input type="button" id="openCommendComp_' + item.reply_id + '" class="openCommendCompBtn" value="신고"/></div>';
                    replyList += '</div>';
                }
                replyList += '<div class="reply-content">' + item.reply_content;
                if (item.reply_modDate !== null) {
                    replyList += ' (수정됨)';
                }
                replyList += '</div>';
            }
            
            replyList += '</div>';
        });
    } else {
        replyList = '<div>댓글이 없습니다.</div>';
    }

    $('#replyList').empty();
    $('#replyList').append(replyList);
}

// 사진 불러와야 하는 곳
function getReplyProSync(reply_id) {
    var result;
    $.ajax({
        type: 'GET',
        url: 'getReplyPro',
        data: {
            reply_id: reply_id,
        },
        dataType: 'json',
        async: false, // 비동기를 동기적으로 변경
        success: function(data) {
            result = data;
        },
        error: function(e) {
            console.log(e);
        }
    });
    return result;
}

function drawphoto(poto) {
    replyphoto = ''; // replyphoto를 전역으로 변경
    if (poto) {
        var photoReply = poto.photoReply;
        if (photoReply && photoReply.length > 0) {
            photoReply.forEach(function(photoItem) {
                replyphoto += '<img src="/photo/' + photoItem.photo_fileName + '" width="50" height="50" alt="' + photoItem.photo_fileName + '" />';
            });
        }
    }
}

function reportReply(reply_id) {
    var url = './commentcompTypeList.do?reply_id=' + reply_id;
    location.href = url;
}

// 댓글 수정 함수
function editReply(reply_id) {
    var replyItem = obj.replyList.find(function(item) {
        return item.reply_id === reply_id;
    });

    if (replyItem) {
        replyItem.editing = true;
        drawList(obj);
    }
}

// 수정 저장
function saveEdit(reply_id) {
    var editedContent = $('#editContent' + reply_id).val();

    $.ajax({
        type: 'POST',
        url: 'replyUpdate',
        data: {
            reply_id: reply_id,
            editedContent: editedContent
        },
        dataType: 'json',
        success: function(data) {
            console.log('댓글 수정 성공:', data);
            loadReplyList();
        },
        error: function(e) {
            console.log('댓글 수정 실패:', e);
        }
    });
}

// 수정 취소하는 함수
function cancelEdit(reply_id) {
    var replyItem = obj.replyList.find(function(item) {
        return item.reply_id === reply_id;
    });

    if (replyItem) {
        replyItem.editing = false;
        drawList(obj);
    }
}

function deleteReply(reply_id) {
    if (confirm("댓글을 삭제하시겠습니까?")) {
        $.ajax({
            type: 'POST',
            url: 'replyDel',
            data: {
                reply_id: reply_id
            },
            dataType: 'json',
            success: function(data) {
                loadReplyList();
            },
            error: function(e) {
                console.log('댓글 삭제 요청 실패:', e);
            }
        });
    }
}

var one = "1";
var two = "2";

// 좋아요 버튼 요청시(회원이 이미 추천을 눌렀었나 DB에서 확인, if Count>0 이면 삭제 else면 추가)
function like(board_id, member_idx) {
	
	document.getElementById("likeButton").disabled = true;
	document.getElementById("hateButton").disabled = true;

	var member_idx = $('[name="member_idx"]').val();
	$.ajax({
		type: 'GET',
		url: 'checkRec',
		dataType: 'JSON',
		data: {
			board_id: board_id,
			member_idx: member_idx,
		},
		success: function(data){		
			// console.log(data);
			if(data && data.checkRec > 0){
				// console.log("삭제요청");
				deleteRec(board_id, member_idx, one);
				recommendLike();
				recommendHate();
			}else{
				// console.log("좋아요 insert 요청");
				$.ajax({
					type: 'POST',
					url: 'like',
					data: {
						board_id: board_id,
						member_idx: member_idx
					},
					dataType: 'JSON',
					success: function(data){
						// console.log(data);
						recommendLike();
						recommendHate();
					},
					error: function(e){
						console.log(e);
					}
				});
			}
		},
		error: function(e){
			console.log(e);
		}
	});	
	// 4초후 다시 버튼 활성화
	setTimeout(function() {
        document.getElementById("likeButton").disabled = false;
    }, 2000);
	setTimeout(function() {
        document.getElementById("hateButton").disabled = false;
    }, 2000);
}

// 싫어요 버튼 함수
function hate(board_id, member_idx) {
	
	document.getElementById("likeButton").disabled = true;
	document.getElementById("hateButton").disabled = true;

	var member_idx = $('[name="member_idx"]').val();
	var two = "2";
	$.ajax({
		type: 'GET',
		url: 'checkRec',
		dataType: 'JSON',
		data: {
			board_id: board_id,
			member_idx: member_idx,
		},
		success: function(data){
			// console.log("checkRec 요청값");
			// console.log(data);
			if(data && data.checkRec > 0){
				// console.log("삭제요청");
				deleteRec(board_id, member_idx, two);
				recommendLike();
				recommendHate();
			}else{
				console.log("싫어요 insert 요청");
				$.ajax({
					type: 'POST',
					url: 'hate',
					data: {
						board_id: board_id,
						member_idx: member_idx
					},
					dataType: 'JSON',
					success: function(data){
						// console.log(data);
						recommendLike();
						recommendHate();
					},
					error: function(e){
						console.log(e);
					}
				});
			}
		},
		error: function(e){
			console.log(e);
		}
	});	
	// 4초후 다시 버튼 활성화
	setTimeout(function() {
        document.getElementById("likeButton").disabled = false;
    }, 2000);
	setTimeout(function() {
        document.getElementById("hateButton").disabled = false;
    }, 2000);
	recommendLike();
	recommendHate();
}

// 좋아요 갯수 보여주는 함수
function recommendLike() {
    $.ajax({
        type: 'GET',
        url: 'recommendLike',
        dataType: 'json',
        data: { 'board_id': ${board.board_id} },
        success: function (data) {
            // console.log(data);
            $('#likeCount').text(data.likeCount);
        },
        error: function (e) {
            console.log(e);
        }
    });
}

// 싫어요 갯수 보여주는 함수
function recommendHate() {
    $.ajax({
        type: 'GET',
        url: 'recommendHate',
        dataType: 'json',
        data: { 'board_id': ${board.board_id} },
        success: function (data) {
            // console.log(data);
            $('#hateCount').text(data.hateCount);
        },
        error: function (e) {
            console.log(e);
        }
    });
}

// 추천 삭제 함수
function deleteRec(board_id, member_idx, rec_type) {
	
    $.ajax({
        type: 'POST',
        url: 'deleteRec',
        data: {
            board_id: board_id,
            member_idx: member_idx,
            rec_type: rec_type
        },
        dataType: 'JSON',
        success: function (data) {
        	// console.log(data);
			recommendLike();
			recommendHate();
        },
        error: function (e) {
            console.log(e);
        }
    });
}

$('#openAlarm').click(function (e) {
	   // JSP 파일을 가져와서 모달 창에 표시
	   $.get("./alarmList.go", function(data) {
	   	console.log(data);
	   	console.log("#alarmContent");
	       $("#alarmContent").html(data);
	   });
	});
	
	// 게시물 삭제 버튼 클릭시 함수 호출
function confirmDelete(boardId) {
   var result = confirm("게시물을 삭제하시겠습니까?");
   if (result) {
       // 사용자가 확인을 눌렀을 때만 컨트롤러로 요청 보내기
       location.href = './del?board_id=' + boardId;
   } else {
       // 사용자가 취소를 눌렀을 때의 동작 (생략 가능)
   }
}
$('#openBoardComp').click(function (e) {
	
	e.preventDefault();
	var boardId = '${board.board_id}'
    // Ajax를 통해 모달 내용을 가져옵니다.
    $.get("./boardcompTypeList.do", { board_id: boardId },function(data) {
        $("#boardContent").html(data);
    });
});
$(document).on('click', '.openCommendCompBtn', function(e) {
    e.preventDefault();
    var replyId = this.id.split('_')[1]; // 버튼 id에서 reply_id 추출
    // 모달 로직에서 replyId를 사용합니다.
    $.get("./commentcompTypeList.do", { reply_id: replyId }, function(data) {
        $("#commendContent").html(data);
    });
});
</script>
</html>