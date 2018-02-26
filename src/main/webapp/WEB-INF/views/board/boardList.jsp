<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(function() {
		var message='${message}';
		if(message != ''){
			alert(message);
		}
				
		$(".page").click(function() {
			var cur=$(this).attr("title");
			document.frm.curPage.value=cur;
			document.frm.search.value='${page.search}';
			document.frm.kind.value='${page.kind}';
			document.frm.submit();
		});
	});
</script>
<style type="text/css">
	.page{
		cursor: pointer;
	}
</style>
</head>
<body>
	<h1>질문게시판</h1>

	<div>
		<form name="frm" action="./${board}List">
			<input type="hidden" name="curPage" value="1">
			<select name="kind">
				<option value="title">제목</option>
				<option value="writer">글쓴이</option>
				<option value="contents">내용</option>
			</select>
			<input type="text" name="search">
			<input id="btn" type="submit" value="SEARCH">
		</form>
	</div>

	<table class="table">
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>글쓴이</td>
			<td>내용</td>
			<td>날짜</td>
			<td>조회수</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.num}</td>
				<td>
					<c:catch>
						<c:forEach begin="1" end="${dto.depth}" var="i">
							-
						</c:forEach>
					</c:catch>
					<a href="${board}View?num=${dto.num}">${dto.title}</a>
				</td>
				<td>${dto.writer}</td>
				<td>${dto.contents }</td>
				<td>${dto.reg_date}</td>
				<td>${dto.hit}</td>				
			</tr>
		</c:forEach>
	</table>
	
	<div>
		<c:if test="${page.curBlock>1}">
			<span class="page" title="${page.startNum-1}">[이전]</span>
		</c:if>
		<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
			<span class="page" title="${i}">${i}</span>
		</c:forEach>
		<c:if test="${page.curBlock<page.totalBlock}">
			<span class="page" title="${page.lastNum+1}"> [다음] </span>
		</c:if>
	</div>
	
	<div>
		<a href="./${board}Write" >Write</a>
	
	</div>
	
</body>
</html>