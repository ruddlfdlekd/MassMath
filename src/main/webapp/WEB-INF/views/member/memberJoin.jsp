<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JOIN</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="/m1/resources/css/join.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript">
	$(function() {
		var email="";
		var data2="";
		
		
		   //약관 동의
	      $("#all_check").click(function() {
	         if ($(this).prop("checked")) {
	            $(".box").prop("checked", true);
	         } else {
	            $(".box").prop("checked", false);
	         }
	      });
	      $(".box").click(function() {
	            if ($("#c1").prop("checked") && $("#c2").prop("checked")
	                  && $("#c3").prop("checked")) {
	               $("#all_check").prop("checked", true);
	            } else {
	               $("#all_check").prop("checked", false);
	            }
	      });
	      
	      //약관 동의서 보기
	      var check = true;
	      $("#ser_1").click(function() {
	         if (check) {
	            $("#ser_1").text("닫기▲");
	            $(".see1").css("margin", "10px");
	            check = false;
	         } else {
	            $("#ser_1").text("보기▼");
	            check = true;
	         }
	         $(".see1").slideToggle("slow");
	      });

	      var check2 = true;
	      $("#ser_2").click(function() {
	         if (check2) {
	            $("#ser_2").text("닫기▲");
	            $(".see2").css("margin", "10px");
	            check2 = false;
	         } else {
	            $("#ser_2").text("보기▼");
	            check2 = true;
	         }
	         $(".see2").slideToggle("slow");
	      });
		
		$("#id").change(function() {
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
					data2=$.trim(data);
				}
						
			});						
			
		});
		
		$("#pw").keyup(function() {
			if ($("#pw").val().length > 7) {
				$("#pwcheck").text("사용가능한 비밀번호 입니다");
				$("#pwCheck").val("1");
			} else {
				$("#pwcheck").text("비밀번호는 8자리 이상이여야 합니다");
				$("#pwCheck").val("2");
			}
		});
		
		$("#pw2").keyup(function() {
			if ($("#pw").val() == $("#pw2").val()) {
				if($("#pw").val().length > 7){
					$("#pwcheck2").text("비밀번호가 일치합니다");
					$("#pwCheck").val("1");
				}
				
			} else {
				$("#pwcheck2").text("비밀번호가 일치 하지 않습니다");
				$("#pwCheck").val("2");
			}
		});
		if($("#pw").val().length < 8){
			$("#pwCheck").val("2");
		}else{
			$("#pwCheck").val("1");
		}
		
		$("#nn").click(function() {
			new daum.Postcode({
	               oncomplete: function(data) {
	                   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                   // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                   var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                   var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	                   // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                   // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                       extraRoadAddr += data.bname;
	                   }
	                   // 건물명이 있고, 공동주택일 경우 추가한다.
	                   if(data.buildingName !== '' && data.apartment === 'Y'){
	                      extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                   }
	                   // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                   if(extraRoadAddr !== ''){
	                       extraRoadAddr = ' (' + extraRoadAddr + ')';
	                   }
	                   // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                   if(fullRoadAddr !== ''){
	                       fullRoadAddr += extraRoadAddr;
	                   }

	                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                   $('#postal_code').val(data.zonecode); //5자리 새우편번호 사용
	                   $('#street').val(fullRoadAddr);
	                   
	                   window.self.close();
	               }
	           }).open();
		});
		
		$("#btn").click(function() {
			if( $("#pw").val() != $("#pw2").val()){
				alert("비밀번호를 확인해주세요");
			}else{
				if(email==$("#id").val() && $("#check").val()=="t"){
					if ($("#id").val() && $("#pw").val() && $("#pw2").val() && $("#name").val() && $("#goal").val() && $("#birth").val() && $("#phone").val() && $("#postal_code").val().length > 0) {
						if($("#c1").prop("checked") && $("#c2").prop("checked")){		
							if($("#pwCheck").val()=='2'){
								alert("비밀번호 확인.");
							}else{
							frm.submit();
							alert("회원가입 완료");
							}
						}else{
							alert("약관동의를 확인해주세요");
						}
					} else {
						alert("모든 사항을 입력해주세요.");
					}
				}else{
					alert("이메일 인증을 해주세요.");
				}
			}
		});
		
  		$("#btn2").click(function(){
  			if(data2=="사용 가능한 ID 입니다."){
	  			email = $("#email input").val();
	  			window.open("./sendMail?id="+$("#email input").val(),"","top=300, left=750, width=410, height=450");
  			}else{
  				alert("이메일을 다시 확인해주세요.");
  			}
  		});
  		


		
	});


</script>
</head>
<body class="body">
	<div class="join-center">
		<h2>회원가입</h2>
		<!-- <h6>가입 버튼을 누르면 이용약관과 정책에 동의한 것으로 간주합니다</h6> -->
		<article id="agree_border">
			<div class="terms_border">
				<div class="terms_border2">
					<div class="all">
						<input type="checkbox" id="all_check"> 가입 전체약관 및 수신에
						동의합니다.
					</div>
					<div class="tline"></div>
					<div class="agree">
						<input type="checkbox" class="box feel" id="c1"> <span
							class="point">[필수]</span> 서비스 이용약관 동의
						<button class="see" id="ser_1">보기▼</button>
						<div class="see1">
							<%@include file="./service_1.jsp"%>
						</div>
					</div>
					<div class="agree">
						<input type="checkbox" class="box feel" id="c2"> <span
							class="point">[필수]</span> 개인정보 수집 및 이용 동의
						<button class="see" id="ser_2">보기▼</button>
						<div class="see2">
							<%@include file="./service_2.jsp"%>
						</div>
					</div>
					<div class="agree">
						<input type="checkbox" class="box" id="c3"> <span
							id="choice">[선택]</span> 개인정보 수집 및 이용 동의 <br> <span id="sub">(공고
							소식 및 광고메일, 휴대폰 알림)</span>
					</div>
				</div>
			</div>

		</article>


		<article id="join_border">
			<form action="memberJoin" method="post" name="frm">

				<div id="email">
					<label>ID </label>
					<p>
						<input type="email" id="id" name="id" placeholder="  이메일 형식만 가능"><input
							type="button" value="인증 이메일 전송" id="btn2">
					</p>
				</div>
				
				<input type="button" value="비밀번호 찾기" id="btn3">

				<div id="result"></div>

				<input type="hidden" name="check" id="check" value="f"> 
				
				<label>PW</label>
				<p class="p">
					<input type="password" placeholder="  비밀번호를 입력해주세요" name="pw"
						id="pw">
				<p id="pwcheck"></p>

				<label>PW_CHECK </label>
				<p class="p">
					<input type="password" placeholder="  비밀번호를 확인해주세요" id="pw2">
				<p id="pwcheck2"></p>
					<input type="hidden" id="pwCheck">
				<label>NAME </label>
				<p class="p">
					<input type="text" placeholder="  이름을 입력해주세요" name="name" id="name">
				</p>

				<label>ADDRESS </label>
				<p class="p">
					<input type="text" placeholder="우변번호" name="postal_code"
						id="postal_code" class="join_in2"> <input type="button"
						value="우편번호 찾기" id="nn" class="btn btn-default"><br>
					<input type="text" placeholder="도로명주소" name="street" id="street"
						class="join_in2"><br> <input type="text"
						placeholder="나머지주소" name="street2" id="street2" class="join_in2">
				</p>

				<label>GOAL </label>
				<p>
					<select name="goal" id="goal">
						<script>
					for(i=1;i<101;i++){
						document.write("<option value="+i+">"+i+"</option>");
					}
				</script>
					</select>
				</p>

				<label>BIRTH </label>
				<p class="p">
					<input type="date" name="birth" id="birth">
				</p>

				<label>PHONE </label>
				<p class="p">
					<input type="text" placeholder="  휴대폰 번호를 입력해주세요" name="phone"
						id="phone">
				</p>
				<input type="hidden" name="auto_payment" value="0">
				<!-- 0이면 X, 1이면 O -->
				<p id="btn-group">
					<input type="button" class="btn" id="btn" value="JOIN">
					<a href="./login" class="btn">CANCEL</a>
				</p>
			</form>
		</article>
	</div>
</body>
</html>