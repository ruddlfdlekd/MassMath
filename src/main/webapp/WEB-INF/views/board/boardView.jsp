<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../resources/css/problemView.css">
  <script type="text/javascript">
  	$(function(){
  		$(".boton").wrapInner('<div class=botontext></div>');
  	    
  	    $(".botontext").clone().appendTo( $(".boton") );
  	    
  	    $(".boton").append('<span class="twist"></span><span class="twist"></span><span class="twist"></span><span class="twist"></span>');
  	    $(".twist").css("width", "25%").css("width", "+=3px");
  	    
  		$("#update").click(function(){
  			location.href="noticeUpdate?num=${view.num}";
  		});
		$("#delete").click(function(){
  			location.href="noticeDelete?num=${view.num}";
  		});
  	});
  </script>
<title>Mass Math</title>
<style>
	#notice_section{
		width:100%;
		height:900px;
		padding: 100px;
	}
</style>
</head>
<%@ include file="../temp/header.jsp"%>
<body>
	<section>
		<div id="notice_section">
			<div class="container">
			 <div class="container-fluid text-center">
				<div class="jumbotron" style="background-color: white;">
				 <h2>${view.title}</h2>
				</div>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th>NUM</th>
								<th>Writer</th>
								<th>Date</th>
								<th>Hit</th>
							</tr>
						</thead>
						<tbody>
							<td>${view.num}</td>
							<td>${view.writer}님</td>
							<td>${view.reg_date}</td>
							<td>${view.hit}</td>
						</tbody>
					</table>
				</div>
			 </div>

				
				<div class="container" style="text-align: center">
				${view.contents}
				</div>
				<div>
				<a href="./noticeList" class="boton" id="btn" style="margin-top:50px"> List Notice! </a>
				 <c:if test="${member.id eq 'admin@admin'}">
				 <div style="margin-left: 38%; margin-top: 100px;">
					 <button class="btn btn-primary" id="update">Update</button>
					 <button class="btn btn-primary" id="delete" style="margin-left:150px;">Delete</button>				
				 </div>
				</c:if>
				</div>
			</div>
		</div>
	</section>
<%@ include file="../temp/footer.jsp"%>
</body>
</html>