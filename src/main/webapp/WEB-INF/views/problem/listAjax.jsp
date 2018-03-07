<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$(function(){
		<c:if test="${not empty page.curPage}">
		var a = ${page.curPage};
				$(".badge").css({width:"", height:""});
				$("#p"+a).css({width:"30px", height:"25px"});	
		</c:if>
		
	});
</script>


			
	<div style="width:50%; margin : 0 auto;">
	 <div style="padding: 15px; padding-top:30px; width:870px; position: relative;">
	
	
			
	 <div class="container">
	 
		<c:if test="${empty dto}">
			<div>
				<h1>해당데이터없음<img alt="" src="/m1/resources/images/오류.jpg" style="width:10%; height:10%;"></h1>		
			</div>
		</c:if>
		
		<c:if test="${not empty dto}">
		
		<input type="hidden" value="${page.kind}">
		<input type="hidden" value="${page.search}">
		<table class="table table-hover" style="width:80%; height:800px;">
			<tr class="warning">
			 <td>Num</td>
			 <td>Contents</td>
			 <td>Book</td>
			 <td>Chapter</td>
			 <td>Chapter_m</td>
			 <td>Type</td>
			 <td>Percentage</td>
			</tr>
		<c:forEach items="${dto}" varStatus="view" >
			<tr class="td_search" title="${dto[view.index].pnum}" style="cursor: pointer">
				<td>${dto[view.index].pnum}</td>
				
				<td>
					<c:forEach items="${contents[view.index]}" var="a" varStatus="q">
						<c:if test="${q.index % 2 eq 0 }">
							${a}
						</c:if>
						<c:if test="${q.index % 2 eq 1}">
							<img src="http://latex.codecogs.com/gif.latex?${a}"/>
						</c:if>
					</c:forEach>
				</td>
				<td>${dto[view.index].book}</td>
				<td>${dto[view.index].chapter}</td>
				<td>${dto[view.index].chapter_m}</td>
				<td>${dto[view.index].type}</td>
				<fmt:formatNumber var="percent" value="${dto[view.index].percentage}" pattern=".00"/>
		
				<td>${percent}%</td>
				
			</tr>
		</c:forEach>
		</table>
		<div><button id="insert_p" class="btn btn-primary" style="float: left">Make Problem</button>
		<div style="padding-left:30%;">
			<c:if test="${dto.size() != 0}">
				<ul class="pager">
				<c:if test="${page.curBlock > 1}">
					<li><a href="#"><span class="page" title="${page.startNum-1}">이전</span></a></li>
				</c:if>
				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="n">
					<span class="page" title="${n}"><span class="badge" style="background-color: rgb(24, 167, 255);" id="p${n}" title="${n}">${n}</span></span>
				</c:forEach>
				<c:if test="${page.curBlock < page.totalBlock}">
					<li><a href="#"><span class="page" title="${page.lastNum+1}">다음</span></a></li>
				</c:if>	
				</ul>
			</c:if>		
		</div>
		</div>
		
		</c:if>
		</div>
	   </div>
	</div>
