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

<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
  });
</script>
<script type="text/javascript">
  $(function(){
	  
	  var answer = '${problemDTO.answer}';
	  $("#answer option").each(function(){
		  if($(this).val()==answer){
			  $(this).attr("selected","selected");
		  }
	  });
	  
	$("#btn").click(function(){
		$(".type").each(function(){
			var a = $(this).val();
			
		})
	})
	  
	  $("#btn2").click(function(){
				 frm.submit();
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
	display: none;
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
	position: fixed;
	z-index: 999;
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header"></div>
		</div>
	</nav>

<div class="container-fluid text-center">
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
				<div class="sik"  title="\times"><img src="http://latex.codecogs.com/gif.latex?\times"/></div>
				<div class="sik"  title="\left AB \{\ x^{a}+ x^{a} \}"><img src="http://latex.codecogs.com/gif.latex?\large&space;\left AB \{\ x^{a}+ x^{a} \}"/></div>
				<div class="sik"  title="(x^{2}&plus;x^{2})^{2}"><img src="http://latex.codecogs.com/gif.latex?\large&space;(x^{2}&plus;x^{2})^{2}"/></div>
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
				<form action="./problemUpdate" method="post" name="frm">
				Type:<input type="text" name="type" value="${problemDTO.type}" readonly="readonly" style="width:20px;">
				Chapter:<input type="text" name="chapter" value="${problemDTO.chapter}" readonly="readonly" style="width:80px;">
				Chapter_m:<input type="text" name="chapter_m" value="${problemDTO.chapter_m}" readonly="readonly">
				<input type="hidden" name="answerlist" value="${problemDTO.answerlist}">
				<input type="hidden" name="contents" value="${problemDTO.contents}" >
				<input type="hidden" name="check" value="true">
				<input type="hidden" name="pnum" value="${problemDTO.pnum}">
				정답:<select id="answer" name="answer" style="width:60px">
					        <option>1</option>
					        <option>2</option>
					        <option>3</option>
					        <option>4</option>
		      			</select>
				<hr>
				<div class="container">				
				<table>
				<tr>
					<th style="width:550px;">해설수정</th>
					<th style="width:200px;">AnswerList</th>
				</tr>
				<tr>
					<td>
						<textarea name="commentary" rows="10" cols="60" id="contents" placeholder="스페이스바 한번 누르세요.">${problemDTO.commentary}</textarea>
					</td>
					<td>
					<c:forEach begin="0" end="${answer_ar.size()}" var="i" items="${answer_ar}" varStatus="index">
					<h4>${index.index+1}번 &nbsp; &nbsp;&nbsp;&nbsp;<img src="http://latex.codecogs.com/gif.latex?${i}"/></h4><hr>
					</c:forEach>
					</td>
				</tr>			
				</table>
				</div>
					<input class="btn btn-primary" type="button" value="Go Update" id="btn2" style="margin-left:15%; width:500px;">				
				</form>
					<h3>LaTeX 로 미리보기</h3>
				 <div id="result">
				 </div>
				</div>
			<div class="col-sm-2 sidenav">
			 <div id="well_div" style="position: relative">
				<div class="well" id="well1">
					<h3 style="color:green">문제수정</h3>
				</div>
				<i id="nextIcon" class="fa fa-arrow-down" style="font-size:60px; color: green"></i>
				<div class="well" id="well2">
					<h3 style="color:green">정답수정</h3>
				</div>
				<i id="nextIcon2" class="fa fa-arrow-down" style="font-size:60px"></i>
				<div class="well" id="well3">
					<h3>해설수정</h3>
				</div>
				<i id="nextIcon3" class="fa fa-arrow-down" style="font-size:60px"></i>
				<div class="well" id="well4">
					<h3>완료</h3>
				</div>			 
			 </div>
			</div>
		</div>
	</div>
	
	
	

</body>
</html>