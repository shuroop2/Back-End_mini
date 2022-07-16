/**
 * common.js
 */
 
$(document).ready(function(){
	var path = $(location).attr('pathname').substring(1, 5);
	if(path == 'flig') {
		if($('.nav_flight').hasClass('nav_active')){
			if($('.nav_stay').hasClass('nav_active'));
				$('.nav_stay').removeClass('nav_active');
			if($('.nav_rent').hasClass('nav_active'));
				$('.nav_rent').removeClass('nav_active');
		}else{ 
			$('.nav_flight').addClass('nav_active');
			if($('.nav_stay').hasClass('nav_active'));
				$('.nav_stay').removeClass('nav_active');
			if($('.nav_rent').hasClass('nav_active'));
				$('.nav_rent').removeClass('nav_active');
		}
	} else if(path == 'stay') {
		if($('.nav_stay').hasClass('nav_active')){
			if($('.nav_flight').hasClass('nav_active'));
				$('.nav_flight').removeClass('nav_active');
			if($('.nav_rent').hasClass('nav_active'));
				$('.nav_rent').removeClass('nav_active');
		}else{ 
			$('.nav_stay').addClass('nav_active');
			if($('.nav_flight').hasClass('nav_active'));
				$('.nav_flight').removeClass('nav_active');
			if($('.nav_rent').hasClass('nav_active'));
				$('.nav_rent').removeClass('nav_active');
		}
	} else if(path == 'rent') {
		if($('.nav_rent').hasClass('nav_active')){
			if($('.nav_stay').hasClass('nav_active'));
				$('.nav_stay').removeClass('nav_active');
			if($('.nav_flight').hasClass('nav_active'));
				$('.nav_flight').removeClass('nav_active');
		}else{ 
			$('.nav_rent').addClass('nav_active');
			if($('.nav_stay').hasClass('nav_active'));
				$('.nav_stay').removeClass('nav_active');
			if($('.nav_flight').hasClass('nav_active'));
				$('.nav_flight').removeClass('nav_active');
		}
	} 
	
	// 탑 버튼 눌렀을 때 최상단으로
	$(".btn_top").click(function () {
		$('html, body').animate({
			scrollTop: 0
		}, 400);
		return false;
	});
});