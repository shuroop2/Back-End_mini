<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<c:import url="/WEB-INF/views/layout/head.jsp" />
	<!-- css -->
	<link rel="stylesheet" href="<c:url value='/css/mypage_rsv_complete.css' />"/>
</head>
<body> 
	<!-- top.jsp -->
	<c:import url="/WEB-INF/views/layout/top.jsp" />
	
	<!-- section -->
	<section class="section">
	    <div class="wrap">
	    	<div class="rsv_wrap">
			    <div id="rsvImg"><img src="<c:url value='/images/flight.png'/>"></div>
			    <span class="rsv_text">항공 예약이 완료 되었습니다</span>
			    <button type="button" class="rsv_btn">마이페이지로 이동</button>
		    </div>
	    </div>
    </section>
	
	<!-- bottom.jsp -->
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>