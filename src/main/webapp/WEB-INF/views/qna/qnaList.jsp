<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".page").click(function() {
		var cur=$(this).attr("title");
		document.frm.curPage.value=cur;
		document.frm.search.value='${page.search}';
		document.frm.kind.value='${page.kind}';
		document.frm.submit();
	});
})
</script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../temp/header.jsp"%>
<div class="container">
	<div class="btn-group pull-right">
		<button type="button" class="btn btn-primary">전체글</button>
		<button type="button" class="btn btn-primary">내 글</button>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th>NO</th>
				<th>제목</th>
				<th>이름</th>
				<th>날짜</th>
				<th>조회수</th>
				<th>답변</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.num}</td>
					<td><a href="${board}View?num=${dto.num}"> ${dto.title}</a></td>
					<td>${dto.writer}</td>
					<td>${dto.reg_date}</td>
					<td>${dto.hit}</td>
					<td>${dto.replyCount}개</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<form name="frm" style="float:right;" action="qnaList">
			<input type="hidden" name="curPage" value="1">
			<select name="kind">
				<option value="title">TITLE</option>
				<option value="writer">WRITER</option>
				<option value="contents">CONTENTS</option>
			</select>
			<input type="text" name="search">
			<input id="btn" type="submit" value="SEARCH">
		</form>
		<div>
			<a class="btn btn-primary" href="qnaWrite">글쓰기</a> 
		</div>
	</div>
	<div class="text-center">
		<ul class="pagination" style="cursor:pointer;">
		<c:if test="${page.curBlock >1}">
			<li><span class="page" title="${page.startNum-1}">이전</span></li>
		</c:if>
		<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
			<li><span class="page" title="${i}">${i}</span></li>
		</c:forEach>
		<c:if test="${page.curBlock < page.totalBlock}">
			<li><span class="page" title="${page.lastNum+1}">다음</span></li>
		</c:if>
		</ul>
	</div>
</div>
<%@ include file="../temp/footer.jsp"%>
</body>
</html>