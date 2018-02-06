<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JOIN</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#id").keyup(function() {
			var id = $(this).val();
			$.ajax({
				url : "./memberIdCheck",
				type : "GET",
				data : {
					id : id
				},
				success : function(data) {
					if($.trim(data) == "사용 가능한 ID 입니다."){
						$("#result").css('color', 'blue');
					}else{
						$("#result").css('color', 'red');
					}
					$("#result").html(data);
				}
						
			});						
			
		});
		
		$("#pw").keyup(function() {
			if ($("#pw").val().length > 7) {
				$("#pwcheck").text("사용가능한 비밀번호 입니다");
			} else {
				$("#pwcheck").text("비밀번호는 8자리 이상이여야 합니다");
			}
		});
		
		$("#pw2").keyup(function() {
			if ($("#pw").val() == $("#pw2").val()) {
				$("#pwcheck2").text("비밀번호가 일치합니다");
			} else {
				$("#pwcheck2").text("비밀번호가 일치 하지 않습니다");
			}
		});
		
		$("#nn").click(function() {
			//var addr = document.frm.addr.value;
			window.open("./memberAddrSearch", "", "toolbar=yes,scrollbars=yes,resizable=yes,top=300,left=750,width=400,height=400");
		});
		
		$("#btn").click(function() {
			if(email==$("#email").val() && $("#check").val()=="t"){
		  		alert($("#email").val());
		  		alert(email);
			}else{
				alert("이메일 인증을 다시 해주세요.");
			} 		
			if ($("#id").val() && $("#pw").val() && $("#pw2").val() && $("#name").val() && $("#goal").val() && $("#birth").val() && $("#phone").val() && $("#postal_code").val().length > 0) {
				frm.submit();
				alert("회원가입 완료");
			} else {
				alert("필수입력사항을 입력해주세요");
			}
		});
		var email="";
  		$("#btn2").click(function(){
  			email = $("#email input").val();
  			window.open("./sendMail?id="+$("#email input").val(),"","top=300, left=750, width=410, height=450");
  		});
		
	});


</script>
</head>
<body>
	<h1> Member Join </h1>
	
	<form action="./memberJoin" method="post" name="frm">
	

	<div id="email">
		<label>이메일:</label> 
   		<input type="text" name="email" placeholder="필수항목">
		<span class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
    </div>
    	<input type="button" value="인증번호 발급" id="btn2">

	<div id="result"></div>
	
	<p>PW : <input type="text" name="check" id="check" value="f">
	
	<p>PW : <input type="password" name="pw" id="pw"><p id="pwcheck"></p>
	<p>PW_CHECK : <input type="password" id="pw2"><p id="pwcheck2"></p>
	<p>NAME : <input type="text" name="name" id="name"></p>
	<p>ADDRESS : <input type="text" placeholder="우변번호" name="postal_code" id="postal_code" class="join_in"> <input type="button" value="우편번호 찾기" id="nn" class="btn btn-default"><br>
				<input type="text" placeholder="도로명주소" name="street" id="street" class="join_in"><br>
				<input type="text" placeholder="나머지주소" name="street2" id="street2" class="join_in">
	</p>
	<p>GOAL : <input type="text" name="goal" id="goal"></p>
	<p>BIRTH : <input type="date" name="birth" id="birth"></p>
	<p>PHONE : <input type="text" name="phone" id="phone"></p>
	<input type="hidden" name="auto_payment" value="0">	 <!-- 0이면 X, 1이면 O -->
	<p><input type="button" id="btn" value="JOIN"></p>	
	</form>
	
</body>
</html>