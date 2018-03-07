<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="../resources/css/problemView.css">
<script type="text/javascript">
$(function(){
$(".boton").wrapInner('<div class=botontext></div>');
    
    $(".botontext").clone().appendTo( $(".boton") );
    
    $(".boton").append('<span class="twist"></span><span class="twist"></span><span class="twist"></span><span class="twist"></span>');
    $(".twist").css("width", "25%").css("width", "+=3px");
 	
 	//전역변수
    var obj = [];              
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder: "contents",
        sSkinURI: "../resources/SE2/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
        }
    });
    //전송버튼
    $("#btn").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
        //폼 submit
        if($("#title").val().length == 0){
        	alert("제목을 입력해주세요.");
        }else if($("#contents").val().length == 0){
        	alert("내용을 입력해주세요.");
        }else{
        	
        $("#frm").submit();
        }
    });

});
</script>
<title>Insert title here</title>
</head>
<%@ include file="../temp/header.jsp"%>
<body>
	<section style="width: 100%; height: 900px; padding:100px;">
		<div class="container">
			
			<form action="./noticeWrite" method="post" id="frm"
				enctype="multipart/form-data">
				<div class="container">
					<table class="table-responsive" style="margin-left: 38%;">
						<tr>
							<th>Email</th>
							<th>Writer</th>
						</tr>
						<tr>
							<th style="width:300px;">${view.email}</th>
							<th>${view.writer}</th>
						</tr>
					</table>
				</div>
				<div class="container" style="margin-top:30px;">
				<input type="text" name="title" id="title" value="${view.title}"
								placeholder="Title Insert" style="width:700px; font-size: 35px; font-weight: bold; margin-left: 20%;">
				<input type="hidden" readonly="readonly" name="email"
								value="${view.email}">
				<input type="hidden" readonly="readonly" name="writer"
								id="writer" value="${view.writer}">
				<input type="hidden" value="${view.num}">
				<div style="margin-left: 20%; margin-top: 20px;">				
					<textarea rows="10" cols="100" name="contents" id="contents">${view.contents}</textarea>
				</div>
				

				<a href="#" class="boton" id="btn" style="margin-top:50px"> Update Notice! </a>
				
				</div>
			</form>

		</div>
	</section>



</body>
<%@ include file="../temp/footer.jsp"%>
</html>