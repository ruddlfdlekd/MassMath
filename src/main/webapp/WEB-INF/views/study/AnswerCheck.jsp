<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
		$(window).bind("beforeunload", function (){
		var a = new Array();
		var reason = $(".reason");
		var answer = $(".answer");
		for(var i=0; i<reason.length; i++){
		a.push(reason[i].value);
		a.push(answer[i].title);
		a.push(answer[i].value);
		}
		$.ajax({
			url : "./myNote",
		
			type : 'POST',
		
			data : {"a" : a},
			traditional : true,
				
			success:function(data){   
			
			},  
		});
	});
		$("#btn").click(function(){
			window.opener.location.href="../../../m1";
			window.close();
		});
		
});
</script>
</head>
<body>
<c:forEach items="${check}" var="a" varStatus="i">
<p>${i.index+1 }번문제 ${a} 정답 : ${answer[i.index]} 내답:${my_answer[i.index]}
<c:if test="${a eq 'X' }" >
해설 : ${c[i.index]}
<select class="reason">
<option value="wrong">Wrong</option>
<option value="miss">Miss</option>
</select>
<input type="hidden" class="answer" value="${pnum[i.index] }" title="${my_answer[i.index] }">
</c:if>
</p>
</c:forEach>
<button id="btn">오답노트에 저장</button>
</body>
</html>