<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/chattingList.css" type="text/css">
<!-- bootstrap 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 처리를 위한 라이브러리 -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>

	a, a:link, a:visited, a:active, a:hover {
		text-decoration: none;
		color: var(--black);
	}
	
	
	/* admin페이지 side bar 메뉴 아이콘 */
	.bi-gear-fill, .bi-reception-3, .bi-people-fill, 
	.bi-person-gear, .bi-person-x-fill, .bi-door-open-fill {
		position:relative;
		color: var(--black) ;
		font-size: 22px;
		margin-right:10px;
	}
	
	/* 본인 페이지 것으로 변경하기  */
	.btn_gnb .bi-person-gear, .btn_gnb.auth{
	    color: var(--white);
	    background-color: var(--green);
	}
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
	.btn_gnb:hover .bi-gear-fill,
	.btn_gnb:hover .bi-reception-3,
	.btn_gnb:hover .bi-people-fill,
	/* .btn_gnb:hover .bi-person-gear, */
	.btn_gnb:hover .bi-person-x-fill,
	.btn_gnb:hover .bi-door-open-fill {
	    background-color: var(--light);
	}
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
	.btn_gnb.home:hover,
	.btn_gnb.dash:hover,
	.btn_gnb.user:hover,
	/* .btn_gnb.auth:hover, */
	.btn_gnb.comp:hover,
	.btn_gnb.service:hover{
		background-color: var(--light);
	}
	
	table{
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
		
	.mainContainer{
		height:100%;
	}
	
	.content{
		flex-direction: column;
		padding: 40px 0 40px 60px;
		justify-content: flex-start;
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
	
	a.highlight-link:hover {
		color: #1abc9c; /* 마우스 오버 시 링크 색상 */
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
		<h2 style="font-family:pretendard">권한 관리</h2><hr/>
			<table>
					<tr>
						<th>번호</th>			
						<th>권한명</th>
						<th>설명</th>
					</tr>
				<c:if test="${substypeList.size() == 0}">
				<tr><td colspan="3">권한이 존재하지 않습니다.</td></tr>
				</c:if>
					<c:forEach items="${authList}" var="auths">
						<tr>
							<td>${auths.subsType_code}</td>
							<td><a href="authDetailList.do?subsType_code=${auths.subsType_code}" class="highlight-link">
							${auths.subsType}</a></td>
							<td>${auths.subs_desc}</td>
						</tr>
					</c:forEach>	
			</table>	
		</div>
	</div>
</div>



</body>
<script>
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