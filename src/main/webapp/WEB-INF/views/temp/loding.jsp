<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/m1/resources/css/mainLoding.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
function loading() {
	$("#a").css("display", "none");
	b.style.visibility="visible";
	$("html").css("background-color","#49aee4");
	$("body").css("background-color","#49aee4");
}
</script>
</head>
<body onLoad="setTimeout('loading()',2500)">
	<div id="a" style="visibility: visible;">
		<div class="bookshelf_wrapper">
			<ul class="books_list">
				<li class="book_item first"></li>
				<li class="book_item second"></li>
				<li class="book_item third"></li>
				<li class="book_item fourth"></li>
				<li class="book_item fifth"></li>
				<li class="book_item sixth"></li>
			</ul>
			<div class="shelf"></div>
		</div>

	</div>
</body>
</html>