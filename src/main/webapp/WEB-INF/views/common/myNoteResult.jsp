<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.searchlist{
	border: 1px solid red;
}
</style>
<c:forEach items="${result}" var="list">
	<div class="container" id="del${list.num}">
		<table class="table" style="width:60%; margin: 0 auto;">
			<thead>
				<tr>
					<th>${list.num}(num)</th>
					<th>${list.chapter}(단원)</th>
					<th>${list.chapter_m}(중단원)</th>
					<th>${list.reg_date}</th>
					<th>${list.reason}</th>
					<th style="text-align: right">
						<button type="button" class="btn btn-danger btn-sm del" value="${list.num}">삭제하기<span class="glyphicon glyphicon-remove"></span></button>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="6">
					문제${list.contents }<br>
					내용내용내용내용
					내용내용내용내용내용내용내용내용내용내용내용내용
					내용내용내용내용내용내용내용내용내용내용내용내용
					내용내용내용내용내용내용내용내용내용내용내용내용
					내용내용내용내용내용내용내용내용내용내용내용내용
					내용내용내용내용내용내용내용내용내용내용내용내용
					내용내용내용내용내용내용내용내용내용내용내용내용
					내용내용내용내용내용내용내용내용내용내용내용내용
					<br>
					보기 : <br>
					1<br>
					2<br>
					3<br>
					4<br>
					5<br>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="text-align: center;">
						<button type="button" class="btn btn-primary btn-sm" id="checkAnswer" value="${list.num}">정답 확인</button>
						<button type="button" class="btn btn-default btn-sm" value="${list.num}">질문 하기</button>
					</td>
				</tr>
					<tr id="commentary${list.num}" style="display: none">
						<td colspan="6">
							해설<br>${list.commentary}
						</td>
					</tr>				
			</tbody>
		</table>
		<br>
		<hr>
		<br>
	</div>
</c:forEach>