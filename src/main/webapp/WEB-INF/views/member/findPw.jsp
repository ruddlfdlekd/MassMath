<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	
	$("#btn").click(function(){	
		opener.parent.location.href = "./login";
		window.self.close();			
	});
	
});
</script>
</head>
<body>
	<section style="width:400px;height:400px;"> <label>${checkmsg}</label>
	<form action="./login" id="form">
		<div class="center-block" style="width: 100px; margin-top: 70px;">
			<input type="button" class="btn btn-default btn-sm" value="확인" id="btn"> 
		</div>

	</form>
	</section>
</body>
</html>