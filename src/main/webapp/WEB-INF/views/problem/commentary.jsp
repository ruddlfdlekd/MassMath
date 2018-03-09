<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Make Problem</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<script>
function loading() {
$("#a").css("display", "none");
b.style.visibility="visible";
}
</script>

<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
  });
</script>
<script type="text/javascript">
  $(function(){
	  
	  
	  $("#btn2").click(function(){
		  if($("#rightCount").val().length==0){
			  alert("정답률입력해주세요.");
		  }else{
				 frm.submit();
		  }
	 });
	  
	  $("#chapter").click(function(){
		  $("#op_1").attr("value","다항식의 연산");
		  if($(this).val() == '다항식'){
			  $(".chapter_m").css("display" , "none");
			  $(".chapter_m").attr("name","");
			  $("#c_1").css("display" , "inline-block");
			  $("#c_1").attr("name","chapter_m");
		  }else if($(this).val() == '방정식'){
			  $(".chapter_m").css("display" , "none");
			  $(".chapter_m").attr("name","");
			  $("#c_2").css("display" , "inline-block");
			  $("#c_2").attr("name","chapter_m");

		  }else{
			  $(".chapter_m").css("display" ,"none");
			  $(".chapter_m").attr("name","");
			  $("#c_3").css("display" , "inline-block");
			  $("#c_3").attr("name","chapter_m");
		  };
	  })
	  
	  $("#contents").keyup(function(){
		  if(event.keyCode === 13){
			  $("#contents").val($("#contents").val()+'<br>');
		  }
			 var contents = $("#contents").val();
				 $.ajax({
				 
				type: "GET",
				url: "./problemAjax",
				data: {
					contents : contents,
				},
				success: function(data){
					$("#result").html(data);
					}	
				
				 }); //ajax 
		  
	  })
	  
	  
	  	$(".icon_div div").click(function(){
  
			   $("#contents").val($("#contents").val()+$(this).attr("title"));
		 var contents = $("#contents").val();
			 $.ajax({
			 
			type: "GET",
			url: "./problemAjax",
			data: {
				contents : contents,
			},
			success: function(data){
				$("#result").html(data);
				}	
			
			 }); //ajax 
		 }); // click
		
		});
  </script>
<style type="text/css">
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 910px;
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top:25px;
	height: 100%;
	background-color: white;
}

/* Set black background color, white text and some padding */

@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
	}
	.row.content {
		height: auto;
	}
}

.icon_div{
	width:45%;
	line-height: 6;
	
}
.sik{
	cursor: pointer;
}
.sik:hover{
	box-shadow: 5px 0px 40px rgba(0,0,0, .2);
}

.icon_div div {
	margin-left: 15px;
	float: left;
}

.chapter_m{
	
}
@keyframes blink {
 0% {color: black;}
 50% {color: red;}
}
 
/* for Chrome, Safari */
@-webkit-keyframes blink {
  0% {background-color: black;}
 50% {background-color: red;}
}
#nextIcon2 {
 animation: blink 1s step-end infinite;
 -webkit-animation: blink 1s step-end infinite;
}
#well3{
animation: blink 1s step-end infinite;
 -webkit-animation: blink 1s step-end infinite;
}
.scroll{
	top: 100px;
	position: relative;
	z-index: 999;
	width:400px;
}
#result{
	margin-bottom: 110px;
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
		  <div class="navbar-header">
			<a class="navbar-brand" href="#"><img alt="" src="../resources/images/logo.png" style="width:30px; height:30px"></a>
		  </div>
		  <ul class="nav navbar-nav">
		  	<li id="nav_pro"  data-toggle="modal" data-target="#pro_info"><a href="#">Make Problem?</a></li>
		  	<li id="nav_ans"  data-toggle="modal" data-target="#ans_info"><a href="#">Answer List?</a></li>
		  	<li id="nav_com" class="active" data-toggle="modal" data-target="#com_info"><a href="#">Make Commentary?</a></li>
		  </ul>
		  <ul class="nav navbar-nav navbar-right">
		  	<li><a class="navbar-brand" href="javascript:history.back(-1)"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
			<li><a class="navbar-brand" href="javascript:history.go(1)"> <span class="glyphicon glyphicon-chevron-right"></span></a></li>
		  </ul>
		</div>
	</nav>

<div class="container-fluid text-center" style="overflow: hidden;">
	<div class="row content">
	  <div class="col-sm-2 sidenav">
	   <div class="scroll">
			<div class="icon_div">
				<div class="sik" title="{x}^{a}"><img src="http://latex.codecogs.com/gif.latex?\large&space;{x}^{a}"/></div>
				<div class="sik" title="{x}_{a}"><img src="http://latex.codecogs.com/gif.latex?\large&space;{x}_{a}"/></div>
				<div class="sik" title="\frac{a}{b}"><img src="http://latex.codecogs.com/gif.latex?\large&space;\frac{a}{b}"/></div>
				<div class="sik" title="{x_{a}}^{b}"><img src="http://latex.codecogs.com/gif.latex?\large&space;{x_{a}}^{b}"/></div>
				<div class="sik" title="x_{a}^{b}"><img src="http://latex.codecogs.com/gif.latex?\large&space;x_{a}^{b}"/><br></div>
				<div class="sik" title="\lim_{x \to 0}"><img src="http://latex.codecogs.com/gif.latex?\large&space;\lim_{x \to 0}"/></div>
			</div>
			<div class="icon_div">
				<div class="sik" title="\sqrt [n]{x}"><img src="http://latex.codecogs.com/gif.latex?\large&space;\sqrt [n]{x}"/></div>
				<div class="sik"  title="\sqrt[n]{a}^{x}"><img src="http://latex.codecogs.com/gif.latex?\large&space;\sqrt[n]{a}^{x}"/></div>
				<div class="sik" title="\int_{a}^{b}"><img src="http://latex.codecogs.com/gif.latex?\large&space;\int_{a}^{b}"/></div>
				<div class="sik"  title="\overline{AB}"><img src="http://latex.codecogs.com/gif.latex?\large&space;\overline{AB} "/></div>
				<div class="sik"  title="\frac{a^2}{ax^2}"><img src="http://latex.codecogs.com/gif.latex?\large&space;\frac{a^2}{ax^2}"/></div>
				<div class="sik" title="\alpha"><img src="http://latex.codecogs.com/gif.latex?\large&space;\alpha"/></div>
				<div class="sik"  title="\beta"><img src="http://latex.codecogs.com/gif.latex?\large&space;\beta"/></div>
			</div>
			<div class="icon_div">
				<div class="sik"  title="\gamma"><img src="http://latex.codecogs.com/gif.latex?\large&space;\gamma"/></div>
				<div class="sik"  title="\sum"><img src="http://latex.codecogs.com/gif.latex?\large&space;\sum"/></div>
				<div class="sik"  title="\sum_{a}^{b}"><img src="http://latex.codecogs.com/gif.latex?\sum_{a}^{b}" title="\sum_{a}^{b}" /></div>
				<div class="sik"  title="\leq"><img src="http://latex.codecogs.com/gif.latex?\large&space;\leq"/></div>
				<div class="sik"  title="\geq"><img src="http://latex.codecogs.com/gif.latex?\large&space;\geq"/></div>
				<div class="sik"  title="\cdot"><img src="http://latex.codecogs.com/gif.latex?\large&space;\cdot"/></div>
				<div class="sik"  title="\triangle"><img src="http://latex.codecogs.com/gif.latex?\triangle"/></div>
				<div class="sik"  title="\therefore "><img src="http://latex.codecogs.com/gif.latex?\therefore"/></div>
				<div class="sik"  title="\times"><img src="http://latex.codecogs.com/gif.latex?\times"/></div>
				<div class="sik"  title="\left AB \{\ x^{a}+ x^{a} \}"><img src="http://latex.codecogs.com/gif.latex?\left AB \{\ x^{a}+ x^{a} \}"/></div>
				<div class="sik"  title="(x^{2}&plus;x^{2})^{2}"><img src="http://latex.codecogs.com/gif.latex?(x^{2}&plus;x^{2})^{2}"/></div>
				
			</div>		
			</div>
		 </div>
			<div class="col-sm-8 text-left">
				<h1>사용법</h1>
				<p><h3>Latex 이용하여 문제만들기</h3></p>
				<p><h3>1. 처음 시작할때 한칸 꼭 띄어서 사용하세요*</h3></p>
				<p><h3>2. 수식은 맨처음과 뒤를 * 로 시작하고 끝맺음 지어주세요.</h3></p>
				ex) 둘리는 *{x}^{2}*개 희동이는 *{5}^{x}+2*개 
				<img alt="" src="../resources/images/test.png" style="width:300px; height:200px; margin-left: 40px">  
				<hr>
				<form action="./write" method="post" name="frm">
				Book:<input type="text" name="book" value="${problemDTO.book}" readonly="readonly" style="width:20px;">
				Type:<input type="text" name="type" value="${problemDTO.type}" readonly="readonly" style="width:20px;">
				Chapter:<input type="text" name="chapter" value="${problemDTO.chapter}" readonly="readonly" style="width:80px;">
				Chapter_m:<input type="text" name="chapter_m" value="${problemDTO.chapter_m}" readonly="readonly">
				<input type="hidden" name="chapter_name" value="${problemDTO.chapter}">
				<input type="hidden" name="chapter_m_name" value="${problemDTO.chapter_m}">
				<input type="hidden" name="type_name" value="${problemDTO.type}">
				<input type="hidden" name="book_name" value="${problemDTO.book}">
				<input type="hidden" name="answerlist" value="${problemDTO.answerlist}" readonly="readonly">
				<input type="hidden" name="contents" value="${problemDTO.contents}" readonly="readonly">
				기본정답률:<input type="text" name="rightCount" id="rightCount" placeholder="기본설정 0~100 숫자만입력" style="width:100px;">
				정답:<select id="answer" name="answer" style="width:60px">
					        <option>1</option>
					        <option>2</option>
					        <option>3</option>
					        <option>4</option>
		      			</select>
		      			<div>
		      			<c:forEach begin="0" end="${answer_ar.size()}" var="i" items="${answer_ar}" varStatus="index">
					&nbsp;&nbsp;${index.index+1}번 <img src="http://latex.codecogs.com/gif.latex?${i}"/>&nbsp; &nbsp;&nbsp;&nbsp;
					</c:forEach>		      			
		      			</div>
				<hr>
				<div class="container">				
				<table>
				<tr>
					<th style="width:440px;">해설입력</th>
					<th style="width:550px;">미리보기</th>
				</tr>
				<tr>
					<td>
						<textarea name="commentary" rows="10" cols="60" id="contents" placeholder="스페이스바 한번 누르세요."></textarea>
					</td>
					<td>
	
				 <div id="result">
				 </div>
			 
					</td>
				</tr>			
				</table>
				</div>
					<input class="btn btn-primary" type="button" value="해설등록" id="btn2" style="margin-top:20px; margin-left:15%; width:500px;">				
				</form>
				</div>
			<div class="col-sm-2 sidenav">
			 <div id="well_div" style="position: relative">
				<div class="well" id="well1">
					<h3 style="color:green">문제입력</h3>
				</div>
				<i id="nextIcon" class="fa fa-arrow-down" style="font-size:60px; color: green"></i>
				<div class="well" id="well2">
					<h3 style="color:green">정답입력</h3>
				</div>
				<i id="nextIcon2" class="fa fa-arrow-down" style="font-size:60px"></i>
				<div class="well" id="well3">
					<h3>해설입력</h3>
				</div>
				<i id="nextIcon3" class="fa fa-arrow-down" style="font-size:60px"></i>
				<div class="well" id="well4">
					<h3>완료</h3>
				</div>			 
			 </div>
			</div>
		</div>
	</div>
	
	<!-- 문제입력 사용 -->
	<div class="modal fade" id="pro_info" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">문제입력시 주의사항</h4>
        </div>
        <div class="modal-body">
          <p>1. 문제입력시 한글과 수식은 같이 입력될수 없어 구분점 * 으로 지어줘야합니다.</p>
          <p>2. *(수식)* 수식이 들어갈 내용에는 한글 입력하지 마세요.</p>
          <p>3. 식이 잘못되거나, **안에 한글이 들어갈경우 미리보기가 제한됩니다.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <!-- 보기입력 사용 -->
	<div class="modal fade" id="ans_info" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">보기입력시 주의사항</h4>
        </div>
        <div class="modal-body">
          <p>1. 보기입력시 한글입력은 안됩니다. 오로지 숫자와 식만 가능합니다.</p>
          <p>2. 식이 잘못되거나, 안에 한글이 들어갈경우 미리보기가 제한됩니다.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <!-- 해설입력 사용 -->
	<div class="modal fade" id="com_info" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">해설입력시 주의사항</h4>
        </div>
        <div class="modal-body">
          <p>1. 해설입력시 한글과 수식은 같이 입력될수 없어 구분점 * 으로 지어줘야합니다.</p>
          <p>2. *(수식)* 수식이 들어갈 내용에는 한글 입력하지 마세요.</p>
          <p>3. 식이 잘못되거나, **안에 한글이 들어갈경우 미리보기가 제한됩니다.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
	
	

</body>
</html>