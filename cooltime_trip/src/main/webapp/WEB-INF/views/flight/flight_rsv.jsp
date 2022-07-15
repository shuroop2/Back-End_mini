<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en"><c:import url="/WEB-INF/views/layout/head.jsp" />
	<!-- custom -->
    <script src="<c:url value='/js/flight_rsv.js' />"></script>
	<link rel="stylesheet" href="<c:url value='/css/flight_rsv.css' />"/>
</head>
<body>
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
                        <div class="dep_city_from">서울(ICN)</div>
                        <div><img src="<c:url value='/images/ic_arrow_right_short.png' />"></div>
                        <div class="dep_city_to">괌(GUM)</div>
                    </div>
                    <!-- 가는편 세부정보 -->
                    <div class="reserve_flight">
                        <!-- 가는편 위 블럭 -->
                        <div class="flight_info">
                            <div class="flight_logo"><img src="<c:url value='/images/lg_jin_air.png' /> "></div>
                            <div class="flight_airline">진에어</div>
                            <div class="flight_time">
                                <div class="dep_from">
                                    <span class="dep_from_time">09:40</span>
                                    <span class="dep_from_city">ICN</span>
                                </div>
                                <div class="dep_part">
                                    <div><img src="<c:url value='/images/ic_arrow_right_plane.png' /> "></div>
                                    <div class="dep_duringtime">04시간 25분</div>
                                </div>
                                <div class="dep_to">
                                    <span class="dep_to_time">15:05</span>
                                    <span class="dep_to_city">GUM</span>
                                </div>
                            </div>
                        </div>
                        <!-- 가는편 아래 블럭 -->
                        <div class="flight_detail">
                            <div class="detail_area">
                                <div class="flight_no">진에어 0641</div>
                                <div class="dep_date">06월 27일</div>
                                <div><img src="<c:url value='/images/line_plane.png' /> "></div>
                                <div class="detail_time">
                                    <div class="detail_dep">09:40</div>
                                    <div class="detail_duringtime">04시간 25분</div>
                                    <div class="detail_arr">15:05</div>
                                </div>
                                <div class="detail_info">
                                    <span class="detail_from_city">서울 ICN</span>
                                    <span>무료수하물 1개</span>
                                    <div class="detail_to_city">괌 GUM</div>
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
                        <div class="arr_city_from">괌(GUM)</div>
                        <div><img src="<c:url value='/images/ic_arrow_right_short.png' /> "></div>
                        <div class="arr_city_to">서울(ICN)</div>
                    </div>
                    <div class="reserve_flight">
                        <!-- 오는편 위 블럭 -->
                        <div class="flight_info">
                            <div class="flight_logo"><img src="<c:url value='/images/lg_jin_air.png' /> "></div>
                            <div class="flight_airline">진에어</div>
                            <div class="flight_time">
                                <div class="dep_time">
                                    <span class="dep_from_time">09:40</span>
                                    <span class="dep_from_city">GUM</span>
                                </div>
                                <div class="dep_part">
                                    <div><img src="<c:url value='/images/ic_arrow_right_plane.png' /> "></div>
                                    <div class="dep_duringtime">04시간 40분</div>
                                </div>
                                <div class="dep_to">
                                    <span class="dep_to_time">15:20</span>
                                    <span class="dep_to_city">ICN</span>
                                </div>
                            </div>
                        </div>
                        <!-- 오는편 아래 블럭 -->
                        <div class="flight_detail">
                            <div class="detail_area">
                                <div class="flight_no">진에어 0642</div>
                                <div class="dep_date">07월 01일</div>
                                <div><img src="<c:url value='/images/line_plane.png' /> "></div>
                                <div class="detail_time">
                                    <div class="detail_dep">09:40</div>
                                    <div class="detail_duringtime">04시간 40분</div>
                                    <div class="detail_arr">15:20</div>
                                </div>
                                <div class="detail_info">
                                    <span class="detail_from_city">괌 GUM</span>
                                    <span>무료수하물 1개</span>
                                    <div class="detail_to_city">서울 ICN</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 섹션 오른쪽 부분 -->
            <div class="right">
                <div class="select_way">
                    <span>서울</span>
                    <span><img src="<c:url value='/images/ic_arrow_rl.png' /> "></span>
                    <span>괌</span>
                </div>
                <div class="total_check">06월 27일 - 07월 01일 ・ 승객 1명</div>
                <!-- 요금표 -->
                <div class="tariff">
                    <!-- 자세한 요금 -->
                    <div class="fare_body">
                        <h3 class="tariff_btn">성인 <b>1</b>명</h3>
                        <div class="fare_detail">
                            <div class="fare_detail1">
                                <table>
                                    <tr>
                                        <td>항공 요금</td>
                                        <td>1명</td>
                                        <td align="right">221,400원</td>
                                    </tr>
                                    <tr>
                                        <td>유류할증료</td>
                                        <td>1명</td>
                                        <td align="right">173,200원</td>
                                    </tr>
                                    <tr>
                                        <td>제세공과금</td>
                                        <td>1명</td>
                                        <td align="right">61,100원</td>
                                    </tr>
                                    <tr>
                                        <td>발권수수류</td>
                                        <td>1명</td>
                                        <td align="right">0원</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="fare_detail2">
                                <table>
                                    <tr>
                                        <td colspan="2">성인 총 요금</td>
                                        <td align="right">455,700원</td>
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
                                <h3>455,700<span>원</span></h3>
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
</body>
</html>