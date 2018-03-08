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
			var rate = $("#level").val();
			opener.location.href = "./studyTest?chapter="+v+"&rate="+rate;  
			window.close();
		});
});
</script>
</head>

<body>
<h1>현재등급</h1>
레벨선택
<select id = "level">
<option value="A">A(정답률0~20%)</option>
<option value="B">B(정답률20~40%)</option>
<option value="C">C(정답률40~60%)</option>
<option value="D">D(정답률60~80%)</option>
<option value="E">E(정답률80~100%)</option>
</select>
<p>(전에 풀던 문제가 있으면 등급에 상관없이 자동으로 가져옴)</p>
<button id="btn">확인</button>

</body>
</html>