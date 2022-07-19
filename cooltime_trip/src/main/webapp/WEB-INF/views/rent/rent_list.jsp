<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<c:import url="/WEB-INF/views/layout/head.jsp"></c:import>
	<link rel="stylesheet" href="<c:url value='/css/rent_list.css'/>">
	<script src="<c:url value='/js/rent_list.js'/>"></script>
	</head>
	<body>
		<!-- TOP -->
		<c:import url="/WEB-INF/views/layout/top.jsp"></c:import>
		<!--검색영역-->
		  <section class="sec_rent_search_list">
		    <span class="list_destination">여행지</span>
		    <!--검색 설정-->
		    <div class="rent_list_search wrap">
		      <div class="wrap_rent_box">
		        <form id="rentSearchList" method="post" action="<c:url value='/rent_list'/>">
		          <div class="wrap_search_input_box">
		            <input type="text" class="search_destination" name="rentLocation" value="${rentLocation}">
		            <input type="text" id="rentDatepicker" name="datetimes" class="search_daterange txt_stay txt_stay_placeholder" value="${daterange}">
		            <input type="text" class="search_drive_age" name="rentBirth" placeholder="YYMMDD" value="${rentBirth}">
		            <input type="submit" class="rent_search_btn" value="검색하기">
		          </div>
		        </form>
		        <!--검색 팝업-->
		        <div class="popup_rent">
		          <h4 class="tlt_popup_rent">여행지 검색</h4><i class="fa-solid fa-xmark" id="popupRentListCloseBtn"></i>
		          <div class="div_popup_rent_search">
		            <input type="text" name="" id="popupRentListSearch" class="input_popup_rent_search" placeholder="여행지 검색">
		            <input type="button" name="" id="popupRentListSearchBtn" class="btn_popup_rent_search" value="검색하기">
		          </div>
		          <h6 class="tlt_list_rent">최근 확인한 여행지</h6>
		          <!--최근 검색지-->
		          <div class="list_location">
		            <i class="fa-solid fa-location-dot"></i>
		            <div class="div_popup_search">
		              <span class="txt_location_main">제주도</span>
		              <span class="txt_location_sub">대한민국</span>
		            </div>
		          </div>
		          <div class="list_location">
		            <i class="fa-solid fa-location-dot"></i>
		            <div class="div_popup_search">
		              <span class="txt_location_main">가평군</span>
		              <span class="txt_location_sub">대한민국 경기도</span>
		            </div>
		          </div>
		          <h6 class="tlt_list_rent">최근 확인한 여행지</h6>
		          <!--인기여행지 3개까지-->
		          <div class="list_location">
		            <i class="fa-solid fa-location-dot"></i>
		            <div class="div_popup_search">
		              <span class="txt_location_main">제주도</span>
		              <span class="txt_location_sub">대한민국</span>
		            </div>
		          </div>
		          <div class="list_location">
		            <i class="fa-solid fa-location-dot"></i>
		            <div class="div_popup_search">
		              <span class="txt_location_main">강릉</span>
		              <span class="txt_location_sub">대한민국 강원도</span>
		            </div>
		          </div>
		          <div class="list_location">
		            <i class="fa-solid fa-location-dot"></i>
		            <div class="div_popup_search">
		              <span class="txt_location_main">여수</span>
		              <span class="txt_location_sub">대한민국 전라남도</span>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </section>
		  <!-- 검색 영역 끝 -->
		   <!-- 검색필터 / 검색 결과 -->
		   <div class="bg_gray">
		    <!-- 검색필터 -->
		    <div class="wrap wrap_result">
		      <section class="sec_filter">
		        <div class="wrap_kind_car">
		          <button class="tlt_kind_car">차종<i id="arrowDown" class="fa-solid fa-angle-up"></i></button>
		          <div class="toggle_filter">
		            <ul class="wrap_car_picker">
		              <li class="txt_car_picker"><i class="fa-solid fa-check fa-active"></i>경차</li>
		              <li class="txt_car_picker"><i class="fa-solid fa-check fa-active"></i>소형</li>
		              <li class="txt_car_picker"><i class="fa-solid fa-check fa-active"></i>준중형</li>
		              <li class="txt_car_picker"><i class="fa-solid fa-check fa-active"></i>중형</li>
		              <li class="txt_car_picker"><i class="fa-solid fa-check fa-active"></i>고급</li>
		              <li class="txt_car_picker"><i class="fa-solid fa-check fa-active"></i>RV/SUV</li>
		              <li class="txt_car_picker"><i class="fa-solid fa-check fa-active"></i>승합</li>
		            </ul>
		          </div>
		        </div>
		        <div class="wrap_kind_fuel">
		          <button class="tlt_kind_fuel">연료<i id="arrowDown2" class="fa-solid fa-angle-down"></i></button>
		          <div class="toggle_filter2">
		            <ul class="wrap_fuel_picker">
		              <li class="txt_fuel_picker"><i class="fa-solid fa-check fa-active"></i>휘발유</li>
		              <li class="txt_fuel_picker"><i class="fa-solid fa-check fa-active"></i>경유</li>
		              <li class="txt_fuel_picker"><i class="fa-solid fa-check fa-active"></i>LPG</li>
		              <li class="txt_fuel_picker"><i class="fa-solid fa-check fa-active"></i>하이브리드</li>
		              <li class="txt_fuel_picker"><i class="fa-solid fa-check fa-active"></i>전기</li>
		            </ul>
		          </div>
		        </div>
		      </section>
		      <!-- 검색결과 -->
		     <section class="sec_result">
		      <div class="wrap_result_title">
		        <span class="result_count">검색결과 총 ${fn:length(carList)}개</span>
		        <!-- 커스텀 셀렉트 -->
		        <div class="result_filter">
		          <button class="result_filter_open"><span>인기순</span><i id="arrowDown" class="fa-solid fa-angle-down"></i></button>
		          <ul class="result_filter_select">
		            <li class="result_filter_option">인기순</li>
		            <li class="result_filter_option">가격 낮은 순</li>
		            <li class="result_filter_option">가격 높은 순</li>
		          </ul>
		        </div>
		      </div>
		      <!-- result data-->
			  <c:forEach var="carList" items="${carList}">
			     <form id="carListForm" name="carListForm" method="post" action="<c:url value='/rent_detail/${carList.carNo}'/>">
				     <div class="wrap_result_car_list">
				        <div class="result_car_img">
				          <img src="<c:url value='/carImg/${carList.carImgNo}.png'/>">
				        </div>
				        <div class="wrap_whole">
				          <div class="txt_box_rent_result">
				            <div class="wrap_result_car_txt">
				              <div class="txt_k5">${carList.carName}</div>
				              <div id="txtDateCancel" class="txt_free_cancel">${dateCancel}</div>
				              
				              <input type="hidden" id="dateCancel" name="dateCancel" value="dateCancel">
				            </div>
				            <div class="txt_choose">
				              선택 <i class="fa-solid small_angle fa-angle-right"></i>
				            </div>
				          </div>
				          <div class="wrap_final_price">
				            <div class="wrap_txt_rent_company">
				              <div class="txt_rent_company">${carList.rentName}</div>
				              <div class="txt_rent_year">${carList.carYear} · ${carList.carFuel}</div>
				            </div>
				            <div class="wrap_txt_money">
			           		  <span class="txt_ttl">총</span>
				              <span class="txt_num_won"><fmt:formatNumber value='${carList.carPrice}' pattern='#,###'/></span><span class="txt_ttl">원</span>
				            </div>
				          </div>
				        </div>
				      </div>
				    </form>
			    </c:forEach>
           	 </section>
           	 <script>
            	$('.txt_choose').click(function(){
	              	var rr = document.getElementById("txtDateCancel").innerHTML;
	              	console.log(rr);
	              	$('#dateCancel').val(rr);
	              	$('#carListForm').submit();
	             });
            </script>
		    </div>
		   </div>
		   <!-- BOTTOM -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp"></c:import>
	</body>
</html>