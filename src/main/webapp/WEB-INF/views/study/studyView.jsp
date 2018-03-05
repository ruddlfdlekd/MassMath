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
			location.href="./studyView?chapter="+$(this).val();
		});
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
<button class="btn" value="1111">고등수학상</button>
<button class="btn" value="2111">고등수학하</button>
<button class="btn" value="3111">수1</button>
<button class="btn" value="4111">수2</button>
<button class="btn" value="5111">미분과적분</button>
<button class="btn" value="6111">확률과통계</button>
<button class="btn" value="7111">기하</button>
<br><br><br><br><br>
<button class="btn2" value="1">개념</button>
<button class="btn2" value="2">문제풀기</button>
<button class="btn2" value="3">맞춤형테스트</button>
</body>
</html> 