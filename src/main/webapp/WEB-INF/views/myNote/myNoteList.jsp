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
	$("#btn").click(function(){
		var id = $("#id").val();
		
		var reason = $("input[class=reason]:checked").val();
		alert(reason);

		var books = [];
		$("input[class=book]:checked").each(function(){
			books.push($(this).val());
		});
		/* 배열의 길이가 0이면 전체 값을 다 넣어준다.	 */
		if(books.length == 0){
			books = ['b1', 'b2', 'b3', 'b4', 'b5', 'b6', 'b7'];
		}
		alert(books);

 		var data={id:id, books:books, reason:reason};
		var values = [];
 		$.ajax({
 			type: "GET",
 			url: "../myNote/myNoteFilter",
 			data: data,
 			success: function(data){
 				alert("완료");
 				alert(data);
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
		$("#commentary"+$(this).val()).toggle();
	});
	
	//질문하기
	
	
	
	
	
});


</script>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	
	<div class="container">
    <div class="row">
        <div class="col-md-3">
        	<h4 class="text-center"><b>필터 적용</b></h4>
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
						<label><input name="book" class="book" id="b1" type="checkbox" value="b1">고등수학(상)</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b2" type="checkbox" value="b2">고등수학(하)</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b3" type="checkbox" value="b3">수학 1</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b4" type="checkbox" value="b4">수학 2</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b5" type="checkbox" value="b5">미적분</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b6" type="checkbox" value="b6">확률</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b7" type="checkbox" value="b7">통계</label>
					</div>
					<div class="text-center" style="margin-top: 20px;">
						<input class="btn btn-default center" type="button" id="btn" value="적용하기">
					</div>
            </div>
        </div>
        <div class="col-md-9">
        	<div id="myNoteList">
				<c:forEach items="${result}" var="list">
					<div id="del${list.num}" class="listcount">
						<table class="table" style="width:100%; margin: 0 auto;">
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
			</div>
        </div>
    </div>
</div>
	
	<!-- 필터 -->

<!-- 	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-2">
			<div class="pull-left" style="width:100%; padding: 30px 40px; background-color: white; border: 1px solid black">

					<h4 class="text-center"><b>종류 선택</b></h4><br>
					<p><input type="hidden" id="id" name="id" value="${member.id}"></p>
					<p><input type="radio" class="reason" name="reason" autocomplete="off" value="all" checked="checked">전체</p>
					<p><input type="radio" class="reason" name="reason" autocomplete="off" value="wrong">모르는 문제</p>
					<p><input type="radio" class="reason" name="reason" autocomplete="off" value="miss">실수한 문제</p>
					<hr>
					<h4 class="text-center"><b>책 선택</b></h4><br>
					<div >
						<label><input name="book" class="book" id="b1" type="checkbox" value="b1">고등수학(상)</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b2" type="checkbox" value="b2">고등수학(하)</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b3" type="checkbox" value="b3">수학 1</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b4" type="checkbox" value="b4">수학 2</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b5" type="checkbox" value="b5">미적분</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b6" type="checkbox" value="b6">확률</label>
					</div>
					<div>
						<label><input name="book" class="book" id="b7" type="checkbox" value="b7">통계</label>
					</div>
					<div class="text-center" style="margin-top: 20px;">
						<input class="btn btn-default center" type="button" id="btn" value="적용하기">
					</div>
				</form>
			</div>
		</div>
		<div class="col-md-6">
			
		</div>
		<div class="col-md-2"></div>
	</div> -->
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>