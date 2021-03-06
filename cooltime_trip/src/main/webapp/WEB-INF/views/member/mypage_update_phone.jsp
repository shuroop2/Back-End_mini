<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<c:import url="/WEB-INF/views/layout/head.jsp" />
		<!-- css -->
		<link rel="stylesheet" href="<c:url value='/css/mypage_update_phone.css' />"/>
		<!-- js -->
		<script src="<c:url value='/js/mypage_update_phone.js' />"></script>
	</head>
	<body> 
		<!-- top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />
		
		<!-- section -->
		<section class="section">
		    <div class="wrap">
			    <form id="form_update_phone" method="post" action="<c:url value='/updatePhone'/>">
			    	<div class="div_phoneNum_panel">
			            <div class="div_phoneNum_title">
			                <div class="div_phoneNum_title title_main">
			                휴대폰 번호 변경하기
			                </div>
			            </div>
			            <div class="div_phoneNum_field">
			                <div class="div_phoneNum_input">
			                    <p class="text_phoneNum_input">휴대폰 번호</p>
			                    <input id="input_phone" name="input_phone" class="input_phoneNum_box" type="text" placeholder="- 빼고 입력">
			                    <p class="error_update_phoneNum">휴대폰 번호를 확인해주세요</p>
			                </div>
			                <div class="div_phoneNum_check">
			                    <p class="text_phoneNum_check">인증번호</p>
			                    <input id="input_serial" name="input_serial" type="hidden">
			                    <input id="input_check" name="input_check" class="input_phoneNum_check" type="text" placeholder="인증번호 6자리 입력">
			                    <p class="error_check_phoneNum">인증번호를 확인해주세요</p>
			                </div>
			                <div class="div_phoneNum_button">
			                    <button type="button" class="btn_phoneNum_send">문자로 인증번호 보내기</button>
			                    <button type="submit" class="btn_phoneNum_confirm">변경하기</button>
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