<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en"><c:import url="/WEB-INF/views/layout/head.jsp" />
	<!-- custom -->
    <script src="<c:url value='/js/flight_reservation.js' />"></script>
	<link rel="stylesheet" href="<c:url value='/css/flight_reservation.css' />"/>
</head>
<body><c:import url="/WEB-INF/views/layout/top.jsp" />
    <!-- 섹션 -->
    <div class="section_wrap">
        <!-- 섹션 왼쪽 부분 -->
        <section class="section_left">
            <!-- 예약한 항공권 정보 -->
            <article class="rsv_info">
                <!-- 예약한 항공권 요약 -->
                <div class="rsv_summary">
                    <table>
                        <colgroup>
                            <col style="width: 183.5px;">
                            <col style="width: 112px;">
                            <col style="width: 183.5px;">
                            <col style="width: 110px;">
                            <col style="width: 130px;">
                            <col style="width: 110px;">
                        </colgroup>
                        <tr>
                            <td>
                                <p>${depart_location }</p>
                                <p>GMP</p>
                            </td>
                            <td>
                                <p><img src="<c:url value='/images/ic_arrow_right_plane.png' />"></p>
                                <p><img src="<c:url value='/images/ic_arrow_left_plane.png' />"></p>
                                <p>${fn:substring(daterange,0,2) }월 ${fn:substring(daterange,3,5) }일 - ${fn:substring(daterange,11,13) }월 ${fn:substring(daterange,14,16) }일</p>
                            </td>
                            <td>
                                <p>${arrive_location }</p>
                                <p>CJU</p>
                            </td>
                            <td>
                                <p>운항종류</p>
                                <p>왕복</p>
                            </td>
                            <td>
                                <p>좌석등급</p>
                                <p>${classType }</p>
                            </td>
                            <td>
                                <p>승객</p>
                                <p>${personCount }</p>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- 예약한 항공권 세부 정보 -->
                <div class="rsv_flight">
                    <table>
                        <colgroup>
                            <col style="width: 50px">
                            <col style="width: 150px;">
                            <col style="width: 180px;">
                            <col style="width: 130px;">
                            <col style="width: 85px;">
                            <col style="width: 120px;">
                            <col style="width: 103px;">
                        </colgroup>
                        <tr>
                            <th colspan="2">항공편</th>
                            <th>여정</th>
                            <th>출발</th>
                            <th>도착</th>
                            <th>좌석</th>
                            <th>수하물</th>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/images/${dep_airline }.png'/>"></td>
                            <td>${dep_flight_no }</td>
                            <td>${depart_location } - ${arrive_location }</td>
                            <td>
                                <p>${fn:substring(daterange,0,2) }월 ${fn:substring(daterange,3,5) }일 ${fn:substring(daterange,5,8) }</p>
                                <p>${dep_start_time }</p>
                            </td>
                            <td>
                                <p>${fn:substring(daterange,0,2) }월 ${fn:substring(daterange,3,5) }일 ${fn:substring(daterange,5,8) }</p>
                                <p>${dep_end_time }</p>
                            </td>
                            <td>
                                <p>${classType }</p>
                                <p>${fn:substring(personCount,0,1) }석</p>
                            </td>
                            <td>${fn:substring(personCount,0,1) }PC</td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/images/${arr_airline }.png'/>"></td>
                            <td>${arr_flight_no }</td>
                            <td>${arrive_location } - ${depart_location }</td>
                            <td>
                                <p>${fn:substring(daterange,11,13) }월 ${fn:substring(daterange,14,16) }일 ${fn:substring(daterange,16,19) }</p>
                                <p>${arr_start_time }</p>
                            </td>
                            <td>
                                <p>${fn:substring(daterange,11,13) }월 ${fn:substring(daterange,14,16) }일 ${fn:substring(daterange,16,19) }</p>
                                <p>${arr_end_time }</p>
                            </td>
                            <td>
                                <p>${classType }</p>
                                <p>${fn:substring(personCount,0,1) }석</p>
                            </td>
                            <td>${fn:substring(personCount,0,1) }PC</td>
                        </tr>
                    </table>
                </div>
                <!-- 항공 예약 규정 -->
                <div class="rsv_flight_regulation">
                    <ul>
                        <li>・공동운항편 탑승수속은 실제 운항항공사 카운터를 이용해 주시기 바라며, 규정에 따라 탑승 수속 마감시간이 상이할 수 있으니 반드시 확인 바랍니다.</li>
                        <li>・대기예약시 모든 여정이 확약되어야만, 항공권 구매가 가능합니다. 미확약시 이용이 불가능합니다.</li>
                    </ul>
                </div>
            </article>
            <!-- 예약자 정보 -->
            <article class="user_info">
                <h3>예약자 정보</h3>
                <div class="user_info_border">
                    <div class="user_info_wrap">
                        <div>예약자 이름</div>
                        <div><input type="text" class="user_name bdblue" value="${mem.memName }"></div>
                        <div>이메일 주소</div>
                        <div>
                            <span>
                                <input type="text" class="user_email1" value="${email1 }">@<input type="text" class="user_email2" placeholder="직접 입력" value="${email2 }">
                                <select class="user_email3">
                                    <option value="" selected>직접입력</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                    <option value="nate.com">nate.com</option>
                                </select>
                            </span>
                        </div>
                        <div>휴대폰 번호</div>
                        <div>
                            <span>
                                <select class="user_phone1">
                                    <option value="010" selected>010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>
                                <input type="text" class="user_phone2" maxlength="4" value="${phone2 }"><input type="text" class="user_phone3" maxlength="4" value="${phone3 }">
                            </span>
                        </div>
                        <!-- 휴대폰 번호 규정 -->
                        <div class="user_phone_regulation">
                            <ul>
                                <li>・예약자 정보는 항공사 스케줄 변동 등의 사유로 기재되오니 즉시 연락이 가능한 연락처 기재 부탁드립니다.</li>
                                <li>・연락처 오기재로 발생되는 불이익에 대해 당사는 책임지지 않사오니 이점 유의하시기 바랍니다.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- 예약자 정보 규정 -->
                <div class="user_info_regulation">
                    <ul>
                        <li><b>・탑승객의 영문이름과 생년월일은 여권과 반드시 동일해야 합니다. (영문이름은 특수문자 및 공백 제외한 영문만 입력 가능합니다)<br>
                            <i>・</i>예약완료 후 잘못된 정보입력 시에는 수정이 불가하며, 출국하실 수 없습니다.</b></li>
                        <li>・소아는 출발일 기준 만 2~12세 미만, 유아는 출발일로부터 만 2세 미만입니다.</li>
                        <li>・귀국일 기준으로 만 12세 이상인 소아와 만 2세가 넘는 유아는 추가 차액 발생하므로 항공예약상담으로 문의 바랍니다.</li>
                        <li>・보호자 없이 혼자 여행하는 만 12~18세 미만 청소년의 경우 운송항공사 규정에 따라 탑승이 제한될 수 있습니다.</li>
                    </ul>
                </div>
            </article>
            <!-- 탑승객 정보 -->
            <article class="passenger_info">
                <h3>탑승객 정보</h3>
                <div class="passenger_info_border">
                    <div class="passenger_info_wrap">
                        <div>탑승객 1 : 성인</div>
                        <div><span>영문 성</span><span>영문 이름</span></div>
                        <div><span><input type="text" class="passenger_name1" placeholder="EX) HONG"></span><span><input type="text"class="passenger_name2" placeholder="EX) GILDONG"></span></div>
                        <div>예약 후 변경이 불가능 하오니 영문 성함을 정확히 입력 바랍니다.</div>
                        <div>성별</div>
                        <div><span><button class="btn_passenger_male">남성</button><button class="btn_passenger_female">여성</button></span></div>
                        <div>생년월일</div>
                        <div>
                            <span>
                                <input type="text" class="passenger_birth_year" maxlength="4" placeholder="EX) 1990">
                                <select class="passenger_birth_month">
                                    <option selected>월</option>
                                    <option value="01">01</option>
                                    <option value="02">02</option>
                                    <option value="03">03</option>
                                    <option value="04">04</option>
                                    <option value="05">05</option>
                                    <option value="06">06</option>
                                    <option value="07">07</option>
                                    <option value="08">08</option>
                                    <option value="09">09</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>
                                <select class="passenger_birth_date">
                                    <option selected>일</option>
                                    <option value="01">01</option>
                                    <option value="02">02</option>
                                    <option value="03">03</option>
                                    <option value="04">04</option>
                                    <option value="05">05</option>
                                    <option value="06">06</option>
                                    <option value="07">07</option>
                                    <option value="08">08</option>
                                    <option value="09">09</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                </select>
                            </span>
                        </div>
                    </div>
                </div>
            </article>
            <!-- 예약 유의사항 동의 -->
            <article class="agree">
                <h3>예약 유의사항 동의</h3>
                <div class="agree_border">
                    <div class="agree_list_contents">
                        <p><b>▶미확정 요금</b> - 예약 후 24시간 이내 결제가능 여부 확인하여 문자로 안내드립니다.</p>
                        <br>
                        <p><b>▶취급 수수료</b> - 마이리얼트립을 통해 일정변경/영문변경/환불 시에는 운임규정과 별도로 여행사 취급 수수료가 매회 발생되며, 취급 수수료는 환불이
                            불가합니다.<br><b>※ 1인당 3만원</b> (성인/소아/유아 동일)</p>
                        <br>
                        <p><b>▶운임규정</b> - 결제 요청 전에 반드시 항공사 운임규정을 확인 바랍니다. 규정 확인이 어려우신 경우 고객센터를 통해 문의 바랍니다.</p>
                        <br>
                        <p><b>▶환승(경유)</b> - 환승(경유) 시 출/도착 공항이 상이할 수 있으며, 상이할 경우 이용이 불가할 수 있으므로 반드시 항공사 및 해당 국가 대사관을 통해
                            공항 환승가능여부 확인 부탁드립니다.</p>
                        <br>
                        <p><b>▶영문명</b> - 여권 상의 영문 성함과 성별이 다른 경우 탑승이 불가하며, 예약 완료 후에는 영문명 변경이 불가합니다. 동일 발음의 영문 변경을 허용하는
                            항공사인 경우, 취급 수수료가 발생됩니다. (항공권 양도 불가)</p>
                        <br>
                        <p><b>▶사전좌석지정</b> - 자리지정은 확정된 사항이 아니며, 구매한 항공권에 따라 여행사를 통해 자리지정이 불가할 수 있습니다. 지정이 불가한 항공권은 항공사
                            웹체크인 또는 공항에서 배정하시기 바랍니다.</p>
                        <br>
                        <p><b>▶기타 서비스</b> - 아기바구니/휠체어/항공사마일리지적립/경유지 호텔, 투어 서비스 등 확정된 사항이 아니며, 이용하시는 항공사 콜센터를 통해 신청 바랍니다.
                            항공사에서 제공하는 부가 서비스에 대한 신청이 불가할 수 있으니 반드시 고객센터를 통해 확인하시어 결제 바랍니다.<br>
                        <div class="txt_red txt_14">※ 신청 불가 서비스 : 동방항공-큐브시티/밀쿠폰, 케냐항공-호텔 서비스, 베트남항공-경유지 투어, 진에어-번들 서비스 등</div>
                        </p>
                        <br>
                        <p><b>▶어린이의 여행</b> - 혼자 여행하는 어린이(만 12세~18세)는 탑승 항공사에 별도의 서비스를 신청해야 하며, 추가 비용이 발생되므로
                            고객센터를 통해 상담 후 예약하여 주시기 바랍니다. 항공사별로 규정이 상이할 수 있으며, 목적지 국가의 입국이 거절될 수 있습니다.<br>
                            <b>※일부 항공사는 <span class="txt_red txt_14">UM 서비스 이용 불가하거나 만 17세 미만 아동은 탑승이 불가</span></b>하오니 반드시 결제 전
                            항공사로 재확인하시어
                            결제 요청 주시기 바랍니다.</p>
                        <br>
                        <p><b>▶수하물</b> - 예약 내역에서 무료 수하물 확인 바랍니다. 수하물 추가는 해당 항공사를 통해 신청 바랍니다.</p>
                        <br>
                        <p><b>▶예약변경</b> - 예약 후 일정/시간/경유지/목적지 변경 시 항공요금 변동되거나, 변경이 불가할 수 있으니, 운임규정을 확인 바랍니다. 항공사 또는 공항
                            사정에 의하여 발권 이후 운항정보가 변동될 수 있습니다. 운항정보가 변경될 경우 변경일로부터 5일(영업일 기준)이 내 등록된 연락처로 문자 발송되고 있습니다.</p>
                        <br>
                        <p><b>▶예약재확인</b> - 항공사 사정에 의해서 사전 통보없이 스케줄이 변동, 취소가 될 수 있으므로 반드시 출국/귀국 각각 출발 72시간전에 예약을 재확인 하시기
                            바랍니다.</p>
                        <br>
                        <p><b>▶미확정 운임</b> - 항공사의 판매금액이 확정적이지 않아 확인이 필요한 운임 / 좌석을 포함하고 있어 항공사로 운임규정을 재확인해야 하는 예약 건입니다. 예약
                            접수 기준 48시간 이내 확인 후 SMS로 안내드리고 있으며, 확정된 예약 건에 대해서만 구매가 가능합니다. 결제시한 전까지 좌석, 요금이 확정되지 않을 경우 SMS
                            안내 후 취소됩니다.</p>
                        <br>
                        <p><b>▶여권 및 비자</b> - 여권의 유효기간이 6개월 미만인 경우 출국이 제한될 수 있습니다. 여행하시는 나라(경유지 포함)의 대사관, 영사관,
                            출입국사무소 등을 통해 입국 요건(비자 유/무)을 미리 확인하시기 바랍니다. 출국 불가, 입국 거부 등으로 발생되는 비용, 환불에 대해 당사는 책임지지
                            않습니다.</p>
                        <br>
                        <p><b>▶중복예약</b> - 동일 항공사로 같은 일정 예약 시 중복 예약으로 간주되어 별도의 사전 연락 없이 항공사에서 임의로 취소할 수 있으며, 그로
                            인한 불이익 발생 시 당사에서는 책임지지 않습니다.</p>
                        <br>
                        <p><b>▶마일리지이용/적립</b> - 마일리지 이용은 이용하시는 항공사를 통해 문의 바랍니다. 마일리지를 통한 좌석 승급은 당사 고객센터로 문의
                            부탁드립니다. 마일리지 적립은 "마일리지 등록" 버튼을 통하여 입력 또는 수속 시에 항공사로 요청하셔야 합니다. 적립률 또는 적립 여부는 이용하시는
                            항공사를 통해 확인 바랍니다.</p>
                        <br>
                        <p><b>▶결제시한</b> - 예약 완료 후 항공권 예약내역 > 예약상세의 결제 시한을 확인 바랍니다. 당사의 결제시한은 항공사 결제시한과 상이할 수 있으며 (항공사
                            결제시한보다 우선함) , 사전 통보 없이 변경될 수 있습니다.</p>
                        <br>
                        <p><b>▶공동운항</b> - 공동운항편 이용시에 영문변경/좌석지정/마일리지적립/웹체크인 등의 서비스가 제한될 수 있습니다.</p>
                        <br>
                        <p><b>▶고객지원실</b><br>
                            항공권 문의 전화번호 <b>1670-8208 (내선 1번)</b><br>
                            09:00 ~ 18:00 (연중무휴), 점심시간 12:00 ~ 13:00<br>
                            ※단, 발권 및 환불/변경은 (월 - 금) 09:00 ~ 17:00까지 접수 가능합니다.</p>
                        </div>
                    </div>
                <!-- 동의 체크박스 -->
                <div class="agree_check">
                    <span class="btn_agree_check"><i class="fa-solid fa-check white"></i></span>
                    <span>예약규정을 읽었으며, 내용에 동의합니다.</span>
                </div>
            </article>
        </section>
        <!-- 섹션 오른쪽 부분 -->
        <section class="section_right">
            <!-- 요금표 -->
            <article class="tariff">
                <!-- 세부 요금 -->
                <div class="fare_body">
                    <h3>성인 <b>${fn:substring(personCount,0,1) }</b>명</h3>
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
                        <div>
                            <h3>총 요금</h3>
                        </div>
                        <div>
                            <h3><fmt:formatNumber value='${charge_total }' pattern='#,###'/><span>원</span></h3>
                            <span>세금 및 수수로 표함</span>
                        </div>
                    </div>
                </div>
            </article>
        </section>
    </div>
    <!-- 예약하기 버튼 -->
    <div class="btn_rsv_area">
        <button class="btn_rsv">예약하기</button>
    </div><c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>