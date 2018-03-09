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
		window.open("","AnswerCheck","width=600,height=600");
		frm.submit();
		}
		else
			alert("정답 다 체크해");
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
<h1>시험문제페이지</h1>
<form name="frm" action="./AnswerCheck" method="POST" target="AnswerCheck">
<input type="hidden" name="test" value="test">
<input type="hidden" id="ma" name="ma">
<input type="hidden" name="chapter" value="<%=request.getAttribute("chapter")%>">
<input type="hidden" name="rate" value="<%=request.getAttribute("rate")%>">
<c:forEach items="${ar}" var="problem" varStatus="i">
		<p>${i.index+1 }문제  ${problem.contents }</p>
		<input type="hidden" name="pnum" value="${problem.pnum }">
		<input type="hidden" name="answer" value="${problem.answer }">
		<c:forEach items="${problem.answerlist.split(',')}" var="answerlist" varStatus="a">
		<input type="radio"<c:if test="${problem.my_answer == a.index+1}">  checked="checked"</c:if> class="answer" title="${problem.pnum }" name="answer${i.index+1}" value="${a.index+1}">${answerlist }
		</c:forEach>
		<br><br>
</c:forEach>
<br>

<input type="button" id="btn" value="제출">
</form>
<%@ include file="../temp/footer.jsp"%>
</body>
</html>