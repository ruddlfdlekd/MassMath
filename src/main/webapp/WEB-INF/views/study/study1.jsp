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
		alert($(this).val());
	});
});
</script>
</head>
<body>
<h1>문제페이지</h1>
<form action="study1" method="POST">
<c:forEach items="${ar}" var="problem" varStatus="i">
		<input type="hidden" name="pnum" value="pnum">
		<p>${i.index+1 }문제  ${problem.contents }</p>
		<c:forEach items="${problem.answerlist.split(',')}" var="answerlist" varStatus="a">
		<input type="radio" class="answer" name="answer${i.index+1 }" value="${a.index}">${answerlist } ${a.index }
		</c:forEach>
</c:forEach>
<button>제출</button>
</form>

</body>
</html>