<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	$(function() {
		$(".btn2").click(function(){
			
			var v = <%= request.getParameter("chapter") %>;
			if($(this).val()=="1"){
				location.href="./study1?chapter="+v;
			}
			if($(this).val()=="2"){
				window.open("./studyLevel?chapter="+v, "", "top=500,left=500,width=400,height=400");
			}
			if($(this).val()=="3"){
				location.href="./study3?chapter="+v;
			}
		});
		
		$("#sidebar li").click(function() {
			$("#sidebar li").removeClass("active");
			$(this).addClass("active");
		});
		
		$("#btn3").click(function(){
			var v = <%= request.getParameter("chapter") %>;
			var level = $("#level").val();
			var type = $("#type").val();
			location.href = "./study2?chapter="+v+"&level="+level+"&type="+type;  
		});
	});
</script>
</head>
<body>
<%@ include file="../temp/header.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-3">
        	<h4 class="text-center"><b>고등수학(상)</b></h4>
            <div id="sidebar" class="well sidebar-nav">
                <h4>
                    <small><b>1 다항식</b></small>
                </h4>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="#">01.다항식의 연산</a></li>
                    <li><a href="#">02.항등식과 나머지정리</a></li>
                    <li><a href="#">03.인수분해</a></li>
                </ul>
                <h4>
                    <small><b>2 방정식과 부등식</b></small>
                </h4>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="#">04.복소수</a></li>
                    <li><a href="#">05.이차방정식</a></li>
                    <li><a href="#">06.이차방정식과 이차함수</a></li>
                    <li><a href="#">07.여러가지 방정식</a></li>
                    <li><a href="#">08.여러가지 부등식</a></li>
                </ul>
                <h4>
                    <small><b>3 도형의 방정식</b></small>
                </h4>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="#">10.평면좌표</a></li>
                    <li><a href="#">11.직선의 방정식</a></li>
                    <li><a href="#">12.원의 방정식</a></li>
                    <li><a href="#">13.도형의 이동</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-9" style="margin-top :40px; border: 1px solid #bbbbbb; height: 650px;">
        	<img style="margin-top: 100px; margin-left: auto; margin-right: auto; display: block;" alt="hello" src="/m1/resources/images/hello.png">
        	<br>
        	<p style="text-align: center;">선택해주세요.</p>
        	<div class="row text-center">
				<div style="border-right : 1px solid #bbbbbb; height: 250px;" class="col-md-4">
					<div style="height: 140px;">
						<h4><b>기초학습</b></h4>
						<p>기본 개념을 공부하는 곳입니다.<br>단원을 처음 학습하거나 기초부터 개념을 다시 학습하고 싶은 분들께 추천합니다.</p>
					</div>
					<button style="margin-top : 50px; margin-bottom: 50px;" class="btn2 btn btn-default" value="1">시작하기</button>
				</div>
				<div style="border-right : 1px solid #bbbbbb; height: 250px;" class="col-md-4">
					<div style="height: 140px;">
						<h4><b>실력확인</b></h4>
						<p>실력확인을 하는 곳입니다. 원하는 난이도를 선택하여 테스트 문제를 풀어보고, <br>자신의 예상점수를 확인할 수 있습니다.</p>
					</div>
					<!-- <button style="margin-top : 50px; margin-bottom: 50px;"  class="btn2 btn btn-default" value="2">시작하기</button> -->
					<p><a style="margin-top : 50px; margin-bottom: 50px;" class="btn btn-default" data-target="#modal" data-toggle="modal">시작하기</a></p>
				</div>
				<div style="height: 250px;" class="col-md-4">
					<div style="height: 140px;">
						<h4><b>맞춤형 문제</b></h4>
						<p>맞춤형 문제가 제공되는 곳입니다. 학습자의 예상점수와 알맞는 난이도의 문제가 제공됩니다.</p>
					</div>
					<button style="margin-top : 50px; margin-bottom: 50px;" class="btn2 btn btn-default" value="3">시작하기</button>
				</div>
			</div>
        </div>
    </div>
</div>
<%@ include file="../temp/footer.jsp"%>

<div class="row">
	<div class="modal" id="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center;">
					난이도 선택
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" style="text-align: center;">
					난이도 선택
					<select id = "level">
						<option value="1">HARD</option>
						<option value="2">NORMAL</option>
						<option value="3">EASY</option>
					</select>
					<br>
					유형 선택
					<select id = "type">
						<option value="1">1유형</option>
						<option value="2">2유형</option>
					</select>
					<br>
					<button id="btn btn3 btn-default">확인</button>
				</div>
				<hr>
			</div>
		</div>
	</div>
</div>

</body>
</html> 