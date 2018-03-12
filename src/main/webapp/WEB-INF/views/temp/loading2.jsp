<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function loading() {
	$("#a").css("display", "none");
	b.style.visibility="visible";
	$("html").css("background-color","white");
	$("body").css("background-color","white");
}
</script>
<style type="text/css">
	*, *:before, *:after {
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
}

body {
  background: #455a64;
}

#a .container {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  -webkit-transform-style: preserve-3d;
          transform-style: preserve-3d;
  -webkit-perspective: 2000px;
          perspective: 2000px;
  -webkit-transform: rotateX(-30deg) rotateY(-45deg);
          transform: rotateX(-30deg) rotateY(-45deg);
}

.holder {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  -webkit-transform-style: preserve-3d;
          transform-style: preserve-3d;
  -webkit-transform: translate3d(0em, 3em, 1.5em);
          transform: translate3d(0em, 3em, 1.5em);
}
.holder:last-child {
  -webkit-transform: rotateY(-90deg) rotateX(90deg) translate3d(0, 3em, 1.5em);
          transform: rotateY(-90deg) rotateX(90deg) translate3d(0, 3em, 1.5em);
}
.holder:first-child {
  -webkit-transform: rotateZ(-90deg) rotateX(-90deg) translate3d(0, 3em, 1.5em);
          transform: rotateZ(-90deg) rotateX(-90deg) translate3d(0, 3em, 1.5em);
}
.holder:nth-child(1) .box {
  background-color: #1FBCD3;
}
.holder:nth-child(1) .box:before {
  background-color: #126d7a;
}
.holder:nth-child(1) .box:after {
  background-color: #1894a7;
}
.holder:nth-child(2) .box {
  background-color: #CBE2B4;
}
.holder:nth-child(2) .box:before {
  background-color: #98c66a;
}
.holder:nth-child(2) .box:after {
  background-color: #b2d48f;
}
.holder:nth-child(3) .box {
  background-color: #F6B6CA;
}
.holder:nth-child(3) .box:before {
  background-color: #eb5b88;
}
.holder:nth-child(3) .box:after {
  background-color: #f089a9;
}

.box {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  -webkit-transform-style: preserve-3d;
          transform-style: preserve-3d;
  -webkit-animation: ani-box 6s infinite;
          animation: ani-box 6s infinite;
  width: 3em;
  height: 3em;
}
.box:before, .box:after {
  position: absolute;
  width: 100%;
  height: 100%;
  content: "";
}
.box:before {
  left: 100%;
  bottom: 0;
  -webkit-transform: rotateY(90deg);
          transform: rotateY(90deg);
  -webkit-transform-origin: 0 50%;
          transform-origin: 0 50%;
}
.box:after {
  left: 0;
  bottom: 100%;
  -webkit-transform: rotateX(90deg);
          transform: rotateX(90deg);
  -webkit-transform-origin: 0 100%;
          transform-origin: 0 100%;
}

@-webkit-keyframes ani-box {
  8.33% {
    -webkit-transform: translate3d(-50%, -50%, 0) scaleZ(2);
            transform: translate3d(-50%, -50%, 0) scaleZ(2);
  }
  16.7% {
    -webkit-transform: translate3d(-50%, -50%, -3em) scaleZ(1);
            transform: translate3d(-50%, -50%, -3em) scaleZ(1);
  }
  25% {
    -webkit-transform: translate3d(-50%, -100%, -3em) scaleY(2);
            transform: translate3d(-50%, -100%, -3em) scaleY(2);
  }
  33.3% {
    -webkit-transform: translate3d(-50%, -150%, -3em) scaleY(1);
            transform: translate3d(-50%, -150%, -3em) scaleY(1);
  }
  41.7% {
    -webkit-transform: translate3d(-100%, -150%, -3em) scaleX(2);
            transform: translate3d(-100%, -150%, -3em) scaleX(2);
  }
  50% {
    -webkit-transform: translate3d(-150%, -150%, -3em) scaleX(1);
            transform: translate3d(-150%, -150%, -3em) scaleX(1);
  }
  58.3% {
    -webkit-transform: translate3d(-150%, -150%, 0) scaleZ(2);
            transform: translate3d(-150%, -150%, 0) scaleZ(2);
  }
  66.7% {
    -webkit-transform: translate3d(-150%, -150%, 0) scaleZ(1);
            transform: translate3d(-150%, -150%, 0) scaleZ(1);
  }
  75% {
    -webkit-transform: translate3d(-150%, -100%, 0) scaleY(2);
            transform: translate3d(-150%, -100%, 0) scaleY(2);
  }
  83.3% {
    -webkit-transform: translate3d(-150%, -50%, 0) scaleY(1);
            transform: translate3d(-150%, -50%, 0) scaleY(1);
  }
  91.7% {
    -webkit-transform: translate3d(-100%, -50%, 0) scaleX(2);
            transform: translate3d(-100%, -50%, 0) scaleX(2);
  }
  100% {
    -webkit-transform: translate3d(-50%, -50%, 0) scaleX(1);
            transform: translate3d(-50%, -50%, 0) scaleX(1);
  }
}

@keyframes ani-box {
  8.33% {
    -webkit-transform: translate3d(-50%, -50%, 0) scaleZ(2);
            transform: translate3d(-50%, -50%, 0) scaleZ(2);
  }
  16.7% {
    -webkit-transform: translate3d(-50%, -50%, -3em) scaleZ(1);
            transform: translate3d(-50%, -50%, -3em) scaleZ(1);
  }
  25% {
    -webkit-transform: translate3d(-50%, -100%, -3em) scaleY(2);
            transform: translate3d(-50%, -100%, -3em) scaleY(2);
  }
  33.3% {
    -webkit-transform: translate3d(-50%, -150%, -3em) scaleY(1);
            transform: translate3d(-50%, -150%, -3em) scaleY(1);
  }
  41.7% {
    -webkit-transform: translate3d(-100%, -150%, -3em) scaleX(2);
            transform: translate3d(-100%, -150%, -3em) scaleX(2);
  }
  50% {
    -webkit-transform: translate3d(-150%, -150%, -3em) scaleX(1);
            transform: translate3d(-150%, -150%, -3em) scaleX(1);
  }
  58.3% {
    -webkit-transform: translate3d(-150%, -150%, 0) scaleZ(2);
            transform: translate3d(-150%, -150%, 0) scaleZ(2);
  }
  66.7% {
    -webkit-transform: translate3d(-150%, -150%, 0) scaleZ(1);
            transform: translate3d(-150%, -150%, 0) scaleZ(1);
  }
  75% {
    -webkit-transform: translate3d(-150%, -100%, 0) scaleY(2);
            transform: translate3d(-150%, -100%, 0) scaleY(2);
  }
  83.3% {
    -webkit-transform: translate3d(-150%, -50%, 0) scaleY(1);
            transform: translate3d(-150%, -50%, 0) scaleY(1);
  }
  91.7% {
    -webkit-transform: translate3d(-100%, -50%, 0) scaleX(2);
            transform: translate3d(-100%, -50%, 0) scaleX(2);
  }
  100% {
    -webkit-transform: translate3d(-50%, -50%, 0) scaleX(1);
            transform: translate3d(-50%, -50%, 0) scaleX(1);
  }
}
</style>
</head>
<body onLoad="setTimeout('loading()',2500)">
<div id="a" style="visibility: visible;">
	<div class="container">
  <div class="holder">
    <div class="box"></div>
  </div>
  <div class="holder">
    <div class="box"></div>
  </div>
  <div class="holder">
    <div class="box"></div>
  </div>
</div>
</div>
</body>
</html>