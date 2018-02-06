<%@page import="com.math.member.MyAuthentication"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>인증확인</title>
<script type="text/javascript">
$(function(){
	$("#un").popover();
	
	$("#btn").click(function(){
		
		if(${number}==$("#un").val()){
			alert("성공");
			$("#form").submit();
			window.opener.document.frm.email.value = "${email}";
			window.opener.document.frm.check.value = "t";
			window.self.close();	
						
		}else{
			window.opener.document.frm.check.value = "f";
			alert("실패");
			
		}
		
	});
	
});
</script>
</head>
<body>
	<section style="width:400px;height:400px;"> <label>${checkmsg}</label>
	<h3>${number}</h3>
	<form action="./memberJoin" id="form">
		<div class="center-block" style="margin-top: 20px; margin-left: 80px;">
			<input type="text" id="un" class="form-control" data-toggle="popover"
				data-content="발급된 인증번호를 입력해주세요." data-placement="bottom"
				style="width: 200px;">
		</div>
		<div class="center-block" style="width: 100px; margin-top: 70px;">
			<input type="button" class="btn btn-default btn-sm" value="인증확인" id="btn"> 
		</div>
		<input type="hidden" value="${email}" name="email"> 
		<input type="hidden" value="t" name="check">
	</form>
	</section>
</body>
</html>