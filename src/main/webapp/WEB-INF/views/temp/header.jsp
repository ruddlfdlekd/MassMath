<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/m1/resources/css/navbar.css">
<link rel="stylesheet" href="/m1/resources/css/footer.css">

<script type="text/javascript">
	$(function(){
		
		$("#make_btn").click(function(){
			var popupX = (window.screen.width/2) - (1300/2);
			window.open("../../../m1/problem/makeProblem","","top=-100px, left="+popupX+", width=1300px, height=600px");         
		})

		var url = window.location.href;
		if (url.indexOf("/main/")>0){
			$("#header-main").addClass("active");
		}else if(url.indexOf("/study/")>0){
			$("#header-study").addClass("active");
		}else if(url.indexOf("/myNote/")>0){
			$("#header-mynote").addClass("active");
		}else if(url.indexOf("/problem/")>0){
			$("#header-problem").addClass("active");
		}else if(url.indexOf("/qna/")>0){
			$("#header-qna").addClass("active");
		}else if(url.indexOf("/payment/")>0){
			$("#header-payment").addClass("active");
		}
	});
</script>
<body>
   <!-- navi -->
    <nav class="navbar navbar-default">
      <div class="container">
         <div class="container-fluid">
            <div class="navbar-header">
               <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
               data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                  <span class="sr-only"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
               </button>
               <img class="pull-left" width="50" height="50" alt="매스매쓰 로고" src="/m1/resources/img/logo.png">
               <a class="navbar-brand" href="/m1/main/mainPage">MassMath</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
               <ul class="nav navbar-nav" id="menu">
                  <li id="header-main"><a href="/m1/main/mainPage">메인<span class="sr-only"></span></a></li>
                  <li id="header-study" class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">학습하기<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="/m1/study/studyMain?chapter=1">고등수학 상</a></li>
                        <li><a href="/m1/study/studyMain?chapter=2">고등수학 하</a></li>
                        <li><a href="/m1/study/studyMain?chapter=3">수학 1</a></li>
                        <li><a href="/m1/study/studyMain?chapter=4">수학 2</a></li>
                        <li><a href="/m1/study/studyMain?chapter=5">미적분</a></li>
                        <li><a href="/m1/study/studyMain?chapter=6">확률과 통계</a></li>
                        <li><a href="/m1/study/studyMain?chapter=7">기하</a></li>
                     </ul>
                  </li>
                  <li id="header-mynote"><a href="/m1/myNote/myNoteList?id=${member.id}">마이노트</a></li>
                  <li id="header-qna"><a href="#">질문하기</a></li>
                  <c:if test="${member.id eq 'admin@admin'}">
                  	<li id="make_btn"><a href="#">문제등록</a></li>
                    <li id="header-problem"><a href="/m1/problem/problemList">문제리스트</a></li>
                  </c:if>
               </ul>
               <ul class="nav navbar-nav navbar-right">
                  <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">회원관리<span class="caret"></span></a>                  
                     <ul class="dropdown-menu">
                        <c:if test="${empty member}">
                           <li><a href="/m1/member/login">로그인</a></li>
                           <li><a href="/m1/member/login">회원가입</a></li>
                        </c:if>
                        <c:if test="${not empty member}">
                           <li><a href="/m1/member/memberLogOut">로그아웃</a></li>
                           <li><a href="/m1/member/memberMyPage?id=${member.id}">마이페이지</a></li>
                        </c:if>
                     </ul>
                  </li>
               </ul>
               <ul class="nav navbar-nav navbar-right">
                  <li id="header-payment"><a href="#">결제하기</a></li>
               </ul>
            </div>
         </div>
      </div>
   </nav>
</body>