<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MY PAGE</title>
</head>
<body>
	<h1>My Page</h1>
	
	<p>ID : ${member.id}</p>
	<p>NAME : ${member.name}</p>
	<p>ADDRESS : ${member.address}</p>
	<p>GOAL : ${member.goal}</p>
	<p>BIRTH : ${member.birth}</p>
	<p>LEVEL : ${member.level_avg}</p>
	<p>PHONE : ${member.phone}</p>
	<p>JOIN DATE : ${member.join_date}</p>

	<p>
		<a href="./memberUpdate?id=${member.id}">UPDATE</a> 
		<a href="./memberDelete">DELETE</a>
	</p>

</body>
</html>