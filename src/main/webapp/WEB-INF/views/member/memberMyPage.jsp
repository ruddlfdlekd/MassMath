<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MY PAGE</title>
<link href="/m1/resources/join.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$("#nn").click(function() {
			window.open("../problem/result2","","top=100px, left=200px, width=600px, heigth=600px");
		});
	});
</script>
</head>
<body>

<div class="mypage-center">
	<h2>My Page</h2>
	<div class="info">
		<p class="p">ID : ${member.id}</p>
		<p class="p">NAME : ${member.name}</p>
		<p class="p">ADDRESS : ${member.address}</p>
		<p class="p">GOAL : ${member.goal}</p>
		<p class="p">BIRTH : ${member.birth}</p>
		<p class="p">LEVEL : ${member.level_avg}</p>
		<p class="p">PHONE : ${member.phone}</p>
		<p class="p">JOIN DATE : ${member.join_date}</p>
	
		<p>
		<c:if test="${member.pw eq 'kakao' }">
			<a href="./apiMemberUpdate?id=${member.id}" class="btn3">UPDATE</a> 
		</c:if>
			<a href="./memberUpdate?id=${member.id}" class="btn3">UPDATE</a> 
			<a href="./memberDelete" class="btn3">DELETE</a>
		</p>
		<input type="button" value="문제 추가" id="nn" class="btn3">	
	</div>
</div>
</body>
</html>