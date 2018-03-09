<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">

.panel.with-nav-tabs .panel-heading{
    padding: 5px 5px 0 5px;
}
.panel.with-nav-tabs .nav-tabs{
	border-bottom: none;
}
.panel.with-nav-tabs .nav-justified{
	margin-bottom: -1px;
}
/*** PANEL DEFAULT ***/
.with-nav-tabs.panel-default .nav-tabs > li > a,
.with-nav-tabs.panel-default .nav-tabs > li > a:hover,
.with-nav-tabs.panel-default .nav-tabs > li > a:focus {
    color: #777;
}
.with-nav-tabs.panel-default .nav-tabs > .open > a,
.with-nav-tabs.panel-default .nav-tabs > .open > a:hover,
.with-nav-tabs.panel-default .nav-tabs > .open > a:focus,
.with-nav-tabs.panel-default .nav-tabs > li > a:hover,
.with-nav-tabs.panel-default .nav-tabs > li > a:focus {
    color: #777;
	background-color: #ddd;
	border-color: transparent;
}
.with-nav-tabs.panel-default .nav-tabs > li.active > a,
.with-nav-tabs.panel-default .nav-tabs > li.active > a:hover,
.with-nav-tabs.panel-default .nav-tabs > li.active > a:focus {
	color: #555;
	background-color: #fff;
	border-color: #ddd;
	border-bottom-color: transparent;
}
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu {
    background-color: #f5f5f5;
    border-color: #ddd;
}
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > li > a {
    color: #777;   
}
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > li > a:hover,
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > li > a:focus {
    background-color: #ddd;
}
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > .active > a,
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > .active > a:hover,
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > .active > a:focus {
    color: #fff;
    background-color: #555;
}
</style>
<script type="text/javascript">
$(function() {
	$("#sidebar li").click(function() {
		$("#sidebar li").removeClass("active");
		$(this).addClass("active");
	});
});
</script>
</head>
<body>
<%@ include file="../temp/header.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-3">
        	<h4 class="text-center"><b>고등수학(상)</b></h4>
            <div id="sidebar" class="well sidebar-nav">
                  <h4>
                    <small><b>1 다항식</b></small>
                </h4>
                <ul class="nav nav-pills nav-stacked">
                    <li class="c"><a href="./studyView?chapter=1111">01.다항식의 연산</a></li>
                    <li class="c"><a href="./studyView?chapter=1121">02.항등식과 나머지정리</a></li>
                    <li class="c"><a href="./studyView?chapter=1131">03.인수분해</a></li>
                </ul>
                <h4>
                    <small><b>2 방정식과 부등식</b></small>
                </h4>
                <ul class="nav nav-pills nav-stacked">
                    <li class="c"><a href="./studyView?chapter=1211">04.복소수</a></li>
                    <li class="c"><a href="./studyView?chapter=1221">05.이차방정식</a></li>
                    <li class="c"><a href="./studyView?chapter=1231">06.이차방정식과 이차함수</a></li>
                    <li class="c"><a href="./studyView?chapter=1241">07.여러가지 방정식</a></li>
                    <li class="c"><a href="./studyView?chapter=1251">08.여러가지 부등식</a></li>
                </ul>
                <h4>
                    <small><b>3 도형의 방정식</b></small>
                </h4>
                <ul class="nav nav-pills nav-stacked">
                    <li class="c"><a href="./studyView?chapter=1311">10.평면좌표</a></li>
                    <li class="c"><a href="./studyView?chapter=1321">11.직선의 방정식</a></li>
                    <li class="c"><a href="./studyView?chapter=1331">12.원의 방정식</a></li>
                    <li class="c"><a href="./studyView?chapter=1341">13.도형의 이동</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-9" style="margin-top :40px;">
        	<div class="panel with-nav-tabs panel-default">
                <div class="panel-heading">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1default" data-toggle="tab">개념 학습</a></li>
                            <li><a href="#tab2default" data-toggle="tab">동영상 강의</a></li>
                        </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1default">
                        	chap.1 개념학습개념학습
						</div>
                        <div class="tab-pane fade" id="tab2default">
                        	<div class="embed-responsive embed-responsive-16by9">
								<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/P5l2heNKK_U"></iframe>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../temp/footer.jsp"%>
</body>
</html>