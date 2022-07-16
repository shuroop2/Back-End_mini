<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<c:import url="/WEB-INF/views/layout/head.jsp" />
	<script defer src="<c:url value='../js/rent_reservation.js' />"></script>
    <link rel="stylesheet" href="<c:url value='../css/rent_reservation.css'/>">
</head>

<body>
  <!-- header -->
 	<c:import url="/WEB-INF/views/layout/top.jsp"/>
 <!-- 렌트 예약 -->	
  <section>
    <div class="rent_reservation wrap">
      <div class="rent_reservation_container">
        <section class="rent_reservation_info">
          <article class="rent_info">
            <div class="rent_info_box">
              <div class="rent_img_box">
                <img src="<c:url value='../images/k5.png'/>">
              </div>
              <div class="name_date_box">
                <div class="car_name">THE NEW K5</div>
                <div class="car_date">2022년 07월 19일 (화) 오전 10:00 ~ <br>2022년 07월 20일 (수) 오전 10:00, 24시간</div>
              </div>
            </div>
            <div class="rent_price_info">
              <div>
                <span>차량 대여료</span>
                <span>40,000원</span>
              </div>
              <div>
                <span>일반 자차</span>
                <span>0원</span>
              </div>
            </div>
            <div class="car_total_price">
              <span>총 상품 금액</span>
              <span>40,000원</span>
            </div>
          </article>
          <article class="booker_info">
            <div class="booker_info_title">예약자 정보</div>
            <table class="booker_info_box">
              <tr class="booker_info_content">
                <td>예약자 이름</td>
                <td id="rentBookerName">이혜원</td>
              </tr>
              <tr class="booker_info_content">
                <td>이메일 주소</td>
                <td id="rentBookerEmail">hwwwon@gmail.com</td>
              </tr>
              <tr class="booker_info_content">
                <td>휴대폰 번호</td>
                <td id="rentBookerPhone">010-1111-2222</td>
              </tr>
            </table>
          </article>
          <article class="add_reservation_info">
            <div class="add_reservation_info_title">
              <p>추가 예약 정보</p>
              <span class="another_person_drive" onclick="anotherPersonCheck()"><i class="fa-solid fa-check"></i>다른 사람이 운전해요</span>
            </div>
            <div class="add_reservation_box" id="addBookerBox">
              <p>운전자 한글 이름</p>
              <input type="text" id ="driverKrName" value="이혜원">
              <p>이메일 주소</p>
              <div class="driver_email_container">
                <input type="text" id="driverEmail" value="hwwwon">&nbsp;<span>@</span>&nbsp;
                <input type="text" placeholder="직접입력" id="driverEmailDomain" value="gmail.com">
                <div class="select_email">
                  <div class="selected_email">
                    <span class="selected_value">직접입력</span>
                    <span><i class="fas fa-chevron-down"></i></span>
                  </div>
                  <div class="email_option_box">
                    <div class="email_option">직접입력</div>
                    <div class="email_option">naver.com</div>
                    <div class="email_option">hanmail.net</div>
                    <div class="email_option">gmail.com</div>
                    <div class="email_option">nate.com</div>
                  </div>
                </div>
              </div>
              <p>휴대폰 번호</p>
              <div class="select_phone">
                <div class="selected_phone">
                  <span class="selected_phone_value">010</span>
                  <span><i class="fas fa-chevron-down"></i></span>
                </div>
                <ul>
                  <li class="phone_option">010</li>
                  <li class="phone_option">011</li>
                  <li class="phone_option">016</li>
                  <li class="phone_option">019</li>
                </ul>
              </div>
              <input type="text" class="add_reservation_phone" id="driverPhoneNum1" maxlength="4" value="1111">
              <input type="text" class="add_reservation_phone" id="driverPhoneNum2" maxlength="4" value="2222">
              <p>생년월일</p>
              <input type="text" placeholder="EX) 19900101" id="driverBirth" value="19961027">
              <p>운전면허</p>
              <div class="drive_type_box">
                <input type="radio" name = "license" id="license1" class="drive_type" value="2종 보통" checked="checked" />
                <label for="license1" class="drive_type_content">2종 보통</label>
              </div>
              <div class="drive_type_box">
                <input type="radio" name = "license" id="license2" class="drive_type" value="2종 소형"/>
                <label for="license2" class="drive_type_content">2종 소형</label>
              </div>
              <div class="drive_type_box">
                <input type="radio" name = "license" id="license3" class="drive_type" value="1종 보통"/>
                <label for="license3" class="drive_type_content">1종 보통</label>
              </div>
              <div class="drive_type_box">
                <input type="radio" name = "license" id="license4" class="drive_type" value="1종 대형"/>
                <label for="license4" class="drive_type_content">1종 대형</label>
              </div>
              <div class="notice_add_driver">
                <div>운전자가 더 있나요?</div>
                <div>현장에서 무료로 운전자를 추가할 수 있어요. 보험 가입 기준에 맞는 운전 면허증을 보여주면 같은 보험에 가입돼요.</div>
              </div>
            </div>
          </article>
          <article class="terms">
            <p>약관 안내</p>
            <div class="agree_drive_terms_container">
              <div class="agree_drive_terms_content">
                <div>(필수) 여행자 약관 동의<i class="fas fa-chevron-right"></i></div>
                <div>(필수) 개인정보 제공 동의<i class="fas fa-chevron-right"></i></div>
                <div>(필수) 개인정보 수집 및 이용 동의<i class="fas fa-chevron-right"></i></div>
                <div class="notice_terms">
                  <div>현장 계약서를 확인하세요</div>
                  <div>현장에서 사인한 계약서를 기준으로 약관이 적용돼요.</div>
                </div>
              </div>
              <div class="agree_drive_terms_check">
                <span class="check_agree_terms"><i class="fa-solid fa-check"></i>위 약관을 확인하였으며, 약관에 동의합니다</span>
              </div>
            </div>
          </article>
        </section>
        <div class="rent_total_price_info">
          <div>결제정보</div>
          <div>
            <span>주문금액</span>
            <span>40,000원</span>
          </div>
          <div class="rent_total_price_box">
            <span>총 결제 금액</span>
            <div class="rent_total_price"><span>40,000</span><span>원</span></div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section>
    <div class="rent_reservation_btn">
      <button onclick="checkDriverInfo1() && checkDriverInfo2()" id="rentReservationBtn">
        예약하기
      </button>
    </div>
  </section>
  <img class="btn_top" src="<c:url value='../images/btn_top.png'/>">
</body>
</html>