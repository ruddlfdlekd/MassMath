<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/m1/resources/css/join.css" rel="stylesheet">
</head>
<body>
<div class="sidenav">
  <a href="#services"  class="m_menu" id="m1">서비스 관리</a>
	   <div class="s_menu m1">
	      <a href="#" id="s_m1">자주 하는 질문</a>
	   </div>
	      <div class="s_menu m1">
	      <a href="#" id="s_m2">1:1 상담</a>
	   </div> 
  <a href="#clients" class="m_menu" id="m2">결제 관리</a>
	   <div class="s_menu m1">
	      <a href="#" id="s_m3">결제 내역</a>
	   </div>
	      <div class="s_menu m1">
	      <a href="#" id="s_m4">환불</a>
	   </div>
  <a href="./memberMyPage?id=${member.id}" class="m_menu" id="m3">회원정보 관리</a>
	   <div class="s_menu m1">
	      <a href="./memberUpdate?id=${member.id}" id="s_m6">회원 정보 수정</a>
	   </div>
	   <div class="s_menu m1">
	      <a href="./memberDelete" id="s_m7">회원 탈퇴</a>
	   </div>
</div>
<div class="delete-center">
	<h2> 회원 탈퇴 </h2>
	<form action="./memberDelete" method="post" id="frm">
	<div>
		<label>ID </label>
		<p class="p"><input type="email" readonly="readonly" name="id" value="${member.id}"></p>
    </div>
    
    <label>PW </label>
	<p class="p"><input type="password" placeholder="  비밀번호를 입력해주세요" name="pw" id="pw"></p>
	
	<p><button id="btn">Delete</button></p>
	</form>
</div>
</body>
</html>