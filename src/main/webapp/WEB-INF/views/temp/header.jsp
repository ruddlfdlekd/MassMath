<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/m1/resources/css/navbar.css">
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
					<a class="navbar-brand" href="main.jsp">MassMath</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="main.jsp">메인<span class="sr-only"></span></a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">학습하기<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">고등수학 상</a></li>
								<li><a href="#">고등수학 하</a></li>
								<li><a href="#">수학 1</a></li>
								<li><a href="#">수학 2</a></li>
								<li><a href="#">미적분</a></li>
								<li><a href="#">확률과 통계</a></li>
								<li><a href="#">기하</a></li>
							</ul>
						</li>
						<li class="active"><a href="#">마이노트</a></li>
						<li><a href="#">질문하기</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>						
							<ul class="dropdown-menu">
								<c:if test="${empty member}">
									<li><a href="../member/memberLogin.jsp">로그인</a></li>
									<li><a href="../member/memberJoin.jsp">회원가입</a></li>
								</c:if>
								<c:if test="${not empty member}">
									<li><a href="#">로그아웃</a></li>
									<li><a href="../member/memberMyPage.jsp">마이페이지</a></li>
								</c:if>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</body>
