<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
$(function() {
		$("#btn").click(function(){
			var v = <%= request.getParameter("chapter") %>;
			var level = $("#level").val();
			var type = $("#type").val();
			opener.location.href = "./studyCustom?chapter="+v+"&level="+level+"&type="+type;  
			window.close();
		});
});
</script>
</head>

<body>
<h1>현재등급</h1>
레벨선택
<select id = "level">
<option value="1">한단계위</option>
<option value="2">현재등급</option>
<option value="3">한단계아래</option>
</select>
<br>
유형선택
<select id = "type">
<option value="1">1유형</option>
<option value="2">2유형</option>
</select>
<br>
<button id="btn">확인</button>

</body>
</html>