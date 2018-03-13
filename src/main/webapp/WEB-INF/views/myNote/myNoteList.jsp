<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>mynoteList</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">

</style>
<script type="text/javascript">

$(function (){

	
	var curPage = 1;
	<c:if test="${empty member}">
	alert("로그인을 해주세요.");
	location.href="/m1/member/memberLogin";
	</c:if>
	
	$("#btn").click(function getFilterList(){
		var id = $("#id").val();
		var reason = $("input[class=reason]:checked").val();
	
		var books = [];
		$("input[class=book]:checked").each(function(){
			books.push($(this).val());
		});
		/* 배열의 길이가 0이면 전체 값을 다 넣어준다.	 */
		if(books.length == 0){
			books = ['1', '2', '3', '4', '5', '6', '7'];
		}
 		var data={id:id, books:books, reason:reason, curPage:curPage};
		var values = [];
 		$.ajax({
 			type: "GET",
 			url: "../myNote/myNoteFilter",
 			data: data,
 			success: function(data){
 				alert("완료");
 				$("#myNoteList").html(data);
 			}
 		});
	});
	
	
	
	//삭제 ajax처리
	$("#myNoteList").on("click", ".del", function () {
		var result = confirm("선택하신 문제를 삭제하시겠습니까?");
		
		if(result){
			alert($("#id").val());
			alert($(this).val());
			var id = $("#id").val();
			var num = $(this).val();
			$("#del"+num).remove(); //삭제 버튼을 가지고 있는 container 삭제
			$.ajax({
				type: "GET",
				url: "myNoteDelete", 
				data: {num:num, id:id},
				success: function(data){
					data.trim();
					if(data==1)
						alert("문제가 삭제되었습니다");
					else
						alert("삭제 실패")
				}
			});
		}
		
	});
	
	//정답확인
	$("#myNoteList").on("click", "#checkAnswer", function(){
		$(".commentary"+$(this).val()).toggle();
	});
	
	//질문하기
	
	
	
	
	
});


</script>
</head>
<body>


<%@ include file="../temp/header.jsp"%>
<%@ include file="../temp/scroll.jsp"%>
	
<div class="container">
    <div class="row">
        <div class="col-md-3">
        	<h4 class="text-center"><b>필터</b></h4>
            <div id="sidebar" class="well sidebar-nav">
                <h4>
                    <small><b>종류 선택</b></small>
                </h4>
                <p><input type="hidden" id="id" name="id" value="${member.id}"></p>
				<p><input type="radio" class="reason" name="reason" autocomplete="off" value="all" checked="checked">전체</p>
				<p><input type="radio" class="reason" name="reason" autocomplete="off" value="wrong">모르는 문제</p>
				<p><input type="radio" class="reason" name="reason" autocomplete="off" value="miss">실수한 문제</p>
				<hr>
				<h4><small><b>책 선택</b></small></h4><br>
					<div >
						<label><input name="book" class="book" id="b1" type="checkbox" value="1">고등수학(상)</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b2" type="checkbox" value="2">고등수학(하)</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b3" type="checkbox" value="3">수학 1</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b4" type="checkbox" value="4">수학 2</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b5" type="checkbox" value="5">미적분</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b6" type="checkbox" value="6">확률</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b7" type="checkbox" value="7">통계</label>
					</div>
					<div class="text-center" style="margin-top: 20px;">
						<input class="btn btn-default center" type="button" id="btn" value="적용하기">
					</div>
            </div>
        </div>
		<div class="col-md-9">
			<div id="myNoteList">
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
			</div>
        </div>
    </div>
</div>
<%@ include file="../temp/footer.jsp"%>
</body>
</html>