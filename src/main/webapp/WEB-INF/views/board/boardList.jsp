<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		var curPage = '${page.curPage}';
		$(".pageli").each(function(){
			if(curPage == $(this).attr("id")){
				$(this).attr("class","active");
			}
		});
		
		var message = "${message}";
		if (message != "") {
			alert(message);
		}
		
		
		$(".i tr").mouseover(function(){
			$(this).attr("class","success");
		});
		$(".i tr").mouseout(function(){
			$(this).attr("class","");
		})
		
		$(".pagination li").click(function(){
			$(".pagination li").attr("class","");
			$(this).attr("class","active");
		});
		
		$(".page").click(function() {
			var cur = $(this).attr("title");
			document.frm.curPage.value = cur;
			document.frm.search.value = '${page.search}';
			document.frm.kind.value = '${page.kind}';
			document.frm.submit();
		});

	});
</script>
<style type="text/css">
.page {
	cursor: pointer;
}

</style>
</head>
	<%@ include file="../temp/header.jsp"%>
<body>
	
	<section style="width:100%; height:900px;">
	  <div class="container">
	  
		<div class="container-fluid text-center">
			<div class="jumbotron" style="background-color: white;"><h2>공지사항</h2></div>
			<div class="input-group" style="margin-left: 55%">
				<form name="frm" action="./noticeList">
					<input type="hidden" name="curPage" id="curPage" value="1">
					<a href="./noticeList"><img alt="" src="../resources/images/logo.png"></a>
					<select name="kind" style="width:15%; height:20%">
						<option value="title">TITLE</option>
						<option value="writer">WRITER</option>
						<option value="contents">CONTENTS</option>
					</select> 
				 <input type="text" name="search" placeholder="검색">
					<button id="btn" class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
				</form>
				</div>
			
			
		<div class="container">
			<div class="table-responsive">
			<table class="table">
				<tr>
					<td>NUM</td>
					<td>TITLE</td>
					<td>WRITER</td>
					<td>DATE</td>
					<td>HIT</td>
				</tr>
				<tbody>
				<c:forEach items="${top}" var="ar2">
				  <tr class="info">
						<td><span>공지</span></td>
						<td><a href="noticeView?num=${ar2.num}">${ar2.title}</a> <c:if test="${today eq ar2.reg_date}">
							<span class="label label-danger" style="margin-left: 50px;">new</span>
						</c:if> </td>
						<td>${ar2.writer}</td>
						<td>${ar2.reg_date}</td>
						<td>${ar2.hit}</td>
					</tr>
				</c:forEach>
				<c:forEach items="${list}" var="dto">
				 <div class="i">
					<tr>
						<td>${dto.num}</td>
						<td><a href="noticeView?num=${dto.num}">${dto.title}</a> <c:if test="${today eq dto.reg_date}">
							<span class="label label-danger" style="margin-left: 50px;">new</span>
						</c:if> </td>
						<td>${dto.writer}</td>
						<td>${dto.reg_date}</td>
						<td>${dto.hit}</td>
					</tr>
				 </div>
				</c:forEach>				
				</tbody>
			</table>
			</div>
		</div>
			<div>
			<c:if test="${dto.size() == 0}">
			<h4>찾으실 내용이 없습니다.</h4>	
			</c:if>
			<c:if test="${dto.size() != 0}">
			  <ul class="pager">
				<c:if test="${page.curBlock > 1}">
					<li><a href="#"><span class="page" title="${page.startNum-1}">이전</span></a></li>
				</c:if>			  
			  </ul>
				<ul class="pagination">
					<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
						<li class="pageli" id="${i}"><span class="page" title="${i}">${i}</span></li>
					</c:forEach>				
				</ul>
				<c:if test="${page.curBlock < page.totalBlock}">
					<li><a href="#"><span class="page" title="${page.lastNum+1}">다음</span></a></li>
				</c:if>			
			</c:if>
			</div>
			<div>
			 <c:if test="${member.id eq 'admin@admin'}">
				<a class="btn btn-default" href="noticeWrite">글등록</a>			 
			 </c:if>
			</div>
		</div>
	  </div>
	</section>
<%@ include file="../temp/footer.jsp"%>
</body>
</html>