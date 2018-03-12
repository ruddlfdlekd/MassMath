<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/m1/resources/css/style.css">
</head>
<<<<<<< HEAD
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

	
</script>
=======
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

>>>>>>> master
<body>

<<<<<<< HEAD
<a href="pay/pay3">pay</a>
<a href="index/index3">index</a>
<a href="index/indexex">indexex</a>
<a href="qna/qnaList">Qna</a>


<P>  The time on the server is ${serverTime}. </P>
=======
<%@ include file="./temp/header.jsp"%>
   <a href="./member/login">login</a>
   <a href="./myNote/myNoteList?id=${member.id}">MY NOTE</a>
   <a href="./problem/test1">test</a>
	<a href="./notice/noticeList">Notice</a>
<button id="go_btn">GoList</button>
<button id="make_btn">GoMake</button>

>>>>>>> master
</body>
</html>
