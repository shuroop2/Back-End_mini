<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<html><c:import url="/WEB-INF/views/layout/head.jsp" />
	<!-- custom -->
    <script src="<c:url value='/js/stay_main.js' />"></script>
	<link rel="stylesheet" href="<c:url value='/css/stay_main.css' />"/>
</head>
<body><c:import url="/WEB-INF/views/layout/top.jsp" />
	<!-- 검색 영역 -->
  <section class="sec_search">
    <!-- 백그라운드 -->
    <div class="div_bg_stay">
      <img class="bg_stay" src="<c:url value='../images/bg_stay.jpg'/>" alt="숙박예약 배경">
    </div>
    <!-- 숙박 타이틀 -->
    <h2 class="tlt_stay">숙박 예약</h2>
    <!-- 검색이나 설정하는 영역 / 유효성 검사 필요 -->
    <div class="div_lod_search">
      <div class="wrap_lod_table">
        <!-- 유효성 검사 위한 폼태그 설정 -->
        <form method="post" action="<c:url value='/stay_list'/>">
          <table>
            <tr>
              <th width="30%">여행지, 숙소</th>
              <th width="35%">날짜</th>
              <th width="20%">인원</th>
              <!-- 검색하기 버튼 -->
              <td width="15%" rowspan="2"><input type="submit" class="btn_search_stay" value="검색하기"></td>
            </tr>
            <tr>
              <!-- 해당영역에 js에서 val()로 값 지정 -->
              <!-- 여행지 검색 인풋 -->
              <td><input type="text" id="lodSearchBtn" name="stayLocation"class="txt_stay txt_stay_placeholder" value="여행지를 검색해주세요"></td>
              <!-- 날짜 선택 인풋 -->
              <td><input type="text" id="lodDatepicker" name="daterange" class="txt_stay txt_stay_placeholder" value="날짜를 선택해주세요"></td>
              <!-- 인원 선택 인풋 -->
              <td><input type="text" id="lodPersonCount" name="personCount"class="txt_stay" value="성인1, 어린이0"></td>
            </tr>
          </table>
        </form>
        <!-- 여행지 검색 팝업 -->
        <div class="popup_lod">
          <h4 class="tlt_popup_lod">여행지 검색</h4>
          <i id="popupLodCloseBtn" class="fa-solid fa-xmark"></i>
          <!-- 검색 인풋 영역 -->
          <div class="div_popup_search">
            <input type="text" id="popupLodSearch" class="input_popup_search" placeholder="여행지 검색">
            <input type="button" id="popupLodSearchBtn" class="btn_popup_search" value="검색하기">
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
        <!-- 인원 팝업 -->
        <div class="popup_person">
          <h4 class="tlt_popup_person">인원 선택</h4>
          <i id="popupPersonCloseBtn" class="fa-solid fa-xmark"></i>
          <!-- 인원 선택 성인 -->
          <div class="div_person_count">
            <div class="box_txt_person">
              <span class="txt_person_main">성인</span>
              <span class="txt_person_sub">만 18세 이상</span>
            </div>
            <div class="box_plus_minus">
              <a id="adultMinusBtn" class="btn_popup_count">-</a>
              <span id="adultCount" class="popup_count_person">1</span>
              <a id="adultPlusBtn" class="btn_popup_count btn_adult_plus btn_count_active">+</a>
            </div>
          </div>
          <!-- 인원 선택 어린이 -->
          <div class="div_person_count">
            <div class="box_txt_person">
              <span class="txt_person_main">어린이</span>
              <span class="txt_person_sub">만 18세 미만</span>
            </div>
            <div class="box_plus_minus">
              <a id="childMinusBtn" class="btn_popup_count">-</a>
              <span id="childCount" class="popup_count_person">0</span>
              <a id="childPlusBtn" class="btn_popup_count btn_count_active">+</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- 검색 영역 끝 -->
  <!-- 최근 검색 숙소 -->
  <section class="sec_recent wrap">
    <h4 class="tlt_recent">최근 검색한 숙소</h4>
    <!-- 숙박은 최근 검색 최대 3개만 뜨게 -->
    <div class="div_recent_list">
    <c:forEach begin="7" end="9" items="${hotelList }" var="hotelList">
    <form id="recentForm${hotelList.hotelNo}" method="post" action="<c:url value='/stay_detail/${hotelList.hotelNo }'/>">
      <div class="box_recent">
        <div class="div_recent_img">
          <img id="recentHotel${hotelList.hotelNo }" class="img_recent_hotel" src="<c:url value='/hotelImg/${hotelList.hotelNo }/h001.png'/>" alt="숙소 사진">
        </div>
        <div class="inner_recent_info">
          <span class="txt_recent_location">호텔 ・ 제주도</span>
          <span class="txt_recent_hotel">${hotelList.hotelName }</span>
          <span class="txt_recent_price"><fmt:formatNumber value='${hotelList.roomTPrice}'/>원</span>
        </div>
      </div>
      <input type="hidden" class ="todayDate" name="daterange">
	  <input type="hidden" name="personCount" value="성인2, 어린이0">
      </form>
      <script>
      	$('#recentHotel${hotelList.hotelNo}').click(function(){
      		$('#recentForm${hotelList.hotelNo}').submit();
      	});
      </script>
      </c:forEach>
    </div>
  </section>
  <!-- 최근 검색 숙소 끝 -->
  <!-- 숙소 추천 -->
  <section class="sec_rmd wrap">
    <!-- 제주도 인기 호텔 -->
    <div class="div_rmd_list">
      <h3 class="tlt_rmd">제주도 인기 호텔 🏝️</h3>
      <!-- Prev / Next -->
      <div class="box_rmd_prev">
        <div id="divfirstPrev" class="prev">
          <a id="firstPrevBtn"><i class="fa-solid fa-chevron-left"></i></a>
          <div class="gradient_white"></div>
        </div>
      </div>
      <div class="box_rmd_next">
        <div id="divfirstNext" class="next">
          <a id="firstNextBtn"><i class="fa-solid fa-chevron-right"></i></a>
          <div class="gradient_white"></div>
        </div>
      </div>
      <div id="rmdfirstList" class="box_rmd_list">
      <c:forEach begin="1" end="10" items="${hotelList }" var="hotelList">
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="<c:url value='hotelImg/${hotelList.hotelNo }/h001.png'/>" alt="메종 글래드 제주">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">${hotelList.hotelName }</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>${fn:substring(hotelList.hotelAssesment,0,3)}<span class="txt_review_count">${fn:substring(hotelList.hotelAssesment,3,9)}</span></span>
          <span class="txt_rmd_price"><fmt:formatNumber value='${hotelList.roomTPrice}'/>원</span>
        </div>
        </c:forEach>
      </div>
    </div>
    <!-- 강원도 인기 호텔 -->
    <div class="div_rmd_list">
      <h3 class="tlt_rmd">신혼여행 인기 호텔 ⛱</h3>
      <!-- Prev / Next -->
      <div class="box_rmd_prev">
        <div id="divsecondPrev" class="prev">
          <a id="secondPrevBtn"><i class="fa-solid fa-chevron-left"></i></a>
          <div class="gradient_white"></div>
        </div>
      </div>
      <div class="box_rmd_next">
        <div id="divsecondNext" class="next">
          <a id="secondNextBtn"><i class="fa-solid fa-chevron-right"></i></a>
          <div class="gradient_white"></div>
        </div>
      </div>
      <div id="rmdsecondList" class="box_rmd_list">
      <c:forEach begin="11" end="20" items="${hotelList }" var="hotelList">
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="<c:url value='hotelImg/${hotelList.hotelNo }/h001.png'/>" alt="메종 글래드 제주">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">${hotelList.hotelName}</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>${fn:substring(hotelList.hotelAssesment,0,3)}<span class="txt_review_count">${fn:substring(hotelList.hotelAssesment,3,9)}</span></span>
          <span class="txt_rmd_price"><fmt:formatNumber value='${hotelList.roomTPrice}'/>원</span>
        </div>
        </c:forEach>
      </div>
    </div>
  </section><c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>