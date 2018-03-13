<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.searchlist{
	border: 1px solid red;
}
</style>
				<c:forEach items="${result}" var="list" varStatus="i">
					<div id="del${list.num}" class="listcount">
						<table class="table" style="width:100%; margin: 0 auto;">
							<thead>
								<tr>
									<th>${list.num}번</th>
									<th>${list.chapter_name}</th>
									<th>${list.chapter_m_name}</th>
									<th>${list.reg_date}</th>
									<th>${list.reason}</th>
									<th style="text-align: right">
										<button type="button" class="btn btn-danger btn-sm del" value="${list.num}">삭제하기<span class="glyphicon glyphicon-remove"></span></button>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2">
									<h4>문제</h4><br>
									</td>
									<td colspan="4">
									<c:forEach items="${con[i.index]}" var="contents" varStatus="v">
										<c:if test="${v.index % 2 eq 0 }">
													${contents}
												</c:if>
											<c:if test="${v.index % 2 eq 1}">
												<img src="http://latex.codecogs.com/gif.latex?${contents}"/>
											</c:if>
									</c:forEach>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="border-top-color: white;">
										<h4>보기</h4>
									</td>
									<td colspan="4" style="border-top-color: white;">
									<c:forEach items="${list.answerlist.split(',')}" var="answerlist" varStatus="a">
										 ${a.index+1}번<span style="margin-left: 30px"><img src="http://latex.codecogs.com/gif.latex?${answerlist}"/></span><br>
									</c:forEach>
									</td>
								</tr>
								<tr>
									<td colspan="6" style="text-align: center;">
										<button type="button" class="btn btn-primary btn-sm" id="checkAnswer" value="${list.num}">정답 확인</button>
										<button type="button" class="btn btn-default btn-sm" value="${list.num}">질문 하기</button>
									</td>
								</tr>
								<tr class="commentary${list.num}" style="display: none;">
									<td colspan="2"><h4>정답</h4></td>
									<td colspan="4">
										<h5><b>${list.answer}</b></h5>
									</td>
								</tr>
								<tr class="commentary${list.num}" style="display: none;">
									<td colspan="2" style="border-top-color: white;">
										<h4>해설</h4>
									</td>
									<td colspan="4" style="border-top-color: white;">	
										<c:forEach items="${com[i.index]}" var="commentary" varStatus="s">
										<c:if test="${s.index % 2 eq 0 }">
													${commentary}
												</c:if>
											<c:if test="${s.index % 2 eq 1}">
												<img src="http://latex.codecogs.com/gif.latex?${commentary}"/>
											</c:if>
									</c:forEach>
									</td>
								</tr>
							</tbody>
						</table>
						<br>
						<hr>
						<br>
					</div>
				</c:forEach>