<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOG IN</title>
<link href="/m1/resources/css/join.css" rel="stylesheet">

</head>
<%@include file="../temp/loding.jsp"%>
<body>
<div id="b" name="b" style="visibility:hidden;">
<div class="login-center2">
	<h2> 로그인 </h2>
	<h6> 로그인 정보를 입력해 주세요</h6>
	
	<form action="memberLogin" method="post">
	<div>
		<label>ID </label>
		<p class="p"><input type="email" name="id" placeholder="  이메일 형식만 가능"></p>
    </div>
    
    <label>PW </label>
	<p class="p"><input type="password" placeholder="  비밀번호를 입력해주세요" name="pw" id="pw"></p>
	
	<p id="btn-group">
		<button id="btn">LOGIN</button>
		<a href="./login" class="btn">CANCEL</a>
	</p>	
	
	</form>
</div>
</div>
</body>
</html>