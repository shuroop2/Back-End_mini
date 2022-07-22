<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
		<c:import url="/WEB-INF/views/layout/head.jsp" />
		<!-- css -->
		<link rel="stylesheet" href="<c:url value='/css/mypage_update_main.css' />"/>
		<!-- js -->
		<script src="<c:url value='/js/mypage_update_main.js' />"></script>
	</head>
	<body> 
		<!-- top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />
		<!-- section -->
	    <section class="section">
		    <div class="wrap">
		        <!-- <div class="div_update_title title_main">
		            내 정보 수정하기
		        </div> -->
		        <form id="form_mypage_update" method="post" action="<c:url value='/mypageUpdateMemName'/>">
		        	<div class="div_update_panel">
			            <div class="div_update_profile">
			                <!-- 사진 -->
			                <div class="div_img_profile">
			                    <img class="img_profile_image" src="<c:url value='/images/ic_profile.png' />">
			                    <div class="div_update_image">
			                        <img class="img_camera_background" src="<c:url value='/images/ic_camera_background.png' />">
			                        <img class="img_camera_image" src="<c:url value='/images/ic_camera.png' />">
			                    </div>
			                </div>
			            </div>
			            <table class="table_user_info">
			                <tr><td class="td_text user_id">아이디</td><td colspan="2"><input class="input_update_id" type="text" value="${mem.memId }"></td></tr>
			                <tr><td class="td_text user_password">비밀번호</td><td class="td_link update_password" colspan="2"><a href="<c:url value='/mypage_update_password' />">비밀번호 변경하기</a></td></tr>
			                <tr><td class="td_text user_name">이름</td><td colspan="2"><input id="input_name" name="input_name" class="input_update_name" type="text" placeholder="실명 입력" value="${mem.memName }"></td></tr>
			                <tr><td class="td_text user_phone">휴대폰 번호</td><td class="td_data user_phone">${mem.memPhone }</td><td class="td_link update_phone"><a href="<c:url value='/mypage_update_phone' />">연락처 변경하기</a></td></tr>
			                <tr><td class="td_text user_email">이메일</td><td class="td_data user_email" colspan="2">${mem.memEmail }</td></tr>
			            </table>
			            <br>
			            <!-- 구분선 -->
			            <div class="line_update_panel"></div>
			            <br>
			            <div class="div_update_button">
			                <button class="btn_update_cancel" type="button">취소하기</button>
			                <button class="btn_update_confirm" type="submit">저장하기</button>
			            </div>
			        </div>
		        </form>
		        
		        <div class="div_delete_account">
		            <a href="<c:url value='/deleteMember'/>">회원탈퇴</a>
		        </div>
		    </div>
	    </section>
	    <!-- 탑 버튼 -->
	    <!-- <img class="btn_top" src="../images/btn_top.png"> -->
		<!-- bottom.jsp -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp" />
	</body>
</html>