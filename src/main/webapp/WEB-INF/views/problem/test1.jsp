<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>

<html>

<head>

<meta http-equiv="Content-Type"content="text/html; charset=utf-8" />

<script type="text/javascript"src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

<script>
function add_text() {
 document.all.ta.focus();
 txt = "안녕하세요";
 cRange = document.selection.createRange();
 cRange.text = txt;
}
</script>

 

<textarea name="ta" rows="10" cols="20">
우히히히 멋진놈입니다.
</textarea>
<input type="button" value="Add" onClick="add_text()">
[출처] Textarea 안에서 현재 커서 위치에 글 추가하기|작성자 realuv

</html>


