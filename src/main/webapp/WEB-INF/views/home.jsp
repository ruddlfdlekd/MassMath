<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>

	<h1>Hello world!</h1>


<!-- 
	<div class="snslogin_btn">
	<a href="#" onclick="facebookLogin();"><img src="/Global/Gbl_Design/Common/member/loginpage_fb.png" alt="페이스북 로그인" hspace="5" /></a>
	 <a href="#" onclick="kakaoLogin();"><img src="/Global/Gbl_Design/Common/member/loginpage_kakao.png" alt="카카오톡 로그인" hspace="5" /></a>
	 <a href="#" onclick="naverLogin();"><img src="/Global/Gbl_Design/Common/member/loginpage_naver.png" alt="네이버 로그인" hspace="5" /></a>
	 <a href="#" id="googleLogin"><img src="/Global/Gbl_Design/Common/member/loginpage_google.png" alt="구글 로그인" hspace="5"  /></a>
	 <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
	</div>
	
	<div class="snslogin_info" id="snsInfo" style="display:none">
	 <strong id="title"></strong><br/>
	 <p id="message"></p>
	 <p>
	  <a href="/Global/Gbl_Member/member_join_sns.asp?link_idx=1079"><span class="snslogin_b1">회원가입</span></a>      
	  <a href="/"><span class="snslogin_b3">취소</span></a>
	 <a href="#" onclick="FB.logout();">[facebook logout]</a><br>
	  <a href="#" onclick="Kakao.Auth.logout();">[kakao logout]</a><br>
	 
	 </p>
	</div>
	<fb:login-button width="200" scope="public_profile,email" size="small"></fb:login-button>
	
	페이스북  
	<script>
	  function epassUserCheck(email,type) {
	  $.ajax({   
	   url: "/login_check.asp",   
	   type: "post",  
	   //dataType: "html",  
	   async : false,
	   data: "email="+ email , 
	   success: function(data){        
	    rs = data.split("@#@");         
	    if(rs[0] == 'Y') {
	     location.href="http://dev-www.epasskorea.com/Global/Gbl_Include/login_Check.asp?UserID="+rs[2]+"&snsType=facebook"; 
	    } else {         
	     var msg = "비회원 또는 "+email+"로 가입된 일치하는 계정이 없습니다.";      
	     $("#snsInfo").find('#title').empty().append("※ "+type+" 인증완료!");
	     $("#snsInfo").find('#message').empty().append(msg).end().show();           
	    }
	   },
	   error:function(request,status,error){
	    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   }
	  });
	  }
	
	   window.fbAsyncInit = function() {
	  FB.init({
	    appId      : '1591748667546890',  // 앱 ID
	    status     : true,    // 로그인 상태를 확인
	   // cookie     : false,    // 쿠키허용
	    xfbml      : true     // parse XFBML
	  });           
	   };
	 
	   // Load the SDK Asynchronously
	   (function(d){
	   var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
	   if (d.getElementById(id)) {return;}
	   js = d.createElement('script'); js.id = id; js.async = true;
	   js.src = "//connect.facebook.net/ko_KR/all.js";
	   ref.parentNode.insertBefore(js, ref);
	    }(document));
	   
	   function facebookLogin() {
	    FB.login(function(response) {
	   FB.getLoginStatus(function(response) {   
	    statusChangeCallback(response);
	   });
	    }, {scope: 'public_profile,email'});
	   }
	
	   function statusChangeCallback(response) {
	   if (response.status === 'connected') {                 
	    FB.api('/me?fields=id,name,email', function(user) {
	     if (user) {
	      //console.log(JSON.stringify(user));
	      /*var image = document.getElementById('image');
	      image.src = 'http://graph.facebook.com/' + user.id + '/picture';
	      var name = document.getElementById('name');
	      name.innerHTML = user.name
	      var id = document.getElementById('id');
	      id.innerHTML = user.id 
	      var email = document.getElementById('email');
	      email.innerHTML = user.email        
	      //console.log(response.authResponse.accessToken);
	      */
	      epassUserCheck(user.email, '페이스북');
	     }
	    });      
	   } else if (response.status === 'not_authorized') {     
	   } else { }
	   }
	</script> 
 -->
 <!-- naver 
	 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
	<div id="naver_id_login" style="display:none;" ></div>
	<script> 
	 var naver_id_login = new naver_id_login("","http://dev-www.epasskorea.com/c_naver_login.html");
	    var state = naver_id_login.getUniqState();
	    naver_id_login.setButton("white", 2, 40);
	    naver_id_login.setDomain("http://dev-www.epasskorea.com");
	    naver_id_login.setState(state);
	    naver_id_login.setPopup();
	    naver_id_login.init_naver_id_login();
	
	 function naverLogin() {
	  $("#naver_id_login_anchor").click();
	 }
	
	 function naverCallback(email) { 
	  epassUserCheck(email,'네이버');
	    }
	 
	</script>
	-->
<!-- 구글 
	 <script src="</script'>https://apis.google.com/js/api:client.js"></script>
	<script>
	  var googleUser = {};
	  var startApp = function() {
	    gapi.load('auth2', function(){
	      // Retrieve the singleton for the GoogleAuth library and set up the client.
	      auth2 = gapi.auth2.init({
	        client_id: '',
	        cookiepolicy: 'single_host_origin',
	        // Request scopes in addition to 'profile' and 'email'
	        scope: 'profile email'
	      });
	      attachSignin(document.getElementById('googleLogin'));
	    });
	  };
	
	  function attachSignin(element) {   
	    auth2.attachClickHandler(element, {},
	  function(googleUser) {
	   var profile = googleUser.getBasicProfile();
	   console.log("Email: " + profile.getEmail());
	   epassUserCheck(profile.getEmail(),'구글');
	  }, function(error) {
	    //alert(JSON.stringify(error, undefined, 2));
	  });
	  }
	</script>
	<script>startApp();</script> 

-->







	<!-- 카카오톡 -->
	
	<a id="kakao-login-btn"></a>
	<!-- <a href="http://developers.kakao.com/logout"></a> -->
	<input type="button" value="로그아웃" onclick="ktout()">
	<script type='text/javascript'>
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('80bc1cd77bbd75031f8f8ee90be76739');

		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			persistAccessToken :false,
			persistRefreshToken :false,
			success : function(authObj){
			login();
				
			},
				/* function (authObj) {
				// 로그인 성공시, API를 호출합니다.
				Kakao.API.request({
					url : '/v1/user/me',
					success : function(res) {
						alert(res.properties.nickname + '님 환영합니다.');
						location.href = "./member/kakaoLogin?id=" + res.id + "&name=" + res.properties.nickname;
					},
					fail : function(error) {
						alert("왜 실패?");
					}
				}); 
			},*/
			fail : function(err) {
				alert("아예 실패");
			} 
		});
		
		$("#kakao-login-btn2").click(login);
		
		function login() {
			Kakao.Auth.loginForm(function(res) {
				alert(res.properties.nickname + '님 환영합니다.');
				location.href = "./member/kakaoLogin?id=" + res.id + "&name=" + res.properties.nickname;
				
			});
		}

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
	
	<script>
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
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '1591748667546890',
    cookie     : true,  // 쿠키가 세션을 참조할 수 있도록 허용
    xfbml      : true,  // 소셜 플러그인이 있으면 처리
    version    : 'v2.1' // 버전 2.1 사용
  });

  // 자바스크립트 SDK를 초기화 했으니, FB.getLoginStatus()를 호출한다.
  //.이 함수는 이 페이지의 사용자가 현재 로그인 되어있는 상태 3가지 중 하나를 콜백에 리턴한다.
  // 그 3가지 상태는 아래와 같다.
  // 1. 앱과 페이스북에 로그인 되어있다. ('connected')
  // 2. 페이스북에 로그인되어있으나, 앱에는 로그인이 되어있지 않다. ('not_authorized')
  // 3. 페이스북에 로그인이 되어있지 않아서 앱에 로그인이 되었는지 불확실하다.
  //
  // 위에서 구현한 콜백 함수는 이 3가지를 다루도록 되어있다.

    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });

  };

  // SDK를 비동기적으로 호출
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // 로그인이 성공한 다음에는 간단한 그래프API를 호출한다.
  // 이 호출은 statusChangeCallback()에서 이루어진다.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }
</script>

<!--
  아래는 소셜 플러그인으로 로그인 버튼을 넣는다.
  이 버튼은 자바스크립트 SDK에 그래픽 기반의 로그인 버튼을 넣어서 클릭시 FB.login() 함수를 실행하게 된다.
-->

<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>

<div id="status">
</div>
	
	
	
	
	

	<P>The time on the server is ${serverTime}.</P>

	<c:if test="${empty member}">
		<a href="./member/memberJoin">Join</a>
		<a href="./member/memberLogin">Login</a>
	</c:if>
	<c:if test="${not empty member}">
		<a href="./member/memberMyPage?id=${member.id}">My Page</a>
		<a href="./member/memberLogOut">Logout</a>
	</c:if>

</body>
</html>
