// mypage_update_main.js

$(document).ready(function(){
    // 프로필 사진 변경
    // 파일 업로드
    ///


    // 회원 아이디 텍스트 상자 설정
    //$('.input_update_id').val("admin");// 회원 아이디 값
    $('.input_update_id').attr("disabled", true);// 텍스트 상자 비활성화

    // 회원 이름 텍스트 상자 설정
    $('.input_update_name').focus(function(){// 포커스 O
        $(this).css('border', '1px solid #48A0FF');
    });

    $('.input_update_name').blur(function(){// 포커스 X
        $(this).css('border', '1px solid #DDDDDD');
    });

    // 취소하기 버튼 - index.html 로 이동
    $('.btn_update_cancel').click(function(){
        location.href='/';
    });

	/*
	$('#form_mypage_update').on('submit', function(){	
		event.preventDefault();	
    	$.ajax({
    		type: "post",
    		url: "mypageUpdateMemName",
    		data:{"input_name":$('#input_name').val()},
    		dataType: "text",
    		success: function(result){// 성공 시 수행
    			if(result=="success"){//
    				alert("성공적으로 저장되었습니다.");
    				location.href="/mypage";
    			} else {
    				alert("성공적으로 저장되었습니다.");
    				location.href="/mypage";
    			}
    		},
    		error: function(request, error){
    			console.log("code:"+request.status+"\nmessage:"+request.responseText+"\nerror:"+error);
    		}		  
    	});//ajax
    });//submit
    /*
	$('#form_mypage_update').on('submit', function(){
        if(('.input_update_name').val() != null){
    		alert("회원정보가 저장되었습니다.");
	        location.href='/';
    	}else {
    		alert("이름을 확인해주세요.");
    	}
    });


    // 저장하기 버튼 - index.html 로 이동
    $('.btn_update_confirm').click(function(){
        if(('.input_update_name').val() != null){
    		alert("회원정보가 저장되었습니다.");
	        location.href='/';
    	}else {
    		alert("이름을 확인해주세요.");
    	}
    });
    */
});