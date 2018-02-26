<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<link href="/m1/resources/join.css" rel="stylesheet">
</head>
<body>
	<div class="login-center">
		<div id="logo-a"><div id="logo-m"></div> <div id="logo">MASS MATH</div></div>
		<div id="hd">
			<p>오직 너만을 위한</p>
			<p>인공지능 학습, 시작해볼까?</p>
		</div>
			<div class="facebook">
				<!-- 페이스북 -->

				<div class="fb-login-button" data-max-rows="1" data-size="large"
					data-button-type="login_with" data-show-faces="false"
					data-auto-logout-link="true" data-use-continue-as="true"
					scope="public_profile,email" onlogin="checkLoginState();"></div>

				<script>
					// SDK를 비동기적으로 호출
					(function(d, s, id) { 
						var js, fjs = d.getElementsByTagName(s)[0];
						if (d.getElementById(id))
							return;
						js = d.createElement(s);
						js.id = id;
						js.src = "//connect.facebook.net/ko_KR/sdk.js";
						fjs.parentNode.insertBefore(js, fjs);
					}(document, 'script', 'facebook-jssdk'));

					window.fbAsyncInit = function() {
						FB.init({
							appId : '1591748667546890',
							cookie : false, // 쿠키가 세션을 참조할 수 있도록 허용
							xfbml : true, // 소셜 플러그인이 있으면 처리
							version : 'v2.12' // 버전 2.1 사용
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
							document.getElementById('status').innerHTML = 'Please log '
									+ 'into this app.';
						} else {
							// 페이스북에 로그인이 되어있지 않다. 따라서, 앱에 로그인이 되어있는지 여부가 불확실하다.
							document.getElementById('status').innerHTML = 'Please log '
									+ 'into Facebook.';
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
								location.href = "./member/apiLogin?id="
										+ response.id + "&name="
										+ response.name + "&api=1";

							});
						});
					}
				</script>
			</div>

			<div class="kakao">
				<!-- 카카오톡 -->
				<a id="kakao-login-btn"></a> <a
					href="http://developers.kakao.com/logout"></a> 
					<!-- <input type="button" value="로그아웃" onclick="ktout()"> -->
				<script type='text/javascript'>
					// 사용할 앱의 JavaScript 키를 설정해 주세요.
					Kakao.init('80bc1cd77bbd75031f8f8ee90be76739');

					// 카카오 로그인 버튼을 생성합니다.
					Kakao.Auth
							.createLoginButton({
								container : '#kakao-login-btn',
								success : function(authObj) {
									// 로그인 성공시, API를 호출합니다.
									Kakao.API
											.request({
												url : '/v1/user/me',
												success : function(res) {
													alert(res.properties.nickname
															+ '님 환영합니다.');
													location.href = "./member/apiLogin?id="
															+ res.id
															+ "&name="
															+ res.properties.nickname
															+ "&api=0";
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
			</div>

			
			<div class="email-login">
				<c:if test="${empty member}">
				<div>
					<a id="email-join" href="./memberJoin">이메일 계정으로 시작</a>
				</div><br>
					<a href="./memberLogin">이미 회원이신가요? 로그인</a>
				</c:if>
				<c:if test="${not empty member}">
					<a href="./memberMyPage?id=${member.id}">My Page</a>
					<a href="./memberLogOut">Logout</a>
				</c:if>
				<p>이용약관/개인정보 취급방침</p>
			</div>
			
		
	</div>
</body>
</html>