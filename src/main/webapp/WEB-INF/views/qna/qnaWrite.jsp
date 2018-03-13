<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(function () {
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
    //전송버튼
    $("#save").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
        //폼 submit
        $("#frm").submit();
    });
    
	var i = 0;
	$("#file-btn").click(function() {
		var fileBox = "<div><input class=\"select-btn\" type=\"file\" name=\"file\"><span class=\"close\">X</span></div>";
		if(i<5){
			$("#result").append(fileBox);
			i++;
		}
	})
	
	$("#result").on("click", ".close", function() {
		$(this).parent().remove();
		i--;
	});
});
</script>
<style type="text/css">
	.x{
		cursor: pointer;
	}
	#contents{
		width: 99.5%;
	}
</style>
</head>
<body>
<%@ include file="../temp/header.jsp"%>



<div class="container">
	<div class="row">
      <div class="col-md-10 col-md-offset-1">
        <div class="well well-sm" style="background-color: white;">
          <form class="form-horizontal" action="qnaWrite" method="post" name="frm">
          <fieldset>
            <legend class="text-center">질문하기</legend>
    
            <!-- Name input-->
            <div class="form-group">
              <div class="col-md-12">
                <input id="title" name="title" type="text" placeholder="제목을 입력하세요" class="form-control">
              </div>
            </div>
    
            <!-- Email input-->
            <div class="form-group">
              <div class="col-md-12">
                <input id="writer" name="writer" type="text" placeholder="이름을 입력하세요" class="form-control">
              </div>
            </div>  
    
            <!-- Message body -->
            <div class="form-group">
              <div class="col-md-12">
              	<div>
              	<textarea style="background-color: white;" class="form-control" rows="10" cols="" name="contents" id="contents" placeholder="내용을 입력하세요"></textarea>
              	</div>
              </div>
            </div>
    
            <!-- Form actions -->
            <div class="form-group">
              <div class="col-md-12 text-right">
                <button type="submit" id="save" class="btn btn-primary">작성완료</button>
              </div>
            </div>
          </fieldset>
          </form>
        </div>
      </div>
	</div>
</div>
<%@ include file="../temp/footer.jsp"%>
</body>
</html>