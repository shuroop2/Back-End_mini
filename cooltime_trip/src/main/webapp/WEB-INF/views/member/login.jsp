<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
		<c:import url="/WEB-INF/views/layout/head.jsp" />
		<!-- css -->
		<link rel="stylesheet" href="<c:url value='/css/login.css' />"/>
		<!-- js -->
		<script src="<c:url value='/js/login.js' />"></script>
	</head>
	<body> 
		<!-- top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />
		<!-- section.jsp -->
		<section class="section">
			<div class="wrap">
      			<div class="div_login_panel">
        			<div class="div_login_title">
          				<div class="div_login_title title_main">
            				WELCOME!
          				</div>
          				<div class="div_login_title title_sub">
            				여행 쿨탐 찼다! 떠나자!
          				</div>
        			</div>
        			<div class="div_login_id">
          				<p class="text_login_id">아이디</p>
          				<input class="input_login_id" type="text" placeholder="아이디 입력">
          				<div class="error_login_id">아이디를 다시 확인해주세요</div>
        			</div>
			        <div class="div_login_password">
			          	<p class="text_login_password">비밀번호</p>
			          	<input class="input_login_password" type="password" placeholder="비밀번호 입력">
			          	<div class="error_login_password">비밀번호가 일치하지 않습니다</div>
			        </div>
			        <div class="div_login_savefind">
			          	<input class="checkbox_login_save" id="checkbox_login_save" type="checkbox">
						<!-- <label for="checkbox_login_save"><img class="ic_check" src="<c:url value='/images/ic_eye-solid.png' />"></label> -->
						<div class="div_ic_check"></div>
						<label for="checkbox_login_save">로그인 상태 유지</label>
						<a class="link_login_find" href="#">아이디/비밀번호 찾기</a>
			        </div>
			        <div class="div_login_button">
			          	<button class="btn_login">로그인</button>
			        </div>
			        <hr>
			        <p class="p_sns_title">SNS로 간편하게 로그인하기</p>
			        <div class="div_login_sns">
			          	<button class="btn_login_kakao"><img src="<c:url value='/images/lg_kakao.png' />">카카오</button>
			          	<button class="btn_login_naver"><img src="<c:url value='/images/lg_naver.png' />">네이버</button>
			         	<button class="btn_login_google"><img src="<c:url value='/images/lg_google.png' />">구글</button>
			        </div>
			        <div class="div_signup_button">
			         	<a class="btn_signup" href="<c:url value='/signup' />">회원가입</a>
					</div>
				</div>
			</div>
		</section>
		<!-- bottom.jsp -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp" />
	</body>
</html>