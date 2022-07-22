<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<c:import url="/WEB-INF/views/layout/head.jsp" />
		<!-- css -->
		<link rel="stylesheet" href="<c:url value='/css/signup.css' />"/>
		<!-- js -->
		<script src="<c:url value='/js/signup.js' />"></script>
	</head>
	<body> 
		<!-- top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />
		<!-- section.jsp -->
		<section class="section">
		<!-- 섹션 wrap -->
		    <div class="wrap">
			    <%-- <form id="form_signup" method="post" action="<c:url value='/checkMemId'/>"> --%>
			    	<div class="div_signup_panel">
			        	<div class="div_signup_title"><p>SIGN UP</p></div>
			        	<form id="form_check_id" method="post" action="<c:url value='/checkMemId'/>">
				        	<div class="div_signup_id"><p>아이디 *</p>
				          		<input class="input_signup_id" type="text" id="memId" name="memId" placeholder="아이디 입력">
				          		<button id="check_id" name="check_id" class="btn_check_id" style="cursor:pointer" type="submit" >중복확인</button>
				        	</div>
			        	</form>
			        	<form id="form_signup" method="post" action="<c:url value='/checkMemPwd'/>">
				        	<div class="div_signup_password"><p>비밀번호 *</p>
				          		<input class="input_signup_password" type="password" id="memPwd" name="memPwd" placeholder="영문 숫자 특수문자 조합 8~16자리">
				         		<div class="eyes"><img class="eyes_signup_password" src="<c:url value='/images/ic_eye-solid.png' />"></div>
				        	</div>
				        	<div class="div_check_password"><p>비밀번호 확인 *</p>
				          		<input class="input_check_password" type="password" id="memPwdchk" name="memPwdchk" placeholder="비밀번호 확인">
				          		<div class="eyes"><img class="eyes_check_password" src="<c:url value='/images/ic_eye-solid.png' />"></div>
				        	</div>
			        	</form>
			        	<div class="div_signup_name"><p>이름 *</p>
			          		<input class="input_signup_name" type="text" id="memName" name="memName" placeholder="실명 입력">
			        	</div>
			        	<form id="form_check_phone" method="post" action="<c:url value='/checkMemPhone'/>">
				        	<div class="div_signup_phone"><p>휴대폰 번호 *</p>
				          		<input class="input_signup_phone" type="text" id="memPhone" name="memPhone" placeholder="숫자만 입력">
				          		<button class="btn_signup_phone" type="button" style="cursor:pointer">인증하기</button>
				        	</div>
				        	<div class="div_check_phone">
				        		<input class="input_check_serial" type="hidden" id="memPhoneSerial" name="memPhoneSerial">
				          		<input class="input_check_phone" type="text" id="memPhoneCheck" name="memPhoneCheck" placeholder="인증번호 입력">
				          		<button class="btn_check_phone" type="submit" style="cursor:pointer">확인</button>
				        	</div>
			        	</form>
			        	<div class="div_signup_email"><p>이메일 *</p>
			          		<input class="input_signup_email" type="text" id="memEmail" name="memEmail" placeholder="ID@example.com">
			        	</div>
			        	<br><br>
			        	<div class="div_agreeTos">
			            	<div class="div_agreeTos_total">
			              		<input class="checkbox_agreeTos_total" id="checkboxTos" type="checkbox" name="checkboxTotal" style="cursor:pointer"><p>약관 전체 동의</p>
			            	</div>     
			            	<br>
			            	<div class="div_agreeTos_sub">
			                	<div class="div_agreeTos_sub1">
			                    	<input class="checkbox_agreeTos_sub1" id="checkboxTos1" type="checkbox" name="checkboxSub" style="cursor:pointer"><p>(필수) 이용약관 동의</p>
			                    	<a class="link_agreeTos_sub1" href="#">전체 보기</a>
			                	</div>
			                	<div class="div_agreeTos_sub2">
			                    	<input class="checkbox_agreeTos_sub2" id="checkboxTos2" type="checkbox" name="checkboxSub" style="cursor:pointer"><p>(필수) 만 14세 이상 확인</p>
			                	</div>
			                	<div class="div_agreeTos_sub3">
			                    	<input class="checkbox_agreeTos_sub3" id="checkboxTos3" type="checkbox" name="checkboxSub" style="cursor:pointer"><p>(필수) 개인정보 수집 및 이용 동의</p>
			                    	<a class="link_agreeTos_sub3" href="#">전체 보기</a>
			                	</div>
			            	</div>
			        	</div>
			        	<br>
			        	<br>
			        	<form id="form_signup" method="post" action="<c:url value='/signupMember'/>">
				        	<div class="div_signup_button">
				            	<button class="btn_signup" type="submit" style="cursor:pointer">회원가입</button>
				            	<input id="resultId" name="resultId" type="hidden">
				            	<input id="resultPwd" name="resultPwd" type="hidden">
				            	<input id="resultName" name="resultName" type="hidden">
				            	<input id="resultPhone" name="resultPhone" type="hidden">
				            	<input id="resultEmail" name="resultEmail" type="hidden">
				            	<input id="resultSignup" name="resultSignup" type="hidden">
				        	</div>
			        	</form>
					</div>
				<!-- </form> -->           
			</div> 	
		</section>
		<!-- bottom.jsp -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp" />
	</body>
</html>