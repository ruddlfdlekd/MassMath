<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
	
	var search = $("#search").val();
	var kind = $("#kind").val();
	var curPage = $("#curPage").val();
	
	$.ajax({
		type:"GET",
		url: "./listAjax",
		data: {
			search:search,
			kind:kind,
			curPage:curPage
		},
		success : function(data){
			$("#listView").html(data);
		}
	})
		
	
	$("#menu a").click(function(){
		var a=$(this).html();
		$(this).html($("#btn").val());
		$("#kind").val(a);
	});
	
	$("#listView").on("click","#update",function(){
		var pnum=$("#pnum").val();
		var contents=$("#contents").val();
		var chapter=$("#chapter").val();
		var chapter_m=$("#chapter_m").val();
		var answer=$("#answer").val();
		var answerlist=$("#answerlist").val();
		var commentary=$("#commentary").val();
		var type=$("#type").val();
		
		//기호가 들어간 문자열을 파라미터로 받을수 있게 인코딩 작업
		contents = encodeURIComponent(contents);
		answerlist = encodeURIComponent(answerlist);
		commentary = encodeURIComponent(commentary);
		
		window.open("/m1/problem/problemUpdate?pnum="+pnum+"&&contents="+contents+"&&chapter="+chapter+"&&chapter_m="+chapter_m
				+"&&answer="+answer+"&&answerlist="+answerlist+"&&commentary="+commentary+"&&type="+type
				,"","top=100px, left=200px, width=70%, heigth=50%");
	});
	
	$("#listView").on("click",".td_search",function(){
		var pnum=$(this).attr("title");
		$.ajax({
			type:"GET",
			url: "./problemView",
			data:{
				pnum:pnum
			},
			success : function(data){
				$("#listView").html(data);
			}
		});
		
	});
	$("#listView").on("click","#insert_p",function(){
		window.open("./result2","","top=100px, left=200px, width=600px, heigth=600px");
	})
	
	$("#listView").on("click",".page",function(){
		$('html, body').animate({scrollTop:0}, 1500);
		var cur=$(this).attr("title");
		var kind = $("#kind").val();
		var search = $("#search").val();
	
		$.ajax({
			type:"GET",
			url: "./listAjax",
			data: {
				search:search,
				kind:kind,
				curPage:cur
			},
			success : function(data){
				$("#listView").html(data);
			}
		})
		
	});
	$("#listView").on("click","#answer_check",function(){
		$("#answer").css("display","inline-block");
	})
	
	$("#search").keyup(function(){
		var search = $(this).val();
		var kind = $("#kind").val();
		var curPage = $("#curPage").val();
		
		$.ajax({
			type:"GET",
			url: "./listAjax",
			data: {
				search:search,
				kind:kind,
				curPage:curPage
			},
			success : function(data){
				$("#listView").html(data);
			}
		})
	})
	
})
</script>
<style type="text/css">
	
	.page{
		cursor: pointer;
	}
	#search{
		margin: 0 auto;
		float: left;
	}
	#kind{
		float: left;
	}
	#menu{
		float: left;
	}
	#menu_hd{
		padding: 15px;
		width:990px;
		position: relative;
		z-index: 999;
	}
	#logo{
		width:150px;
		height:100px;
		float:left;
	}
</style>
</head>
<body onLoad="setTimeout('loading()',1000)">
	
	  <div id="menu_hd" class="container">
	  	<div id="logo"><img alt="" src="../resources/images/logo.png"></div>
			<input type="hidden" id="curPage" name="curPage" value="1">
		    <input type="text" id="search" name="search" style="height:100px; width:630px; font-size: 35px; font-weight: bold;">
		<div class="btn-group">
		    <input id="kind" type="button" class="btn btn-primary" name="kind" value="all" style="width:100px; height: 100px;">	
		    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
		      <span class="caret"></span>
		    </button>
		    <ul id="menu" class="dropdown-menu" role="menu">
		      <li><a href="#">all</a></li>
		      <li><a href="#">chapter</a></li>
		      <li><a href="#">chapter_m</a></li>
		      <li><a href="#">chapter_s</a></li>
		      <li><a href="#">type</a></li>
		      <li><a href="#">Percentage</a></li>
		    </ul>
		  </div>
		</div>
 				 <div id="a" name="a" style="visibility: visible; margin-left: 30%;">
					<img alt="" src="../resources/images/sandclock.gif">
				</div>
  <div id="b" name="b" style="visibility:hidden;">	
  	<div id="listView">
  	</div>
  </div>
  
  



</body>
</html>