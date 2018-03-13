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
$(function(){
	var popupX = (window.screen.width/2) - (1300/2);
	$(".answer").click(function(){
		var answer = $(this).val();
		var num = $(this).attr("title");
		$.get("./my_answer?pnum="+num+"&my_answer="+answer,function(data){
		});
	});
	
	$("#btn").click(function(){
		var check = $(".answer");
		var aa ="";
		var num =0;
		for(var i=0; i<check.length; i++){
			if(check[i].checked){
				aa = aa+check[i].value;
				num=num+1;
			}
		}
		$("#ma").val(aa);
		if(num==10){
		window.open("","AnswerCheck","top=100px, left="+popupX+",width=600,height=600");
		frm.submit();
		}
		else
			alert("정답을 체크해주세요.");
	});
	
	$("#sidebar li").click(function() {
		$("#sidebar li").removeClass("active");
		$(this).addClass("active");
	});
});
</script>
</head>
<body>
<%@ include file="../temp/header.jsp"%>

<form name="frm" action="./AnswerCheck" method="POST" target="AnswerCheck">
<input type="hidden" name="test" value="test">
<input type="hidden" id="ma" name="ma">
<input type="hidden" name="chapter" value="<%=request.getAttribute("chapter")%>">
<input type="hidden" name="rate" value="<%=request.getAttribute("rate")%>">
<div class="container-fluid">
 <div class="container" style="margin-left:200px;">
	<h1 style="font-weight: 700"><%=request.getAttribute("rate")%>등급 문제</h1>
	<c:forEach items="${ar}" var="problem" varStatus="i">
			${i.index+1 }.<c:forEach items="${con[i.index] }" var="contents" varStatus="v">
				<c:if test="${v.index % 2 eq 0 }">
							${contents}
						</c:if>
					<c:if test="${v.index % 2 eq 1}">
						<img src="http://latex.codecogs.com/gif.latex?${contents}"/>
					</c:if>
			</c:forEach>
			<br><br>
			<input type="hidden" name="pnum" value="${problem.pnum }">
			<input type="hidden" name="answer" value="${problem.answer }">
			<c:forEach items="${problem.answerlist.split(',')}" var="answerlist" varStatus="a">
			<input type="radio"<c:if test="${problem.my_answer == a.index+1}">  checked="checked"</c:if> class="answer" title="${problem.pnum }" name="answer${i.index+1}" value="${a.index+1}"><img src="http://latex.codecogs.com/gif.latex?${answerlist }"/><br>
			</c:forEach>
			<br><br>
			<hr>
	</c:forEach>
<br>

 <div class="container" style="padding:50px;">
<input class="btn btn-primary" style="width:300px; margin-left:300px" type="button" id="btn" value="제출"> 
 </div>

 </div>
</div>
 <div class="container text-center" style="padding:20px;">
<input class="btn btn-primary" style="width:250px;" type="button" id="btn" value="제출"> 
 </div>

</form>
<%@ include file="../temp/footer.jsp"%>
</body>
</html>