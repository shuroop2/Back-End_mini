<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en"><c:import url="/WEB-INF/views/layout/head.jsp" />
	<!-- custom -->
    <script src="<c:url value='/js/flight_detail.js' />"></script>
	<link rel="stylesheet" href="<c:url value='/css/flight_detail.css' />"/>
</head>
<body>
	<form id="form_flight_detail" method="post" action="<c:url value='/flight_reservation' />">
    <!-- 헤더 -->
    <div class="header_wrap">
        <div class="headerBox">
            <!-- 뒤로가기 -->
            <div class="btn_back">
                <a class="back" href="#"><span><i class="fa-solid fa-angle-left"></i></span><span>뒤로가기</span></a>
            </div>
            <h2 class="title">선택한 항공편</h2>
        </div>
    </div>
    <!-- 섹션 -->
    <div class="wrap">
        <div class="section">
            <!-- 섹션 왼쪽 부분 -->
            <div class="left">
                <!-- 가는편 -->
                <div class="dep">
                    <!-- 가는편 요약 -->
                    <div class="search_result">
                        <div class="dep_flight"><span>가는편</span></div>
                        <div class="dep_city_from">${depart_location }</div>
                        <div><img src="<c:url value='/images/ic_arrow_right_short.png' />"></div>
                        <div class="dep_city_to">${arrive_location }</div>
                    </div>
                    <!-- 가는편 세부정보 -->
                    <div class="reserve_flight">
                        <!-- 가는편 위 블럭 -->
                        <div class="flight_info">
                            <div class="flight_logo"><img src="<c:url value='/images/${dep_airline }.png'/>" alt="항공사로고"></div>
                            <div class="flight_airline">${dep_airline }</div>
                            <div class="flight_time">
                                <div class="dep_from">
                                    <span id="dep_from_time" class="dep_from_time">${dep_start_time }</span>
                                    <span id="dep_from_city" class="dep_from_city">GMP</span>
                                </div>
                                <div class="dep_part">
                                    <div><img src="<c:url value='/images/ic_arrow_right_plane.png' /> "></div>
                                    <div class="dep_duringtime">${dep_during }</div>
                                </div>
                                <div class="dep_to">
                                    <span class="dep_to_time">${dep_end_time }</span>
                                    <span id="dep_to_city" class="dep_to_city">CJU</span>
                                </div>
                            </div>
                        </div>
                        <!-- 가는편 아래 블럭 -->
                        <div class="flight_detail">
                            <div class="detail_area">
                                <div class="flight_no">${dep_flight_no }</div>
                                <div class="dep_date">${fn:substring(daterange,0,2) }월 ${fn:substring(daterange,3,5) }일</div>
                                <div><img src="<c:url value='/images/line_plane.png' /> "></div>
                                <div class="detail_time">
                                    <div class="detail_dep">${dep_start_time }</div>
                                    <div class="detail_duringtime">${dep_during }</div>
                                    <div class="detail_arr">${dep_end_time }</div>
                                </div>
                                <div class="detail_info">
                                    <span id="dep_detail_from" class="detail_from_city">${depart_location } GMP</span>
                                    <span>무료수하물 1개</span>
                                    <div id="dep_detail_to" class="detail_to_city">${arrive_location } CJU</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 오는편 -->
                <div class="arr">
                    <!-- 오는편 요약 -->
                    <div class="search_result">
                        <div class="arr_flight"><span>오는편</span></div>
                        <div class="arr_city_from">${arrive_location }</div>
                        <div><img src="<c:url value='/images/ic_arrow_right_short.png' /> "></div>
                        <div class="arr_city_to">${depart_location }</div>
                    </div>
                    <div class="reserve_flight">
                        <!-- 오는편 위 블럭 -->
                        <div class="flight_info">
                            <div class="flight_logo"><img src="<c:url value='/images/${arr_airline }.png'/>" alt="항공사로고"></div>
                            <div class="flight_airline">${arr_airline }</div>
                            <div class="flight_time">
                                <div class="dep_from">
                                    <span class="dep_from_time">${arr_start_time }</span>
                                    <span id="arr_from_city" class="dep_from_city">CJU</span>
                                </div>
                                <div class="dep_part">
                                    <div><img src="<c:url value='/images/ic_arrow_right_plane.png' /> "></div>
                                    <div class="dep_duringtime">${arr_during }</div>
                                </div>
                                <div class="dep_to">
                                    <span class="dep_to_time">${arr_end_time }</span>
                                    <span id="arr_to_city" class="dep_to_city">GMP</span>
                                </div>
                            </div>
                        </div>
                        <!-- 오는편 아래 블럭 -->
                        <div class="flight_detail">
                            <div class="detail_area">
                                <div class="flight_no">${arr_flight_no }</div>
                                <div class="dep_date">${fn:substring(daterange,11,13) }월 ${fn:substring(daterange,14,16) }일</div>
                                <div><img src="<c:url value='/images/line_plane.png' /> "></div>
                                <div class="detail_time">
                                    <div class="detail_dep">${arr_start_time }</div>
                                    <div class="detail_duringtime">${arr_during }</div>
                                    <div class="detail_arr">${arr_end_time }</div>
                                </div>
                                <div class="detail_info">
                                    <span id="arr_detail_from" class="detail_from_city">${arrive_location } CJU</span>
                                    <span>무료수하물 1개</span>
                                    <div id="arr_detail_to" class="detail_to_city">${depart_location } GMP</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 섹션 오른쪽 부분 -->
            <div class="right">
                <div class="select_way">
                    <span>${depart_location }</span>
                    <span><img src="<c:url value='/images/ic_arrow_rl.png' /> "></span>
                    <span>${arrive_location }</span>
                </div>
                <div class="total_check">${fn:substring(daterange,0,2) }월 ${fn:substring(daterange,3,5) }일 - ${fn:substring(daterange,11,13) }월 ${fn:substring(daterange,14,16) }일 ・ 승객 ${personCount }</div>
                <!-- 요금표 -->
                <div class="tariff">
                    <!-- 자세한 요금 -->
                    <div class="fare_body">
                        <h3 class="tariff_btn">성인 <b>${fn:substring(personCount,0,1) }</b>명</h3>
                        <div class="fare_detail">
                            <div class="fare_detail1">
                                <table>
                                    <tr>
                                        <td>항공 요금</td>
                                        <td>${personCount }</td>
                                        <td align="right"><fmt:formatNumber value='${charge_flight }' pattern='#,###'/>원</td>
                                    </tr>
                                    <tr>
                                        <td>유류할증료</td>
                                        <td>${personCount }</td>
                                        <td align="right"><fmt:formatNumber value='${charge_fuel }' pattern='#,###'/>원</td>
                                    </tr>
                                    <tr>
                                        <td>제세공과금</td>
                                        <td>${personCount }</td>
                                        <td align="right"><fmt:formatNumber value='${charge_tax }' pattern='#,###'/>원</td>
                                    </tr>
                                    <tr>
                                        <td>발권수수류</td>
                                        <td>${personCount }</td>
                                        <td align="right"><fmt:formatNumber value='${charge_ticket }' pattern='#,###'/>원</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="fare_detail2">
                                <table>
                                    <tr>
                                        <td colspan="2">성인 총 요금</td>
                                        <td align="right"><fmt:formatNumber value='${charge_total }' pattern='#,###'/>원</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- 총 요금 -->
                    <div class="total_fare_wrap">
                        <div class="total_fare">
                            <div><h3>총 요금</h3></div>
                            <div>
                                <h3><fmt:formatNumber value='${charge_total }' pattern='#,###'/><span>원</span></h3>
                                <span>세금 및 수수로 표함</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="reserve">
        <button type="button" title="예약하기" class="rsv_btn">예약하기</button>
    </div>
    <input type="hidden" name="depart_location" value="${depart_location }">
    <input type="hidden" name="arrive_location" value="${arrive_location }">
    <input type="hidden" name="daterange" value="${daterange }">
    <input type="hidden" name="dep_airline" value="${dep_airline }">
    <input type="hidden" name="arr_airline" value="${arr_airline }">
    <input type="hidden" name="dep_flight_no" value="${dep_flight_no }">
    <input type="hidden" name="arr_flight_no" value="${arr_flight_no }">
    <input type="hidden" name="dep_start_time" value="${dep_start_time }">
    <input type="hidden" name="dep_end_time" value="${dep_end_time }">
    <input type="hidden" name="arr_start_time" value="${arr_start_time }">
    <input type="hidden" name="arr_end_time" value="${arr_end_time }">
    <input type="hidden" name="dep_during" value="${dep_during }">
    <input type="hidden" name="arr_during" value="${arr_during }">
    <input type="hidden" name="classType" value="${classType }">
    <input type="hidden" name="personCount" value="${personCount }">
    <input type="hidden" name="charge_flight" value="${charge_flight }">
    <input type="hidden" name="charge_fuel" value="${charge_fuel }">
    <input type="hidden" name="charge_tax" value="${charge_tax }">
    <input type="hidden" name="charge_ticket" value="${charge_ticket }">
    <input type="hidden" name="charge_total" value="${charge_total }">
    
    <script type="text/javascript">
    	if($('.dep_city_from').text() == "제주"){
    		$('#dep_from_city').text("CJU");
    		$('#dep_to_city').text("GMP");
    		$('#dep_detail_from').text("제주 CJU");
    		$('#dep_detail_to').text("김포 GMP");
    		$('#arr_from_city').text("GMP");
    		$('#arr_to_city').text("CJU");
    		$('#arr_detail_from').text("김포 GMP");
    		$('#arr_detail_to').text("제주 CJU");
    	}
    	
    	// 예약하기 버튼 눌렀을 때 로그인 안했으면 로그인 페이지로, 로그인 상태라면 이동
    	$('.rsv_btn').on('click', function(){
        	if(${sessionScope.sid == null }) {
        		alert("로그인이 필요한 페이지입니다.\n로그인을 해주세요.");
        		location.href="/login";
        	} else {
    	    	$('#form_flight_detail').submit();
        	}
        });
    </script>
    </form>
</body>
</html>