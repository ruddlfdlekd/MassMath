<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>NUM</th>
					<th>Type</th>
					<th>Chapter</th>
					<th>RightCount</th>
					<th>Answer</th>
					<th>AnswerList</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${problem.pnum}</td>
					<td>${problem.type}</td>
					<td>${problem.chapter}</td>
					<td>${problem.rightCount}</td>
					<td>${problem.answer}</td>
					<td>
						<c:forEach items="${answerList}" begin="0"
					end="${answerList.size()}" var="i" varStatus="y">
					${y.index+1}번 &nbsp; &nbsp;&nbsp;&nbsp;<img src="http://latex.codecogs.com/gif.latex?${i}" />&nbsp; &nbsp;&nbsp;&nbsp;
					
				</c:forEach>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="container">
		<div>
			<c:forEach begin="0" end="${contents.size()}" items="${contents}"
				var="i" varStatus="index">
				<c:if test="${index.index % 2 eq 0}">
				${i}
			</c:if>
				<c:if test="${index.index % 2 eq 1}">
					<img src="http://latex.codecogs.com/gif.latex?\large&space;${i}" />
				</c:if>
			</c:forEach>
			
		</div>
		<hr>

	<h2>해설</h2>
		<div>
			<c:forEach begin="0" end="${commentary.size()}" items="${commentary}"
				var="i" varStatus="index">
				<c:if test="${index.index % 2 eq 0}">
				${i}
			</c:if>
				<c:if test="${index.index % 2 eq 1}">
					<img src="http://latex.codecogs.com/gif.latex?\large&space;${i}" />
				</c:if>
			</c:forEach>
		</div>
			<div class="container" style="margin-left: 500px; margin-top: 50px; padding: 10px;">
				
				<button class="btn btn-primary" id="update"
					style="width: 100px; height: 30px">update</button>
				<button class="btn btn-danger" id="delete"
					style="width: 100px; height: 30px; margin-left: 30px;">delete</button>
			</div>

	</div>


</div>



<input type="hidden" id="pnum" name="pnum" value="${problem.pnum}">
<input type="hidden" id="type" name="type" value="${problem.type}">
<input type="hidden" id="rightCount" name="rightCount"
	value="${problem.rightCount}">
<input type="hidden" id="chapter" name="chapter"
	value="${problem.chapter}">
<input type="hidden" id="contents" name="contents"
	value="${problem.contents}">
<input type="hidden" id="answer" name="answer" value="${problem.answer}">
<input type="hidden" id="answerlist" name="answerlist"
	value="${problem.answerlist}">
<input type="hidden" id="chapter_m" name="chapter_m"
	value="${problem.chapter_m}">
<input type="hidden" id="commentary" name="commentary"
	value="${problem.commentary}">

