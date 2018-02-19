<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".btn").click(function(){
		var answer = $(this).val();
		var num = $(this).attr("title");
		$.get("./mynote?pnum="+num+"&my_answer="+answer,function(data){
		});
	
	});
});

</script>
</head>
<body>
<c:forEach items="${check}" var="a" varStatus="i">
<p>${i.index+1 }번문제 ${a} 정답 : ${answer[i.index]} 내답:${my_answer[i.index]}
<c:if test="${a eq 'X' }" >
해설 : ${c[i.index]}
<button class="btn" title="${pnum[i.index] }" value="${my_answer[i.index] }">오답노트로</button>
</c:if>
</p>
</c:forEach>
</body>
</html>