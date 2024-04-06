<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/recvMatchList.css" type="text/css">
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

button{
	  border: 0;
	  background-color: transparent;
	  cursor : pointer;
	}


a, a:link, a:visited, a:active, a:hover {
	text-decoration: none;
	color: var(--black);
}


/* 본인 페이지 것으로 변경하기  */
.btn_gnb .bi-list-ul, .btn_gnb.match{
    color: var(--white);
    background-color: var(--green);
}


/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb:hover .bi-house-door-fill,
.btn_gnb:hover .bi-chat-dots-fill,
.btn_gnb:hover .bi-gear-fill,
.btn_gnb:hover .bi-people-fill,
.btn_gnb:hover .bi-person-circle
/* .btn_gnb:hover .bi-list-ul */ {
    background-color: var(--light);
}

/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb.home:hover,
/* .btn_gnb.match:hover, */
.btn_gnb.chatting:hover,
.btn_gnb.board:hover,
.btn_gnb.myPage:hover,
.btn_gnb.admin:hover{
	background-color: var(--light);
}


.blur{
	display:flex;
	align-items: center;
    justify-content: center;
    background-color: rgba(0,0,0,0.05);
}

.blur span{
	font-size: 14px;
	line-height: 22px;
	color: var(--dark);
	font-weight: 600;
  	font-family:Pretendard;
  	text-align:center;
  	
}

/*css 커스텀*/
.container .left .people {
	display:flex;
	flex-direction: column;
}
.container .left .people .person {
	display:flex;
	flex-direction: column;
	justify-content: center;
  width: 100%;
  height:124px;
  padding: 10px 20px;
  border-bottom:1px solid var(--light);
}

.myName{
	position: relative;
	font-family:Pretendard;
	color:var(--grey);
	font-weight:300;
	font-size:12px;
	margin: 0 0 8px 20px;
}

.proDetail{
	display:flex;
	width:100%;
	justify-content: space-around;
}

.container .left .people .person img {
  width: 40px;
  height: 40px;
  margin-right: 12px;
  margin-top: 4px;
  border-radius: 50%;
  object-fit: cover;
}

.container .left .people .person .time {
  font-size: 14px;
  top: 69px;
  right: 489px;
  padding: 0 0 5px 5px;
  color: var(--grey);
  font-family:Pretendard;
}

.mid_flex{
	display:flex;
	flex-direction: column;
}

.bi-hearts{
	color: var(--light);
	font-size: 32px;
	margin-right:10px;
	cursor: pointer;
}

.bi-hearts:hover{
	color:var(--green);
}

.person .charTypeList.recv{
	display:flex;
	flex-wrap: wrap;
	width: 40%;
}

.open_flex{
	display:flex;
	width: 40%;
}

.detailModal{
	left:252px !important;
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
		<div id="modalContent"></div>
		<!-- 여기다가 각자 내용 추가하기 -->
				<div class="container">
			        <div class="left">
			            <div class="top">
			            	<div class="recvMatchingList">나에게 온 요청 리스트</div>
			            </div>
						<!-- 리스트 -->
			            <ul class="people">
			            </ul>
						<!-- 페이징 -->			
						<nav aria-label="Page navigation" style="text-align:center">
							<ul class="pagination" id="pagination"></ul>
						</nav>					
			        </div>
				</div>
				
		</div>
	</div>
</div>
</body>
<script>

var showPage = 1;
var pro_idx = "";

listCall(showPage);

function listCall(page){
	$.ajax({
		type:'post',
		url:'recvMatchingList.do',
		data:{'pagePerNum':5, 'page':page},
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

// 일반 회원이면 3개 이상 리스트 못보게 제한 걸려있음.
// 나에게 요청 보낸 리스트 보기
function drawList(obj){
	
	if(obj.subsType != 1){
		
		console.log("일반회원이 아닙니다!");
	
		var content = '';
	
		obj.matList.forEach(function(item, idx){
			content +='<li class="person">';
			content +='<div class="myName">'+item.myDogName+' 님에게 온 매칭요청입니다.</div>';
			content +='<span class="proDetail">';
			content +='<span class="open_flex">'
			content +='<button class="openModal" value='+item.pro_idx+'>'; // 버튼클릭시 상세보기 페이지 띄워줌
			content +='<img src="/photo/'+item.photo_fileName+'"/>';
			content +='</button>';
			content +='<span class="mid_flex">'
			content +='<span>'
			content +='<span class="name">'+item.pro_dogName+'</span> ';
			content +='<span class="breedType">'+item.breedType+'</span>';
			content +='</span>'
			content +='<span class="time">'+item.matchTime+'</span>';
			content +='</span>'
			content +='</span>'
			content+='<span class="charTypeList recv">'
			item.charType.forEach(function(charType,idx){
				content +='<span class="charType">'+charType+'</span>';
			});
			content +='</span>';
			content +='<a href="./chatOpen.do?match_idx='+item.match_idx+'"><span class="bi bi-hearts"></span></a>';
			content+='</span>'
			content +='</li>';
		});
	
	}else if(obj.subsType == 1 && obj.matList.length >= 4){
		
		console.log("일반회원이네요?");
		
		var content = '';
	
		for (var idx = 0; idx < 3; idx++) { // idx가 2까지 돌리려면 3으로 설정
		    var item = obj.matList[idx];
		
			if(item != null){
				
				console.log(item);
				console.log(item.myDogName);
			
			    content +='<li class="person">';
			    content +='<div class="myName">'+item.myDogName+' 님에게 온 매칭요청입니다.</div>';
				content +='<span class="proDetail">';
				content +='<span class="open_flex">'
				content +='<button class="openModal" value='+item.pro_idx+'>'; // 버튼클릭시 상세보기 페이지 띄워줌
				content +='<img src="/photo/'+item.photo_fileName+'"/>';
				content +='</button>';
				content +='<span class="mid_flex">'
				content +='<span>'
				content +='<span class="name">'+item.pro_dogName+'</span> ';
				content +='<span class="breedType">'+item.breedType+'</span>';
				content +='</span>'
				content +='<span class="time">'+item.matchTime+'</span>';
				content +='</span>'
				content +='</span>'
				content+='<span class="charTypeList recv">'
				item.charType.forEach(function(charType,idx){
					content +='<span class="charType">'+charType+'</span>';
				});
				content +='</span>';
				content +='<a href="./chatOpen.do?match_idx='+item.match_idx+'"><span class="bi bi-hearts"></span></a>';
				content+='</span>'
				content +='</li>';
				
			}
		
		}
		content +='<a href="./myPageList.do">';
		content +='<li class="person blur">';
		content +='<span>리스트를 3개 이상 더 보고싶으시면 구독을 해주세요!</span> ';
		content +='</li>';
		content +='</a>'

	}
	
	$('.people').empty();
	$('.people').append(content);
	

	// 페이징 처리 UI 그리기(플러그인 사용)
	$('#pagination').twbsPagination({
			startPage:obj.currPage, // 보여줄 페이지
			totalPages:obj.pages,// 총 페이지 수(총갯수/페이지당보여줄게시물수) : 서버에서 계산해서 가져와야함
			visiblePages:5,//[1][2][3][4][5]
			onPageClick:function(e,page){ // 번호 클릭시 실행할 내용
				//console.log(e);
				if(showPage != page){
					console.log(page);
					showPage = page; // 클릭해서 다른 페이지를 보여주게 되면 현재 보고 있는 페이지 번호도 변경해 준다.
					listCall(page);
				}
			}
		});
	// 페이징 처리 css 변경
	$('.first').children().empty();
	$('.last').children().empty();
	$('.prev').children().empty();
	$('.next').children().empty();
	$('.first').children().addClass('bi bi-chevron-double-left');
	$('.last').children().addClass('bi bi-chevron-double-right');
	$('.prev').children().addClass('bi bi-chevron-left');
	$('.next').children().addClass('bi bi-chevron-right');
	
} 

$('#openAlarm').click(function (e) {
   // JSP 파일을 가져와서 모달 창에 표시
   $.get("./alarmList.go", function(data) {
   	console.log(data);
   	console.log("#alarmContent");
       $("#alarmContent").html(data);
   });
});

// 상세보기(상위 document로 안할시 버튼클릭 이벤트가 안먹음)
$(document).on('click', '.openModal', function (e) {
	e.stopPropagation(); // 모달의 영향을 받지 않도록 이벤트 전파 막기
	
	console.log("모달클릭");
	var pro_idx = $(this).val();
	console.log("pro_idx 값: "+pro_idx);

   // JSP 파일을 가져와서 모달 창에 표시
	if (pro_idx !== '') {
	    $.get("./memberDetailList.go?pro_idx=" + pro_idx, function(data) {
	        console.log("#modalContent");
	        $("#modalContent").html(data);
	    });
	}
});

</script>
</html>