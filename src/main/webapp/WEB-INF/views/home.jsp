<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
</head>
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
  });
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
  $(function(){
		$("#go_btn").click(function(){
			window.open("./problem/result","","top=100px, left=200px, width=900px, height=400px");
		})
		
		$("#make_btn").click(function(){
			window.open("./problem/result2","","top=100px, left=200px, width=600px, heigth=600px");			
		})
	});
  </script>

<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="./problem/test">test</a>
<a href="./notice/noticeList">Notice</a>
<a href="./qna/qnaList">Qna</a>
<button id="go_btn">GoList</button>
<button id="make_btn">GoMake</button>
<a href="./problem/result2">Make Problem<a>
<a href="./problem/problemView">select One</a>

 <div>
 


 </div>



</body>
</html>
