<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en"><c:import url="/WEB-INF/views/layout/head.jsp" />
	<!-- custom -->
    <script src="<c:url value='/js/rent_detail.js' />"></script>
	<link rel="stylesheet" href="<c:url value='/css/rent_detail.css' />"/>
</head>
<body><c:import url="/WEB-INF/views/layout/top.jsp" />
    <!-- 섹션 -->
    <form method="post" action="<c:url value='/rent_reservation'/>">
    <section>
        <!-- 디테일 컨텐츠 -->
        <div class="detail_contents">
            <!-- 렌터카 정보 -->
            <div class="car_info">
                <div class="car_detail">
                    <div class="car_detail_text">
                        <div>${car.carName}</div>
                        <input type="hidden" name="carNo" value="${car.carNo}">
                        <div class="car_agency">
                            ${car.rentName}<i class="fa-solid fa-circle-info gray"></i>
                        </div>
                        <div class="model_image gray">현장에서 받는 차의 색상과 디테일은 다를 수 있어요</div>
                    </div>
                    <div class="car_detail_img">
                        <img src="<c:url value='/carImg/${car.carImgNo}.png'/>">
                    </div>
                </div>
                <div id="quantity_left" class="quantity_left">
                    <span><i class="fa-regular fa-clock gray"></i></span>
                    <span id="quantity_left_txt">${car.carCount}대 남았어요</span>
                </div>
                <div class="cancel_time">
                    <i class="fa-regular fa-circle-check gray"></i>${strCancel2}
                </div>
                <div class="car_option">
                    <div class="car_year"><i class="fa-regular fa-calendar-check gray"></i>${car.carYear}</div>
                    <div class="car_fuel"><i class="fa-solid fa-gas-pump gray"></i>${car.carFuel}</div>
                    <div class="car_capacity"><i class="fa-solid fa-user gray"></i>${car.carSeater}인</div>
                    <c:set var="carGear" value="${car.carGear}"/>
                    <div class="car_gear"><i class="fa-solid fa-map-pin gray"></i>${fn:toUpperCase(carGear)}</div>
                    <div class="car_navi"><i class="fa-solid fa-location-arrow gray"></i>네비게이션</div>
                    <div class="car_bluetooth"><i class="fa-brands fa-bluetooth gray"></i>블루투스</div>
                    <div class="car_blackbox"><i class="fa-solid fa-camera gray"></i>블랙박스</div>
                </div>
                <script>
	                if('${car.carNav}' == 'n'){
	            		$('.car_navi').addClass('disable');
	            		$('.fa-location-arrow').addClass('disable');
	            	}
	                
	                if('${car.carBluetooth}' == 'n'){
	            		$('.car_blackbox').addClass('disable');
	            		$('.fa-bluetooth').addClass('disable');
	            	}
                
                	if('${car.carBlackbox}' == 'n'){
                		$('.car_blackbox').addClass('disable');
                		$('.fa-camera').addClass('disable');
                	}
                </script>
            </div>
            <!-- 업체 정보 -->
            <div class="agency_info">
                <div>
                    <div class="agency_info_name">${car.rentName}</div>
                    <div class="agency_info_option">
                        <div class="car_stroller"></div>
                        <div class="car_babyseat"></div>
                    </div>
                    <script>
		                if('${car.carStroller}' == 'n'){
		            		$('.car_stroller').text('유모차 (업체문의)');
		            	}
		                
		                if('${car.carBabySeat}' == 'n'){
		            		$('.car_babyseat').text('카시트 (업체문의)');
		            	}
	                </script>
                </div>
                <div class="agency_info_detail">
                    <div>${car.rentExpl}</div>
                    <div class="agency_info_extra">
                        <div><div><i class="fa-solid fa-bus-simple gray"></i></div><div>${car.rentItvTime}<br>${car.rentBusStop}</div></div>
                        <div><i class="fa-solid fa-clock gray"></i>${car.rentOpTime}</div>
                        <div><i class="fa-solid fa-hourglass gray"></i>${car.rentTakenTime}</div>
                        <div><i class="fa-solid fa-headphones-simple gray"></i>${car.rentPhoneNum}</div>
                    </div>
                </div>
            </div>
            <div class="agency_map">
                <div id="map">
                </div>
                <div>
                    <div class="agency_address">
                        <span id="agency_address_text">${car.rentAddress}</span>
                        <span><i class="fa-regular fa-copy"></i></span>
                    </div>
                    <form id="form_to_map" method="post" action="/rent_map">
        			<input type="hidden" name="address" id="address" value="'${car.rentAddress}'">
                    <button type="button" class="btn_kakaomap">
                        <i class="fa-regular fa-map"></i>지도 보기
                    </button>
                    </form>
                </div>
            </div>
            <!-- 이용 규칙 -->
            <div class="agency_policy">
                <div class="agency_policy_text">이용 규칙</div>
                <div>
                    <div class="agency_policy_first">
                        ▶ 전차량 금연<br>
                        ▶ 낚시용품 지참 불가, 애완동물 동승 불가<br>
                        ▶ 차량 반납시 실내 오염 및 악취 발생시 클리닝 비용 발생 가능(10~30만원)<br>
                        <br>
                        ▶ 영업시간(8시~20시)외 인수시 사전 문의(렌트카업체)필수(반납은 불가)<br>
                        ▶ 야간 인수(20시~22시)시 시간당 1만원 추가 비용 발생<br>
                        ▶ 유모차/카시트 대여 업체(베베루앤클린)/연락 주문(064-725-8586)/홈페이지 주문(www.beberoojeju.com)<br><br>
                        
                        1.계약서에 기재된 운전자 이외 운전 불가.(계약자 외 운전시 보험처리불가)<br>
                        2.연료 대금은 임차인 부담.<br>
                        3.차량 임차중에 발생한 제반 교통법규 위반 사항은 임차인 책임.<br>
                        4.대여차량은 종합보험(대인, 대물, 자손)가입 되어 있음.<br>
                        5.임차중 자차 미가입 사고발생시 수리비 전액과 휴차 보상료(1일 대여요금의 50%)는 임차<br>
                    </div>
                    <div class="agency_policy_second">
                        인 부담.(자차 효력은 최초 사고 발생 1건에만 효력, 단독사고는 제외)<br>
                        6.사고 발생시 즉시 회사로 접수해야 보험처리 가능합니다.(반납후 통보시 보험처리불가)<br>
                        7.사고발생후운행이 불가하거나 즉시 수리를 해야 한다고 판단되는 경우 차량은 회수처리 되며 이경우 잔여 시간에 대한 대여요금은 환불 불가함.<br>
                        8.자차보험 처리의 경우 회사 자체적으로 시행하고 있는 관계로 보험 영수증은 별도로 발급불가.<br>
                        9.정규도로가 아닌 모래사장, 계곡지역, 눈길, 침수지역등 운행중 차량 문제가 발생시 고의성으로 간주 보험처리 불가.(우도내에서는 긴급출동서비스 불가지역)<br>
                        10.사고차량의 경우 회사측의 지정된 1급 공업사에서만 수리 가능.<br>
                        11.차량 임차중 연장을 원할 경우 반드시 회사에 가능여부를 확인 후 연장가능. 반납을 요할시에는 반납을 해야 함.(무단연장시 법적 절차 진행)<br>
                        12.조기 반납시 환불불가.(자차보험료 환불불가)<br>
                        13.차량임차중 물품(키분실, 실내악취, 네비, 타이어, 유리, 휠, 휠캡 및 부가용품등)파손 및 분실시 임차인 부담.(보험처리 불가항목입니다.)<br>
                        14.현장출동시 부가요금 고객부담.<br>
                        15.대여 조건 미달시(나이, 경력, 정원초과, 면허증 미지참등)인수 및 환불 불가.<br><br>
                        
                        ▶렌터카 자격요건 : 보험 안내 및 약관에 따름<br>
                        ▶운전면허 : 국내 도로교통법상 유효한 운전면허증 소지자, 운전면허증 필히 지참 바랍니다.<br>
                        ▶국제면허 : 외국인 및 교포는 국제운전면허증과 여권 소지자에 한해 가능합니다.(주립 면허증 대여불가)<br>
                        ▶보험은 현장에서 작성하는 계약서를 기준으로 적용됩니다. 반드시 계약서를 확인해주시기 바랍니다.<br>
                        ▶차량 반납(조기 반납 포함)후 임차 계약은 자동으로 종료됩니다.
                    </div>
                    <div class="btn_expand txt_blue">더보기<i class="fa-solid fa-angle-down txt_blue"></i></div>
                    <div class="agency_policy_exception">이용규칙에 나와있지 않은 예외 사항에 대해서는 반드시 렌터카 업체에 문의 후 예약해주세요.</div>
                </div>
            </div>
            <!-- 취소 및 환불 규정 -->
            <div class="refund_policy">
                <div>취소 및 환불 규정</div>
                <div>
                    - 결제 후 1시간 이내에 예약을 취소하면 취소 수수료가 없어요.<br>
                    - 당일 예약도 1시간 이내라면 취소 수수료가 없어요.<br>
                    - 인수 시간이 지나면 환불이 되지 않아요.<br>
                    <br>
                    - 인수 전 72시간 이전 취소 : 전액 환불<br>
                    - 인수 전 72시간 이내 취소 : 총 상품(주문) 금액의 70% 환불<br>
                    - 인수 이후 취소 : 환불 불가
                </div>
            </div>
        </div>
        <!-- 스토커박스 -->
        <div class="detail_stalker">
            <div class="stalker_text">
                <div>${car.carName}</div>
                <div>${car.rentName}</div>
            </div>
            <button class="btn_choice">렌터카 선택하기</button>
        </div>
    </section>
    </form>
    <!-- 주소 복사 시 팝업 박스 -->
    <div id="copy_box">주소가 클립보드에 복사되었습니다. </div><c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>