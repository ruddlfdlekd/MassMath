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
		$(".btn2").click(function(){
			
			var v = <%= request.getParameter("chapter") %>;
			if($(this).val()=="1"){
				location.href="./study1?chapter="+v;
			}
			if($(this).val()=="2"){
				window.open("./studyLevel?chapter="+v, "", "top=500,left=500,width=400,height=400");
			}
			if($(this).val()=="3"){
				location.href="./study3?chapter="+v;
			}
		});
	});
</script>
</head>
<body>
<%@ include file="../temp/header.jsp"%>

<button class="btn2" value="1">개념</button>
<button class="btn2" value="2">문제풀기</button>
<button class="btn2" value="3">맞춤형테스트</button>

<%@ include file="../temp/footer.jsp"%>
</body>
</html> 