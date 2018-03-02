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
	  var type = '${problemDTO.type}';
	  var chapter = '${problemDTO.chapter}';
	  var chapter_m = '${problemDTO.chapter_m}';
	  
	  
	  $("#type option").each(function(){
		if($(this).val() == type){
			$(this).attr("selected","selected");
		}
	  });
	  
	  
	  $("#chapter option").each(function(){
		  if($(this).val() ==  chapter){
			  $(this).attr("selected", "selected");
			  
			  
			  if($(this).val() == '다항식'){
				  $(".chapter_m").css("display" , "none");
				  $(".chapter_m").attr("name","");
				  $("#c_1").css("display" , "inline-block");
				  $("#c_1").attr("name","chapter_m");
				  	$("#c_1 option").each(function(){
				  		if($(this).val() == chapter_m){
				  			$(this).attr("selected","selected");
				  			
				  		}
				  	});
			  }else if($(this).val() == '방정식'){
				  $(".chapter_m").css("display" , "none");
				  $(".chapter_m").attr("name","");
				  $("#c_2").css("display" , "inline-block");
				  $("#c_2").attr("name","chapter_m");
				  	$("#c_2 option").each(function(){
				  		if($(this).val() == chapter_m){
				  			$(this).attr("selected","selected");
				  			
				  		}
				  	});

			  }else{
				  $(".chapter_m").css("display" ,"none");
				  $(".chapter_m").attr("name","");
				  $("#c_3").css("display" , "inline-block");
				  $("#c_3").attr("name","chapter_m");
				  	$("#c_3 option").each(function(){
				  		if($(this).val() == chapter_m){
				  			$(this).attr("selected","selected");
				  			
				  			
				  		}
				  	});
			  };
			  
		  }
		  
	  })
	  
	  
	  
	  
	  $("#answerList_btn").click(function(){
		  var check;
	  		for(var i=1; i<5; i++){
		  if($("#al"+i).val().length == 0){
			  alert(i+"번보기 누락");
			  check = false;
	  		}else{
	  		  var a = $("#al"+i).val();
	  		  $("#answerlist").val($("#answerlist").val()+a+',');
	  		  check = true;
	  		  };
		  };
	  		if(check){
	  			al_frm.submit();
		  		  frm.submit();
	  		}
	  		
	  })
	  
	  $("#btn").click(function(){
		 if($("#contents").val().length==0){
			 alert("Not insert Problem.");
		 }else if($(".chapter_m").val() == ""){
			 alert("Not check chapter");
		 }else{
			 frm.submit();
		 };
		  
	  });
	  
	  $("#btn2").click(function(){
		 
		  if($("#contents").val().length==0){
				 alert("Not insert Problem.");
			}else if($(".chapter_m").val() == ""){
				 alert("Not check chapter");		
			 }else{
				$("#myModal").modal();
			
			$("#well2").css("animation","blink 1s step-end infinite");
			$("#well2").css("-webkit-animation","blink 1s step-end infinite");
			
				 };
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
	  
	  var id;
	  $(".form-control").keyup(function(){
	  	var answerlist = $(this).val();
	  	id = $(this).attr("id");
	  	 $.ajax({
	  		type: "GET",
	  		url: "./answerAjax",
	  	 	data: {
	  	 		answerlist : answerlist
	  	 	},
	  	 	success: function(data){
	  	 		$(".answerList_result").each(function(){
	  	 			if($(this).attr("title")==id){
	  	 				$(this).html(data);
	  	 			}
	  	 		});
	  	 	}
	  	 });
	  });
	  
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
	  
	  $(".form-control").click(function(){
		  id=$(this).attr("id");
	  })
	  
	  $("#answer_icon div").click(function(){
		  var a = $(this).attr("title");
		  var answerlist;
		  $(".form-control").each(function(){
			  if($(this).attr("id")==id){
				  $(this).val($(this).val()+a);
				  answerlist =  $(this).val();
				  $.ajax({
						type: "GET",
						url: "./answerAjax",
						data: {
							answerlist : answerlist,
						},
						success: function(data){
							$(".answerList_result").each(function(){
				  	 			if($(this).attr("title")==id){
				  	 				$(this).html(data);
				  	 			}
							});
						}
					
					 }); //ajax
			  }
		  });
		  
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
.modal-header, h4, .close {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
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
	background-color: white;
	height: 100%;
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
	line-height:6;
	
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


#answerList_btn{
	margin-top: 20px;
}


.answerList_result{
	width:100px;
	height: 20px;
	margin: 0 auto;
}
.dropdown-menu div{
	float: left;
}

.chapter_m{
	display: none;
}
#drop_btn{
 margin-bottom: 20px;
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
#nextIcon {
 animation: blink 1s step-end infinite;
 -webkit-animation: blink 1s step-end infinite;
}
#well1{
animation: blink 1s step-end infinite;
 -webkit-animation: blink 1s step-end infinite;
}
#answer_icon div{
	float: left;
	margin-left: 15px;
}
.scroll{
	top: 100px;
	position: fixed;
	z-index: 999;
}
.well{
	width:200px;
}
#result{
	width:20%;
	display:inline-block;
	float: right;
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
				<img alt="" src="../resources/images/test.png" style="width:400px; height:300px; margin-left: 40px">  
				<hr>
				<h3>문제수정</h3>
				<form action="./problemUpdate" method="post" name="frm">
		Type:<select id="type" name="type">
			<option value="A">A</option>
			<option value="B">B</option>
			<option value="C">C</option>
		</select>
		Chapter:<select id="chapter" name="chapter">
			<option value="다항식">다항식</option>
			<option value="방정식">방정식</option>
			<option value="부등식">부등식</option>
		</select>
		
		<select class="chapter_m" id="c_1" >
			<option value="다항식의 연산">다항식의 연산</option>
			<option value="항등식과 나머지정리">항등식과 나머지정리</option>
			<option value="인수분해">인수분해</option>
		</select>
		<select class="chapter_m" id="c_2" >
			<option value="복소수">복소수</option>
			<option value="이차방정식과 이차함수">이차방정식과 이차함수</option>
			<option value="여러 가지 방정식">여러 가지 방정식</option>
		</select>
		<select class="chapter_m" id="c_3" >
			<option value="평면좌표">평면좌표</option>
			<option value="직선의 방정식">직선의 방정식</option>
			<option value="원의 방정식">원의 방정식</option>
		</select><br>
		<input type="hidden" id="answerlist" name="answerlist">
		<input type="hidden" name="commentary" value="${problemDTO.commentary}">
		<input type="hidden" name="answer" value="${problemDTO.answer}">
		<input type="hidden" name="pnum" value="${problemDTO.pnum}">
		<div>
					<textarea name="contents" rows="10" cols="90" id="contents" placeholder="스페이스바 한번 누르세요.">${problemDTO.contents}</textarea>		
						
				<div id="result">
				</div>
		</div>
					<input class="btn btn-primary" type="button" value="보기수정" id="btn2" style="margin-top:30px;margin-left:15%; width:500px;">
				</form>
					
			</div>
			<div class="col-sm-2 sidenav">
			 <div id="well_div" style="position: relative">
				<div class="well" id="well1">
					<h3>문제수정</h3>
				</div>
				<i id="nextIcon" class="fa fa-arrow-down" style="font-size:60px"></i>
				<div class="well" id="well2">
					<h3>정답수정</h3>
				</div>
				<i id="nextIcon2" class="fa fa-arrow-down" style="font-size:60px"></i>
				<div class="well">
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
	
	
	
	  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:10px 30px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4>AnswerList</h4>
        </div>
        <div class="modal-body" style="padding:15px">
        <div class="container">
        	<button id="drop_btn" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="width:500px;">Show Icons
    		<span class="caret"></span></button>
    		<ul class="dropdown-menu" style="width:600px;">
        	<div id="answer_icon">
        		<div class="sik" title="{x}^{a}"><img src="http://latex.codecogs.com/gif.latex?{x}^{a}"/></div>
				<div class="sik" title="{x}_{a}"><img src="http://latex.codecogs.com/gif.latex?{x}_{a}"/></div>
				<div class="sik" title="\frac{a}{b}"><img src="http://latex.codecogs.com/gif.latex?\frac{a}{b}"/></div>
				<div class="sik" title="{x_{a}}^{b}"><img src="http://latex.codecogs.com/gif.latex?{x_{a}}^{b}"/></div>
				<div class="sik" title="x_{a}^{b}"><img src="http://latex.codecogs.com/gif.latex?x_{a}^{b}"/><br></div>
				<div class="sik" title="\lim_{x \to 0}"><img src="http://latex.codecogs.com/gif.latex?\lim_{x \to 0}"/></div>
				<div class="sik" title="\sqrt [n]{x}"><img src="http://latex.codecogs.com/gif.latex?\sqrt [n]{x}"/></div>
				<div class="sik" title="\int_{a}^{b}"><img src="http://latex.codecogs.com/gif.latex?\int_{a}^{b}"/></div>
				<div class="sik"  title="\left \{ contents\right contents\}"><img src="http://latex.codecogs.com/gif.latex?\left \{\right\}"/></div>
				<div class="sik"  title="\frac{a^2}{ax^2}"><img src="http://latex.codecogs.com/gif.latex?\frac{a^2}{ax^2}"/></div>
				<div class="sik" title="\alpha"><img src="http://latex.codecogs.com/gif.latex?\alpha"/></div>
				<div class="sik"  title="\beta"><img src="http://latex.codecogs.com/gif.latex?\beta"/></div>
				<div class="sik"  title="\gamma"><img src="http://latex.codecogs.com/gif.latex?\gamma"/></div>
				<div class="sik"  title="\sum"><img src="http://latex.codecogs.com/gif.latex?\sum"/></div>
			</div>
    		</ul>
		</div>
          <form role="form" name="al_frm">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-eye-open"></span> 1번보기</label>
              <input type="text" class="form-control" id="al1" value="${answerlist[0]}" placeholder="Enter AnswerList">
            </div>
            <div class="answerList_result" title="al1"></div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> 2번보기</label>
              <input type="text" class="form-control" id="al2" value="${answerlist[1]}" placeholder="Enter AnswerList">
            </div>
            <div class="answerList_result" title="al2"></div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> 3번보기</label>
              <input type="text" class="form-control" id="al3" value="${answerlist[2]}" placeholder="Enter AnswerList">
            </div>
            <div class="answerList_result" title="al3"></div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> 4번보기</label>
              <input type="text" class="form-control" id="al4" value="${answerlist[3]}" placeholder="Enter AnswerList">
            </div>
            <div class="answerList_result" title="al4"></div>
              <input type="button" id="answerList_btn" class="btn btn-success btn-block" style="margin-top: 10px;" value="insert">
          </form>
        </div>
      </div>
      
    </div>
  </div> 


</body>
</html>