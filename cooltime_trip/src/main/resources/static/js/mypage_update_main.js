// mypage_update_main.js

$(document).ready(function(){
    // 프로필 사진 변경
    // 파일 업로드
    $('.div_img_profile').click(function(){
    	$('#uploadFile').click();
    });
    
    /*$("#uploadFile").change(function(){
    	var fileName = $('#uploadFile').val().split("\\").pop();
    	
    	var div = document.querySelector('.div_img_profile'); // 이미지를 감싸는 div
		var img = div.querySelector('.img_profile_image'); // 이미지
		var divAspect = 180 / 180 ;
		// div의 가로세로비는 알고 있는 값이다
		var imgAspect = img.height / img.width;
		
		if (imgAspect <= divAspect) {
		    // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
		    var imgWidthActual = div.offsetHeight / imgAspect;
		    var imgWidthToBe = div.offsetHeight / divAspect;
		    var marginLeft = Math.round((imgWidthActual - imgWidthToBe) / 2);
		    img.style.cssText = 'width: auto; height: 100%; margin-left: '  + marginLeft + 'px;'
		} else {
		    // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
		    img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
		}
		
    	$('#img_profile_image').attr('src', '/upload/'+fileName);
    	setTimeout(function(){
    		$('#form_update_image').submit();
    	}, 3000);
	});*/
    
    // 사진 변경 처리 작업
    $('#form_update_image').on('submit', function(){
 		event.preventDefault();
 		
 		// 폼 데이터 읽어 오기
 		var formData = new FormData($('#form_update_image')[0]);

		// var fileName = $('#uploadFile').val().split("\\").pop();
 		$.ajax({
 			type: "post",
 			url: "updateImage",
 			enctype: "multipart/form-data",
 			data: formData,
 			processData: false, // multipart 사용하기 위한 필수
 			contentType: false,
 			success: function(result){
		 		
 			},
 			error: function(){
 				alert("전송 실패");
 			}
 		});	
 	});


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
    
});