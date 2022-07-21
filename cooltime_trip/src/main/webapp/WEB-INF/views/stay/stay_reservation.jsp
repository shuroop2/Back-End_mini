<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 페이지 새로고침 안해도댐! -->
<%    
response.setHeader("Cache-Control","no-store");    
response.setHeader("Pragma","no-cache");    
response.setDateHeader("Expires",0);    
if (request.getProtocol().equals("HTTP/1.1"))  
        response.setHeader("Cache-Control", "no-cache");  
%>
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
		          <img src="<c:url value='/hotelImg/${hotel.hotelNo }/h001.png'/>">
		          <div class="maison_text_box">
		            <div class="glad_jeju_text">${hotel.hotelName }</div>
		            <div class="glad_jeju_stay">
		              <div class="first_stay">${dateTime[0]}~${dateTime[1]}</div>
		              <div class="second_stay">${hotel.hotelAddress}</div>
		            </div>
		          </div>
		        </div>
		        <div class="num_people_bed_box">
		          <div class="num_people_bed">${roomType}-2인 / <span id="bedType">더블침대 1개</span></div>
		          <div class="num_people_bed_price">${roomTypePrice}원</div>
		          <script>
		          	if('${roomType}'=='디럭스 트윈'){
		          		$('#bedType').text('싱글침대 2개');
		          	}
		          </script>
		        </div>
		        <div class="total_price_box">
		          <div class="total_price_text">총 상품 금액</div>
		          <div class="total_price_won">${roomTypePrice}원</div>
		        </div>
		        <div class="booked_info">
		          <div>예약자 정보</div>
		        </div>
		        <div class="booked_customer_info">
		          <div class="b_name">예약자 이름</div>
		          <input type="text" class="booked_p_name" id="cusName" value="${mem.memName }" disabled>
		          <div class="b_mail">이메일 주소</div>
		          <div class="email_text_box">
		            <input type="text" class="email_id" id="emailId" value="${email[0]}">
		            <span>@</span>
		            <input type="text" class="email_address_insert" id="emailAddress" value="${email[1] }" placeholder="직접입력"> 
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
		            <select class="phone_first" id="cusPsel"selected="010" value="${memPH1 }">
		              <option>010</option>
		              <option>011</option>
		              <option>019</option>
		            </select>
		            <input type="text" class="phone_second" id="num_second" value="${memPH2 }">
		            <input type="text" class="phone_third" id="num_third" value="${memPH3 }">
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
		          <div>${roomTypePrice}원</div>
		        </div>
		        <div class="total_price_final">
		          <div class="ttp_text">총 요금</div>
		          <div class="ttp_num">${roomTypePrice}<div class="ttr_won">원</div></div>          
		        </div>
		      </div>
		    </div>
		  </section>
		  <!-- BOTTOM -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp"></c:import>
	</body>
</html>