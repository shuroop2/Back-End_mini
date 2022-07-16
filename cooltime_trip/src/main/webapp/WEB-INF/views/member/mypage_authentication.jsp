<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<!-- head -->
		<c:import url="/WEB-INF/views/layout/head.jsp" />
		<!-- css -->
		<link rel="stylesheet" href="<c:url value='/css/mypage_authentication.css' />"/>
		<!-- js -->
		<script src="<c:url value='/js/mypage_authentication.js' />"></script>
		
		<meta charset="UTF-8">
		<title>쿨탐찼다! 여행가자! - 쿨타임트립</title>
	</head>
	<body> 
		<!-- top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />
		
		<!-- section -->
		<section class="section">
		    <div class="wrap">
		        <div class="div_authentication_panel">
		            <div class="div_authentication_title">
		                <div class="div_authentication_title title_main">
		                내 정보 수정하기
		                </div>
		                <div class="div_authentication_title title_sub">
		                여행자님의 소중한 정보 보호를 위해 다시 한 번 인증해주세요
		                </div>
		            </div>
		            <div class="div_authentication_field">
		                <div class="div_authentication_password">
		                    <p class="text_authentication_password">비밀번호</p>
		                    <input class="input_authentication_password" type="password" placeholder="비밀번호 입력">
		                    <div class="error_authentication_password">비밀번호가 일치하지 않습니다</div>
		                </div>
		                <div class="div_authentication_button">
		                    <button class="btn_authentication">비밀번호 인증</button>
		                </div>
		            </div>
		        </div>
		    </div>
		    </section>
		    <!-- 탑 버튼 -->
		    <!-- <img class="btn_top" src="../images/btn_top.png"> -->
		    <!-- footer -->
		
		<!-- bottom.jsp -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp" />
	</body>
</html>