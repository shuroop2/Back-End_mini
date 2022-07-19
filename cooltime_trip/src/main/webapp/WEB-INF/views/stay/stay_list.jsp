<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html><c:import url="/WEB-INF/views/layout/head.jsp" />
	<!-- custom -->
    <script src="<c:url value='/js/stay_list.js' />"></script>
	<link rel="stylesheet" href="<c:url value='/css/list.css' />"/>
</head>
<body><c:import url="/WEB-INF/views/layout/top.jsp" />
	<!-- 검색 영역 -->
  <section class="sec_search_list">
    <span class="div_list_tlt">여행지</span>
    <!-- 검색 설정 영역 / 유효성 검사 필요 -->
    <div class="div_lod_list_search wrap">
      <div class="wrap_lod_div">
        <form id="lodSearchList">
            <div class="wrap_search_input">
              <input type="text" id="lodListSearchBtn" class="txt_stay" value="${stayLocation }">
              <input type="text" id="lodListDatepicker" name="daterange" class="txt_stay" value="${daterange }">
              <input type="text" id="lodListPersonCount" class="txt_stay" value="${personCount }">
              <input type="submit" class="btn_search_stay" value="검색하기">
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
              <span class="txt_person_sub">만 18세 이상</span>
            </div>
            <div class="box_plus_minus">
              <a id="adultListMinusBtn" class="btn_popup_count">-</a>
              <span id="adultListCount" class="popup_count_person">1</span>
              <a href="#" id="adultListPlusBtn" class="btn_popup_count btn_adult_plus btn_count_active">+</a>
            </div>
          </div>
          <div class="div_person_count">
            <div class="box_txt_person">
              <span class="txt_person_main">어린이</span>
              <span class="txt_person_sub">만 18세 미만</span>
            </div>
            <div class="box_plus_minus">
              <a id="childListMinusBtn" class="btn_popup_count">-</a>
              <span id="childListCount" class="popup_count_person">0</span>
              <a href="#" id="childListPlusBtn" class="btn_popup_count btn_count_active">+</a>
            </div>
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
        <div class="wrap_map_btn">
          <a href="https://map.naver.com/v5/search/hotel?c=14080163.7383975,3960182.5048724,14.31,0,0,0,dh">
            <img src="<c:url value='images/btn_map.png'/>" alt="지도로 보기">
            <span>지도로 보기</span>
          </a>
        </div>
        <div class="wrap_hotel_star">
          <span class="tlt_hotel_star">호텔등급</span>
          <div class="wrap_star">
            <i class="fa-solid fa-star"><span id="starZero">0+</span></i>
            <i class="fa-solid fa-star"><span id="starTwo">2</span></i>
            <i class="fa-solid fa-star"><span id="starThree">3</span></i>
            <i class="fa-solid fa-star"><span id="starFour">4</span></i>
            <i class="fa-solid fa-star fa-disabled"><span id="starFive">5</span></i>
          </div>
        </div>
      </section>
      <!-- 검색 결과 -->
      <section class="sec_result">
        <div class="wrap_result_title">
          <span class="result_count">검색결과 총 ${fn:length(hotelList)}개</span>
          <!-- 커스텀 셀렉트 -->
          <div class="result_filter">
            <button class="result_filter_open"><span>추천순</span><i id="arrowDown" class="fa-solid fa-angle-down"></i></button>
              <ul class="result_filter_select">
                <li class="result_filter_option">추천순</li>
                <li class="result_filter_option">많은 후기순</li>
                <li class="result_filter_option">높은 평점순</li>
                <li class="result_filter_option">낮은 가격순</li>
                <li class="result_filter_option">높은 가격순</li>
              </ul>
          </div>
        </div>
        <!-- result data-->
        <c:forEach items="${hotelList }" var="hotelList" >
	        <div class="wrap_result_list">
	          <div class="wrap_result_img">
	            <img src="<c:url value='/hotelImg/${hotelList.hotelNo}/h001.png'/>" alt="호텔 사진"> <!-- /hotelImg/ho001/h001.png -->
	          </div>
	          <div class="wrap_result_hotel_info">
	            <span class="txt_result_name">${hotelList.hotelName}</span>
	            <span class="txt_result_adrs">${hotelList.hotelGrade } ・ ${hotelList.hotelAddress }</span>
	            <span class="txt_result_review"><i class="fa-solid fa-star txt_blue"></i>${hotelList.hotelAssesment}<span class="txt_result_review_count">(131)</span></span>
	            <span class="txt_result_price">178,700원</span>
	          </div>
	        </div>
        </c:forEach>
      </section>
    </div>
  </div><c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>