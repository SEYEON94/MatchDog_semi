<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

	.pagination > .active > a,
    .pagination > .active > a:focus,
    .pagination > .active > a:hover,
    .pagination > .active > span,
    .pagination > .active > span:focus,
    .pagination > .active > span:hover {
        z-index: 3;
        color: #fff;
        cursor: default;
        background-color: var(--green); 
        border-color: var(--green);
    }
    
    .pagination > li > a,
    .pagination > li > span {
        color: var(--dark);
    }
    

    #pageButton{
    	display:flex;
    	justify-content: space-between;
    	height: 3.125rem;
    }
    
    #writeButton{
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
	
	#writeButton:hover{
	    background-color: var(--darkGreen);
	    border: 1px solid var(--darkGreen);
	}
	    
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
	
	.content {
		font-family:pretendard;
	}

	.boardList{
		border-collapse: collapse;
		border-spacing: 0;
		width:100%;
	}

	th, td{
		border: 1px solid var(--light);
		border-collapse: collapse;
		padding: 8px 12px;
		text-align:center;
		color:var(--dark);
		border-left: none;
    	border-right: none;
	}

	select{
		margin: 4px;
		height: 1.625rem;
	    border: 1px solid var(--light);
	    border-radius: 4px;
	    color: var(--dark);
	}
	
	#search {
        cursor:pointer;
        background-color: var(--green);
        color:var(--white);
        font-family:Pretendard;
        font-size:16px;
		font-weight: 500;
		text-align: center;
		height: 2.125rem;
		margin: 4px;
    }
    
    #search:hover{
		background-color: var(--darkGreen);
	    border: 1px solid var(--darkGreen);
	}
    
    #searchType{
    	height: 2.125rem;
    }
	
	#searchKey{
		margin: 4px;
		height: 2.125rem;
	    border: 1px solid var(--light);
	    border-radius: 4px;
	    color: var(--dark);
	    width:30%;
	}
	
	#searchDIV{
		display:flex;
		justify-content: center;
		height: 4.625rem;
	}
	
	.boardSearch th, .boardSearch td,
	.boardPaging th, .boardPaging td{
		border:none;
	}
	
	.icon {
    	margin-right: 10px;
	}
	#reply{
		color: var(--green);
	    text-decoration: none; /* 밑줄 제거 */
	}


	#openAlarm{
		cursor: pointer;
	}

	a.highlight-link:hover {
        color: var(--green); /* 마우스 오버 시 링크 색상 */
    }
	.button-green {
        padding: 5px 20px;
        font-size: 12px;
        text-align: center;
        text-decoration: none;
        background-color: #1abc9c;
        color: #ffffff;
        border-radius: 5px;
        border: 1px solid #1abc9c;
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
		
		<div class="boardList">
			<h2 id="mung" style="color:var(--green); font-weight:600; font-family:Pretendard;">자유 게시판</h2>
			
			<div id="pageButton">
				<div>
					<select id="pagePerNum">
						<option value="10">10개씩 </option>
						<option value="15">15개씩 </option>
						<option value="20">20개씩 </option>
					</select>
				</div>
				<div>
				 	<button id="writeButton" onclick="location.href='BoardWrite'">글쓰기</button>
				</div>
			</div>
			<table class="boardList">
				<thead>
				<tr>
					<th style="width: 5%;">번호</th>	
					<th style="width: 30%;">제목</th>
					<th style="width: 10%;">작성자</th>
					<th style="width: 10%;">작성일</th>
					<th style="width: 5%;">조회수</th>
					<th style="width: 5%;">추천</th>
				</tr>
				</thead>
				<tbody id="list">		
				</tbody>
				
				<tbody class="boardPaging">
					 <tr>
						<td colspan="6" id="paging" style="text-align:center;">	
							<div class="container">									
								<nav aria-label="Page navigation" style="text-align:center">
									<ul class="pagination" id="pagination"></ul>
								</nav>					
							</div>
						</td>
					</tr>
				</tbody>
				
				<tbody class="boardSearch">
					<tr>
						<td colspan="6" style="text-align:center">
							<div id="searchDIV">
								<select id="searchType">
									<option value="board_subject">제목</option>
									<option value="board_content">글내용</option>
									<option value="member_nickName">작성자</option>
								</select>
								 <input type="text" id="searchKey" placeholder="검색어 입력">
				  				 <button id="search" class="button-green">검색</button>
			  				 </div>
						</td>
					</tr>
				</tbody>
				
			</table>
		</div>
	</div>
	</div>
	</div>
</body>
<script>
var showPage = 1;
var searchType = '';
var searchKeyword = '';

listCall(showPage);

$('#pagePerNum').change(function () {
    var selectedPagePerNum = $('#pagePerNum').val();
    $('#pagination').twbsPagination('destroy');
    
    // 검색한 상태인지 확인하고 이에 따라 listCall 또는 searchCall 함수를 호출
    if (searchType !== '' && searchKeyword !== '') {
    	showPage = 1;
        searchCall(showPage, searchType, searchKeyword);
    } else {
    	showPage = 1;
        listCall(showPage);
    }
});

function listCall(page){
	$.ajax({
		type:'get',
		url:'list',
		data:{'pagePerNum':$('#pagePerNum').val(), 'page':page},
		dataType:'json',
		success:function(data){
			console.log(data);
			drawList(data);
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawList(obj) {
    var content = '';
    var totalItems = obj.list.length;
	
    if (totalItems === 0) {
    		content = '<tr><td colspan="5">검색 결과가 없습니다.</td></tr>';
    } else {
        obj.list.forEach(function (item, board_id) {
        	content += '<tr>';
        	content += '<td>' + item.board_id + '</td>';
        	content += '<td style="text-align:left;"><a class="icon" href="detail?board_id=' + item.board_id + '">' + item.board_subject;
        	if (item.img > 0) {
        	    content += '<a class="icon"><img src="resources/img/image.png" width="20px" height="20px"></a>';
        	}
        	if (item.reply > 0) {
        	    content += '<a id="reply" class="icon">[' + item.reply + ']</a>';
        	}
        	content += '</td>';
        	content += '<td>' + item.member_nickName + '</td>';
        	var regDate = new Date(item.board_regDate);
        	var formattedRegDate = regDate.getFullYear() + "-" + (regDate.getMonth() + 1) + "-" + regDate.getDate();
        	content += '<td>' + formattedRegDate + '</td>';
        	content += '<td>' + item.board_bHit.toLocaleString() + '</td>';
        	content += '<td>' + item.likeCount.toLocaleString() + '</td>';
        	content += '</tr>';
        });
        $('#list').empty();
        $('#list').append(content);

        // 검색 결과가 있으면 페이징 UI 그리기
        if (searchType !== '' && searchKeyword !== '') {
            $('#pagination').twbsPagination({
                startPage: obj.currPage,
                totalPages: obj.pages,
                visiblePages: 5,
                onPageClick: function (e, page) {
                    if (showPage != page) {
                        showPage = page;
                        searchCall(page, searchType, searchKeyword); // 검색 결과로 페이지 이동
                    }
                }
            });
        } else {
            $('#pagination').twbsPagination({
                startPage: obj.currPage,
                totalPages: obj.pages,
                visiblePages: 5,
                onPageClick: function (e, page) {
                    if (showPage != page) {
                        showPage = page;
                        listCall(page); // 일반 목록으로 페이지 이동
                    }
                }
            });
        }
    }
}

$('#search').click(function () {
    searchType = $('#searchType').val();
    searchKeyword = $('#searchKey').val();
    showPage=1;
    $('#pagination').twbsPagination('destroy');
    searchCall(showPage, searchType, searchKeyword);
});

function searchCall(page, searchType, searchKeyword) {
    $.ajax({
        type: 'get',
        url: 'search',
        data: {
            'pagePerNum': $('#pagePerNum').val(),
            'page': page,
            'searchType': searchType,
            'searchKeyword': searchKeyword
        },
        dataType: 'json',
        success: function (data) {
            console.log(data);
            drawList(data);
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

</script>
</html>