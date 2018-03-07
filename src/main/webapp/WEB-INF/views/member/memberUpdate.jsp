<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="/m1/resources/css/join.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>UPDATE</title>
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
	
	$("#btn4").click(function() {
		if($("#pw").val() == $("#pw2").val() ){			
			if ($("#pw").val() && $("#pw2").val() && $("#name").val() && $("#goal").val() && $("#birth").val() && $("#phone").val() && $("#postal_code").val().length > 0) {
				frm.submit();
				alert("정보 수정 완료");
			} else {
				alert("필수입력사항을 입력해주세요");
			}
		}else{
			alert("비밀번호를 확인해주세요");
		}
	});
	
	
});

$(function() {
    $(".m_menu").mouseenter(function() {
       $(this).css("color", "white");
       $(this).css("font-weight", "normal");
       $(this).css("background-color", "black");
       var id = $(this).attr("id");
       $("." + id).slideToggle("slow");

       $(".m_menu").each(function() {
          var i = $(this).attr("id");
          if (id != i) {
             $("." + i).hide();

          }
          ;
       });
    });
    
 });


</script>
</head>
<body class="body_w">
<%@include file="../temp/header.jsp"%>

	<div class="sidenav">
	  <a href="#services"  class="m_menu" id="m1">서비스 관리</a>
		   <div class="s_menu m1">
		      <a href="#" id="s_m1">자주 하는 질문</a>
		   </div>
		      <div class="s_menu m1">
		      <a href="#" id="s_m2">1:1 상담</a>
		   </div> 
	  <a href="#clients" class="m_menu" id="m2">결제 관리</a>
		   <div class="s_menu m2">
		      <a href="#" id="s_m3">결제 내역</a>
		   </div>
		      <div class="s_menu m2">
		      <a href="#" id="s_m4">환불</a>
		   </div>
	  <a href="./memberMyPage?id=${member.id}" class="m_menu" id="m3">회원정보 관리</a>
		   <div class="s_menu m3">
		      <a href="./memberUpdate?id=${member.id}" id="s_m6">회원 정보 수정</a>
		   </div>
		      <div class="s_menu m3">
		      <a href="./memberDelete" id="s_m7">회원 탈퇴</a>
		   </div>
	</div>
<div class="update-center">

	<h2> Member Update</h2>

	<form id="frm" action="memberUpdate" method="post" name="frm">
	<p>ID : <input type="text" name="id" id="id" readonly="readonly" value="${member.id}"></p>
	<p class="p2">PW : <input type="password" name="pw" id="pw" value="${member.pw}"></p>
	<p class="p2">PW_CHECK : <input type="password" id="pw2"><p id="pwcheck2"></p>
	<p class="p2">NAME : <input type="text" name="name" id="name" value="${member.name}"></p>
	<p class="p2">ADDRESS :<input type="text" readonly="readonly" name="address" value="${member.address}"> <input type="button" value="주소 변경" id="nn" ><br>
				<input type="text" placeholder="우변번호" name="postal_code" id="postal_code" class="join_in"> <br>
				<input type="text" placeholder="도로명주소" name="street" id="street" class="join_in"><br>
				<input type="text" placeholder="나머지주소" name="street2" id="street2" class="join_in">
	</p>
	<p class="p2">GOAL : <select name="goal" id="goal">
				<script>
					for(i=1;i<101;i++){
						document.write("<option value="+i+">"+i+"</option>");
					}
				</script>	
			 </select>
	</p>
	<p class="p2">BIRTH : <input type="text" name="birth" id="birth" value="${member.birth}"></p>
	<p class="p2">PHONE : <input type="text" name="phone" id="phone" value="${member.phone}"></p>
	<p><input type="button" value="UPDATE" id="btn4"></p>
	</form>
</div>

<%@include file="../temp/footer.jsp"%>

</body>
</html>