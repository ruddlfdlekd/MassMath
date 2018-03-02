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
		$("#insert").click(function(){
			location.href="./result2";
		})
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
			<div class="icon_div">
				<div class="sik" title="{x}^{a}"><img src="http://latex.codecogs.com/gif.latex?{x}^{a}"/></div>
				<div class="sik" title="{x}_{a}"><img src="http://latex.codecogs.com/gif.latex?{x}_{a}"/></div>
				<div class="sik" title="\frac{a}{b}"><img src="http://latex.codecogs.com/gif.latex?\frac{a}{b}"/></div>
				<div class="sik" title="{x_{a}}^{b}"><img src="http://latex.codecogs.com/gif.latex?{x_{a}}^{b}"/></div>
				<div class="sik" title="x_{a}^{b}"><img src="http://latex.codecogs.com/gif.latex?x_{a}^{b}"/><br></div>
				<div class="sik" title="\lim_{x \to 0}"><img src="http://latex.codecogs.com/gif.latex?\lim_{x \to 0}"/></div>
			</div>
			<div class="icon_div">
				<div class="sik" title="\sqrt [n]{x}"><img src="http://latex.codecogs.com/gif.latex?\sqrt [n]{x}"/></div>
				<div class="sik" title="\int_{a}^{b}"><img src="http://latex.codecogs.com/gif.latex?\int_{a}^{b}"/></div>
				<div class="sik"  title="\left \{ contents\right contents\}"><img src="http://latex.codecogs.com/gif.latex?\left \{\right\}"/></div>
				<div class="sik"  title="\frac{a^2}{ax^2}"><img src="http://latex.codecogs.com/gif.latex?\frac{a^2}{ax^2}"/></div>
				<div class="sik" title="\alpha"><img src="http://latex.codecogs.com/gif.latex?\alpha"/></div>
				<div class="sik"  title="\beta"><img src="http://latex.codecogs.com/gif.latex?\beta"/></div>
			</div>
			<div class="icon_div">
				<div class="sik"  title="\gamma"><img src="http://latex.codecogs.com/gif.latex?\gamma"/></div>
				<div class="sik"  title="\sum"><img src="http://latex.codecogs.com/gif.latex?\sum"/></div>
				<div class="sik" title="\therefore "><img src="http://latex.codecogs.com/gif.latex?\therefore"/></div>
			</div>

		</div>
			<div class="col-sm-8 text-left">
			
	<h3>PNUM:${view.pnum}</h3>
	<h3>TYPE:${view.type}</h3>
	<h3>CHAPTER:${view.chapter}</h3>
	<h3>CHAPTER_M:${view.chapter_m}</h3>
	<h3>ANSWER:${view.answer}</h3>
	<h3>Contents:
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
				<button id="go_list">list</button> <button id="insert">Insert</button>
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
	
	
	

</body>
</html>