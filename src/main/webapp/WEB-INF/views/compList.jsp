<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="resources/css/home.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>  

<style>
a, a:link, a:visited, a:active, a:hover {
		text-decoration: none;
		color: var(--black);
	}
	
	
	/* 본인 페이지 것으로 변경하기  */
	.btn_gnb .bi-house-door-fill, .btn_gnb.home{
	    color: var(--white);
	    background-color: var(--green);
	}
	
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
	/* .btn_gnb:hover .bi-house-door-fill, */
	.btn_gnb:hover .bi-chat-dots-fill,
	.btn_gnb:hover .bi-gear-fill,
	.btn_gnb:hover .bi-people-fill,
	.btn_gnb:hover .bi-person-circle,
	.btn_gnb:hover .bi-list-ul {
	    background-color: var(--light);
	}
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
	/* .btn_gnb.home:hover, */
	.btn_gnb.match:hover,
	.btn_gnb.chatting:hover,	
	.btn_gnb.board:hover,
	.btn_gnb.myPage:hover,
	.btn_gnb.admin:hover{
		background-color: var(--light);
	}
	    #modalContent{
	    	width: 500px;
	    	height: 500px;
	    	text-align: left; 
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
        margin-left: 260px;
        padding: 20px;
        text-align: center; /* "우리 동네 리스트"를 가운데 정렬 */
    }
    #modalContent{
    	width: 500px;
    	height: 500px;
    	text-align: left; 
    }

.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 80px;
    color: #999999;
}

.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    width: 55px;
    height: 10px;
    margin-left: 10px;
    font-size: small;
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}


#imgtable {
border: 1px solid black;
}
#imgtable td,tr{
border: 1px solid black;
}
#imgtable td{
width: 300px;
height: 200px;
}

textarea style ="resize: both ;"> </textarea>.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 500px;
	height: 500px;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
	display: none;

}

.modal.active .modal-content {
	display: block;
	
}

.modal-content {
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 70%;
}


.close {
	color: #888;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}


table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
}

select {
	margin: 5px 0px;
}
</style>
</head>
<body>
<div id="wrap">
	<div class="banner">
		<div class="header">
			<h1 class="logo">
				<!-- <a href="./"><img src="/photo/logo.png" class="logo_matchDog"/></a> -->
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
		        <a href="./myProfileList.do" class="btn_gnb myPage">
		        	<span class="bi bi-person-circle"></span>
					<span>마이페이지</span>
		        </a>
	            <a href="./adminList.go" class="btn_gnb admin">
	            	<span class="bi bi-gear-fill"></span>
					<span>관리자페이지</span>
	            </a>
			</div>
		</div>



	<select id="pagePerNum">
		<option value="5">5</option>
		<option value="10">10</option>
		<option value="15">15</option>
		<option value="20">20</option>
	</select>
	<div>안녕하세요 ${sessionScope.loginInfo.member_nickName} 님
		&nbsp;&nbsp;&nbsp;&nbsp;</div>
	<form action="compList.go" method="post">
		<button id="aaa" name="aaa" value="a">전체</button>
		<button id="bbb" name="bbb" value="b">게시글</button>
		<button id="ccc" name="ccc" value="ch">채팅</button>
		<button id="ddd" name="ddd" value="cm">댓글</button>
	</form>
	<table>
		<thead>
			<tr>
				<th><input type="checkbox" id="header-checkbox" /></th>
				<th>번호</th>
				<th>식별위치</th>
				<th>식별번호</th>
				<th>제목</th>
				<th>피신고자ID</th>
				<th>신고접수일자</th>
				<th>처리일자</th>
				<th><form action="compList.go" method="post">
						<select name="adad" id="adad">
							<option value="0">처리상태</option>
							<option value="1">미처리</option>
							<option value="2">처리중</option>
							<option value="3">처리완료</option>
						</select> <input type="submit" value="선택">
					</form></th>
			</tr>
		</thead>
		<tbody id="list2">
		</tbody>
		<tr>
			<td colspan="9 id="paging">
				<!-- 	플러그인 사용	(twbsPagination)	- 이렇게 사용하라고 tutorial 에서 제공-->
				<div class="container">
					<nav aria-label="Page navigation" style="text-align: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
					<form action="proSuc.do" method="post" id="proSucForm">
						<input type="hidden" name="selectedIds" id="selectedIds" value="">
						<button type="submit" id="proSucButton">처리완료</button>
					</form>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="9" style="text-align: center">
				<div id="searchDIV">
					<select id="searchType">
						<option value="comp_content">제목</option>
						<option value="comp_reportIdx">피신고자 ID</option>
						<option value="comp_idfNum">식별번호</option>
					</select> <input type="text" id="searchKey" placeholder="검색어 입력">
					<button id="compSearch">검색</button>
				</div>
			</td>
		</tr>

	</table>
</body>
<script>
	var showPage = 1;
	var searchType = '';
	var searchKeyword = '';

	listCall(showPage, searchType, searchKeyword);

	$('#header-checkbox').click(function() {
		// 머릿글 체크박스의 상태를 가져옵니다
		var isChecked = $(this).prop('checked');

		// 모든 행 체크박스의 상태를 머릿글 체크박스와 일치하도록 설정합니다
		$('.row-checkbox').prop('checked', isChecked);

		if (isChecked) {
			// 모든 체크박스가 체크되었을 때
			$('.row-checkbox').each(function() {
				var id = $(this).attr('id');
				console.log('선택된 체크박스의 id 값:', id);
			});
		} else {
			// 모든 체크박스가 해제되었을 때
			console.log('모든 체크박스가 해제되었습니다.');
		}

	});

	// 행 체크박스 클릭 처리
	$('.row-checkbox')
			.click(
					function() {
						// 모든 행 체크박스가 선택되었는지 확인합니다
						var allChecked = $('.row-checkbox:checked').length === $('.row-checkbox').length;

						// 행 체크박스를 기반으로 머릿글 체크박스 상태를 업데이트합니다
						$('#header-checkbox').prop('checked', allChecked);
					});

	$('#pagePerNum').change(function() {
		// 페이지당 보여줄 게시물 갯수가 변경되면 페이징 처리 UI 를 지우고 다시 그려 준다.
		// 안그럼 처음에 계산한 페이지 값을 그대로 들고 있게 된다.
		$('#pagination').twbsPagination('destroy');
		listCall(showPage, searchType, searchKeyword);
	});

	function listCall(page, searchType, searchKeyword) {
		$.ajax({
			type : 'get',
			url : 'list2',
			data : {
				'pagePerNum' : $('#pagePerNum').val(),
				'page' : page,
				'searchType' : searchType,
				'searchKeyword' : searchKeyword
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				drawList(data);
			},
			error : function(e) {
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
			obj.list
					.forEach(function(item, comp_idx) {
						content += '<tr>';
						content += '<td>'
								+ '<input type="checkbox" class="row-checkbox" id="' + item.comp_idx + '" />'
								+ '</td>';
						content += '<td>' + item.comp_idx + '</td>';
						content += '<td>' + getCompLocText(item.comp_loc)
								+ '</td>';
						content += '<td>' + item.comp_idfNum + '</td>';
						content += '<td>'
								+ '<a href="compDetail?comp_idx='
								+ item.comp_idx
								+ '">'
								+ (item.comp_content.length > 10 ? item.comp_content
										.substring(0, 10)
										+ '...'
										: item.comp_content) + '('
								+ getCompType(item.compType) + ')' + '</a>' + '</td>';
						content += '<td>' + '<a href="sancHistory.go?comp_idx='
								+ item.comp_reportIdx + '">'
								+ item.comp_reportIdx + '</a>' + '</td>';
						var regDate = new Date(item.comp_receiveDate);
						var formattedRegDate = regDate.getFullYear() + "-"
								+ (regDate.getMonth() + 1) + "-"
								+ regDate.getDate();
						content += '<td>' + formattedRegDate + '</td>'; // 날짜 형식 변경
						content += '<td>'
								+ getComp_handleDate(item.comp_handleDate)
								+ '</td>';
						content += '<td>'
								+ getCompHandleState(item.comp_handleState)
								+ '</td>';
						content += '</tr>';
					});

			$(document).ready(function() {
				// 이벤트 처리기 및 관련 코드를 여기에 배치
				$('.row-checkbox').click(function() {
					var id = $(this).attr('id');

					if ($(this).prop('checked')) {
						console.log('선택된 체크박스의 id 값:', id);
					} else {
						console.log('선택 해제된 체크박스의 id 값:', id);
					}
				});
			});

			$('#compSearch').click(function() {
				searchType = $('#searchType').val();
				searchKeyword = $('#searchKey').val();
				showPage = 1;
				searchCall(showPage, searchType, searchKeyword);
			});

			function searchCall(page, searchType, searchKeyword) {
				$.ajax({
					type : 'get',
					url : 'compSearch',
					data : {
						'pagePerNum' : $('#pagePerNum').val(),
						'page' : page,
						'searchType' : searchType,
						'searchKeyword' : searchKeyword
					},
					dataType : 'json',
					success : function(data) {
						console.log(data);
						drawList(data);
					},
					error : function(e) {
						console.log(e);
					}
				});
			}

			function getCompType(compType) {

				if (compType === "스팸홍보/도배글입니다.") {
					return "스팸/홍보";

				} else if (compType === "음란물 입니다.") {
					return "음란물";
				} else if (compType === "불법정보를 포함하고 있습니다.") {
					return "불법정보";

				} else if (compType === "청소년에게 유해한 내용입니다.") {
					return "청소년 유해";

				} else if (compType === "욕설/생명경시/혐오/차별적 표현입니다.") {
					return "욕설/혐오";

				} else if (compType === "개인정보 노출 게시물입니다.") {
					return "정보/노출";

				} else if (compType === "불쾌한 표현이 있습니다.") {
					return "불쾌한 표현";

				}
			}

			function getComp_handleDate(comp_handleDate) {
				if (comp_handleDate === null) {
					return "처리되지 않은 신고입니다.";
				} else {
				

					return comp_handleDate;
				}
			}

			function getCompHandleState(comp_handleState) {
				if (comp_handleState === null ||comp_handleState === "Null") {
					return "미처리";
				} else {
					return comp_handleState;
				}
			}

			function getCompLocText(compLoc) {
				if (compLoc === 1) {
					return "게시글";
				} else if (compLoc === 2) {
					return "댓글";
				} else if (compLoc === 3) {
					return "채팅방";
				} else {
					return "";
				}
			}

			// "처리완료" 버튼 클릭 시
			$('#proSucButton').click(function() {
				// 선택된 체크박스의 ID를 배열에 추가
				var selectedIds = [];
				$('.row-checkbox:checked').each(function() {
					selectedIds.push($(this).attr('id'));
				});

				// 배열을 JSON 문자열로 변환
				var selectedIdsJSON = JSON.stringify(selectedIds);

				// 폼 필드에 JSON 데이터 설정
				$('#selectedIds').val(selectedIdsJSON);

				// 폼을 서버로 제출
				$('#proSucForm').submit(function(e) {
					// 선택된 체크박스의 ID를 배열에 추가
					var selectedIds = [];
					$('.row-checkbox:checked').each(function() {
						selectedIds.push($(this).attr('id'));
					});

					if (selectedIds.length === 0) {
						// 선택된 체크박스가 없을 경우, 폼 제출을 중지
						e.preventDefault();

					} else {
						// 배열을 JSON 문자열로 변환
						var selectedIdsJSON = JSON.stringify(selectedIds);

						// 폼 필드에 JSON 데이터 설정
						$('#selectedIds').val(selectedIdsJSON);
					}
				});
			});

			// 검색 결과가 있으면 페이징 UI 그리기
			$('#pagination').twbsPagination({
				startPage : obj.currPage, // 보여줄 페이지
				totalPages : obj.pages, // 총 페이지 수 (총 갯수 / 페이지당 보여줄 게시물 수): 서버에서 계산해서 가져와야함
				visiblePages : 5, // [1][2][3][4][5]
				onPageClick : function(e, page) {
					if (showPage != page) {
						console.log(page);
						showPage = page; // 클릭해서 다른 페이지를 보여주게 되면 현재 보고 있는 페이지 번호도 변경해 준다.
						listCall(page, searchType, searchKeyword);
					}
				}
			});

		}

		$('#list2').empty();
		$('#list2').append(content);
	}
</script>
</html>