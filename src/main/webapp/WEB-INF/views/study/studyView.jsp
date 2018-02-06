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
			var v = <%= request.getParameter("chapter") %>;
			if($(this).val()=="1"){
				location.href="./study1?chapter="+v;
			}
			if($(this).val()=="2"){
				location.href="./study2?chapter="+v;
			}
			if($(this).val()=="3"){
				location.href="./study3?chapter="+v;
			}
			
			/* 			location.href("study/studyView?chapter=$(this).val()"); */
		});
		});
</script>
</head>
<body>

<button class="btn" value="1">개념</button>
<button class="btn" value="2">문제풀기</button>
<button class="btn" value="3">맞춤형테스트</button>
</body>
</html>