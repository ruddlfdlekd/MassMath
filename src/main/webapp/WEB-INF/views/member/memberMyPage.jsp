<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MY PAGE</title>
<link href="/m1/resources/css/join.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#nn").click(function() {
			window.open("../problem/result2","","top=100px, left=200px, width=600px, heigth=600px");
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
<div class="dd">
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
	      <a href="#" id="s_m4">연장 / 환불</a>
	   </div>
  <a href="./memberMyPage?id=${member.id}" class="m_menu" id="m3">회원정보 관리</a>
	   <div class="s_menu m3">
	      <a href="./memberUpdate?id=${member.id}" id="s_m6">회원 정보 수정</a>
	   </div>
	      <div class="s_menu m3">
	      <a href="./memberDelete" id="s_m7">회원 탈퇴</a>
	   </div>
</div>




<div class="mypage-center">
	<h2>My Page</h2>
	<div class="info">
		<p class="p2">ID : ${member.id}</p>
		<p class="p2">NAME : ${member.name}</p>
		<p class="p2">ADDRESS : ${member.address}</p>
		<p class="p2">GOAL : ${member.goal}</p>
		<p class="p2">BIRTH : ${member.birth}</p>
		<p class="p2">LEVEL : ${member.level_avg}</p>
		<p class="p2">PHONE : ${member.phone}</p>
		<p class="p2">JOIN DATE : ${member.join_date}</p>
	
		<p>
		<c:if test="${member.pw eq 'kakao'}">
			<a href="./apiMemberUpdate?id=${member.id}" class="btn3">UPDATE</a> 
		</c:if>
			<a href="./memberUpdate?id=${member.id}" class="btn3">UPDATE</a> 
			<a href="./memberDelete" class="btn3">DELETE</a>
		</p>
	</div>
</div>
</div>
<%@include file="../temp/footer.jsp"%>
</body>
</html>