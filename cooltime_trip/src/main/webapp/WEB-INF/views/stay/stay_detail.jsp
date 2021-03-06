<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<html>
	<c:import url="/WEB-INF/views/layout/head.jsp"></c:import>
	<!-- custom -->
	<link rel="stylesheet" href="<c:url value='/css/stay_detail.css'/>"/>
    <script src="<c:url value='/js/stay_detail.js'/>"></script>
	</head>
	<body>
		<!-- TOP -->
		<c:import url="/WEB-INF/views/layout/top.jsp"></c:import>
		<div class="wrap">
	        <section>
	          <div class="container_flex">   <!--스토커박스 플렉스용-->
	            <div class="hotel_detail">
	              <div class="hotel_name_grade">
	                <div class="name_box">
	                  <div class="hotel_name">${hotel.hotelName }</div>
	                  <!-- 별 이모티콘 -->
	                  <div class="hotel_grade_num">${hotel.hotelGrade }</div>
	                  <div class="hotel_star">
	                    <!-- 사람들 평가 -->
	                    <span class="num_judge">${fn:substring(hotel.hotelAssesment,0,3)}</span>
	                    <span class="num_of_people">${fn:substring(hotel.hotelAssesment,3,9)}</span>
	                    <script>
	                    	var asset = '${hotel.hotelAssesment}';
	                    	var a = parseInt(asset.substring(0,1));
	                    	var b = parseInt(asset.substring(2,3));
	                    	
	                    	for(var i = 0; i<a; i++){
	                    		if(i == 0){
	                    			$('.hotel_star').prepend('<i class="fa-solid star_all fa-star end_star"></i>');
	                    		}else{
	                    			$('.hotel_star').prepend('<i class="fa-solid star_all fa-star"></i>');
	                    		}
	                    	}
	                    	if(b != 0){
	                    		$('.end_star').after('<i class="fa-solid star_half fa-star-half-stroke c_star"></i>');
	                    	}else if(b == 0){
	                    		$('.end_star').after('<i class="fa-regular empty_star fa-star c_star"></i>');
	                    	}
	                    	var c = document.getElementsByTagName('i').length;
	                    	
	                    	for(var i = c; i<5; i++){
	                    		$('.c_star').after('<i class="fa-regular empty_star fa-star"></i>');
	                    	}
	                    </script>
	                  </div>
	                </div>
	                <!-- 위치보기 버튼 -->
	                <form id="form_to_map" method="post" action="/hotel_map">
	        			<input type="hidden" name="address" id="address" value="'${hotel.hotelAddress}'">
	                    <button type="button" class="btn_kakaomap location_see">
	                        <i class="fa-regular location_map fa-map"></i>위치보기
	                    </button>
                    </form>
	              </div>
	              <!-- 호텔이름 / 체크인아웃 시간 -->
	              <div class="name_time">
	                <div class="hotel_maison">
	                    <i class='fas fa-map-marker-alt'></i>
	                    ${hotel.hotelAddress }
	                </div>
	                <div class="hotel_time">
	                    <i class="fa-solid check_clock fa-clock"></i>
	                    체크인 ${fn:substring(hotel.hotelTime,0,5) } ~ 체크아웃 ${fn:substring(hotel.hotelTime,6,11) }
	                </div>
	              </div>
	              <!-- 호텔 사진들 -->
	                <div class="hotel_main">
	                  <a href="<c:url value='/hotelImg/${hotel.hotelNo }/h001.png'/>" data-lightbox="example"><img src="<c:url value='/hotelImg/${hotel.hotelNo }/h001.png'/>"><button class="expand_box"><i class="fa-solid expand_icon fa-expand"></i></button></a>
	                </div>
	                <div class="hotel_sub" id="popUp">
	                  <div class="expand_hidden_pic">+5</div>
	                  	<c:forEach begin="2" end="9" step="1" varStatus="loop">
	                  		<a href="<c:url value='/hotelImg/${hotel.hotelNo }/h00${loop.index }.png'/>" data-lightbox="example"><img src="<c:url value='/hotelImg/${hotelNo }/h00${loop.index }.png'/>" class="img1"></a>
	                  	</c:forEach>
	                </div>
	                <div class="img_area">
	                  <div class="img_box">
	                    <div class="slider_box"></div>
	                  </div>
	                </div>
	              <!-- 데이트피커랑 인원수체크 들어가야함!!!!!!!! -->
	              <div class="date_count">
	                <div class="textbox_box">
	                    <input type="text" id="lodDatepicker" class="day_night"  name="daterange" value="${daterange }">
	                    <input type="text" id="lodPersonCount" class="guest_count" value="${personCount }">
	                    <button class="re_search">재검색</button>
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
	              <form method="post" id="roomForm"action="<c:url value='/stay_reservation'/>">
		              <div class="room_standard">
		                <img src="<c:url value='/hotelImg/${hotel.hotelNo}/${hotel.hotelTImg }.png'/>"/>
		                <div class="standard_text">
		                    <div class="standard_city">
		                        <div id="roomT" class="standard">${hotel.roomTType}</div>
		                        <div class="room_view">${hotel.roomTView}</div>
		                         <input type="hidden" name="roomView" value="${hotel.roomTView}">
		                    </div> 
		                    <div class="person_icon"><i class="fa-regular person_icon fa-user"></i>기준2인/최대2인</div>
		                    <div class="bed_style"><img src="<c:url value='/images/ic_bed.png'/>">싱글침대2</div>
		                    <div class="double_price">
		                        <span id="roomTprice" class="price_num"><fmt:formatNumber value="${hotel.roomTPrice }"/></span>
		                        <span class="price_won">원</span>
		                    </div>
		                </div>
		                <!-- <button class="booked"><a href="../html/stay_reservation.html"></a>예약</button> -->
		                <input type="button" id="roomTbook" class="booked" value="예약">
		              </div>
		              <div class="room_twin">
		                <img src="<c:url value='/hotelImg/${hotel.hotelNo }/${hotel.hotelDImg }.png'/>"/>
		                <div class="twin_text">
		                    <div class="twin_city">
		                        <span id="roomD" class="standard">${hotel.roomDType}</span>
		                        <span class="room_view">${hotel.roomDView }</span>
		                    </div> 
		                    <div class="person_icon"><i class="fa-regular person_icon fa-user"></i>기준2인/최대2인</div>
		                    <div class="bed_style"><img src="<c:url value='/images/ic_bed.png'/>">더블침대1</div>
		                    <div class="double_price">
		                        <span id="roomDprice" class="price_num"><fmt:formatNumber value="${hotel.roomDPrice }"/></span>
		                        <span class="price_won">원</span>
		                    </div>
		                </div>
		                <input type="button" id="roomDbook"class="booked" value="예약">
		              </div>
		              <input type="hidden" name="hotelNo" value="${hotel.hotelNo }">
		              <input type="hidden" name="daterange" value="${daterange}">
		              <input type="hidden" name="roomType" id="roomType" value="">
		              <input type="hidden" name="roomTypePrice" id="roomTypePrice" value="">
	              </form>
	              <!-- 약관 -->
	              <div class="use_info_box">
	                <div class="use_detail_f_box">
	                  <div class="use_info">이용 안내</div>
	                    <div class="info_detail">
	                      <!-- <pre class="info_detail_expand"> -->
	                        [예약안내]<br>
	                        ㅁ 예약 전 취소 수수료를 꼭 확인바랍니다<br>
	                        ㅁ 예약시 반드시 투숙자명을 실명으로 기재해주세요.<br>
	                        ㅁ 투숙자명을 별칭으로 기재 시 입실이 어려울 수 있습니다
	                        <br><br>
	                        [투숙인원 안내]<br>
	                        ㅁ 미성년자는 보호자의 동행 없이는 투숙이 불가합니다.<br>
	                        ㅁ 쾌적하고 안락한 숙소 운영 방침에 따라 최대정원 이상의 입실은 금합니다. 최대정원 초과<br>
	                        시 현장에서 입실이 거부될 수 있습니다.<br>
	                        ㅁ 기준인원과 초과인원은 반드시 지켜주시기 바랍니다.<br>
	                      <!-- </pre> -->
	                    </div>
	                  </div>
	                <div class="info_detail_second">
	                  <!-- <pre class="info_detail_exsecond"> -->
	                    <br>
	                    [추가요금정책]<br>
	                      ㅁ 조식안내<br>
	                      - 운영시간 : 07:00~10:00<br>
	                      ㅁ 현장결제 : 성인(14세 이상)12,000원, 소인 (48개월~13세) 6400원<br>
	                      - 47개월 이하 소인은 무료입니다.
	                      <br><br>
	                      [키즈존]<br>
	                      ㅁ 키즈존 / 10:00~20:00 / 투숙객 무료<br>
	                      ㅁ 키즈존 이용수칙 및 안전수칙<br>
	                      - 반드시 보호자 (부모님) 동반하여 입장하시기 바랍니다.<br>
	                      - 키즈존 내 음식물 반입을 금지합니다.<br>
	                      - 신발은 벗고 안전을 위해 날카롭거나 깨지는 물건 반입은 금지합니다.<br>
	                      - 고객 부주의 및 아이의 부주의로 인해 일어난 사건, 사고는 당 호텔에서 절대<br>
	                               책임지지 않습니다.<br>
	                      - 많은 어린이들이 이용하는 공간이오니 신발 분실 가능성이 있으므로, 분실이나 바뀌는 일이<br>
	                      없도록 각별한 신경 부탁드립니다.<br>
	                      - 안전을 위해 트램폴린은 4세~6세까지 이용 가능하며, 정원은 2명입니다.<br>
	                      - 키즈존 내 장난감을 외부로 가지고 나갈 수 없습니다.<br>
	                      - 키즈존은 하루에 한 번 소독 진행중이니 안심하고 이용하셔도 됩니다.<br>
	                      - 상주하는 직원이 없으므로 키즈존 사용에 문의사항이 있을 경우 프론트로 문의 부탁드립니다.<br>
	                      - 키즈존 이용수칙 및 안전수칙을 꼭 숙지하신 후 이용해주시고, 본 내용 위반 시<br>
	                      당 호텔에서는 절대 책임지지 않습니다.<br>
	                      <br><br>
	                      [인원 추가 정보]<br>
	                      ㅁ 기준인원 외 추가 시, 1인 20,000원 (성인/유아 구분 없음)<br>
	                      ㅁ 47개월 이하 소인은 무료입니다.<br>
	                      ㅁ 최대인원 초과 인원 추가 불가<br>
	                      ㅁ 영유아 인원수 포함 / 최대인원 초과불가<br>
	                      ㅁ 인원 추가 시 호텔 프론트 문의 필수<br>
	                      <br><br>
	                      [예약 및 이용 시 주의사항]<br>
	                      ㅁ실시간예약 특성상 간혹 예약이 중복될 수 있으며, 바로 연락드려 전액환불 도와드리겠습니다.<br>
	                      ㅁ이용불가 안내를 받았을 경우 직접 취소 시 수수료가 발생하니 고객센터로 연락바랍니다.<br>
	                      ㅁ예약변경 시 고객센터로 연락바라며, 업체규정에 따라 변경이 불가하거나 수수료가 발생할 수 있습니다.<br>
	                      ㅁ고객 연락처 오기재로 인해 연락이 불가할 경우, 예약이 자동취소 될 수 있습니다.<br>
	                      ㅁ단순변심, 고객사정으로 인한 취소 시 취소환불수수료가 적용됩니다.<br>
	                      ㅁ추가인원요금이 예약 시 결제되지 않을 수 있으며, 이 경우 현장결제 부탁드립니다.<br>
	                      ㅁ최대인원 초과 입실 시 입실 및 환불이 불가합니다.<br>
	                      ㅁ늦은 입실 시 업체에 사전연락 부탁드립니다.<br>
	                      ㅁ업체 물품의 파손 및 분실 시 업체기준으로 변상하셔야 합니다.<br>
	                      ㅁ반려동물 전용 업체가 아닌 경우 반려동물 동반 시 입실이 제한될 수 있습니다.<br>
	                      ㅁ당일예약 후 당일이용건일 경우 이용이 불가할 수 있으니 업체에 사전확인 부탁드립니다.<br>
	                      ㅁ보호자를 동반하지 않은 미성년자만 입실 시 입실 및 환불이 불가합니다.<br>
	                      ㅁ사전예약취소 없이 사용하지 않은 예약건에 대해서는 환불이 불가합니다.<br>
	                      ㅁ부대시설 및 객실비품은 업체 상황에 따라 변동될 수 있습니다.<br>
	                      ㅁ업체 이미지는 실제와 상이 할 수 있습니다.<br>
	                  <!-- </pre> -->
	                </div>
	                <!-- 더보기 버튼 슬라이드 토글 -->
	              <button class="expand_text">더보기<i id="arrow" class="fa-solid text_downarrow fa-angle-down"></i></button>
	          </div>
	          <div class="cancel_refund_box">
	              <div class="cancel_refund">취소 및 환불 규정</div>
	              <div class="refund_detail">
	                  <pre class="refund_rule">${hotel.hotelRule } </pre>
	              </div>
	          </div>
	          </div>
	          <!-- 스토커 박스 -->
	          <div class="follow_box">
	              <div class="follow_text">
	                  <span class="ilbak">1박</span>
	                  <span class="follow_money"><fmt:formatNumber value="${hotel.roomTPrice }"/></span><span class="follow_won">원~</span>
	              </div>
	              <button class="room_choice"id="pressBtn">객실 선택하기</button>
	          </div>
	      </div>
	    </section>
	    <script>
		// 예약하기 버튼 눌렀을 때 로그인 안했으면 로그인 페이지로, 로그인 상태라면 이동
		$('#roomTbook').on('click', function(){
	    	if(${sessionScope.sid == null }) {
	    		alert("로그인이 필요한 페이지입니다.\n로그인을 해주세요.");
	    		location.href="/login";
	    	} else {
	    		$('#roomType').val($('#roomT').text());
				$('#roomTypePrice').val($('#roomTprice').text());
		    	$('#roomForm').submit();
	    	}
	    });
		$('#roomDbook').on('click', function(){
	    	if(${sessionScope.sid == null }) {
	    		alert("로그인이 필요한 페이지입니다.\n로그인을 해주세요.");
	    		location.href="/login";
	    	} else {
	    		$('#roomType').val($('#roomD').text());
				$('#roomTypePrice').val($('#roomDprice').text());
		    	$('#roomForm').submit();
	    	}
	    });
    </script>
	  </div>
	  <!-- BOTTOM -->
	  <c:import url="/WEB-INF/views/layout/bottom.jsp"></c:import>
	</body>
</html>