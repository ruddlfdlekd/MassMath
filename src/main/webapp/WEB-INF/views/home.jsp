<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

   <title>Home</title>
   <link rel="stylesheet" href="/m1/resources/style.css">
</head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
  $(function(){
      $("#go_btn").click(function(){
            
         location.href="./problem/problemList";
      })
      
      $("#make_btn").click(function(){
         window.open("./problem/makeProblem","","top=100px, left=200px, width=900px, heigth=600px");         
      })
   });
  </script>

<body>
<h1>
   Hello world!  
</h1>
   <a href="./myNote/myNoteList?id=${member.id}">MY NOTE</a>
   
   <form action="./myNote/myNoteInsert" method="get">
      <p>id : <input type="text" name="id" value="jw"></p>
      <p>pnum : <input type="number" name="pnum" value="100"></p>
      <p>my_a : <input type="text" name="my_answer" value="4"></p>
      <p>reason : <input type="text" name="reason" value="miss"></p>
      <button>등록</button>
   </form>
   <form action="./myNote/myNoteInsert" method="get">
      <p>id : <input type="text" name="id" value="jw"></p>
      <p>pnum : <input type="number" name="pnum" value="200"></p>
      <p>my_a : <input type="text" name="my_answer" value="4"></p>
      <p>reason : <input type="text" name="reason" value="wrong"></p>
      <button>등록</button>
   </form>
<P>  The time on the server is ${serverTime}. </P>
<hr>
<title>Home</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="/m1/resources/join.css" rel="stylesheet">
</head>
<body>

   
   <div id="logo">M MASS MATH</div>
   <div id="hd">
      <p>오직 너만을 위한</p>
      <p>인공지능 학습, 시작해볼까?</p>
   </div>
   
   
   <!-- 카카오톡 -->
   
   <a id="kakao-login-btn"></a>
   <a href="http://developers.kakao.com/logout"></a>
   <input type="button" value="로그아웃" onclick="ktout()">
   <script type='text/javascript'>
      // 사용할 앱의 JavaScript 키를 설정해 주세요.
      Kakao.init('80bc1cd77bbd75031f8f8ee90be76739');


      // 카카오 로그인 버튼을 생성합니다.
      Kakao.Auth.createLoginButton({
         container : '#kakao-login-btn',
         success : function (authObj) {
            // 로그인 성공시, API를 호출합니다.
            Kakao.API.request({
               url : '/v1/user/me',
               success : function(res) {
            	   alert(res.properties.nickname + '님 환영합니다.');
                  location.href = "./member/apiLogin?id=" + res.id + "&name=" + res.properties.nickname + "&api=0";
               },
               fail : function(error) {
                  alert("왜 실패?");
               }
            }); 
         },
         fail : function(err) {
            alert("아예 실패");
         } 
      });
      

      function ktout() {
         Kakao.Auth.logout();
         Kakao.Auth.loginForm(function() {
            
            setTimeout(function() {
               location.href = "http://localhost/m1/"
            }, 1000);
         });
      }
   </script>
   
   
   
   <!-- 페이스북 -->
   
   <div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false"
            data-auto-logout-link="true" data-use-continue-as="true" scope="public_profile,email" onlogin="checkLoginState();"></div>

   <script>
     // SDK를 비동기적으로 호출
     (function(d, s, id) {
       var js, fjs = d.getElementsByTagName(s)[0];
       if (d.getElementById(id)) return;
       js = d.createElement(s); js.id = id;
       js.src = "//connect.facebook.net/ko_KR/sdk.js";
       fjs.parentNode.insertBefore(js, fjs);
     }(document, 'script', 'facebook-jssdk'));
   
     window.fbAsyncInit = function() {
        FB.init({
          appId      : '1591748667546890',
          cookie     : false,  // 쿠키가 세션을 참조할 수 있도록 허용
          xfbml      : true,  // 소셜 플러그인이 있으면 처리
          version    : 'v2.12' // 버전 2.1 사용
        });
     };
 
     function checkLoginState() {
          FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
          });
        }
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
   
    console.log('statusChangeCallback');
    console.log(response);
    // response 객체는 현재 로그인 상태를 나타내는 정보를 보여준다. 
    // 앱에서 현재의 로그인 상태에 따라 동작하면 된다.
    // FB.getLoginStatus().의 레퍼런스에서 더 자세한 내용이 참조 가능하다.
   if (response.status === 'connected') {
      // 페이스북을 통해서 로그인이 되어있다.
       testAPI();
     
    } else if (response.status === 'not_authorized') {
      // 페이스북에는 로그인 했으나, 앱에는 로그인이 되어있지 않다.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      // 페이스북에 로그인이 되어있지 않다. 따라서, 앱에 로그인이 되어있는지 여부가 불확실하다.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }

  // 이 함수는 누군가가 로그인 버튼에 대한 처리가 끝났을 때 호출된다.
  // onlogin 핸들러를 아래와 같이 첨부하면 된다.
 



  // 자바스크립트 SDK를 초기화 했으니, FB.getLoginStatus()를 호출한다.
  //.이 함수는 이 페이지의 사용자가 현재 로그인 되어있는 상태 3가지 중 하나를 콜백에 리턴한다.
  // 그 3가지 상태는 아래와 같다.
  // 1. 앱과 페이스북에 로그인 되어있다. ('connected')
  // 2. 페이스북에 로그인되어있으나, 앱에는 로그인이 되어있지 않다. ('not_authorized')
  // 3. 페이스북에 로그인이 되어있지 않아서 앱에 로그인이 되었는지 불확실하다.
  //
  // 위에서 구현한 콜백 함수는 이 3가지를 다루도록 되어있다.

   

     // 로그인이 성공한 다음에는 간단한 그래프API를 호출한다.
     // 이 호출은 statusChangeCallback()에서 이루어진다.
    
       

      function testAPI() {
         FB.api('/me', function(response) {
            FB.api('/me', function(user) {
               alert(response.name + '님 환영합니다.');
               location.href = "./member/apiLogin?id=" + response.id + "&name=" + response.name + "&api=1";
               
            });
         });
      }
   </script>


   <c:if test="${empty member}">
      <a href="./member/memberJoin">Join</a>
      <a href="./member/memberLogin">Login</a>
   </c:if>
   <c:if test="${not empty member}">
      <a href="./member/memberMyPage?id=${member.id}">My Page</a>
      <a href="./member/memberLogOut">Logout</a>
   </c:if>
<hr>
<a href="./problem/test1">test</a>
<a href="./notice/noticeList">Notice</a>
<a href="./qna/qnaList">Qna</a>
<button id="go_btn">GoList</button>
<button id="make_btn">GoMake</button>
<a href="./problem/makeProblem">Make Problem<a>
<a href="./problem/problemView">select One</a>
<a href="study/studyPage">학습하기</a>
 <div>
 


 </div>




</body>
</html>