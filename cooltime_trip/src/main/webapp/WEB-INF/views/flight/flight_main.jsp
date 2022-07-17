<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<c:import url="/WEB-INF/views/layout/head.jsp" />
	<script defer src="<c:url value='../js/flight_main.js' />"></script>
    <link rel="stylesheet" href="<c:url value='../css/flight_main.css'/>">
</head>

<body>
  <!-- header -->
 	<c:import url="/WEB-INF/views/layout/top.jsp"/>
  <!-- 항공 예약 -->
  <section class="flight_reservation">
    <div class="flight_reservation_content">
      <div class="flight_shuttle_button">
        <button id="roundTrip" class="flight_shuttle_select selectBtn">왕복</button>
        <button id="oneWay" class="flight_shuttle_select">편도</button>
        <button id="multi" class="flight_shuttle_select">다구간</button>
      </div>
      <div class="departure_arrival_container">
        <div class="location_box">
          <div class="depart_location">
            <span class="flight_reservation_subtitle">출발</span>
            <input type="text" class="departure_location" id="depart_loacation" placeholder="출발지를 선택하세요" autocomplete="off">
          </div>
          <div class="depart_popup" id="depart_pop">
            <div class="popup_wrap">
              <p class="depart_popup_title">출발 도시/공항 선택</p>
              <div class="depart_popup_search_box">
                <input id="popupLodSearch" type="text" placeholder="도시를 검색하세요" autocomplete="off">
                <button id="popupLodSearchBtn">검색하기</button>
              </div>
              <p class="depart_popup_subtitle">주요도시 바로 선택</p>
              <table id="depart_location_table" class="location_table">
                <tr>
                  <th rowspan="3">국내</th>
                  <td>제주</td>
                  <td>김포</td>
                  <td>부산</td>
                  <td>청주</td>
                </tr>
                <tr>
                  <td>여수</td>
                  <td>광주</td>
                  <td>대구</td>
                  <td>양양</td>
                </tr>
                <tr>
                  <td>군산</td>
                  <td>울산</td>
                  <td>포항</td>
                  <td>인천</td>
                </tr>
                <tr>
                  <th rowspan="2">아시아</th>
                  <td>다낭</td>
                  <td>방콕</td>
                  <td>세부</td>
                  <td>대만/타오위완</td>
                </tr>
                <tr>
                  <td>코타키나발루</td>
                  <td>나트랑/캄란</td>
                  <td>싱가포르</td>
                  <td>팡라오</td>
                </tr>
                <tr>
                  <th>중국</th>
                  <td>북경</td>
                  <td>상해</td>
                  <td>청도</td>
                  <td>성도</td>
                </tr>
                <tr>
                  <th rowspan="2">일본</th>
                  <td>도쿄/나리타</td>
                  <td>도쿄/하네다</td>
                  <td>오사카/간사이</td>
                  <td>오키나와</td>
                </tr>
                <tr>
                  <td>후쿠오카</td>
                  <td>키타큐슈</td>
                  <td>나고야</td>
                  <td>삿포로/치토세</td>
                </tr>
                <tr>
                  <th rowspan="2">미주</th>
                  <td>로스앤젤레스</td>
                  <td>하와이</td>
                  <td>뉴욕</td>
                  <td>토론토</td>
                </tr>
                <tr>
                  <td>밴쿠버</td>
                  <td>시카고</td>
                  <td>샌프란시스코</td>
                  <td>라스베가스</td>
                </tr>
                <tr>
                  <th>중남미</th>
                  <td>상파울로</td>
                  <td>칸쿤</td>
                  <td>산티아고</td>
                  <td>하바나</td>
                </tr>
                <tr>
                  <th rowspan="2">유럽</th>
                  <td>블라디보스크</td>
                  <td>파리</td>
                  <td>런던</td>
                  <td>로마</td>
                </tr>
                <tr>
                  <td>프랑크프루트</td>
                  <td>프라하</td>
                  <td>바르셀로나</td>
                  <td>이스탄불</td>
                </tr>
                <tr>
                  <th>대양주</th>
                  <td>시드니</td>
                  <td>맬버른</td>
                  <td>괌</td>
                  <td>사이판</td>
                </tr>
              </table>
            </div>
          </div>
          <i id="change" class="fa fa-exchange roundArrow" aria-hidden="true"></i>
          <div class="arrive_location">
            <span class="flight_reservation_subtitle">도착</span>
            <input type="text" class="arrival_location" id="arriveLocation" placeholder="도착지를 선택하세요" autocomplete="off">
          </div>
          <div class="arrive_popup" id="arrive_pop">
            <div class="popup_wrap">
              <p class="arrive_popup_title">도착 도시/공항 선택</p>
              <div class="arrive_popup_search_box">
                <input id="popupLodSearch2" type="text" placeholder="도시를 검색하세요" autocomplete="off">
                <button id="popupLodSearchBtn2">검색하기</button>
              </div>
              <p class="arrive_popup_subtitle">주요도시 바로 선택</p>
              <table id="arrive_location_table" class="location_table">
                <tr>
                  <th rowspan="3">국내</th>
                  <td>제주</td>
                  <td>김포</td>
                  <td>부산</td>
                  <td>청주</td>
                </tr>
                <tr>
                  <td>여수</td>
                  <td>광주</td>
                  <td>대구</td>
                  <td>양양</td>
                </tr>
                <tr>
                  <td>군산</td>
                  <td>울산</td>
                  <td>포항</td>
                  <td>인천</td>
                </tr>
                <tr>
                  <th rowspan="2">아시아</th>
                  <td>다낭</td>
                  <td>방콕</td>
                  <td>세부</td>
                  <td>대만/타오위완</td>
                </tr>
                <tr>
                  <td>코타키나발루</td>
                  <td>나트랑/캄란</td>
                  <td>싱가포르</td>
                  <td>팡라오</td>
                </tr>
                <tr>
                  <th>중국</th>
                  <td>북경</td>
                  <td>상해</td>
                  <td>청도</td>
                  <td>성도</td>
                </tr>
                <tr>
                  <th rowspan="2">일본</th>
                  <td>도쿄/나리타</td>
                  <td>도쿄/하네다</td>
                  <td>오사카/간사이</td>
                  <td>오키나와</td>
                </tr>
                <tr>
                  <td>후쿠오카</td>
                  <td>키타큐슈</td>
                  <td>나고야</td>
                  <td>삿포로/치토세</td>
                </tr>
                <tr>
                  <th rowspan="2">미주</th>
                  <td>로스앤젤레스</td>
                  <td>하와이</td>
                  <td>뉴욕</td>
                  <td>토론토</td>
                </tr>
                <tr>
                  <td>밴쿠버</td>
                  <td>시카고</td>
                  <td>샌프란시스코</td>
                  <td>라스베가스</td>
                </tr>
                <tr>
                  <th>중남미</th>
                  <td>상파울로</td>
                  <td>칸쿤</td>
                  <td>산티아고</td>
                  <td>하바나</td>
                </tr>
                <tr>
                  <th rowspan="2">유럽</th>
                  <td>블라디보스크</td>
                  <td>파리</td>
                  <td>런던</td>
                  <td>로마</td>
                </tr>
                <tr>
                  <td>프랑크프루트</td>
                  <td>프라하</td>
                  <td>바르셀로나</td>
                  <td>이스탄불</td>
                </tr>
                <tr>
                  <th>대양주</th>
                  <td>시드니</td>
                  <td>맬버른</td>
                  <td>괌</td>
                  <td>사이판</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
        <p class="partition">|</p>
        <div class="flight_date_box">
          <div class="flight_reservation_subtitle">출발일 - 도착일</div>
          <input type="text" class="flight_date" id="rangepicker" name="daterange" placeholder="여행 날짜 선택" autocomplete="off">
        </div>
        <div class="sit_class_box">
          <span class="flight_reservation_subtitle">인원, 좌석등급</span>
          <div class="sit_class_area" id="person_sit">
            <input type="button" class="sit_class1" id="personCount" value="1명"></input><span>,</span>
            <input type="button" class="sit_class2" id="classType" value="좌석 전체"></input>
          </div>
          
        </div>
        <div class="customer_flightclass_popup" id="custom_flight_pop">
          <div class="customer_flightclass_wrap">
            <p>인원 & 좌석등급</p>
            <div class="age_container">
              <div class="age_box">
                <div>성인</div>
                <div>만 12세 이상</div>
              </div>
              <div class="person_count_box">
                <span class="person_minus_button" id="adultBtnMinus" onclick="plusMinusBtn('adminus')">-</span>
                <span class="person_number" id="adCount">1</span>
                <span class="person_plus_button" id="adultBtnPlus" onclick="plusMinusBtn('adplus')">+</span>
              </div>
            </div>
            <div class="age_container">
              <div class="age_box">
                <div>소아</div>
                <div>만 12세 미만</div>
              </div>
              <div class="person_count_box">
                <span class="person_minus_button" id="childBtnMinus" onclick="plusMinusBtn('cdminus')">-</span>
                <span class="person_number" id="cdCount">0</span>
                <span class="person_plus_button" id="childBtnPlus" onclick="plusMinusBtn('cdplus')">+</span>
              </div>
            </div>
            <div class="age_container">
              <div class="age_box">
                <div>유아</div>
                <div>24개월 미만</div>
              </div>
              <div class="person_count_box">
                <span class="person_minus_button" id="babyBtnMinus" onclick="plusMinusBtn('bbminus')">-</span>
                <span class="person_number" id="bbCount">0</span>
                <span class="person_plus_button" id="babyBtnPlus" onclick="plusMinusBtn('bbplus')">+</span>
              </div>
            </div>
            <div class="flight_sit_choice">
              <div>
                <input id="sitsGen" type="radio" name="sits" value="일반석" checked="checked">
                <label id="sitsGenLabel" for="sitsGen"> 일반석</label>
              </div>
              <div>
                <input id="sitsPreGen" type="radio" name="sits" value="프리미엄 일반석">
                <label id="sitsPreGenLabel" for="sitsPreGen"> 프리미엄 일반석</label>
              </div>
              <div>
                <input id="sitsBusi" type="radio" name="sits" value="비즈니스석">
                <label id="sitsBusiLabel" for="sitsBusi">비즈니스석</label>
              </div>
              <div>
                <input id="sitsFir" type="radio" name="sits" value="일등석">
                <label id="sitsFirLabel" for="sitsFir">일등석</label>
              </div>
            </div>
          </div>
        </div>
        <input type="button" class="flight_search" value="검색하기" onclick="flightCheck()">
      </div>
    </div>
  </section>

  <!-- 비행기 배경 -->
  <section class="flight_background">
    <img src="<c:url value='../images/bg_plane@2x.png'/>" alt="비행기 배경">
    <div class="flight_reservation_title">
      항공 예약
    </div>
  </section>

  <!-- 최근 검색한 항공권 -->
  <section class="recently_search_flight">
    <div class="recently_flight_title">최근 검색한 항공권</div>

    <div class="recently_slide_container">
      <div class="recently_slide_box">
        <div class="recently_item">
          <div class="shuttle_close_line">
            <span class="recently_shuttle_way">왕복</span>
            <span class="recently_colse_btn"><i class="fa fa-times close" aria-hidden="true"></i></span>
          </div>
          <div class="recently_destination">
            <span>김포 (GMP)</span><i class="fa fa-exchange" aria-hidden="true"></i><span>제주 (CJU)</span>
          </div>
          <div class="recently_desc">
            <span>6월 20일 ~ 6월 25일 · </span><span>성인1 · </span><span>전체</span>
          </div>
        </div>
        <div class="recently_item">
          <div class="shuttle_close_line">
            <span class="recently_shuttle_way">왕복</span>
            <span class="recently_colse_btn"><i class="fa fa-times close" aria-hidden="true"></i></span>
          </div>
          <div class="recently_destination">
            <span>김포 (GMP)</span><i class="fa fa-exchange" aria-hidden="true"></i><span>괌 (GUM)</span>
          </div>
          <div class="recently_desc">
            <span>6월 20일 ~ 6월 23일 · </span><span>성인1 · </span><span>전체</span>
          </div>
        </div>
        <div class="recently_item">
          <div class="shuttle_close_line">
            <span class="recently_shuttle_way">왕복</span>
            <span class="recently_colse_btn"><i class="fa fa-times close" aria-hidden="true"></i></span>
          </div>
          <div class="recently_destination">
            <span>김포 (GMP)</span><i class="fa fa-exchange" aria-hidden="true"></i><span>세부 (CBU)</span>
          </div>
          <div class="recently_desc">
            <span>6월 21일 ~ 6월 27일 · </span><span>성인1 · </span><span>전체</span>
          </div>
        </div>
        <div class="recently_item">
          <div class="shuttle_close_line">
            <span class="recently_shuttle_way">왕복</span>
            <span class="recently_colse_btn"><i class="fa fa-times close" aria-hidden="true"></i></span>
          </div>
          <div class="recently_destination">
            <span>김포 (GMP)</span><i class="fa fa-exchange" aria-hidden="true"></i><span>괌 (GUM)</span>
          </div>
          <div class="recently_desc">
            <span>6월 22일 ~ 6월 26일 · </span><span>성인1 · </span><span>전체</span>
          </div>
        </div>
        <div class="recently_item">
          <div class="shuttle_close_line">
            <span class="recently_shuttle_way">왕복</span>
            <span class="recently_colse_btn"><i class="fa fa-times close" aria-hidden="true"></i></span>
          </div>
          <div class="recently_destination">
            <span>김포 (GMP)</span><i class="fa fa-exchange" aria-hidden="true"></i><span>제주 (CJU)</span>
          </div>
          <div class="recently_desc">
            <span>6월 20일 ~ 6월 24일 · </span><span>성인1 · </span><span>전체</span>
          </div>
        </div>
        <div class="recently_item">
          <div class="shuttle_close_line">
            <span class="recently_shuttle_way">왕복</span>
            <span class="recently_colse_btn"><i class="fa fa-times close" aria-hidden="true"></i></span>
          </div>
          <div class="recently_destination">
            <span>김포 (GMP)</span><i class="fa fa-exchange" aria-hidden="true"></i><span>세부 (CBU)</span>
          </div>
          <div class="recently_desc">
            <span>6월 24일 ~ 6월 30일 · </span><span>성인1 · </span><span>전체</span>
          </div>
        </div>
      </div>
    </div>
    
    <span class="recently_prev" id="flightPrev"><i class="fas fa-chevron-left"></i></span>
    <span class="recently_next" id="flightNext"><i class="fas fa-chevron-right"></i></span>
    
    
  </section>

  <!-- 제주여행 -->
  <section class="jeju_trip">
    <div class="jeju_title">제주 휴가 즐겨요</div>
    <div class="jeju_container">
      <div class="jeju_box">
        <img src="<c:url value='/images/jeju1.jfif'/>">
        <div class="jeju_content">
          <div class="jeju_location_direction">
            <span>서울</span><i class="fas fa-long-arrow-alt-right"></i><span>제주</span>
          </div>
          <div class="jeju_date">
            <span>6월 20일 - 6월 25일</span>
          </div>
          <div class="jeju_price">
            <span>37,500 ~</span>
          </div>
        </div>
      </div>
      <div class="jeju_box">
        <img src="<c:url value='../images/jeju2.jfif'/>">
        <div class="jeju_content">
          <div class="jeju_location_direction">
            <span>서울</span><i class="fas fa-long-arrow-alt-right"></i><span>제주</span>
          </div>
          <div class="jeju_date">
            <span>6월 20일 - 6월 25일</span>
          </div>
          <div class="jeju_price">
            <span>37,500 ~</span>
          </div>
        </div>
      </div>
      <div class="jeju_box">
        <img src="<c:url value='../images/jeju3.jfif'/>">
        <div class="jeju_content">
          <div class="jeju_location_direction">
            <span>서울</span><i class="fas fa-long-arrow-alt-right"></i><span>제주</span>
          </div>
          <div class="jeju_date">
            <span>6월 20일 - 6월 25일</span>
          </div>
          <div class="jeju_price">
            <span>37,500 ~</span>
          </div>
        </div>
      </div>
      <div class="jeju_box">
        <img src="<c:url value='../images/jeju4.jfif'/>">
        <div class="jeju_content">
          <div class="jeju_location_direction">
            <span>서울</span><i class="fas fa-long-arrow-alt-right"></i><span>제주</span>
          </div>
          <div class="jeju_date">
            <span>6월 20일 - 6월 25일</span>
          </div>
          <div class="jeju_price">
            <span>37,500 ~</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 신혼여행 -->
  <section class="honeymoon_trip">
    <div class="honeymoon_title">신혼여행</div>
    <div class="honeymoon_container">
      <div class="honeymoon_box">
        <img src="<c:url value='/images/guam1.jfif'/>">
        <div class="honeymoon_content">
          <div class="honeymoon_location_direction">
            <span>서울</span><i class="fas fa-long-arrow-alt-right"></i><span>괌</span>
          </div>
          <div class="honeymoon_date">
            <span>6월 20일 - 6월 25일</span>
          </div>
          <div class="honeymoon_price">
            <span>437,500 ~</span>
          </div>
        </div>
      </div>
      <div class="honeymoon_box">
        <img src="<c:url value='/images/guam2.jfif'/>">
        <div class="honeymoon_content">
          <div class="honeymoon_location_direction">
            <span>서울</span><i class="fas fa-long-arrow-alt-right"></i><span>괌</span>
          </div>
          <div class="honeymoon_date">
            <span>6월 20일 - 6월 25일</span>
          </div>
          <div class="honeymoon_price">
            <span>437,500 ~</span>
          </div>
        </div>
      </div>
      <div class="honeymoon_box">
        <img src="<c:url value='/images/guam3.jfif'/>">
        <div class="honeymoon_content">
          <div class="honeymoon_location_direction">
            <span>서울</span><i class="fas fa-long-arrow-alt-right"></i><span>괌</span>
          </div>
          <div class="honeymoon_date">
            <span>6월 20일 - 6월 25일</span>
          </div>
          <div class="honeymoon_price">
            <span>437,500 ~</span>
          </div>
        </div>
      </div>
      <div class="honeymoon_box">
        <img src="<c:url value='/images/guam4.jfif'/>">
        <div class="honeymoon_content">
          <div class="honeymoon_location_direction">
            <span>서울</span><i class="fas fa-long-arrow-alt-right"></i><span>괌</span>
          </div>
          <div class="honeymoon_date">
            <span>6월 20일 - 6월 25일</span>
          </div>
          <div class="honeymoon_price">
            <span>437,500 ~</span>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- footer -->
  <c:import url="/WEB-INF/views/layout/bottom.jsp"/>
</body>
</html>