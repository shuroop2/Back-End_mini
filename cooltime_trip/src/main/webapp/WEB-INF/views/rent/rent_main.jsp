<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 양식 다시 제출 방지 -->
<%    
response.setHeader("Cache-Control","no-store");    
response.setHeader("Pragma","no-cache");    
response.setDateHeader("Expires",0);    
if (request.getProtocol().equals("HTTP/1.1"))  
        response.setHeader("Cache-Control", "no-cache");  
%>
<!DOCTYPE html>
<html><c:import url="/WEB-INF/views/layout/head.jsp" />
	<!-- custom -->
    <script src="<c:url value='/js/rent_main.js' />"></script>
	<link rel="stylesheet" href="<c:url value='/css/rent_main.css' />"/>
</head>
<body><c:import url="/WEB-INF/views/layout/top.jsp" />
	<!-- 검색 영역 -->
  <section class="sec_search">
    <!-- 렌트카 백그라운드 -->
    <div class="div_bg_rent">
      <img class="bg_rent" src="<c:url value='/images/bg_rent.jpg' />" alt="숙박예약 배경">
    </div>
    <!-- 렌트카 타이틀 -->
    <h2 class="tlt_rent">렌터카 예약</h2>
    <!-- 검색이나 설정하는 영역 / 유효성 검사 필요 -->
    <div class="div_rent_search">
      <div class="wrap_rent_table">
        <!-- 유효성 검사 위한 폼태그 설정 -->
        <form method="post" action="<c:url value='/rent_list'/>">
          <table>
            <tr>
              <th width="22%">여행지</th>
              <th width="45%">날짜</th>
              <th width="18%">운전자 생년월일</th>
              <!-- 검색하기 버튼 -->
              <td width="15%" rowspan="2"><input type="submit" class="btn_search_rent" value="검색하기"></td>
            </tr>
            <tr>
              <!-- 해당영역에 js에서 val()로 값 지정 -->
              <!-- 여행지 검색 인풋 -->
              <td><input type="text" id="rentSearchBtn" name="rentLocation" class="txt_rent txt_rent_placeholder" value="여행지를 검색해주세요"></td>
              <!-- 날짜 선택 인풋 -->
              <td><input type="text" id="rentDatepicker" name="datetimes" class="txt_rent txt_rent_placeholder" value="날짜를 선택해주세요"></td>
              <!-- 운전자 생년월일 입력 인풋 -->
              <td><input type="text" id="rentBirth" name="rentBirth" class="txt_rent" placeholder="YYMMDD"></td>
            </tr>
          </table>
        </form>
        <!-- 여행지 검색 팝업 -->
        <div class="popup_rent">
          <h4 class="tlt_popup_rent">여행지 검색</h4>
          <i id="popuprentCloseBtn" class="fa-solid fa-xmark"></i>
          <!-- 검색 인풋 영역 -->
          <div class="div_popup_search">
            <input type="text" id="popuprentSearch" class="input_popup_search" placeholder="여행지 검색">
            <input type="button" id="popuprentSearchBtn" class="btn_popup_search" value="검색하기">
          </div>
          <h6 class="tlt_list_rent">최근 확인한 여행지</h6>
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
          <h6 class="tlt_list_rent">인기 여행지</h6>
          <!-- 인기 여행지 3개 -->
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
      </div>
    </div>
  </section>
  <!-- 검색 영역 끝 -->
  <!-- 렌터카 소개 -->
  <section class="sec_rent_info wrap">
    <div class="div_rent_info">
        <img class="ic_rent_info" src="<c:url value='/images/ic_low.png' />">
        <span class="tlt_rent_info">최저가 비교</span>
        <span class="txt_rent_info">전국 13,000개 이상의 렌터카를<br>한 곳에서 비교하세요</span>
    </div>
    <div class="div_rent_info">
        <img class="ic_rent_info" src="<c:url value='/images/ic_free.png' />">
        <span class="tlt_rent_info">무료 취소</span>
        <span class="txt_rent_info">인수 72시간 전까지<br>무료로 취소할 수 있어요</span>
    </div>
    <div class="div_rent_info">
        <img class="ic_rent_info" src="<c:url value='/images/ic_super.png' />">
        <span class="tlt_rent_info">슈퍼 자차 보험</span>
        <span class="txt_rent_info">예상치 못한 상황에도<br>안심할 수 있어요</span>
    </div>
    <div class="div_rent_info">
        <img class="ic_rent_info" src="<c:url value='/images/ic_cal.png' />">
        <span class="tlt_rent_info">당일 예약</span>
        <span class="txt_rent_info">1시간 전에도 렌터카를<br>예약할 수 있어요</span>
    </div>
  </section><c:import url="/WEB-INF/views/layout/bottom.jsp" />
  <!-- 렌터카 소개 끝 -->
</body>
</html>