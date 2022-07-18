<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html><c:import url="/WEB-INF/views/layout/head.jsp" />
	<!-- custom -->
    <script src="<c:url value='/js/flight_list.js' />"></script>
	<link rel="stylesheet" href="<c:url value='/css/list.css' />"/>
	<script type="text/javascript">
		var cnt = 0;
	</script>
</head>
<body><c:import url="/WEB-INF/views/layout/top.jsp" />
	<!-- 검색 영역 -->
  <section class="sec_search_list">
    <span class="div_list_tlt">${shuttle }</span>
    <!-- 검색 설정 영역 / 유효성 검사 필요 -->
    <div class="div_flight_list_search wrap">
      <div class="wrap_flight_div">
        <form id="flightSearchList">
            <div class="wrap_search_input">
              <input type="text" id="flightStartSearchBtn" class="txt_lodgment" value="${depart_location }">
              <button><i class="fa-solid fa-arrow-right-arrow-left"></i></button>
              <input type="text" id="flightEndSearchBtn" class="txt_lodgment" value="${arrive_location }">
              <input type="text" id="flightDatepicker" name="daterange" class="txt_lodgment" value="${daterange }">
              <input type="text" id="flightPersonCount" class="txt_lodgment" value="${personCount}, ${classType}">
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
          <span id="result_count" class="result_count">검색결과 총 ${fn:length(objDep)}개</span>
          <span class="result_sub_text">성인 기준 1인 왕복 요금입니다 (세금 및 수수료 모두 포함)</span>
          <!-- 커스텀 셀렉트 -->
          <div class="result_filter">
            <button class="result_filter_open"><span>가는날 출발 시간 빠른 순</span><i id="arrowDown" class="fa-solid fa-angle-down"></i></button>
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
        <c:forEach var="obj" items="${objDep}" varStatus="status">
        <div class="wrap_result_flight_list">
          <div class="wrap_flight_info">
            <div class="wrap_result_flight_info">
              <img src="<c:url value='/images/${obj.airlineNm}.png'/>" alt="항공사로고">
              <span class="airline_name">${obj.airlineNm}</span>
              <table class="div_flight_time">
                <tr>
                  <td><span class="start_time">${fn:substring(obj.depPlandTime,8,10)}:${fn:substring(obj.depPlandTime,10,12)}</span></td>
                  <td><img src="<c:url value='/images/ic_arrow_right_plane.png' />"></td>
                  <td><span class="end_time">${fn:substring(obj.arrPlandTime,8,10)}:${fn:substring(obj.arrPlandTime,10,12)}</span></td>
                </tr>
                <tr>
                  <td><span class="start_airport">${obj.depAirportNm}</span></td>
                  <td><span id="dep_taken_time${status.index }" class="taken_time">04시간 25분</span></td>
                  <td><span class="end_airport">${obj.arrAirportNm}</span></td>
                </tr>
              </table>
            </div>
            <div class="wrap_result_flight_info">
              <img src="<c:url value='/images/${objArv[status.index].airlineNm}.png'/>" alt="항공사로고">
              <span class="airline_name">${objArv[status.index].airlineNm}</span>
              <table class="div_flight_time">
                <tr>
                  <td><span class="start_time">${fn:substring(objArv[status.index].depPlandTime,8,10)}:${fn:substring(objArv[status.index].depPlandTime,10,12)}</span></td>
                  <td><img src="<c:url value='/images/ic_arrow_right_plane.png' />"></td>
                  <td><span class="end_time">${fn:substring(objArv[status.index].arrPlandTime,8,10)}:${fn:substring(objArv[status.index].arrPlandTime,10,12)}</span></td>
                </tr>
                <tr>
                  <td><span class="start_airport">${objArv[status.index].depAirportNm}</span></td>
                  <td><span id="arr_taken_time${status.index }" class="taken_time">01시간 10분</span></td>
                  <td><span class="end_airport">${objArv[status.index].arrAirportNm}</span></td>
                </tr>
              </table>
            </div>
          </div>
          <div class="wrap_flight_info_right">
            <div class="wrap_flight_price_btn">
              <span class="txt_flight_count">9석 남음</span>
              <c:set var="charge" value="${obj.economyCharge+objArv[status.index].economyCharge}"/>
              <span id="txt_flight_price${status.index }" class="txt_flight_price"><fmt:formatNumber value='${charge}' pattern='#,###'/></span><span>원</span>
              <span class="txt_flight_select">선택 <i class="fa-solid fa-chevron-right"></i></span>
            </div>
            <button class="toggle_flight_info">상세 정보 보기 <i class="fa-solid fa-chevron-down"></i></button>
          </div>
        </div>
        <div class="wrap_result_flight_detail">
          <div class="wrap_flight_title">
            <span class="flight_label">가는편</span>
            <span class="flight_location">${obj.depAirportNm}</span>
            <img src="<c:url value='/images/ic_arrow_right_short.png' />">
            <span class="flight_location">${obj.arrAirportNm}</span>
            <span id="dep_flight_time${status.index }" class="flight_time">04시간 25분</span>
          </div>
          <div class="wrap_flight_time">
            <span class="flight_no">${obj.airlineNm } ${obj.vihicleId }</span>
            <div class="flight_time_info">
              <img src="<c:url value='/images/line_plane.png' />">
              <div class="wrap_flight_detail">
                <div class="wrap_flight_detail_top">
                  <span class="flight_detail_time">${fn:substring(obj.depPlandTime,8,10)}:${fn:substring(obj.depPlandTime,10,12)}</span>
                  <span class="flight_detail_loca">${obj.depAirportNm}</span>
                  <span class="flight_detail_etc">무료수하물 1개</span>
                </div>
                <div class="wrap_flight_detail_middle">
                  <span id="dep_flight_detail${status.index }" class="flight_detail_etc">04시간 25분</span>
                </div>
                <div class="wrap_flight_detail_bottom">
                  <span class="flight_detail_time">${fn:substring(obj.arrPlandTime,8,10)}:${fn:substring(obj.arrPlandTime,10,12)}</span>
                  <span class="flight_detail_loca">${obj.arrAirportNm}</span>
                </div>
              </div>
            </div>
          </div>
          <div class="wrap_flight_title">
            <span class="flight_label">오는편</span>
            <span class="flight_location">${objArv[status.index].depAirportNm}</span>
            <img src="<c url value='/images/ic_arrow_right_short.png' />">
            <span class="flight_location">${objArv[status.index].arrAirportNm}</span>
            <span id="arr_flight_time${status.index }" class="flight_time">04시간 40분</span>
          </div>
          <div class="wrap_flight_time">
            <span class="flight_no">${objArv[status.index].airlineNm } ${objArv[status.index].vihicleId }</span>
            <div class="flight_time_info">
              <img src="<c url value='/images/line_plane.png' />">
              <div class="wrap_flight_detail">
                <div class="wrap_flight_detail_top">
                  <span class="flight_detail_time">${fn:substring(objArv[status.index].depPlandTime,8,10)}:${fn:substring(objArv[status.index].depPlandTime,10,12)}</span>
                  <span class="flight_detail_loca">${objArv[status.index].depAirportNm}</span>
                  <span class="flight_detail_etc">무료수하물 1개</span>
                </div>
                <div class="wrap_flight_detail_middle">
                  <span id="arr_flight_detail${status.index }" class="flight_detail_etc">04시간 40분</span>
                </div>
                <div class="wrap_flight_detail_bottom">
                  <span class="flight_detail_time">${fn:substring(objArv[status.index].arrPlandTime,8,10)}:${fn:substring(objArv[status.index].arrPlandTime,10,12)}</span>
                  <span class="flight_detail_loca">${objArv[status.index].arrAirportNm}</span>
                </div>
              </div>
            </div>
          </div>
          <div class="wrap_detail_price">
            <span class="tlt_detail_price">상세 요금</span>
            <table id="table_detail_price${status.index }" class="table_detail_price">
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
              	<fmt:parseNumber var="person_count" value="${fn:substring(personCount,0,2)}" />
                <td>성인</td>
                <td><fmt:formatNumber value='${(charge - 39600 - 8000 ) * person_count}' pattern='#,###'/>원</td>
                <td><fmt:formatNumber value='${39600 * person_count}' pattern='#,###'/>원</td>
                <td><fmt:formatNumber value='${8000 * person_count}' pattern='#,###'/>원</td>
                <td>0원</td>
                <td>${personCount }</td>
                <td><fmt:formatNumber value='${charge * person_count}' pattern='#,###'/>원</td>
              </tr>
            </table>
            <div class="wrap_total_price">
              <span class="tlt_total_price">총 예상 요금</span>
              <div class="div_total_price">
                <span class="total_price"><fmt:formatNumber value='${charge * person_count}' pattern='#,###'/></span><span class="total_won">원</span>
              </div>
            </div>
          </div>
        </div>
        <script>
        	// 허수 제거
	        if($('#txt_flight_price${status.index}').text() == "0") {
				$('#txt_flight_price${status.index}').closest('.wrap_result_flight_list').remove();
				cnt++;
			}
			
			if($('#txt_flight_price${status.index}').text().length == 6) {
				$('#txt_flight_price${status.index}').closest('.wrap_result_flight_list').remove();
				cnt++
			}
			
			// 걸리는 시간 계산
			
			<fmt:parseNumber var="dep_start_hour" value="${fn:substring(obj.depPlandTime,8,10)}" />
			<fmt:parseNumber var="dep_start_min" value="${fn:substring(obj.depPlandTime,10,12)}" />
			<fmt:parseNumber var="dep_end_hour" value="${fn:substring(obj.arrPlandTime,8,10)}" />
			<fmt:parseNumber var="dep_end_min" value="${fn:substring(obj.arrPlandTime,10,12)}" />
			
			
			<fmt:parseNumber var="arr_start_hour" value="${fn:substring(objArv[status.index].depPlandTime,8,10)}" />
			<fmt:parseNumber var="arr_start_min" value="${fn:substring(objArv[status.index].depPlandTime,10,12)}" />
			<fmt:parseNumber var="arr_end_hour" value="${fn:substring(objArv[status.index].arrPlandTime,8,10)}" />
			<fmt:parseNumber var="arr_end_min" value="${fn:substring(objArv[status.index].arrPlandTime,10,12)}" />
			
			if(${dep_end_min - dep_start_min} < 0){
				dep_during_hour = ${dep_end_hour - dep_start_hour} - 1;
				dep_during_min = ${dep_end_min - dep_start_min} + 60;
			} else {
				dep_during_hour = ${dep_end_hour - dep_start_hour};
				dep_during_min = ${dep_end_min - dep_start_min};
			}
			
			if(${arr_end_min - arr_start_min} < 0){
				arr_during_hour = ${arr_end_hour - arr_start_hour} - 1;
				arr_during_min = ${arr_end_min - arr_start_min} + 60;
			} else {
				arr_during_hour = ${arr_end_hour - arr_start_hour};
				arr_during_min = ${arr_end_min - arr_start_min};
			}
			
			dep_during_time = dep_during_hour + "시간 " + dep_during_min +  "분";
			arr_during_time = arr_during_hour + "시간 " + arr_during_min +  "분";
			
			$('#dep_taken_time${status.index}').html(dep_during_time);
			$('#dep_flight_time${status.index }').html(dep_during_time);
			$('#dep_flight_detail${status.index }').html(dep_during_time);
			
			$('#arr_taken_time${status.index}').html(arr_during_time);
			$('#arr_flight_time${status.index }').html(arr_during_time);
			$('#arr_flight_detail${status.index }').html(arr_during_time);
		</script>
        </c:forEach>
      </section>
    </div>
	<script type="text/javascript">
		// 검색결과 계산
		cnt = ${fn:length(objDep)} - cnt;
		document.getElementById("result_count").innerHTML = "검색결과 총 " + cnt +  "개";
	</script>
  </div><c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>