<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<c:import url="/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" href="<c:url value='/css/stay_reservation.css'/>">
		<script src="<c:url value='/js/stay_reservation.js'/>"></script>
	</head>
	<body>
	<!-- TOP -->
		<c:import url="/WEB-INF/views/layout/top.jsp"></c:import>
		<section>
		    <div class="final_price_line">
		      <div class="book_detail">
		        <div class="book_hotel_stay">
		          <img src="<c:url value='/images/glad_jeju.png'/>">
		          <div class="maison_text_box">
		            <div class="glad_jeju_text">메종 글래드 제주</div>
		            <div class="glad_jeju_stay">
		              <div class="first_stay">2022년 07월 19일 (화)</div>
		              <div class="second_stay">2022년 07월 20일 (수), 1박</div>
		            </div>
		          </div>
		        </div>
		        <div class="num_people_bed_box">
		          <div class="num_people_bed">스탠다드 더블-2인 / 더블침대 1개</div>
		          <div class="num_people_bed_price">89,100원</div>
		        </div>
		        <div class="total_price_box">
		          <div class="total_price_text">총 상품 금액</div>
		          <div class="total_price_won">89,100원</div>
		        </div>
		        <div class="booked_info">
		          <div>예약자 정보</div>
		        </div>
		        <div class="booked_customer_info">
		          <div class="b_name">예약자 이름</div>
		          <input type="text" class="booked_p_name" id="cusName" value="곽경록" disabled>
		          <div class="b_mail">이메일 주소</div>
		          <div class="email_text_box">
		            <input type="text" class="email_id" id="emailId">
		            <span>@</span>
		            <input type="text" class="email_address_insert" id="emailAddress" placeholder="직접입력"> 
		            <select class="email_address_select" id="cusSel">
		              <option value="" selected>직접입력</option>
		              <option value="naver.com">naver.com</option>
		              <option value="gmail.com">gmail.com</option>
		              <option value="hanmail.net">hanmail.net</option>
		              <option value="hotmail.com">hotmail.com</option>
		            </select> 
		          </div>
		          <div class="b_phone">휴대폰 번호</div>
		          <div class="phone_num_box">
		            <select class="phone_first" id="cusPsel"selected="010">
		              <option>010</option>
		              <option>011</option>
		              <option>019</option>
		            </select>
		            <input type="text" class="phone_second" id="num_second">
		            <input type="text" class="phone_third" id="num_third">
		          </div> 
		        </div>
		        <div class="stay_p_info">
		          <div class="p_info_detail">투숙객 정보</div>
		          <!-- <input type="checkbox" class="check_box_sizing" id="cusInfo">
		          <div class="same_name">예약자와 동일해요</div> -->
		          <span class="same_name"><i class="fa-solid fa-check"></i>예약자와 동일해요</span>
		        </div>
		        <div class="booked_customer_info">
		          <div class="b_name">예약자 이름</div>
		          <input type="text" class="booked_p_name" id="realName">
		          <div class="b_mail">이메일 주소</div>
		          <div class="email_text_box">
		            <input type="text" class="email_id" id="realId">
		            <span>@</span>
		            <input type="text" class="email_address_insert" id="realAddress" placeholder="직접입력">
		            <select class="email_address_select" id="realSel">
		              <option value="" selected>직접입력</option>
		              <option value="1">naver.com</option>
		              <option value="2">gmail.com</option>
		              <option value="3">hanmail.net</option>
		              <option value="4">hotmail.com</option>
		            </select> 
		          </div>
		          <div class="b_phone">휴대폰 번호</div>
		          <div class="phone_num_box">
		            <select class="phone_first" id="realPsel"selected="010">
		              <option>010</option>
		              <option>011</option>
		              <option>019</option>
		            </select>
		            <input type="text" class="phone_second" id="realPs">
		            <input type="text" class="phone_third" id="realPt">
		          </div> 
		        </div>
		        <div class="contract_info">
		          <div class="introduce_contract">약관안내</div>
		        </div>
		        <div class="introduce_contract_box">
		          <div class="agreement_a">(필수) 여행자 약관 동의 ></div>
		          <div class="agreement_b">(필수) 개인정보 제공 동의 ></div>
		          <div class="agreement_c">(필수) 개인정보 수집 및 이용 동의 ></div>
		        </div>
		        <div class="agreement_check_final">
		          <!-- <input type="checkbox" class="check_box_final" id="check_final">
		          <div class="agree_text_final">위 약관을 확인 하였으며, 약관에 동의합니다</div> -->
		          <span class="agree_text_final"><i class="fa-solid fa-check"></i>위 약관을 확인 하였으며, 약관에 동의합니다</span>
		        </div>
		        <div class="booked_button_final">
		          <button class="final_book_btn" id="book_ing">예약하기</button>
		        </div>
		      </div>
		      <div class="payment_final_info">
		        <div class="info_pay">결제정보</div>
		        <div class="order_price_box">
		          <div>주문금액</div>
		          <div>89,100원</div>
		        </div>
		        <div class="total_price_final">
		          <div class="ttp_text">총 요금</div>
		          <div class="ttp_num">89,100<div class="ttr_won">원</div></div>          
		        </div>
		      </div>
		    </div>
		  </section>
		  <!-- BOTTOM -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp"></c:import>
	</body>
</html>