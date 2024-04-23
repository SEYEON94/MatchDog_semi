## 프로젝트 소개
<br>
<br>
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/b21902f9-c2cc-4646-834e-4746d8b9ec6e" width="auto" height="200">
<br>
<br>

우리 동네 반려견 친구를 만들어주기 위한 매칭 서비스

- 🤝 내가 사는 지역 내 반려견의 성향과 비슷한 리스트를 우선적으로 추천하여 매칭을 요청하고 수락할 수 있다.
- 💬 매칭된 상대와의 1:1 채팅이 가능하며 채팅을 나눈 상대방을 평가할 수 있다.
- 🐕 다견 가정을 고려한 다중 프로필 등록이 가능하고 대표 프로필을 설정할 수 있다.
- 🔒 구독 시스템을 통해 등급에 따라 서비스 이용을 제한한다. 

<br>

## 📅 프로젝트 기간 
2023/10/13 ~ 2023/11/15
<br>
<br>

## 👩‍🚀 팀원

|   | 김세연  | 이한준  | 정지원  | 김인혜  | 전은호  | 차재호  |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 역할 | 조장  | 팀원  | 팀원  | 팀원  | 팀원  | 팀원  |
| 기능 | CSS<br>1:1 채팅<br>매칭리스트<br>프로필 등록 | 통계<br>로그인/회원가입<br>회원 관리 | 신고 관리<br>프로필 등록 | 프로필/마이페이지 관리<br>권한 관리 | 자유게시판<br>매칭받은 리스트| 알림<br>매칭리스트

## 🛠 개발 환경 및 배포 URL

<div align=left>
	<h3>📚 개발 환경 📚</h3>
	<p>▪ FRONT</p>
</div>
<div align="left">
	<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white" />
	<img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white" />
	<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white" />
	<img src="https://img.shields.io/badge/jQuery-0769AD?style=flat&logo=jQuery&logoColor=white" />
	<br>
</div>
<div align=left>
	<p>▪ BACK</p>
</div>
<div align="left">
	<img src="https://img.shields.io/badge/Java-007396?style=flat&logo=Conda-Forge&logoColor=white" />
	<img src="https://img.shields.io/badge/Eclipse%20IDE-2C2255?style=flat&logo=EclipseIDE&logoColor=white" />
</div>
<div align=left>
	<p>▪ 프레임워크</p>
</div>
<div align="left">
	<img src="https://img.shields.io/badge/Spring-6DB33F?style=flat&logo=Spring&logoColor=white" />
	<img src="https://img.shields.io/badge/Mybatis-000000?style=flat&logo=Fluentd&logoColor=white" />
</div>
<div align=left>
	<p>▪ 데이터베이스</p>
</div>
<div align="left">
	<img src="https://img.shields.io/badge/mariaDB-003545?style=flat&logo=mariaDB&logoColor=white" />
</div>
<div align=left>
	<p>▪ 버전 관리 툴</p>
</div>
<div align="left">
	<img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=GitHub&logoColor=white" />
	<img src="https://img.shields.io/badge/Sourcetree-0052CC?style=flat&logo=Sourcetree&logoColor=white" />
</div>
<br>

## 🧱 프로젝트 설계

### ERD
![1조 매칭해주개](https://github.com/SEYEON94/MatchDog_semi/assets/121929117/50f4613b-4b9c-42ef-a4f8-6d2d77ac3f5b)


## ⚙ 주요기능

* 반려견 매칭
  - **추천 리스트** : 입력된 동 주소가 일치하는 리스트에서 내 강아지의 성향과 일치하는 순서대로 랜덤 추천 (SQL문 ORDER BY RAND() 함수 사용)
  - **매칭받은 리스트** : 각각의 프로필에 보낸 매칭 요청을 모아 리스트 구현, 회원 등급에 따라 보여주는 리스트 제한

* 채팅
  - **1:1 채팅** : 매칭 수락 시 자동으로 채팅방 생성, POLLING 방식을 이용하여 웹 페이지와 주기적으로 데이터를 교환하여 실시간 채팅 및 파일 전송 구현, 회원 등급에 따라 채팅 횟수 제한, 신고 등록
  - **매너견 평가** : 채팅 후 매너견 평가 점수 등록 가능, 일정 점수에 따라 매너견/비매너견 표시 

* 관리자페이지
  - **통계** : Chart.js를 사용하여 방문자 수,매출액,구독자 수 그래프로 표시
  - **회원관리** : 회원 구독 등급별 조회/수정/검색 기능
  - **권한관리** : 관리자 및 회원 등급에 따른 권한 조회 및 수정 기능
  - **신고관리** : 신고 처리 유형별 조회/수정/검색 기능, 신고 히스토리 기록, 로그인 제제 기능

* 마이페이지
  - **다중 프로필** : 다견 가정을 위한 다중 프로필 등록 최대 3개 가능, 대표 프로필 지정, 프로필 CRUD 구현, 프로필 사진 등록 및 수정 기능
  - **내 정보** : 내 정보 수정, 회원 탈퇴 기능
 
* 커뮤니티 게시판
  - **커뮤니티 게시판** : 게시글 및 댓글 작성/수정/삭제/조회 기능, 신고 등록, 이미지 업로드, 좋아요 싫어요 평가 기능능

* 회원
  - **회원가입/로그인** : 정규 표현식에 의한 유효성 검사 및 Ajax 중복 체크, 비밀번호 암호화, 카카오 MAP API 이용
  - **아이디 찾기** : 아이디 분실 시 이메일 인증 후 해당 이메일로 가입한 아이디 공개
  - **비밀번호 찾기** : 비밀번호 분실 시 이메일 인증 후 해당 이메일에 임시비밀번호 전송
    
## 🖥️ 구현화면

<h3>[로그인화면]</h3>
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/89846af5-a1a3-41d3-b15d-6bbbda058f15">
<br>
<h3>[회원가입]</h3>
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/6b25b8fd-3bd6-4cb7-a28f-8a787f6f89c5">
<br>
<h3>[메인페이지]</h3>
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/b091aa38-cfa8-484d-82e8-ef7559ec74e4">
<br>
<h3>[매칭리스트]</h3>
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/0cc6d29e-7358-419a-8041-dcf07b4b0721">
<br>
<h3>[1:1 채팅]</h3>
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/040f3f0c-d7b6-4deb-9c10-5c676a549ec4">
<br>
<h3>[후기 등록]</h3>
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/003fc038-5108-4eb8-ac8c-a00b02c5a880">
<br>
<h3>[자유게시판]</h3>
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/badeb91d-1326-4b50-840e-5835c53a4cfb">
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/cd705ab1-f526-4ee5-8495-44fde330cc97">
<br>
<h3>[마이페이지]</h3>
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/213a3813-561d-4005-9ef9-c57b71542141">
<br>
<h3>[반려견 다중프로필]</h3>
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/4c0cfb6a-aeef-41e1-b3d2-c2c16c8aa93d">
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/aea86033-82bc-47ac-9483-1f63056ed466">
<br>
<h3>[관리자페이지-대시보드]</h3>
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/02352f51-b103-4b8f-96a5-c608e33310dd">
<br>
<h3>[회원관리]</h3>
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/660f7d02-d96a-4fe1-ac1a-b039996aa8c3">
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/5fa5ace6-2c08-4e35-b35e-e1db7064bc19">
<br>
<h3>[권한관리]</h3>
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/a9910968-9f1b-4166-b4f0-12abd29b1b65">
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/7b0494ba-2d5d-4fa4-ae8d-bbe7d5d9e98f">
<br>
<h3>[신고관리]</h3>
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/8bfbc45f-3b78-4813-a3cd-79ac3cc8c6a3">
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/d654c020-9406-4e60-82dd-b92a6c533c77">
<br>
<h3>[알람/신고 모달]</h3>
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/f73ea2c2-5e86-4972-8efb-a57ab8503a3f">
<img src="https://github.com/SEYEON94/MatchDog_semi/assets/121929117/cb7eaedd-06a6-403b-9a08-de3ecaf5e44c">




