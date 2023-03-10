<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>최강선생 | 로그인 페이지</title>
	<script src="js/httpRequest.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
	<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script> --> 
	
	
	<style>
		@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
		* {
			font-family: 'Noto Sans KR', sans-serif;
			margin:0;
			padding:0;
		}
		
		
		html {
		  height: 100%;
		}
		body {
		  margin:0;
		  padding:0;
		  font-family: sans-serif;
		  background: linear-gradient(white, #243b55);
		}
		
		.login-box {
		  position: absolute;
		  top: 60%;
		  left: 50%;
		  width: 400px;
		  padding: 40px;
		  transform: translate(-50%, -50%);
		  background: rgba(0,0,0,.5);
		  box-sizing: border-box;
		  box-shadow: 0 15px 25px rgba(0,0,0,.6);
		  border-radius: 10px;
		}
		
		.login-box h2 {
		  margin: 0 0 30px;
		  padding: 0;
		  color: #fff;
		  text-align: center;
		}
		
		.login-box .user-box {
		  position: relative;
		}
		
		.login-box .user-box input {
		  width: 100%;
		  padding: 10px 0;
		  font-size: 20px;
		  color: #fff;
		  margin-bottom: 30px;
		  border: none;
		  border-bottom: 1px solid #fff;
		  outline: none;
		  background: transparent;
		}
		.login-box .user-box label {
		  position: absolute;
		  top:0;
		  left: 0;
		  padding: 10px 0;
		  font-size: 16px;
		  color: #fff;
		  pointer-events: none;
		  transition: .5s;
		}
		
		.login-box .user-box input:focus ~ label,
		.login-box .user-box input:valid ~ label {
		  top: -20px;
		  left: 0;
		  color: white;
		  font-size: 12px;
		}
		
		.login-box form a {
		   position: relative;
		  display: inline-block;
		  padding: 10px 20px;
		  color: white;
		  font-size: 16px;
		  text-align:center;
		  text-decoration: none;
		  text-transform: uppercase;
		  overflow: hidden;
		  transition: .5s;
		  margin:10px 0 0 63px;
		  letter-spacing: 4px;
		  width:150px;
		  
		}
		
		.login-box a:hover {
		  background: #FD4307;
		  color: white;
		  font-weight:600;
		  border-radius: 5px;
		  box-shadow: 0 0 5px #FD4307,
		              0 0 25px #FD4307,
		              0 0 50px #FD4307,
		              0 0 100px #FD4307;
		}
		#kakao_btn:hover {
			background: #FAE100;
			color: #3B1E1E;
			font-weight:600;
			border-radius: 5px;
			box-shadow: 0 0 5px #FAE100,
				0 0 25px #FAE100,
				0 0 50px #3B1E1E,
				0 0 100px #FAE100;
		}
		
		.login-box a span {
		  position: absolute;
		  display: block;
		}
		
		.login-box a span:nth-child(1) {
		  top: 0;
		  left: -100%;
		  width: 100%;
		  height: 2px;
		  background: linear-gradient(90deg, transparent, white);
		  animation: btn-anim1 1s linear infinite;
		}
		
		@keyframes btn-anim1 {
		  0% {
		    left: -100%;
		  }
		  50%,100% {
		    left: 100%;
		  }
		}
		
		.login-box a span:nth-child(2) {
		  top: -100%;
		  right: 0;
		  width: 2px;
		  height: 100%;
		  background: linear-gradient(180deg, transparent, white);
		  animation: btn-anim2 1s linear infinite;
		  animation-delay: .25s
		}
		
		@keyframes btn-anim2 {
		  0% {
		    top: -100%;
		  }
		  50%,100% {
		    top: 100%;
		  }
		}
		
		.login-box a span:nth-child(3) {
		  bottom: 0;
		  right: -100%;
		  width: 100%;
		  height: 2px;
		  background: linear-gradient(270deg, transparent, white);
		  animation: btn-anim3 1s linear infinite;
		  animation-delay: .5s
		}
		
		@keyframes btn-anim3 {
		  0% {
		    right: -100%;
		  }
		  50%,100% {
		    right: 100%;
		  }
		}
		
		.login-box a span:nth-child(4) {
		  bottom: -100%;
		  left: 0;
		  width: 2px;
		  height: 100%;
		  background: linear-gradient(360deg, transparent, white);
		  animation: btn-anim4 1s linear infinite;
		  animation-delay: .75s
		}
		
		@keyframes btn-anim4 {
		  0% {
		    bottom: -100%;
		  }
		  50%,100% {
		    bottom: 100%;
		  }
		}


	</style>
</head>
<body>
<jsp:include page="Main_header.jsp"></jsp:include>

	<div class="login-box">
	  <h2>최강선생 로그인</h2>
	  <form name="login_box">
	    <div class="user-box" >
	      <input type="text" name="id" id="id">
	      <label>아이디</label>
	    </div>
	    <div class="user-box">
	      <input type="password" name="pw" id="pw">
	      <label>비밀번호</label>
	    </div>
	    <a href="#" onclick="send();">
			<span></span>
			<span></span>
			<span></span>
			<span></span>
			로 그 인
	    </a>
	    <input type="hidden" value="${param.path }" id="param">
	    <a href="#" onclick="kakaoLogin();" id="kakao_btn" style="margin-top:30px;">
			<span></span>
			<span></span>
			<span></span>
			<span></span>
			KAKAO 로그인
	    </a>
	  </form>
	</div>
	
	
	<script>
	var kakao_nickname = "";
	var kakao_email_addr = "";
	var kakao_profile_img = "";
	var path = decodeURI(decodeURIComponent(document.getElementById('param').value));
	
	window.addEventListener("keydown", keysPressed, false);
	window.addEventListener("keyup", keysReleased, false);

	var keys = [];

	function keysPressed(e) {
		keys[e.keyCode] = true;
		
		if (keys[13]) {
			send();
		}
	}
	
	function keysReleased(e) {
		keys[e.keyCode] = false;
	}
	
	
	
		function send(){ //이름은 send, form태그를 하나만 받음 (body에 명시되어있음)
		
			var id = document.getElementById('id').value;
			var pw = document.getElementById('pw').value;
			
				
			alert(path);
			//유효성 체크
			if(id == ''){	//id 공백 체크
				alert("아이디를 입력하세요.");
				document.login_box.id.focus();
				return;
			}
			if(pw == ''){	//pw 공백 체크
				alert("비밀번호를 입력하세요.");
				document.login_box.pw.focus();
				return;
			}
			
			var url = "login.do"; //login.do라는 서블릿을 호출한다.
			//파라미터를 2개 보낸다. (아이디&패스워드)
			var param = "id=" + id + "&pw=" + encodeURIComponent(pw) + "&path=" + path; //비밀번호에 특수문자가 섞여있을수 있으니 
			sendRequest(url, param, resultCheck, "POST");
		}
		
		//위에 resultCheck라는 콜백메소드를 만든다.
		function resultCheck() {
			
			if(xhr.readyState == 4 && xhr.status == 200){
				//서블릿 (LoginAction)에서 넘어온 값이 무엇인지 처리한다.
				//아이디 없음 : "[{'param' : 'no_id'}]"
				//비밀번호 틀림 : "[{'param' : 'no_pw'}]" 
				//로그인 성공 : "[{'param' : 'success'}]"
				var data = xhr.responseText;
				var json = eval(data);
				
				if (json[0].param == 'no_id'){
					alert("아이디가 일치하지 않습니다.");
					document.login_box.id.focus();
				}
				else if (json[0].param == 'no_pw'){
					alert("비밀번호가 일치하지 않습니다.");
					document.login_box.pw.focus();
				}
				else if (json[0].param == 'success'){
					//로그인 성공이면 메인페이지로 가도 된다.
					var path = json[1].p_path;
					if( path.includes('join_teacher.jsp') || path.includes('join_student.jsp') ){
						path = '/ZV2Project/Main_page.jsp';
						
					}
					alert(path);
					location.href = path;
				}
			}
		}
		
		
		Kakao.init('225d36194afaf18d6eb267edec9baa70'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized());

		//카카오로그인
		function kakaoLogin() {
			Kakao.Auth.login({
				success: function (response) {
					Kakao.API.request({
						url: '/v2/user/me',
						success: function (response) {
							kakao_nickname = response.kakao_account.profile.nickname;
							kakao_email_addr = response.kakao_account.email;
							kakao_profile_img = response.kakao_account.profile.profile_image_url;
							var path = decodeURI(decodeURIComponent(document.getElementById('param').value));
							
							var url = "kakaologin.do"; //kakaologin.do라는 서블릿을 호출한다.
							var param = "kakao_email=" + kakao_email_addr + "&id=try&path="+path; //파라미터를 2개 보낸다. (카카오 이메일, 시도중)
							sendRequest(url, param, kakao_resultCheck, "POST");
							
							function kakao_resultCheck(){
								if(xhr.readyState == 4 && xhr.status == 200){
									//서블릿 (LoginAction)에서 넘어온 값이 무엇인지 처리한다.
									//연결된 계정 없음 : "[{'param' : 'no_account'}]"
									//로그인 성공 : "[{'param' : 'success'}]"
									
									var data = xhr.responseText;
									var json = eval(data);
									
									if (json[0].param == 'no_account'){
										alert("연결된 계정이 없습니다. 최초 1회 로그인이 필요합니다!");
										var p_path = '${param.path}';
										location.href="kakaologin.do?kakao_email=" + kakao_email_addr + "&id=no&path="+decodeURI(decodeURIComponent(p_path));
										return;
									}
									else if (json[0].param == 'success'){
										//로그인 성공이면 메인페이지로 가도 된다.
										var path = json[1].p_path;
										location.href = path;
									}
							}
							}
							
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		  }
		//카카오로그아웃  
		function kakaoLogout() {
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
		  }  
		
	</script>
	

</body>
</html>