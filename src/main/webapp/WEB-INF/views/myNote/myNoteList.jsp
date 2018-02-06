<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<h1>MyNote</h1>
	
	<c:forEach items="${note}" var="list">
	<div style="border: 1px black solid;">
		<p>id : ${list.id} </p>
		<p>pnum : ${list.pnum}</p>
		<p>reason : ${list.reason}</p>
		<a href="#">정답보기(경일)</a>
		<a href="myNoteDelete?pnum=${list.pnum}&id=${list.id}">문제 삭제</a>
	</div>
	</c:forEach>
</body>
</html>