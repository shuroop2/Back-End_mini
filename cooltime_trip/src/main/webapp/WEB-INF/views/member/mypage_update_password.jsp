<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
		<c:import url="/WEB-INF/views/layout/head.jsp" />
		<!-- css -->
		<link rel="stylesheet" href="<c:url value='/css/mypage_update_password.css' />"/>
		<!-- js -->
		<script src="<c:url value='/js/mypage_update_password.js' />"></script>
	</head>
	<body> 
		<!-- top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />
		
		<!-- section -->
		<section class="section">
		    <div class="wrap">
			    <form id="form_update_password" method="post" action="<c:url value='/updatePassword'/>">
			    	<div class="div_update_password_panel">
			            <div class="div_update_password_title">
			                <div class="div_update_password_title title_main">
			                비밀번호 변경하기
			                </div>
			            </div>
			            <div class="div_update_password_field">
			                <div class="div_update_notice">
			                    <p class="div_update_notice_title">유의사항</p>
			                    <p class="div_update_notice_text">
			                        ・ 8~15자 길이로 만들어주세요<br> 
			                        ・ 영문 대/소문자, 숫자, 특수문자 2가지를 조합해주세요<br> 
			                        ・ 3자 이상 연속/동일한 문자, 숫자는 사용할 수 없습니다<br>
			                    </p>
			                </div>
			                <div class="div_update_password">
			                    <p class="text_update_password">새 비밀번호</p>
			                    <input class="input_update_password" type="password" placeholder="비밀번호 입력">
			                    <div class="error_update_password1"><p>기존 비밀번호와 동일합니다</p></div>
			                    <div class="error_update_password2"><p>비밀번호를 확인해주세요</p></div>
			                </div>
			                <div class="div_check_password">
			                    <p class="text_check_password">새 비밀번호 확인</p>
			                    <input class="input_check_password" type="password" placeholder="비밀번호 입력">
			                    <div class="error_check_password"><p>비밀번호가 일치하지 않습니다</p></div>
			                </div>
			                <div class="div_update_password_button">
			                    <button class="btn_update_password">변경하기</button>
			                </div>
			            </div>
			        </div>
			    </form>
		    </div>
	    </section>
	    <!-- 탑 버튼 -->
	    <!-- <img class="btn_top" src="../images/btn_top.png"> -->
		
		<!-- bottom.jsp -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp" />
	</body>
</html>