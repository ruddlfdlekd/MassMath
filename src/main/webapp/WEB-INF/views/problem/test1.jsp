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
input[type="checkbox"]{
  display: none;
  &+label{
    display: inline-block;
    width: 40px;
    height: 20px;
    position: relative;
    transition: 0.3s;
    margin: 0px 20px;
    box-sizing: border-box;
    &:after,&:before{
      content: '';
      display: block;
      position: absolute;
      left: 0px;
      top: 0px;
      width: 20px;
      height: 20px;
      transition: 0.3s;
      cursor: pointer;
    }
  }
}
#simple-3{
  &:checked+label{
    &.red{background: #ECA9A7;&:after{background: #D9534F;}}
    &.green{background: #AEDCAE;&:after{background: #5CB85C;}}
    &:after{
      left: calc(~'100% - 20px');
    }
  }
  &+label{
    background: #ddd;
    border-radius: 20px;
    box-shadow: 1px 1px 3px #aaa;
    &:after{
      background: #fff;
      border-radius: 50%;
      box-shadow: 1px 1px 3px #aaa;
    }
  }
}
</style>
</head>
<body>
<div style="width:1000px; height:1000px">

<input type="checkbox" id="simple-3">
  <label for="simple-3" class="green"></label>
</div>
</body>
</html>