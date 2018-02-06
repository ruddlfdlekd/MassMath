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
</body>
</html>