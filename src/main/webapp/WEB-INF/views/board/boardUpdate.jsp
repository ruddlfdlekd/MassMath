<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>${board}Update</h1>
	<form action="./${board}Update" method="post">
		<input type="hidden" name="num" value="${view.num}">
		<p>Email : <input type="text" name="email" value="${view.email}"></p>
		<p>Title : <input type="text" name="title" value="${view.title}"></p>
		<p>Writer : <input type="text" name="writer" value="${view.writer}"></p>
		<p>contents : <textarea rows="" cols="" name="contents">${view.contents}</textarea></p>

		<button>Write</button>
	</form>
	
</body>
</html>