<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
		window.open("","AnswerCheck","width=1000,height=1000");
		frm.submit();
		}
	});
});
</script>
</head>
<body>
<h1>문제페이지</h1>
<form name="frm" action="./AnswerCheck" method="POST" target="AnswerCheck">
<input type="text" id="ma" name="ma">
<c:forEach items="${ar}" var="problem" varStatus="i">
		<p>${i.index+1 }문제  ${problem.contents }</p>
		<input type="text" name="pnum" value="${problem.pnum }">
		<input type="text" name="answer" value="${problem.answer }">
		<c:forEach items="${problem.answerlist.split(',')}" var="answerlist" varStatus="a">
		<input type="radio"<c:if test="${problem.my_answer == a.index+1}">  checked="checked"</c:if> class="answer" title="${problem.pnum }" name="answer${i.index+1}" value="${a.index+1}">${answerlist }
		</c:forEach>
</c:forEach>
<br>
<input type="button" id="btn" value="제출">
</form>

</body>
</html>