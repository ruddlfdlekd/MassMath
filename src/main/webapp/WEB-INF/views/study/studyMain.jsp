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
	alert("로그인을 해주세요.");
	location.href="/m1/member/memberLogin";
	</c:if>

		$(".btn2").click(function(){
			var type = $("#select").val();
			var v = <%= request.getParameter("chapter") %>;
			if($(this).val()=="1"){
				location.href="./studyConcept?chapter="+v;
			}
			if($(this).val()=="2"){
				window.open("./studyLevel?chapter="+v, "", "top=500,left=500,width=400,height=400");
			}
			if($(this).val()=="3"){
				location.href="./studyCustom?chapter="+v+type;
			}
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
                    <li><a href="./studyView?chapter=1111">01.다항식의 연산</a></li>
                    <li><a href="./studyView?chapter=1121">02.항등식과 나머지정리</a></li>
                    <li><a href="./studyView?chapter=1131">03.인수분해</a></li>
                </ul>
                <h4>
                    <small><b>2 방정식과 부등식</b></small>
                </h4>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="./studyView?chapter=1211">04.복소수</a></li>
                    <li><a href="./studyView?chapter=1221">05.이차방정식</a></li>
                    <li><a href="./studyView?chapter=1231">06.이차방정식과 이차함수</a></li>
                    <li><a href="./studyView?chapter=1241">07.여러가지 방정식</a></li>
                    <li><a href="./studyView?chapter=1251">08.여러가지 부등식</a></li>
                </ul>
                <h4>
                    <small><b>3 도형의 방정식</b></small>
                </h4>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="./studyView?chapter=1311">10.평면좌표</a></li>
                    <li><a href="./studyView?chapter=1321">11.직선의 방정식</a></li>
                    <li><a href="./studyView?chapter=1331">12.원의 방정식</a></li>
                    <li><a href="./studyView?chapter=1341">13.도형의 이동</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-9" style="margin-top :40px; border: 1px solid #bbbbbb; height: 450px;">
        	<c:forEach items="${ar}" var="rate" varStatus="i">
        	<p>${i.index+1 }Chapter 등급 : ${rate }</p>
        	</c:forEach>
        	<img style="margin-top: 100px; margin-left: auto; margin-right: auto; display: block;" alt="hello" src="/m1/resources/images/hello.png">
        	<br>
        	<p style="text-align: center;">반갑습니다.</p>
        	
        </div>
        
        
    </div>
</div>

<%@ include file="../temp/footer.jsp"%>
</body>
</html> 