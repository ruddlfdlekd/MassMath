<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/m1/resources/css/main.css">
<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			location.href="/m1/member/memberLogin";
		});
	});
</script>

</head>
<%@include file="./temp/scroll.jsp"%>
<body>

	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					aria-expanded="false">
					시작하기
				</button>
				<img class="pull-left" width="50" height="50" alt="매스매쓰 로고"
					src="/m1/resources/img/logo.png"> <a class="navbar-brand"
					href="/m1/main/mainPage">MassMath</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" id="menu">
					<li id="header-main"><div class="large-12 columns">
							<div class="wrapper">
								<div class="btn btn--border btn--primary btn--animated" id="btn" style="margin-left: 750px; width:300px; margin-top:50px;">시작하기</div>
							</div>
						</div>
						<span class="sr-only"></span></li>

				</ul>
			</div>
		</div>
	</div>
	</nav>
	<div class="index">
		<div id="section1" style="height:800px;">
	     <div style="width:100%; height:100%">
	     	<img alt="" src="/m1/resources/images/메인화면.png" style="width:100%; height:800px;">
	     </div>
		</div>
		<div id="section2" style="height:800px; background-color: rgb(48, 162, 210)">
			<div style="width: 100%; height: 100%; background-image: url('/m1/resources/images/메인1.jpg');">
				<div class="container" style="width: 800px;">
					<div class="row" style="margin-top:100px;">
						<div class="col-sm-4">
							<h1 style="color: white; font-size: 80px; font-weight: 800">필요한</h1>
							<h1 style="color: white; font-size: 80px; font-weight: 800">문제만</h1>
							<h1 style="color: white; font-size: 80px; font-weight: 800">풀어요</h1>
						</div>
						<div class="col-sm-4" style="margin-top:100px;">
							<p><h4 style="font-weight: 800; color:black">입체적으로 재구성된 문제부터</h4></p>
							<p><h4 style="font-weight: 800; color:black">개인별 취약점을 효율적으로 분석하여</h4></p>
							<p><h4 style="font-weight: 800; color:black">최적화된 방식으로 치료하는</h4></p>
							<p><h4 style="font-weight: 800; color:black">자기 완성형 수학 교육 서비스</h4></p>
							
						</div>
						<div class="col-sm-4" style="margin-top:180px;">
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="text-align: center; font-size: 55px; background-color: #0c3c60; padding: 40px">
			<img alt="" src="/m1/resources/images/logo.png"><span style="line-height: 100px; display: inline-block; vertical-align: top; color: white; margin-top: 15px">MassMath를 소개합니다.</span>
		</div>
		<div style="text-align: center">
			<div class="intro-item">
			 <div class="top" style="width:700px; margin: 0 auto">
			  <img alt="" src="/m1/resources/images/전구.png" style="width:289px; float: left;">
			  <div>
			   <h2 style="color:#c7c7c7; font-size: 30px; text-align: left; padding-top: 80px; line-height: 1em">MassMath는?</h2>
			   <h1 style="color: #0c3c60; font-size: 70px; text-align: left; margin-top: 10px; font-weight: 700; line-height: 1em">똑똑합니다.</h1>
			  </div>
			 </div>
			 <div style="clear: both; word-break:keep-all">
			  <p>
			   <b style="font-weight: 700">35만여개의 방대한 문제은행을 기반으로 One-Touch 개별 맞춤 학습지/교재 제작이 가능합니다. </b>
			  </p>
			  <p>간단한 터치로 학생이 틀린 문제를 간편하게 입력할 수 있습니다.</p>
			  <p>시중 교재/교과서와 연동한 맞춤 학습지도 손쉽게 만들 수 있습니다. <em style="font-size: .9em; color: red;">(18년 1월 현재 600여권 입력)</em></p>
			  <p>취약 유형을 모은 오답 클리닉지가 자동 생성됩니다.</p>
			  <p>자체 보유한 Big Data 기술을 활용해 최고 수준의 학습 Report를 제공합니다.</p>
			  <p>학원전용앱을 통해 학생/학부모와 실시간으로 소통할 수 있습니다.</p>
			 </div>
			</div>
			
			
			<div class="intro-item">
			 <div class="top" style="width:700px; margin: 0 auto">
			  <img alt="" src="/m1/resources/images/손가락.png" style="width:289px; float: left;">
			  <div>
			   <h2 style="color:#c7c7c7; font-size: 30px; text-align: left; padding-top: 80px; line-height: 1em">MassMath는?</h2>
			   <h1 style="color: #0c3c60; font-size: 70px; text-align: left; margin-top: 10px; font-weight: 700; line-height: 1em">쉽습니다.</h1>
			  </div>
			 </div>
			 <div style="clear: both; word-break:keep-all">
			  <p>매쓰플랫은 터치부터 출력까지 이르는 모든 과정을 최소화했습니다.</p>
			  <p>누구나 손쉽게 매쓰플랫이 제공하는 모든 기능을 이용할 수 있습니다.</p>
			  <p>매쓰플랫은 태블릿 PC에 최적화되어 개발된 최신 수학 교육 솔루션앱입니다.</p>
			  <p>언제 어디서나 간단하게 문제를 만들 수 있습니다.</p>
			  <p>더 이상 학습지 제작을 위해 컴퓨터 앞에 앉아있을 필요가 없습니다.</p>
			  <p><b style="font-weight:700">최고의 마우스는 바로 당신의 손가락입니다.</b></p>
			 </div>
			</div>
			
			
			<div class="intro-item">
			 <div class="top" style="width:700px; margin: 0 auto">
			  <img alt="" src="/m1/resources/images/악수.png" style="width:289px; float: left;">
			  <div>
			   <h2 style="color:#c7c7c7; font-size: 30px; text-align: left; padding-top: 80px; line-height: 1em">MassMath는?</h2>
			   <h1 style="color: #0c3c60; font-size: 70px; text-align: left; margin-top: 10px; font-weight: 700; line-height: 1em">든든합니다.</h1>
			  </div>
			 </div>
			 <div style="clear: both; word-break:keep-all">
			  <p>외로운 학원 운영, 더 이상 걱정하지 마세요.</p>
			  <p>매쓰플랫은 선생님의 가장 스마트하고, 든든한 동반자가 되겠습니다.</p>
			  <p>매쓰플랫은 태블릿 PC에 최적화되어 개발된 최신 수학 교육 솔루션앱입니다.</p>
			  <p>매쓰플랫과 함께 당신의 수업을 더 스마트하게 만드세요.</p>
			  <p><b style="font-weight:700">지금, 무료 체험을 통해 매쓰플랫을 만나보실 수 있습니다.</b></p>
			 </div>
			</div>
		</div>
	</div>
</body>
</html>