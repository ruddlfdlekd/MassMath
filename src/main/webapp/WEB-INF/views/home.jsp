<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="/m1/resources/style.css">
	<style type="text/css">
		
	</style>
</head>
<body>
<h1>
	Hello world!  
</h1>
	<a href="./myNote/myNoteList?id=${member.id}">MY NOTE</a>
	
	<form action="./myNote/myNoteInsert" method="get">
		<p>id : <input type="text" name="id" value="jw"></p>
		<p>pnum : <input type="number" name="pnum" value="100"></p>
		<p>my_a : <input type="text" name="my_answer" value="4"></p>
		<p>reason : <input type="text" name="reason" value="miss"></p>
		<button>등록</button>
	</form>
	<form action="./myNote/myNoteInsert" method="get">
		<p>id : <input type="text" name="id" value="jw"></p>
		<p>pnum : <input type="number" name="pnum" value="200"></p>
		<p>my_a : <input type="text" name="my_answer" value="4"></p>
		<p>reason : <input type="text" name="reason" value="wrong"></p>
		<button>등록</button>
	</form>
<P>  The time on the server is ${serverTime}. </P>

<c:if test="${empty member}">
	<a href="./member/memberJoin">Join</a>
	<a href="./member/memberLogin">Login</a>
</c:if>
<c:if test="${not empty member}">
	<a href="./member/memberMyPage?id=${member.id}">My Page</a>
	<a href="./member/memberLogOut">Logout</a>
</c:if>


</body>
</html>
