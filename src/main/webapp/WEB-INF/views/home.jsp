<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="/m1/resources/style.css">
	<link rel="stylesheet" href="/math/resources/join.css">
	<style type="text/css">
	</style>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
  $(function(){
      $("#go_btn").click(function(){
            
         location.href="./problem/problemList";
      })
      
      $("#make_btn").click(function(){
         window.open("./problem/makeProblem","","top=100px, left=200px, width=900px, heigth=600px");         
      })
   });
  </script>

<body>
<%@ include file="./temp/header.jsp"%>
<h1>
   Hello world!  
</h1>
   <a href="./myNote/myNoteList?id=${member.id}">MY NOTE</a>
   <%@ include file="./temp/footer.jsp"%>
</body>
</html>