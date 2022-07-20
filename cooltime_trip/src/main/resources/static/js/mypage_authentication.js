// mypage_authentication.js

$(document).ready(function(){
    // 새 비밀번호 텍스트 상자 설정
    $('.input_authentication_password').focus(function(){
        $(this).css('border', '1px solid #48A0FF');
    });

    $('.input_authentication_password').blur(function(){
        $(this).css('border', '1px solid #DDDDDD');
    });
    //
///////////
/*
   

    var user_pw = "1234";// 기존 비밀번호 값

    $('.btn_authentication').click(function(){ 
        if($('.input_authentication_password').val() != user_pw){
            $('.input_authentication_password').css('border', '1px solid #E65454');
            $('.error_authentication_password').show();// 비밀번호가 일치하지 않습니다 - 표시
        } else {
            alert("비밀번호가 확인되었습니다.");
            location.href = "/mypage_update_main";
        }
    });
*/
/////////////
	// 오류 메세지 초기화
    $('.error_authentication_password').hide();// 비밀번호가 일치하지 않습니다

	$('#form_authentication').on('submit', function(){
    	event.preventDefault();	
    	$.ajax({
    	
    		type: "post",
    		url: "mypageCheck",
    		data:{"mem_id" : $('#mem_id').val(),
    			  "input_pwd":$('#input_pwd').val()},
    		dataType: "text",
    		success: function(result){// 성공 시 수행
    			if(result=="success"){
    				location.href="/mypage_update_main";
    			}else{
					$('.input_authentication_password').css('border', '1px solid #E65454');
	        		$('.error_authentication_password').show();// 비밀번호가 일치하지 않습니다 - 표시
    			}
    		},
    		error: function(request, error){
    			alert("DB_Connection : error");
    			alert("code:"+request.status+"\nmessage:"+request.responseText+"\nerror:"+error);
    		}		  
    	});//ajax
    });

});