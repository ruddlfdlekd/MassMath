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
		
		<c:if test="${empty member}">
		alert("로그인 먼저 해주세요.");
		opner.location.href="/m1/member/memberLogin";
		</c:if>
		
		var v = <%= request.getParameter("chapter") %>+"";
		var c = $(".c");
		var c1 = v.substring(1,2);
		var c2 = v.substring(2,3);
		$(".btn2").click(function(){
			if($(this).val()=="1"){
				location.href="./studyConcept?chapter="+v;
			}
			if($(this).val()=="2"){
				window.open("./studyLevel?chapter="+v, "", "top=500,left=500,width=400,height=400");
			}
			if($(this).val()=="3"){
				location.href="./studyCustom?chapter="+v+"1";
			}
		});
		
		
		
		$("#sidebar li").click(function() {
			$("#sidebar li").removeClass("active");
			$(this).addClass("active");
		});
		
		$("#btn3").click(function(){
			var v = <%= request.getParameter("chapter") %>;
			var rate = $("#level").val();
			location.href = "./studyTest?chapter="+v+"&rate="+rate;  
		});
	
		if(c1=="1"){
			if(c2=="1")
				$("#c0").addClass("active");
			else if(c2=="2")
				$("#c1").addClass("active");
			else if(c2=="3")
				$("#c2").addClass("active");
		}
		else if(c1=="2"){
			if(c2=="1")
				$("#c3").addClass("active");
			else if(c2=="2")
				$("#c4").addClass("active");
			else if(c2=="3")
				$("#c5").addClass("active");
			else if(c2=="4")
				$("#c6").addClass("active");
			else if(c2=="5")
				$("#c7").addClass("active");
		}
		else if(c1=="3"){
			if(c2=="1")
				$("#c8").addClass("active");
			else if(c2=="2")
				$("#c9").addClass("active");
			else if(c2=="3")
				$("#c10").addClass("active");
			else if(c2=="4")
				$("#c11").addClass("active");	
		}
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
                    <li id="c0"><a href="./studyView?chapter=1111">01.다항식의 연산</a></li>
                    <li id="c1"><a href="./studyView?chapter=1121">02.항등식과 나머지정리</a></li>
                    <li id="c2"><a href="./studyView?chapter=1131">03.인수분해</a></li>
                </ul>
                <h4>
                    <small><b>2 방정식과 부등식</b></small>
                </h4>
                <ul class="nav nav-pills nav-stacked">
                    <li id="c3"><a href="./studyView?chapter=1211">04.복소수</a></li>
                    <li id="c4"><a href="./studyView?chapter=1221">05.이차방정식</a></li>
                    <li id="c5"><a href="./studyView?chapter=1231">06.이차방정식과 이차함수</a></li>
                    <li id="c6"><a href="./studyView?chapter=1241">07.여러가지 방정식</a></li>
                    <li id="c7"><a href="./studyView?chapter=1251">08.여러가지 부등식</a></li>
                </ul>
                <h4>
                    <small><b>3 도형의 방정식</b></small>
                </h4>
                <ul class="nav nav-pills nav-stacked">
                    <li id="c8"><a href="./studyView?chapter=1311">10.평면좌표</a></li>
                    <li id="c9"><a href="./studyView?chapter=1321">11.직선의 방정식</a></li>
                    <li id="c10"><a href="./studyView?chapter=1331">12.원의 방정식</a></li>
                    <li id="c11"><a href="./studyView?chapter=1341">13.도형의 이동</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-9" style="margin-top :40px; border: 1px solid #bbbbbb; height: 351px;">
        	<div class="row text-center">
				<div style="border-right : 1px solid #bbbbbb; height: 250px; margin: 50px 0px 50px 0px;" class="col-md-4">
					<div style="height: 140px;">
						<h4><b>기초학습</b></h4>
						<p>기본 개념을 공부하는 곳입니다.<br>단원을 처음 학습하거나 기초부터 개념을 다시 학습하고 싶은 분들께 추천합니다.</p>
					</div>
					<button style="margin-top : 50px; margin-bottom: 50px;" class="btn2 btn btn-default" value="1">시작하기</button>
				</div>
				<div style="border-right : 1px solid #bbbbbb; height: 250px; margin: 50px 0px 50px 0px;" class="col-md-4">
					<div style="height: 140px;">
						<h4><b>테스트 문제</b></h4>
						<p>실력확인을 하는 곳입니다. 원하는 난이도를 선택하여 테스트 문제를 풀어보고, <br>자신의 예상점수를 확인할 수 있습니다.</p>
					</div>
					<p><a style="margin-top : 50px; margin-bottom: 50px;" class="btn btn-default" data-target="#modal" data-toggle="modal">시작하기</a></p>
				</div>
				<div style="height: 250px; margin: 50px 0px 50px 0px;" class="col-md-4">
					<div style="height: 140px;">
						<h4><b>맞춤형 문제</b></h4>
						<p>맞춤형 문제가 제공되는 곳입니다. 학습자의 예상점수와 알맞는 난이도의 문제가 제공됩니다.</p>
						<p>현재등급 : 
						    <c:if test="${empty rate}"><b style="color: red;">없음</b></c:if>
						    <c:if test="${not empty rate}"><b style="color: red;"><%=request.getAttribute("rate") %></b></c:if>
						    
						</p>
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
						<option value="A">A(정답률0~20%)</option>
						<option value="B">B(정답률20~40%)</option>
						<option value="C">C(정답률40~60%)</option>
						<option value="D">D(정답률60~80%)</option>
						<option value="E">E(정답률80~100%)</option>
					</select>
					<p>(전에 풀던 문제가 있으면 등급에 상관없이 자동으로 가져옴)</p>
					유형 선택
					<select id = "type">
						<option value="1">1유형</option>
						<option value="2">2유형</option>
					</select>
					<br>
					<a id="btn3" class="btn btn-default" data-target="#modal" data-toggle="modal">확인</a></p>
				</div>
				<hr>
			</div>
		</div>
	</div>
</div>

</body>
</html> 