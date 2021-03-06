<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<c:import url="/WEB-INF/views/layout/head.jsp" />
	<script defer src="<c:url value='/js/mypage.js' />"></script>
    <link rel="stylesheet" href="<c:url value='/css/mypage.css'/>">
</head>

<body>
  <!-- header -->
 	<c:import url="/WEB-INF/views/layout/top.jsp"/>

  <section class="wrap">
    <div class="mypage_title_box">
      <span>내 여행</span>
    </div>
    <section class="mypage_content_container">
      <div>
        <div class="mypage_nav" id="mypageNav">
          <div class="mypage_nav_hover1 nav_hover selectBtn" id="myBookedAirline"><p>예약한 항공권</p></div>
          <div id="myBookedHotel" class="nav_hover"><p>예약한 숙박</p></div>
          <div id="myBookedRent" class="nav_hover"><p>예약한 렌트</p></div>
          <div id="myCheckList" class="nav_hover"><p>여행 필수 체크리스트</p></div>
          <div class="mypage_nav_hover2 nav_hover"><p>지난 여행기록</p></div>
        </div>
        
        <div class="myinfo_box">
        	<span class="myinfo_title">내 정보</span>
        	<form id="form_myinfo_logout" method="post" action="<c:url value='/mypage_logout'/>">
        		<input id="btn_logout" name="btn_logout" class="btn_logout" type="submit" value="로그아웃">
        	</form>
        </div>
        <div class="myinfo_nav">
          <a href="<c:url value='/mypage_authentication'/>"><div class="myinfo_nav_hover1 nav_hover" id="myinfoNav"><p>내 정보 수정하기</p></div></a>
        </div>
      </div>
      <div class="mypage_content_box">
        <div class="checklist_link_box" id="check_link">
          <div class="checklist_link_text">
            <div>여행갈 때 필요한 물건은 다 챙기셨나요?</div>
            <div>꼭 필요한 물건들을 자동으로 입력해 드릴게요! 여기에 나의 잇템을 추가하면 나만의 체크리스트 완성 :)</div>
          </div>
          <a href="<c:url value='#'/>"><img src="<c:url value='/images/btn_right.png'/>"></a>
        </div>

       <!-- 마이페이지 항공리스트 -->
       
        <section class="reservation_air_container" id="booked_air_page">
        <c:forEach var="fList" items="${fList }">
          <div class="reservation_air_box">
            <div class="reservation_air_contents">
              <div>
                <div class="reservation_air_content1">
                  <div class="reservation_airline">
                    <img src="<c:url value='/images/${fList.dep_airline }.png'/>" alt="진에어 로고">
                    <div>${fList.dep_airline }</div>
                  </div>
                  <div class="air_fly">
                    <div class="air_fly_time1">
                      <span>${fList.dep_start_time }</span><img src="<c:url value='/images/ic_arrow_right_plane.png'/>" alt="화살표"><span>${fList.arr_end_time }</span>
                    </div>
                    <div class="air_fly_time2">
                      <span>${fList.dep_start_city }</span><span>${fList.dep_during_time }</span><span>${fList.dep_end_city }</span>
                    </div>
                  </div>
                </div>
                <div class="reservation_air_content2">
                  <div class="reservation_airline">
                    <img src="<c:url value='/images/${fList.arr_airline }.png'/>" alt="진에어 로고">
                    <div>${fList.arr_airline }</div>
                  </div>
                  <div class="air_fly">
                    <div class="air_fly_time1">
                      <span>${fList.arr_start_time }</span><img src="<c:url value='/images/ic_arrow_right_plane.png'/>" alt="화살표"><span>${fList.dep_end_time }</span>
                    </div>
                    <div class="air_fly_time2">
                      <span>${fList.arr_start_city }</span><span>${fList.arr_during_time }</span><span>${fList.arr_end_city }</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="air_total_pay">
                <div>총 결제 금액</div>
                <div><fmt:formatNumber value='${fList.charge_total }' pattern='#,###'/><span>원</span></div>
                <div class="detail_info">
                  <span class="detail_info_link">상세 정보 보기</span><i class="fas fa-chevron-down right"></i>
                </div>
              </div>
            </div>
          </div>
        
          <div class="wrap_result_flight_detail">
          <div class="wrap_flight_title">
            <span class="flight_label">가는편</span>
            <span class="flight_location">${fList.dep_start_city }</span>
            <img src="<c:url value='/images/ic_arrow_right_short.png' />">
            <span class="flight_location">${fList.arr_start_city }</span>
            <span id="dep_start_date" class="flight_time">${fn:substring(fList.daterange,0,10) }</span>
          </div>
          <div class="wrap_flight_time">
            <span class="flight_no">${fList.dep_flight_no }</span>
            <div class="flight_time_info">
              <img src="<c:url value='/images/line_plane.png' />">
              <div class="wrap_flight_detail">
                <div class="wrap_flight_detail_top">
                  <span class="flight_detail_time">${fList.dep_start_time }</span>
                  <span class="flight_detail_loca">${fList.dep_start_city }</span>
                  <span class="flight_detail_etc">무료수하물 1개</span>
                </div>
                <div class="wrap_flight_detail_middle">
                  <span id="dep_flight_detail" class="flight_detail_etc">${fList.dep_during_time }</span>
                </div>
                <div class="wrap_flight_detail_bottom">
                  <span class="flight_detail_time">${fList.arr_start_time }</span>
                  <span class="flight_detail_loca">${fList.arr_start_city  }</span>
                </div>
              </div>
            </div>
          </div>
          <div class="wrap_flight_title">
            <span class="flight_label">오는편</span>
            <span class="flight_location">${fList.dep_end_city  }</span>
            <img src="<c:url value='/images/ic_arrow_right_short.png' />">
            <span class="flight_location">${fList.arr_end_city  }</span>
            <span id="arr_start_date" class="flight_time">${fn:substring(fList.daterange,13,23) }</span>
          </div>
          <div class="wrap_flight_time">
            <span class="flight_no">${fList.arr_flight_no }</span>
            <div class="flight_time_info">
              <img src="<c:url value='/images/line_plane.png' />">
              <div class="wrap_flight_detail">
                <div class="wrap_flight_detail_top">
                  <span class="flight_detail_time">${fList.dep_end_time }</span>
                  <span class="flight_detail_loca">${fList.dep_end_city  }</span>
                  <span class="flight_detail_etc">무료수하물 1개</span>
                </div>
                <div class="wrap_flight_detail_middle">
                  <span id="arr_flight_detail" class="flight_detail_etc">${fList.arr_during_time }</span>
                </div>
                <div class="wrap_flight_detail_bottom">
                  <span class="flight_detail_time">${fList.arr_end_time }</span>
                  <span class="flight_detail_loca">${fList.arr_end_city }</span>
                </div>
              </div>
            </div>
          </div>
          <div class="wrap_detail_price">
            <span class="tlt_detail_price">상세 요금</span>
            <table id="table_detail_price" class="table_detail_price">
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
                <td><fmt:formatNumber value='${fList.charge_flight }' pattern='#,###'/>원</td>
                <td><fmt:formatNumber value='${fList.charge_fuel }' pattern='#,###'/>원</td>
                <td><fmt:formatNumber value='${fList.charge_tax }' pattern='#,###'/>원</td>
                <td><fmt:formatNumber value='${fList.charge_ticket }' pattern='#,###'/>원</td>
                <td>${personCount }</td>
                <td><fmt:formatNumber value='${fList.charge_total }' pattern='#,###'/>원</td>
              </tr>
            </table>
            <div class="wrap_total_price">
              <span class="tlt_total_price">총 예상 요금</span>
              <div class="div_total_price">
                <span class="total_price"><fmt:formatNumber value='${fList.charge_total }' pattern='#,###'/></span><span class="total_won">원</span>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
        </section>
       

        <!-- 마이페이지 예약한 숙박 -->
        <section class="reservation_hotel_container" id="booked_hotel_page">
	        <c:forEach var="h" items="${sList }">
	          <div class="reservation_hotel_box">
	            <img src="<c:url value='/hotelImg/${h.hotelNo }/h001.png'/>">
	            <div class="reservation_hotel_contents">
	              <div class="reservation_hotel_content1">
	                <div class="reservation_hotel_name">${h.hotelName}</div>
	                <div class="reservation_hotel_detail">
	                	<div>
	                		<div class="reservation_hotel_room">
	                			<div class="reservation_room_type">${h.roomType}</div>
	                			<div class="reservation_room_view">${h.roomView}</div>
	                		</div>
	                		<div class="reservation_hotel_time">${h.daterange2}</div>
	                	</div>
	                	<div class="reservation_hotel_price">${h.roomPrice}원</div>
	                </div>
	              </div>
	            </div>
	          </div>
	         </c:forEach>
        </section>
        
        <!-- 마이페이지 예약한 렌트카 -->
        <section class="reservation_rent_container" id="booked_rent_page">
           <c:forEach var="carList" items="${rList}">
		     <div class="wrap_result_car_list">
		        <div class="result_car_img">
		          <img src="<c:url value='/carImg/${carList.carImgNo}.png'/>">
		        </div>
		        <div class="wrap_whole">
		          <div class="txt_box_rent_result">
		            <div class="wrap_result_car_txt">
		              <div class="txt_k5">${carList.carName}</div>
		              <div id="txtDateCancel" class="txt_free_cancel">${carList.bookDateRange}</div>
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
		   </c:forEach>
        </section>

        <!-- 마이페이지 체크 리스트 -->
        <section class="check_list_container" id="check_list">
          <div class="check_list_box">
            <div class="check_list_title">
              체크리스트
            </div>
            <div class="check_list_contents">
              <div class="check_list_input">
                <div><i class="fa fa-circle-o default_circle" aria-hidden="true"></i></div>
                <input type="text" id="list_input" onkeyup="enter()" placeholder="나만의 체크리스트를 완성해보세요" autocomplete="off">
                <button id="add_btn"><i class='fas fa-plus new_list'></i></button>
              </div>
              
              <!-- js에서 innerHTML로 사용하는 부분 - 지우면 안 됨 -->
              <div id="check_list_board">

              </div>
              <!--  -->
            </div>
          </div>
        </section>
      </div>
    </section>
  </section>  
<!-- footer -->
	<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
</body>
</html>