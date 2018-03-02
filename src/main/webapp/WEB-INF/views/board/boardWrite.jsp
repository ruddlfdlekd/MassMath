<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
 	$("#btn").click(function(){
 		if($("#title").val().length<0){
 			alert("title insert");
 		}
 		$("#frm").submit();
 	})
 	
	

});
</script>
<style type="text/css">

</style>
</head>
<body>

	<h1>${board}Write</h1>
	<form action="./${board}Write" method="post" id="frm">
		<p>Email : <input type="text" name="email"></p>
		<p>Title : <input type="text" name="title" id="title" placeholder="Title Insert"></p>
		<p>Writer : <input type="text" name="writer" id="writer"></p>
		<p>contents : <textarea rows="" cols="" name="contents" id="contents"></textarea></p>
		
		<input type="button" value="Write" id="btn">
	</form>
	

</body>
</html>