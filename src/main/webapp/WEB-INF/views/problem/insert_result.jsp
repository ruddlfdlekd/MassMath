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
<link href='https://fonts.googleapis.com/css?family=Montserrat:700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="../resources/css/problemView.css">
</head>

<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
  });
</script>
<script>
function loading() {
	$("#a").css("display", "none");
	b.style.visibility="visible";
	$("html").css("background-color","white");
	$("body").css("background-color","white");
}
</script>
<script type="text/javascript">
  $(function(){
		$("#insert").click(function(){
			location.href="./makeProblem";
		});
		$("#go_list").click(function(){
			location.href="./problemList"
		});
		$(".boton").wrapInner('<div class=botontext></div>');
		    
		    $(".botontext").clone().appendTo( $(".boton") );
		    
		    $(".boton").append('<span class="twist"></span><span class="twist"></span><span class="twist"></span><span class="twist"></span>');
		    $(".twist").css("width", "25%").css("width", "+=3px");
		
	});
  </script>
<style type="text/css">
html,
body {
  background-color: #404456;
}

#loader {
  position: absolute;
  top: 50%;
  left: 50%;
  margin-top: -2.7em;
  margin-left: -2.7em;
  width: 5.4em;
  height: 5.4em;
  background-color: #404456;
}

#hill {
  position: absolute;
  width: 7.1em;
  height: 7.1em;
  top: 1.7em;
  left: 1.7em;
  background-color: transparent;
  border-left: .25em solid whitesmoke;
  transform: rotate(45deg);
}

#hill:after {
  content: '';
  position: absolute;
  width: 7.1em;
  height: 7.1em;
  left: 0;
  background-color: #404456;
}

#box {
  position: absolute;
  left: 0;
  bottom: -.1em;
  width: 1em;
  height: 1em;
  background-color: transparent;
  border: .25em solid whitesmoke;
  border-radius: 15%;
  transform: translate(0, -1em) rotate(-45deg);
  animation: push 2.5s cubic-bezier(.79, 0, .47, .97) infinite;
}


/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 910px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
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
	width:100%;
	height:40px;
	margin-top: 20px;
	
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
#nextIcon3 {
 animation: blink 1s step-end infinite;
 -webkit-animation: blink 1s step-end infinite;
}
#well4{
animation: blink 1s step-end infinite;
 -webkit-animation: blink 1s step-end infinite;
}
@keyframes push {
  0% {
    transform: translate(0, -1em) rotate(-45deg);
  }
  5% {
    transform: translate(0, -1em) rotate(-50deg);
  }
  20% {
    transform: translate(1em, -2em) rotate(47deg);
  }
  25% {
    transform: translate(1em, -2em) rotate(45deg);
  }
  30% {
    transform: translate(1em, -2em) rotate(40deg);
  }
  45% {
    transform: translate(2em, -3em) rotate(137deg);
  }
  50% {
    transform: translate(2em, -3em) rotate(135deg);
  }
  55% {
    transform: translate(2em, -3em) rotate(130deg);
  }
  70% {
    transform: translate(3em, -4em) rotate(217deg);
  }
  75% {
    transform: translate(3em, -4em) rotate(220deg);
  }
  100% {
    transform: translate(0, -1em) rotate(-225deg);
  }
</style>
</head>
<body onLoad="setTimeout('loading()',2500)">
	<div id="a" style="visibility: visible;">
	 <div id="loader">
	  <div id="box"></div>
	  <div id="hill"></div>
	 </div>
	</div>
	<div id="b" name="b" style="visibility:hidden;">
	<nav class="navbar navbar-inverse" style="border-color: white">
		<div class="container-fluid">
		  <div class="navbar-header">
			<a class="navbar-brand" href="#"><img alt="" src="../resources/images/logo.png" style="width:30px; height:30px"></a>
		  </div>
		  <ul class="nav navbar-nav">
		  	<li id="nav_pro" class="active"  data-toggle="modal" data-target="#pro_info"><a href="#">Make Problem?</a></li>
		  	<li id="nav_ans"  data-toggle="modal" data-target="#ans_info"><a href="#">Answer List?</a></li>
		  	<li id="nav_com"  data-toggle="modal" data-target="#com_info"><a href="#">Make Commentary?</a></li>
		  </ul>
		  <ul class="nav navbar-nav navbar-right">
		  	<li><a class="navbar-brand" href="./problemList">List<span class="glyphicon glyphicon-list"></span></a></li>
		  </ul>
		</div>
	</nav>

<div class="container-fluid text-center">
	<div class="row content">
	  <div class="col-sm-2 sidenav">
			

		</div>
			<div class="col-sm-8 text-center">
		<div class="container">
		
	<h3>PNUM:${view.pnum}</h3>
	<h3>TYPE:${view.type}</h3>
	<h3>CHAPTER:${view.chapter}</h3>
	<h3>CHAPTER_M:${view.chapter_m}</h3>
	<h3>ANSWER:${view.answer}</h3>
	<h3>Problem:
	</h3>
		<c:forEach begin="0" end="${contents.size()}" items="${contents}" var="i" varStatus="index">
			<c:if test="${index.index % 2 eq 0}">
				${i}
			</c:if>
			<c:if test="${index.index % 2 eq 1}">
			<img src="http://latex.codecogs.com/gif.latex?${i}"/>
			</c:if>
		</c:forEach>
	<h3>AnswerList:</h3>
	<div id="answerList">
	<c:forEach items="${answerList}" begin="0" end="${answerList.size()}" var="i" varStatus="y">
	${y.index+1}번&nbsp; &nbsp;&nbsp;&nbsp;<img src="http://latex.codecogs.com/gif.latex?${i}"/>&nbsp; &nbsp;&nbsp;&nbsp;
	</c:forEach>
	</div>
	<h3>Commentary: </h3>
	<c:forEach begin="0" end="${commentary.size()}" items="${commentary}" var="i" varStatus="index">
			<c:if test="${index.index % 2 eq 0}">
				${i}
			</c:if>
			<c:if test="${index.index % 2 eq 1}">
			<img src="http://latex.codecogs.com/gif.latex?${i}"/>
			</c:if>
		</c:forEach>
				<a href="#" class="boton" id="insert"> Make Problem! </a>
		</div>
			</div>
			<div class="col-sm-2 sidenav">
				<div class="well" id="well1">
					<h3 style="color:green">문제입력</h3>
				</div>
				<i id="nextIcon" class="fa fa-arrow-down" style="font-size:60px; color: green"></i>
				<div class="well" id="well2">
					<h3 style="color:green">정답입력</h3>
				</div>
				<i id="nextIcon2" class="fa fa-arrow-down" style="font-size:60px; color: green"></i>
				<div class="well" id="well3">
					<h3 style="color:green">해설입력</h3>
				</div>
				<i id="nextIcon3" class="fa fa-arrow-down" style="font-size:60px"></i>
				<div class="well" id="well4">
						<h3>${message}</h3>
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
          <p>1. 시작하시기전에 스페이스바를 한번 *꼭* 눌러주세요</p>
          <p>2. 문제입력시 한글과 수식은 같이 입력될수 없어, 구분점으로 시작과 끝을  * 으로 지어줘야합니다.</p>
          <p>3. *(수식)* 수식이 들어갈 내용에는 한글 입력하지 마세요.</p>
          <p>4. 식이 잘못되거나, * 안에 한글이 들어갈경우 미리보기가 제한됩니다.</p>
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
          <p>1. 시작하시기전에 스페이스바를 한번 *꼭* 눌러주세요</p>
          <p>2. 문제입력시 한글과 수식은 같이 입력될수 없어, 구분점으로 시작과 끝을  * 으로 지어줘야합니다.</p>
          <p>3. *(수식)* 수식이 들어갈 내용에는 한글 입력하지 마세요.</p>
          <p>4. 식이 잘못되거나, * 안에 한글이 들어갈경우 미리보기가 제한됩니다.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

</body>
</html>