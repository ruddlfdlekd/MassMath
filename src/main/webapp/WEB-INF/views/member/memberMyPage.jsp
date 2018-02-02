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
	<p>PHONE : ${member.phone}</p>

	<p>
		<a href="./memberUpdate?id=${member.id}">UPDATE</a> 
		<a href="./memberDelete">DELETE</a>
	</p>

</body>
</html>