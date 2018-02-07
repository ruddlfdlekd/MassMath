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
	
		<p>Email : ${view.email}</p>
		<p>Title : ${view.title}</p>
		<p>Writer : ${view.writer}</p>
		<p>contents : ${view.contents}</p>
		<p>hit : ${view.hit}</p>
	
		<a href="${board}Update?num=${view.num}">Update</a>
		<a href="${board}Delete?num=${view.num}">Delete</a>


</body>
</html>