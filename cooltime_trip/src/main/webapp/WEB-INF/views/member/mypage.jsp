<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<c:import url="/WEB-INF/views/layout/head.jsp" />
	<script defer src="<c:url value='../js/mypage.js' />"></script>
    <link rel="stylesheet" href="<c:url value='../css/mypage.css'/>">
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
          <div class="mypage_nav_hover1 nav_hover" id="myBookedAirline"><p>예약한 항공권</p></div>
          <div id="myBookedHotel" class="nav_hover"><p>예약한 숙박</p></div>
          <div id="myCheckList" class="nav_hover"><p>여행 필수 체크리스트</p></div>
          <div class="mypage_nav_hover2 nav_hover"><p>지난 여행기록</p></div>
        </div>
        <div class="myinfo_title">내 정보</div>
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
          <a href="<c:url value='#'/>"><img src="<c:url value='../images/btn_right.png'/>"></a>
        </div>

        <!-- 마이페이지 항공리스트 -->
        <section class="reservation_air_container" id="booked_air_page">
          <div class="reservation_air_box">
            <div class="reservation_air_contents">
              <div>
                <div class="reservation_air_content1">
                  <div class="reservation_airline">
                    <img src="<c:url value='../images/lg_jin_air.png'/>" alt="진에어 로고">
                    <div>진에어</div>
                  </div>
                  <div class="air_fly">
                    <div class="air_fly_time1">
                      <span>09:40</span><img src="<c:url value='../images/ic_arrow_right_plane.png'/>" alt="화살표"><span>15:05</span>
                    </div>
                    <div class="air_fly_time2">
                      <span>ICN</span><span>04시간 25분</span><span>GUM</span>
                    </div>
                  </div>
                </div>
                <div class="reservation_air_content2">
                  <div class="reservation_airline">
                    <img src="<c:url value='../images/lg_jin_air.png'/>" alt="진에어 로고">
                    <div>진에어</div>
                  </div>
                  <div class="air_fly">
                    <div class="air_fly_time1">
                      <span>09:40</span><img src="<c:url value='../images/ic_arrow_right_plane.png'/>" alt="화살표"><span>15:20</span>
                    </div>
                    <div class="air_fly_time2">
                      <span>ICN</span><span>04시간 40분</span><span>GUM</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="air_total_pay">
                <div>총 결제 금액</div>
                <div>455,700<span>원</span></div>
                <div>
                  <a href="<c:url value='#'/>"><span class="detail_info_link">상세 정보 보기</span><i class="fas fa-chevron-right right"></i></a>
                </div>
              </div>
            </div>
          </div>
          <div class="reservation_air_box">
            <div class="reservation_air_contents">
              <div>
                <div class="reservation_air_content1">
                  <div class="reservation_airline">
                    <img src="<c:url value='../images/lg_jin_air.png'/>" alt="진에어 로고">
                    <div>진에어</div>
                  </div>
                  <div class="air_fly">
                    <div class="air_fly_time1">
                      <span>09:40</span><img src="<c:url value='../images/ic_arrow_right_plane.png'/>" alt="화살표"><span>15:05</span>
                    </div>
                    <div class="air_fly_time2">
                      <span>ICN</span><span>04시간 25분</span><span>GUM</span>
                    </div>
                  </div>
                </div>
                <div class="reservation_air_content2">
                  <div class="reservation_airline">
                    <img src="<c:url value='../images/lg_jin_air.png'/>" alt="진에어 로고">
                    <div>진에어</div>
                  </div>
                  <div class="air_fly">
                    <div class="air_fly_time1">
                      <span>09:40</span><img src="<c:url value='../images/ic_arrow_right_plane.png'/>" alt="화살표"><span>15:20</span>
                    </div>
                    <div class="air_fly_time2">
                      <span>ICN</span><span>04시간 40분</span><span>GUM</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="air_total_pay">
                <div>총 결제 금액</div>
                <div>455,700<span>원</span></div>
                <div>
                  <a href="<c:url value='#'/>"><span class="detail_info_link">상세 정보 보기</span><i class="fas fa-chevron-right right"></i></a>
                </div>
              </div>
            </div>
          </div>
          <div class="reservation_air_box">
            <div class="reservation_air_contents">
              <div>
                <div class="reservation_air_content1">
                  <div class="reservation_airline">
                    <img src="<c:url value='../images/lg_jin_air.png'/>" alt="진에어 로고">
                    <div>진에어</div>
                  </div>
                  <div class="air_fly">
                    <div class="air_fly_time1">
                      <span>09:40</span><img src="<c:url value='../images/ic_arrow_right_plane.png'/>" alt="화살표"><span>15:05</span>
                    </div>
                    <div class="air_fly_time2">
                      <span>ICN</span><span>04시간 25분</span><span>GUM</span>
                    </div>
                  </div>
                </div>
                <div class="reservation_air_content2">
                  <div class="reservation_airline">
                    <img src="<c:url value='../images/lg_jin_air.png'/>" alt="진에어 로고">
                    <div>진에어</div>
                  </div>
                  <div class="air_fly">
                    <div class="air_fly_time1">
                      <span>09:40</span><img src="<c:url value='../images/ic_arrow_right_plane.png'/>" alt="화살표"><span>15:20</span>
                    </div>
                    <div class="air_fly_time2">
                      <span>ICN</span><span>04시간 40분</span><span>GUM</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="air_total_pay">
                <div>총 결제 금액</div>
                <div>455,700<span>원</span></div>
                <div>
                  <a href="<c:url value='#'/>"><span class="detail_info_link">상세 정보 보기</span><i class="fas fa-chevron-right right"></i></a>
                </div>
              </div>
            </div>
          </div>
        </section>

        <!-- 마이페이지 예약한 숙박 -->
        <section class="reservation_hotel_container" id="booked_hotel_page">
          <div class="reservation_hotel_box">
            <img src="<c:url value='../images/mjeju.jpg'/>" alt="메종글래드 제주">
            <div class="reservation_hotel_contents">
              <div class="reservation_hotel_content1">
                <div>메종 글래드 제주</div>
                <div>4성급 · 제주시 연동 노연로 80</div>
                <div><i class="fas fa-star star"></i><span class="star_grade">4.5</span><span class="customer_num">(131)</span></div>
              </div>
              <div class="reservation_hotel_content2">
                <div>178,700원</div>
                <div>
                  <a href="<c:url value='#'/>"><span class="detail_info_link">상세 정보 보기</span><i class="fas fa-chevron-right right"></i></a>
                </div>
              </div>
            </div>
          </div>
          <div class="reservation_hotel_box">
            <img src="<c:url value='../images/mjeju.jpg'/>" alt="메종글래드 제주">
            <div class="reservation_hotel_contents">
              <div class="reservation_hotel_content1">
                <div>메종 글래드 제주</div>
                <div>4성급 · 제주시 연동 노연로 80</div>
                <div><i class="fas fa-star star"></i><span class="star_grade">4.5</span><span class="customer_num">(131)</span></div>
              </div>
              <div class="reservation_hotel_content2">
                <div>178,700원</div>
                <div>
                  <a href="<c:url value='#'/>"><span class="detail_info_link">상세 정보 보기</span><i class="fas fa-chevron-right right"></i></a>
                </div>
              </div>
            </div>
          </div>
          <div class="reservation_hotel_box">
            <img src="<c:url value='../images/mjeju.jpg'/>" alt="메종글래드 제주">
            <div class="reservation_hotel_contents">
              <div class="reservation_hotel_content1">
                <div>메종 글래드 제주</div>
                <div>4성급 · 제주시 연동 노연로 80</div>
                <div><i class="fas fa-star star"></i><span class="star_grade">4.5</span><span class="customer_num">(131)</span></div>
              </div>
              <div class="reservation_hotel_content2">
                <div>178,700원</div>
                <div>
                  <a href="<c:url value='#'/>"><span class="detail_info_link">상세 정보 보기</span><i class="fas fa-chevron-right right"></i></a>
                </div>
              </div>
            </div>
          </div>
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
              <div id="check_list_board">

              </div>
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