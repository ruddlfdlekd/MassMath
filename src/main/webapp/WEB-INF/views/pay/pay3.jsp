<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link href="../resources/css/pay3.css" rel="stylesheet" >
  <style type="text/css">
 
  </style>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	<%if(session.getAttribute("member")==null){%>
	location.href="/m1/member/login";
	<%}%>
	$(".btn").click(function(){
		location.href="./payment?price="+$(this).val();
	});	 
});
</script>
</head>
<body>



<div class="jumbotron text-center">


  <p>올해도 학원비로 한달에 30만원, 인강비로 한달에 20만원?</p> 
  <p>MASS MATH으로 한방에 끝내는데 대체 왜?</p>
  <h1><span>MASS MATH</span> 수강결재 하러 가즈아~!<i class="fa fa-car" style="font-size:48px;color:black;"></i><i class="fa fa-car" style="font-size:48px;color:black;"></i></h1>
  
</div>


<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h5>시험 전 짧고 굵게 공부하고 싶다면</h5>
      <p>프리패스 2개월49,000원</p>
      <p>모든 문제와 강의, 기능을2개월 완전 무제한으로!모든 기능 무제한 맞춤 문제 무제한 맞춤 강의 무제한</p>

<button type="button" class="btn btn-primary" value="49000" >49000원결재하기</button>
    </div>
<div class="col-sm-4">
      <h5>꼼꼼히 차근차근 공부하고 싶다면</h5>
      <p>프리패스 6개월69,000원</p>
      <p>모든 문제와 강의, 기능을
6개월 완전 무제한으로!
모든 기능 무제한
맞춤 문제 무제한
맞춤 강의 무제한</p>
<button type="button" class="btn btn-primary" value="69000">69000원결재하기</button>
    </div>
<div class="col-sm-4">
      <h5>언제든 필요할 때 공부하고 싶다면</h5>        
      <p>프리패스 12개월99,000원</p>
      <p>모든 문제와 강의, 기능을
12개월 완전 무제한으로!
모든 기능 무제한
맞춤 문제 무제한
맞춤 강의 무제한</p>
<button type="button" class="btn btn-primary" value="99000">99000원결재하기</button>
    </div>
  </div>
</div>



</body>
</html>