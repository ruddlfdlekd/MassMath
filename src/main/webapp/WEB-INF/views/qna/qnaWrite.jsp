<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	//전역변수
    var obj = [];              
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder: "contents",
        sSkinURI: "../resources/SE2/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부
            bUseModeChanger : true,
        }
    });
    

 	$("#insert").click(function(){
 		if($("#title").val().length==0){
 			alert("필수입력");
 		}else{
 			//id가 smarteditor인 textarea에 에디터에서 대입
	        obj.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
	        //폼 submit
	        frm.submit();
	        
 			
 		}
 	});
 	

});
</script>
<style type="text/css">
	.x{
		cursor: pointer;
	}
</style>
</head>
<body>
	<h1>QNA</h1>
	<form action="./qnaWrite" name="frm" method="post" enctype="multipart/form-data">
		<p>Email  : <input type="text" name="email"></p>
		<p>Writer : <input type="text" name="writer"></p>
		<p>Title  : <input type="text" name="title" id="title"></p>
		<p>Contents : <textarea rows="" cols="" name="contents" id="contents"></textarea>
		<input type="button" value="TEST" id="insert">
	</form>
		
	

</body>
</html>