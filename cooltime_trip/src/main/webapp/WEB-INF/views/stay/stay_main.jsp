<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <form>
          <table>
            <tr>
              <th width="30%">여행지, 숙소</th>
              <th width="35%">날짜</th>
              <th width="20%">인원</th>
              <!-- 검색하기 버튼 -->
              <td width="15%" rowspan="2"><input type="button" class="btn_search_stay" value="검색하기"></td>
            </tr>
            <tr>
              <!-- 해당영역에 js에서 val()로 값 지정 -->
              <!-- 여행지 검색 인풋 -->
              <td><input type="text" id="lodSearchBtn" class="txt_stay txt_stay_placeholder" value="여행지를 검색해주세요"></td>
              <!-- 날짜 선택 인풋 -->
              <td><input type="text" id="lodDatepicker" name="daterange" class="txt_stay txt_stay_placeholder" value="날짜를 선택해주세요"></td>
              <!-- 인원 선택 인풋 -->
              <td><input type="text" id="lodPersonCount" class="txt_stay" value="성인1, 어린이0"></td>
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
      <div class="box_recent">
        <div class="div_recent_img">
          <img class="img_recent_hotel" src="../images/img_ramada.jpg" alt="숙소 사진">
        </div>
        <div class="inner_recent_info">
          <span class="txt_recent_location">호텔 ・ 제주도</span>
          <span class="txt_recent_hotel">라마다 제주시티 호텔</span>
          <span class="txt_recent_price">73,000원</span>
        </div>
      </div>
      <div class="box_recent">
        <div class="div_recent_img">
          <img class="img_recent_hotel" src="../images/img_maison.jpg" alt="숙소 사진">
        </div>
        <div class="inner_recent_info">
          <span class="txt_recent_location">호텔 ・ 제주도</span>
          <span class="txt_recent_hotel">메종 글래드 제주</span>
          <span class="txt_recent_price">178,700원</span>
        </div>
      </div>
      <div class="box_recent mr_0">
        <div class="div_recent_img">
          <img class="img_recent_hotel" src="../images/img_shillastay.jpg" alt="숙소 사진">
        </div>
        <div class="inner_recent_info">
          <span class="txt_recent_location">호텔 ・ 제주도</span>
          <span class="txt_recent_hotel">신라스테이 제주</span>
          <span class="txt_recent_price">157,500원</span>
        </div>
      </div>
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
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="../images/img_maison.jpg" alt="메종 글래드 제주">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">메종 글래드 제주</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>4.5<span class="txt_review_count">(131)</span></span>
          <span class="txt_rmd_price">178,700원</span>
        </div>
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="../images/img_shillastay.jpg" alt="신라스테이 제주">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">신라 스테이 제주</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>4.6<span class="txt_review_count">(61)</span></span>
          <span class="txt_rmd_price">157,500원</span>
        </div>
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="../images/img_first70.jpg" alt="서귀포 퍼스트70 호텔">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">서귀포 퍼스트70 호텔</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>4.3<span class="txt_review_count">(123)</span></span>
          <span class="txt_rmd_price">70,000원</span>
        </div>
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="../images/img_coopcityhotel.jpg" alt="코업시티 호텔 하버뷰">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">코업시티 호텔 하버뷰</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>4.3<span class="txt_review_count">(81)</span></span>
          <span class="txt_rmd_price">59,000원</span>
        </div>
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="../images/img_phoenix.jpg" alt="휘닉스 제주 섭지코지">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">휘닉스 제주 섭지코지</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>4.4<span class="txt_review_count">(39)</span></span>
          <span class="txt_rmd_price">330,000원</span>
        </div>
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="../images/img_cordelia.jpg" alt="코델리아S 호텔">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">코델리아S 호텔</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>3.8<span class="txt_review_count">(91)</span></span>
          <span class="txt_rmd_price">44,850원</span>
        </div>
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="../images/img_thecube.jpg" alt="더큐브 리조트 제주">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">더큐브 리조트 제주</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>4.5<span class="txt_review_count">(321)</span></span>
          <span class="txt_rmd_price">65,000원</span>
        </div>
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="../images/img_thecube.jpg" alt="더큐브 리조트 제주">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">더큐브 리조트 제주</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>4.5<span class="txt_review_count">(321)</span></span>
          <span class="txt_rmd_price">65,000원</span>
        </div>
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="../images/img_thecube.jpg" alt="더큐브 리조트 제주">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">더큐브 리조트 제주</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>4.5<span class="txt_review_count">(321)</span></span>
          <span class="txt_rmd_price">65,000원</span>
        </div>
      </div>
    </div>
    <!-- 강원도 인기 호텔 -->
    <div class="div_rmd_list">
      <h3 class="tlt_rmd">강원도 인기 호텔 ⛱</h3>
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
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="../images/img_maison.jpg" alt="메종 글래드 제주">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">메종 글래드 제주</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>4.5<span class="txt_review_count">(131)</span></span>
          <span class="txt_rmd_price">178,700원</span>
        </div>
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="../images/img_shillastay.jpg" alt="신라스테이 제주">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">신라 스테이 제주</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>4.6<span class="txt_review_count">(61)</span></span>
          <span class="txt_rmd_price">157,500원</span>
        </div>
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="../images/img_first70.jpg" alt="서귀포 퍼스트70 호텔">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">서귀포 퍼스트70 호텔</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>4.3<span class="txt_review_count">(123)</span></span>
          <span class="txt_rmd_price">70,000원</span>
        </div>
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="../images/img_coopcityhotel.jpg" alt="코업시티 호텔 하버뷰">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">코업시티 호텔 하버뷰</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>4.3<span class="txt_review_count">(81)</span></span>
          <span class="txt_rmd_price">59,000원</span>
        </div>
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="../images/img_phoenix.jpg" alt="휘닉스 제주 섭지코지">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">휘닉스 제주 섭지코지</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>4.4<span class="txt_review_count">(39)</span></span>
          <span class="txt_rmd_price">330,000원</span>
        </div>
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="../images/img_cordelia.jpg" alt="코델리아S 호텔">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">코델리아S 호텔</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>3.8<span class="txt_review_count">(91)</span></span>
          <span class="txt_rmd_price">44,850원</span>
        </div>
        <div class="inner_rmd_list">
          <div class="div_img_hotel">
            <img class="img_rmd_hotel" src="../images/img_thecube.jpg" alt="더큐브 리조트 제주">
          </div>
          <span class="txt_rmd_location">호텔 ・ 제주도</span>
          <span class="txt_rmd_hotel">더큐브 리조트 제주</span>
          <span class="txt_rmd_star"><i class="fa-solid fa-star"></i>4.5<span class="txt_review_count">(321)</span></span>
          <span class="txt_rmd_price">65,000원</span>
        </div>
      </div>
    </div>
  </section><c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>