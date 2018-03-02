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
<script>
function loading() {
$("#a").css("display", "none");
b.style.visibility="visible";
}
</script>
<script language='javascript' type='text/javascript'>
 	function doGetCaretPosition (ctrl){
    var CaretPos = 0;
    // IE Support
    if (document.selection)
    {
        ctrl.focus ();
        var Sel = document.selection.createRange ();
        Sel.moveStart ('character', -ctrl.value.length);
        CaretPos = Sel.text.length;
    }
    // Firefox support
    else if (ctrl.selectionStart || ctrl.selectionStart == '0')
    {
        CaretPos = ctrl.selectionStart;
    }
    return (CaretPos);
}


function setCaretPosition(ctrl, pos)
{
    if(ctrl.setSelectionRange)
    {
        ctrl.focus();
        ctrl.setSelectionRange(pos,pos);
    }
    else if (ctrl.createTextRange)
    {
        var range = ctrl.createTextRange();
        range.collapse(true);
        range.moveEnd('character', pos);
        range.moveStart('character', pos);
        range.select();
    }
}

function process()
{
    var no = document.getElementById('no').value;
    setCaretPosition(document.getElementById('get'),no);
} 


	
	

</script>
    </head>
    <body onLoad="setTimeout('loading()',500)">
    <div id="a" name="a" style="visibility:visible;">
<img alt="" src="../resources/images/test.gif">
</div>
    <div id="b" name="b" style="visibility:hidden; width:200px; height:100px;">
    	<button id="btn" value="이것이된다면">btn</button>
    	<li id="a">가나다라</li>
        <textarea id="get" name="get" rows="5" cols="31">Please write some integer in the textbox given below and press "Set Position" button. Press "Get Position" button to get the position of cursor.</textarea>
        <br>

        Enter Caret Position: <input type="text" id="no" size="1" /><input type="button" onclick="process();" value="Set Position">
        <BR>
        <input type="button" onclick="alert(doGetCaretPosition(document.getElementById('get')));"
            value="Get Position">

            </div>
    </body>
</html>