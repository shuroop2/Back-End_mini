<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html><c:import url="/WEB-INF/views/layout/head.jsp" />
	<!-- custom -->
    <script src="<c:url value='/js/flight_list.js' />"></script>
	<link rel="stylesheet" href="<c:url value='/css/list.css' />"/>
</head>
<body><c:import url="/WEB-INF/views/layout/top.jsp" />
	<!-- 검색 영역 -->
  <section class="sec_search_list">
    <span class="div_list_tlt">왕복</span>
    <!-- 검색 설정 영역 / 유효성 검사 필요 -->
    <div class="div_flight_list_search wrap">
      <div class="wrap_flight_div">
        <form id="flightSearchList">
            <div class="wrap_search_input">
              <input type="text" id="flightStartSearchBtn" class="txt_lodgment" value="인천 (ICN)">
              <button><i class="fa-solid fa-arrow-right-arrow-left"></i></button>
              <input type="text" id="flightEndSearchBtn" class="txt_lodgment" value="괌 (GUM)">
              <input type="text" id="flightDatepicker" name="daterange" class="txt_lodgment" value="06.27(월) - 07.01(금)">
              <input type="text" id="flightPersonCount" class="txt_lodgment" value="1명, 일반석">
              <input type="submit" class="btn_search_flight" value="검색하기">
            </div>
        </form>
        <!-- 검색 팝업 -->
        <div class="popup_lod">
          <h4 class="tlt_popup_lod">여행지 검색</h4><i class="fa-solid fa-xmark" id="popupLodListCloseBtn"></i>
          <div class="div_popup_search">
            <input type="text" name="" id="popupLodListSearch" class="input_popup_search" placeholder="여행지 검색">
            <input type="button" name="" id="popupLodListSearchBtn" class="btn_popup_search" value="검색하기">
          </div>
          <h6 class="tlt_list_lod">최근 확인한 여행지</h6>
          <!-- 최근 3개까지 -->
          <div class="list_location">
            <i class="fa-solid fa-location-dot"></i>
            <div class="div_txt_location">
              <span class="txt_location_main">제주도</span>
              <span class="txt_location_sub">대한민국</span>
            </div>
          </div>
          <div class="list_location b_none">
            <i class="fa-solid fa-location-dot"></i>
            <div class="div_txt_location">
              <span class="txt_location_main">가평군</span>
              <span class="txt_location_sub">대한민국 경기도</span>
            </div>
          </div>
          <h6 class="tlt_list_lod">인기 여행지</h6>
          <!-- 3개 -->
          <div class="list_location">
            <i class="fa-solid fa-location-dot"></i>
            <div class="div_txt_location">
              <span class="txt_location_main">제주도</span>
              <span class="txt_location_sub">대한민국</span>
            </div>
          </div>
          <div class="list_location">
            <i class="fa-solid fa-location-dot"></i>
            <div class="div_txt_location">
              <span class="txt_location_main">강릉</span>
              <span class="txt_location_sub">대한민국 강원도</span>
            </div>
          </div>
          <div class="list_location b_none">
            <i class="fa-solid fa-location-dot"></i>
            <div class="div_txt_location">
              <span class="txt_location_main">여수</span>
              <span class="txt_location_sub">대한민국 전라남도</span>
            </div>
          </div>
        </div>
        <!-- 인원 팝업 -->
        <div class="popup_person">
          <h4 class="tlt_popup_person">인원 선택</h4><i class="fa-solid fa-xmark" id="popupPersonListCloseBtn"></i>
          <div class="div_person_count">
            <div class="box_txt_person">
              <span class="txt_person_main">성인</span>
              <span class="txt_person_sub">만 12세 이상</span>
            </div>
            <div class="box_plus_minus">
              <a id="adultFlightMinusBtn" class="btn_popup_count">-</a>
              <span id="adultFlightCount" class="popup_count_person">1</span>
              <a href="#" id="adultFlightPlusBtn" class="btn_popup_count btn_adult_plus btn_count_active">+</a>
            </div>
          </div>
          <div class="div_person_count">
            <div class="box_txt_person">
              <span class="txt_person_main">소아</span>
              <span class="txt_person_sub">만 12세 미만</span>
            </div>
            <div class="box_plus_minus">
              <a id="childFlightMinusBtn" class="btn_popup_count">-</a>
              <span id="childFlightCount" class="popup_count_person">0</span>
              <a href="#" id="childFlightPlusBtn" class="btn_popup_count btn_count_active">+</a>
            </div>
          </div>
          <div class="div_person_count">
            <div class="box_txt_person">
              <span class="txt_person_main">유아</span>
              <span class="txt_person_sub">24개월 미만</span>
            </div>
            <div class="box_plus_minus">
              <a id="babyFlightMinusBtn" class="btn_popup_count">-</a>
              <span id="babyFlightCount" class="popup_count_person">0</span>
              <a href="#" id="babyFlightPlusBtn" class="btn_popup_count btn_adult_plus btn_count_active">+</a>
            </div>
          </div>
          <div class="popup_person_radio">
            <input id="sitsGen" type="radio" name="sits" value="일반석" checked="checked">
            <label id="sitsGenLabel" for="sitsGen"><i class="fa-solid fa-circle-dot"></i>  일반석</label>
            <input id="sitsPreGen" type="radio" name="sits" value="프리미엄 일반석">
            <label id="sitsPreGenLabel" for="sitsPreGen"><i class="fa-regular fa-circle"></i>  프리미엄 일반석</label>
            <input id="sitsBusi" type="radio" name="sits" value="비즈니스석">
            <label id="sitsBusiLabel" for="sitsBusi"><i class="fa-regular fa-circle"></i>  비즈니스석</label>
            <input id="sitsFir" type="radio" name="sits" value="일등석">
            <label id="sitsFirLabel" for="sitsFir"><i class="fa-regular fa-circle"></i>  일등석</label>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- 검색 영역 끝 -->
  <!-- 필터 부분 / 검색 결과 -->
  <div class="bg_gray">
    <!-- 검색 필터 -->
    <div class="wrap wrap_result">
      <section class="sec_filter">
        <div class="wrap_start_time">
          <button class="tlt_start_time">출발시간<i id="arrowDown" class="fa-solid fa-angle-up"></i></button>
          <div class="toggle_filter">
            <span class="txt_time_label">가는날</span>
            <ul class="wrap_time_picker">
              <li class="txt_time_picker"><i class="fa-solid fa-check fa-active"></i><span>새벽 00:00 ~ 06:00</span></li>
              <li class="txt_time_picker"><i class="fa-solid fa-check"></i><span>오전 06:00 ~ 12:00</span></li>
              <li class="txt_time_picker"><i class="fa-solid fa-check"></i><span>오후 12:00 ~ 18:00</span></li>
              <li class="txt_time_picker"><i class="fa-solid fa-check"></i><span>야간 18:00 ~ 24:00</span></li>
            </ul>
            <span class="txt_time_label">오는날</span>
            <ul class="wrap_time_picker">
              <li class="txt_time_picker"><i class="fa-solid fa-check fa-active"></i><span>새벽 00:00 ~ 06:00</span></li>
              <li class="txt_time_picker"><i class="fa-solid fa-check"></i><span>오전 06:00 ~ 12:00</span></li>
              <li class="txt_time_picker"><i class="fa-solid fa-check"></i><span>오후 12:00 ~ 18:00</span></li>
              <li class="txt_time_picker"><i class="fa-solid fa-check"></i><span>야간 18:00 ~ 24:00</span></li>
            </ul>
          </div>
        </div>
        <div class="wrap_end_time">
          <button class="tlt_end_time">도착시간<i id="arrowDown2" class="fa-solid fa-angle-down"></i></button>
          <div class="toggle_filter2">
            <span class="txt_time_label">가는날</span>
            <ul class="wrap_time_picker">
              <li class="txt_time_picker"><i class="fa-solid fa-check fa-active"></i><span>새벽 00:00 ~ 06:00</span></li>
              <li class="txt_time_picker"><i class="fa-solid fa-check"></i><span>오전 06:00 ~ 12:00</span></li>
              <li class="txt_time_picker"><i class="fa-solid fa-check"></i><span>오후 12:00 ~ 18:00</span></li>
              <li class="txt_time_picker"><i class="fa-solid fa-check"></i><span>야간 18:00 ~ 24:00</span></li>
            </ul>
            <span class="txt_time_label">오는날</span>
            <ul class="wrap_time_picker">
              <li class="txt_time_picker"><i class="fa-solid fa-check fa-active"></i><span>새벽 00:00 ~ 06:00</span></li>
              <li class="txt_time_picker"><i class="fa-solid fa-check"></i><span>오전 06:00 ~ 12:00</span></li>
              <li class="txt_time_picker"><i class="fa-solid fa-check"></i><span>오후 12:00 ~ 18:00</span></li>
              <li class="txt_time_picker"><i class="fa-solid fa-check"></i><span>야간 18:00 ~ 24:00</span></li>
            </ul>
          </div>
        </div>
      </section>
      <!-- 검색 결과 -->
      <section class="sec_result">
        <div class="wrap_result_title">
          <span class="result_count">검색결과 총 6개</span>
          <span class="result_sub_text">성인 기준 1인 왕복 요금입니다 (세금 및 수수료 모두 포함)</span>
          <!-- 커스텀 셀렉트 -->
          <div class="result_filter">
            <button class="result_filter_open"><span>가격 낮은 순</span><i id="arrowDown" class="fa-solid fa-angle-down"></i></button>
              <ul class="result_filter_select">
                <li class="result_filter_option">가격 낮은 순</li>
                <li class="result_filter_option">비행 시간 짧은 순</li>
                <li class="result_filter_option">가는날 출발 시간 빠른 순</li>
                <li class="result_filter_option">오는날 출발 시간 빠른 순</li>
                <li class="result_filter_option">가는날 도착 시간 빠른 순</li>
                <li class="result_filter_option">오는날 도착 시간 빠른 순</li>
              </ul>
          </div>
        </div>
        <!-- result data-->
        <div class="wrap_result_flight_list">
          <div class="wrap_flight_info">
            <div class="wrap_result_flight_info">
              <img src="../images/lg_jin_air.png" alt="항공사로고">
              <span class="airline_name">진에어</span>
              <table class="div_flight_time">
                <tr>
                  <td><span class="start_time">09:40</span></td>
                  <td><img src="../images/ic_arrow_right_plane.png"></td>
                  <td><span class="end_time">15:05</span></td>
                </tr>
                <tr>
                  <td><span class="start_airport">ICN</span></td>
                  <td><span class="taken_time">04시간 25분</span></td>
                  <td><span class="end_airport">GUM</span></td>
                </tr>
              </table>
            </div>
            <div class="wrap_result_flight_info">
              <img src="../images/lg_jin_air.png" alt="항공사로고">
              <span class="airline_name">진에어</span>
              <table class="div_flight_time">
                <tr>
                  <td><span class="start_time">09:40</span></td>
                  <td><img src="../images/ic_arrow_right_plane.png"></td>
                  <td><span class="end_time">15:20</span></td>
                </tr>
                <tr>
                  <td><span class="start_airport">GUM</span></td>
                  <td><span class="taken_time">04시간 40분</span></td>
                  <td><span class="end_airport">ICN</span></td>
                </tr>
              </table>
            </div>
          </div>
          <div class="wrap_flight_info_right">
            <div class="wrap_flight_price_btn">
              <span class="txt_flight_count">9석 남음</span>
              <span class="txt_flight_price">455,700<span>원</span></span>
              <span class="txt_flight_select">선택 <i class="fa-solid fa-chevron-right"></i></span>
            </div>
            <button class="toggle_flight_info">상세 정보 보기 <i class="fa-solid fa-chevron-down"></i></button>
          </div>
        </div>
        <div class="wrap_result_flight_detail">
          <div class="wrap_flight_title">
            <span class="flight_label">가는편</span>
            <span class="flight_location">서울 (ICN)</span>
            <img src="../images/ic_arrow_right_short.png">
            <span class="flight_location">괌 (GUM)</span>
            <span class="flight_time">04시간 25분</span>
          </div>
          <div class="wrap_flight_time">
            <span class="flight_no">진에어 0641</span>
            <div class="flight_time_info">
              <img src="../images/line_plane.png">
              <div class="wrap_flight_detail">
                <div class="wrap_flight_detail_top">
                  <span class="flight_detail_time">09:40</span>
                  <span class="flight_detail_loca">서울 ICN</span>
                  <span class="flight_detail_etc">무료수하물 1개</span>
                </div>
                <div class="wrap_flight_detail_middle">
                  <span class="flight_detail_etc">04시간 25분</span>
                </div>
                <div class="wrap_flight_detail_bottom">
                  <span class="flight_detail_time">15:05</span>
                  <span class="flight_detail_loca">괌 GUM</span>
                </div>
              </div>
            </div>
          </div>
          <div class="wrap_flight_title">
            <span class="flight_label">오는편</span>
            <span class="flight_location">괌 (GUM)</span>
            <img src="../images/ic_arrow_right_short.png">
            <span class="flight_location">서울 (ICN)</span>
            <span class="flight_time">04시간 40분</span>
          </div>
          <div class="wrap_flight_time">
            <span class="flight_no">진에어 0642</span>
            <div class="flight_time_info">
              <img src="../images/line_plane.png">
              <div class="wrap_flight_detail">
                <div class="wrap_flight_detail_top">
                  <span class="flight_detail_time">09:40</span>
                  <span class="flight_detail_loca">괌 GUM</span>
                  <span class="flight_detail_etc">무료수하물 1개</span>
                </div>
                <div class="wrap_flight_detail_middle">
                  <span class="flight_detail_etc">04시간 40분</span>
                </div>
                <div class="wrap_flight_detail_bottom">
                  <span class="flight_detail_time">15:05</span>
                  <span class="flight_detail_loca">서울 ICN</span>
                </div>
              </div>
            </div>
          </div>
          <div class="wrap_detail_price">
            <span class="tlt_detail_price">상세 요금</span>
            <table class="table_detail_price">
              <tr>
                <th width="12%">항목</th>
                <th width="12%">항공 요금</th>
                <th width="12%">유류할증료</th>
                <th width="12%">제세공과금</th>
                <th width="12%">발권수수료</th>
                <th width="12%">인원</th>
                <th width="25%">총 요금</th>
              </tr>
              <tr>
                <td>성인</td>
                <td>221,700원</td>
                <td>173,300원</td>
                <td>61,000원</td>
                <td>0원</td>
                <td>1명</td>
                <td>445,700원</td>
              </tr>
            </table>
            <div class="wrap_total_price">
              <span class="tlt_total_price">총 예상 요금</span>
              <div class="div_total_price">
                <span class="total_price">455,700</span><span class="total_won">원</span>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </div><c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>