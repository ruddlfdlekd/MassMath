<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="/m1/resources/css/join.css" rel="stylesheet">
<title>UPDATE</title>
<script type="text/javascript">
$(function() {

	$("#btn4").click(function() {
		$("#frm").submit();	
	});
});

$(function() {
	
	$("#nn").click(function() {
		//var addr = document.frm.addr.value;
		window.open("./memberAddrSearch", "", "toolbar=yes,scrollbars=yes,resizable=yes,top=300,left=750,width=400,height=400");	
	});
	
	$("#btn4").click(function() {
			
			if ($("#name").val() && $("#goal").val() && $("#birth").val() && $("#phone").val() && $("#postal_code").val().length > 0) {
				frm.submit();
				alert("정보수정 완료");
			} else {
				alert("필수입력사항을 입력해주세요");
			}
		
	});
	
	
});


</script>
</head>
<body>

<div class="update-center">
	<h1> Member Update</h1>

	<form id="frm" action="memberUpdate" method="post" name="frm">
	<p>ID : <input type="text" name="id" id="id" readonly="readonly" value="${member.id}">${member.id}</p>
	<p class="p">PW : <input type="hidden" name="pw" id="pw" value="${member.pw}"></p>
	<p class="p">NAME : <input type="text" name="name" id="name" value="${member.name}"></p>
	<p class="p">ADDRESS :<input type="text" readonly="readonly" name="address" value="${member.address}"> <input type="button" value="주소 변경" id="nn" class="btn btn-default"><br>
				<input type="text" placeholder="우변번호" name="postal_code" id="postal_code" class="join_in"> <br>
				<input type="text" placeholder="도로명주소" name="street" id="street" class="join_in"><br>
				<input type="text" placeholder="나머지주소" name="street2" id="street2" class="join_in">
	</p>
	<p class="p">GOAL : <select name="goal" id="goal">
				<script>
					for(i=1;i<101;i++){
						document.write("<option value="+i+">"+i+"</option>");
					}
				</script>	
			 </select>
	</p>
	<p class="p">BIRTH : <input type="date" name="birth" id="birth" value="${member.birth}"></p>
	<p class="p">PHONE : <input type="text" name="phone" id="phone" value="${member.phone}"></p>
	<p><input type="button" value="UPDATE" id="btn4"></p>
	</form>
</div>
</body>
</html>