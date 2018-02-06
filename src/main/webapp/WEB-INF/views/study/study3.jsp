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
$(function() {
		$(".btn").click(function(){
			window.open("./studyPage", "", "top=500,left=500,width=400,height=400");
/* 			location.href("study/studyView?chapter=$(this).val()"); */
		});});
</script>
</head>
<body>
<button class="btn">개념</button>
<button class="btn">문제풀기</button>
<button class="btn">맞춤형테스트</button>
</body>
</html>