<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>${board}Write</h1>
	<form action="./${board}Write" method="post">
		<p>Email : <input type="text" name="email"></p>
		<p>Title : <input type="text" name="title"></p>
		<p>Writer : <input type="text" name="writer"></p>
		<p>Fname : <input type="text" name="fname"></p>
		<p>contents : <textarea rows="" cols="" name="contents"></textarea></p>
		<p><input type="button" value="FileAdd" id="btn"></p>
		<div id="result">
		</div>	
		
		<button>Write</button>
	</form>

</body>
</html>