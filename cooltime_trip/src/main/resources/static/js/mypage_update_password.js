// mypage_update_password.js

$(document).ready(function(){
    // 새 비밀번호 텍스트 상자 설정
    $('.input_update_password').focus(function(){
        $(this).css('border', '1px solid #48A0FF');
    });

    $('.input_update_password').blur(function(){
        $(this).css('border', '1px solid #DDDDDD');
    });

    // 새 비밀번호 확인 텍스트 상자 설정
    $('.input_check_password').focus(function(){
        $(this).css('border', '1px solid #48A0FF');
    });

    $('.input_check_password').blur(function(){
        $(this).css('border', '1px solid #DDDDDD');
    });

    // 오류 메세지
    // 오류 메세지 초기화
    $('.error_update_password1').hide();// 기존 비밀번호와 동일합니다
    $('.error_update_password2').hide();// 비밀번호를 확인해주세요
    $('.error_check_password').hide();// 비밀번호가 일치하지 않습니다

    // 비밀번호 변경
    $('#form_update_password').on('submit', function(){
    	event.preventDefault();	
    	
    	$.ajax({
    		type: "post",
    		url: "updatePassword",
    		data:{"input_pwd":$('#input_pwd').val()
    				,"check_pwd":$('#check_pwd').val()},
    		dataType: "text",
    		success: function(result){// 성공 시 수행
				if(result=="success"){
					$('.error_update_password1').hide();// 기존 비밀번호와 동일합니다 - 숨김
	                $('.error_update_password2').hide();// 비밀번호를 확인해주세요 - 숨김
	                $('.error_check_password').hide();// 비밀번호가 일치하지 않습니다 - 숨김
	                $('.input_update_password').css('border', '1px solid #DDDDDD');
	                user_pw = $('.input_update_password').val();// 기존 비밀번호를 새 비밀번호로 대체
	                alert("비밀번호가 변경되었습니다.");
	               	location.href = '/mypage';
				} else {
					$('.error_update_password1').hide();// 기존 비밀번호와 동일합니다 - 숨김
			        $('.error_check_password').hide();// 비밀번호가 일치하지 않습니다 - 숨김
			        $('.input_update_password').css('border', '1px solid #E65454');
			        $('.error_update_password2').show();// 비밀번호를 확인해주세요 - 표시
				}	
    		},
    		error: function(request, error){
    			console.log("code:"+request.status+"\nmessage:"+request.responseText+"\nerror:"+error);
    		}		  
    	});//ajax
    });
   
});