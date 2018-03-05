<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/m1/resources/join.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#btn").click(function(){
		alert("ddd");
			window.open("./findPw?id="+$("#id").val(),"","top=300, left=750, width=410, height=450");
	});
});
</script>
</head>
<body>
<div class="login-center2" id="pw-center">
	<h2> 비밀번호 찾기 </h2>
	<h3> 이메일을 입력해 주세요</h3>

	<div>
		<label>ID </label>
		<p class="p"><input type="email" name="id" id="id" placeholder="  이메일 형식만 가능"></p>
    </div>
    
	<p><input type="button" id="btn" value="비밀번호 찾기"></p>

</div>
</body>
</html>