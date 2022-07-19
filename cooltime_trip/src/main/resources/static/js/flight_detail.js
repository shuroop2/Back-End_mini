$(document).ready(function(){
    // 뒤로가기
    $('.btn_back').on('click', function(){
        window.history.back();
    });

    // 성인 1명 눌러서 상세 요금 슬라이드
    $('.tariff_btn').on('click', function(){
        $('.fare_detail').slideToggle("slow");
    });

    // 예약하기 버튼 눌러서 이동
    /*
    $('.rsv_btn').on('click', function(){
    	if(${empty sessionScope.sid }) {
    		alert("로그인이 필요한 페이지입니다.\n로그인을 해주세요.");
    		location.href="/login";
    	} else {
	    	$('#form_flight_detail').submit();
    	}
    });
    */
});
