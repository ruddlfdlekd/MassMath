<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>NUM</th>
						<th>Title</th>
						<th>Writer</th>
						<th>Date</th>
						<th>Hit</th>
					</tr>
				</thead>
				<tbody>
					<td>${view.num}</td>
					<td>${view.title}</td>
					<td>${view.writer}님</td>
					<td>${view.reg_date}</td>
					<td>${view.hit}</td>
				</tbody>
				</table>
		</div>
	</div>
			
	
		<div class="container">
			${view.contents}
		</div>
	
		<a href="${board}Update?num=${view.num}">Update</a>
		<a href="${board}Delete?num=${view.num}">Delete</a>


</body>
</html>