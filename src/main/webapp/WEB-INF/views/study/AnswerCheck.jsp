<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
	function AnswerCheck(){
	window.opener.location.href="/m1/main/mainPage";
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
			go();
		},
	});
	};
		$(".label").each(function(){
			if($(this).attr("title") == 'X'){
				$(this).attr("class","label label-danger");
			}
		});
		
		$("#btn").click(function(){
			window.close();
			window.opener.location.href="/m1/main/mainPage";
		});
		
});

</script>
</head>
<body onBeforeUnload="AnswerCheck()">
<%@include file="../temp/loading2.jsp"%>
<div id="b" name="b" style="visibility:hidden;">
<div class="container" style="padding:50px">
<c:forEach items="${check}" var="a" varStatus="i">
<div>
<p><h1>${i.index+1 }번문제  <span class="label label-success" title="${a}">${a}</span></h1> <p>정답 : ${answer[i.index]} 내답:${my_answer[i.index]}</p>
</div>
<c:if test="${a eq 'X' }" >
<h2 style="font-weight: 500">해설 :</h2>
<c:forEach items="${c[i.index] }" var="commentary" varStatus="v">
			 <c:if test="${v.index % 2 eq 0 }">
						${commentary}
					</c:if>
				<c:if test="${v.index % 2 eq 1}">
					<img src="http://latex.codecogs.com/gif.latex?${commentary}"/>
				</c:if>	
</c:forEach>
<div style="float:right">
틀린이유:
<select class="reason">
<option value="wrong">몰라서</option>
<option value="miss">실수로</option>
</select>
</div>
<input type="hidden" class="answer" value="${pnum[i.index] }" title="${my_answer[i.index] }">
</c:if>
</p>
<hr>
</c:forEach>

</div>
<div class="container" style="padding:30px">
<button class="btn btn-primary" id="btn" style="width:300px; margin-left:100px">오답노트에 저장</button>
</div>
</div>
</body>
</html>