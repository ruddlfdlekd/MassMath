<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<link href='https://fonts.googleapis.com/css?family=Montserrat:700' rel='stylesheet' type='text/css'>
  
<script type="text/javascript">

</script>
<style type="text/css">
div {
  width: 200px;
  height: 50px;
  background: #151515;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row wrap;
          flex-flow: row wrap;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  overflow: hidden;
}
button {
  font-family: 'Space Mono', monospace;
  letter-spacing: 1px;
  background: none;
  color: white;
  position: relative;
  outline: none;
  border: none;
  height: 50px;
  width: 190px;
  font-size: 14px;
  z-index: 2;
  -webkit-transition: .01s .23s ease-out all;
  transition: .01s .23s ease-out all;
  overflow: hidden;
}
button:before {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  height: 100%;
  width: 55%;
  background: #202020;
  z-index: -1;
  -webkit-transition: .3s ease-in all;
  transition: .3s ease-in all;
}
button:after {
  content: '';
  position: absolute;
  left: -5%;
  top: 5%;
  height: 90%;
  width: 5%;
  background: white;
  z-index: -1;
  -webkit-transition: .4s .02s ease-in all;
  transition: .4s .02s ease-in all;
}
button:hover {
  cursor: pointer;
  color: transparent;
}
button:hover:before {
  left: 100%;
  width: 25%;
}
button:hover:after {
  left: 100%;
  width: 70%;
}
button:hover .icon-right.after:after {
  left: -80px;
  color: white;
  -webkit-transition: .2s .2s ease all;
  transition: .2s .2s ease all;
}
button:hover .icon-right.after:before {
  left: -104px;
  top: 14px;
  opacity: 0.2;
  color: white;
}

.icon-right {
  position: absolute;
  top: 0;
  right: 0;
}
.icon-right:after {
  font-family: "FontAwesome";
  content: '\2192';
  font-size: 24px;
  display: inline-block;
  position: relative;
  top: 26px;
  -webkit-transform: translate3D(0, -50%, 0);
          transform: translate3D(0, -50%, 0);
}
.icon-right.after:after {
  left: -250px;
  color: black;	
  -webkit-transition: .15s .25s ease left, .5s .05s ease color;
  transition: .15s .25s ease left, .5s .05s ease color;
}
.icon-right.after:before {
  content: 'Explore';
  position: absolute;
  left: -230px;
  top: 14px;
  opacity: 0;
  -webkit-transition: .2s ease-in all;
  transition: .2s ease-in all;
}
</style>
</head>
<body>
<div>
<button class="explore">Explore<span class="icon-right"></span><span class="icon-right after"></span></button>
</div>
 
</body>
</html>