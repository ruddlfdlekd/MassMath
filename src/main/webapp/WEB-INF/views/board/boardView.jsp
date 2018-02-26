<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
		var contents=$("#contents").val();//댓글내용
		var num=${view.num};//게시물번호
		var param ={contents:contents,num:num};
		
	$.ajax({
		type:"post",
		url:"./qna/qnaView",
		data:param,
		success:function(data){
      		
		}
	});
	
	$.post("./ReplyInsert2",param,function(data){
		alert(data.trim());
	});
	
	$("#btnReply").click(function(){
		if($("#contents").val().length == 0){
			alert("내용이없습니다.")
		}else{
		frm.submit();			
		}
	});
});
	
</script>
</head>
<body>
	<h1>${board} View</h1>

	<h1>Title : ${view.title}</h1>
	<h1>Contents : ${view.contents}</h1>
	
	<!-- 첨부파일 a 태그 사용 -->
	<c:forEach items="${files}" var="file">
		<a href="../file/fileDown?fname=${file.fname}&oname=${file.oname}">${file.oname}</a>
	</c:forEach>	
	<img src="../resources/images/아이유.PNG">
	
	
	<a href="${board}Update?num=${view.num}">Update</a>
	<a href="${board}Delete?num=${view.num}">Delete</a>
	
	<!-- 댓글 작성 -->
	<form name="frm" action="ReplyInsert2" method="get">
	<input type="hidden" name="num" value="${view.num}">
	<div style="width:700px; text-align: center;">
	<textarea rows="5" cols="80" id="contents" name="contents" placeholder="댓글을 작성하세요"></textarea>
	<br>
	<input type="button" id="btnReply" value="댓글쓰기">
	</div>	
	</form>
	<div id="result"></div>
</body>
</html>