<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<c:import url="/WEB-INF/views/layout/head.jsp" />
	<!-- css -->
	<script defer src="<c:url value='/js/mypage.js' />"></script>
	<link rel="stylesheet" href="<c:url value='/css/mypage_rsv_complete.css' />"/>
</head>
<body> 
	<!-- top.jsp -->
	<c:import url="/WEB-INF/views/layout/top.jsp" />
	
	<!-- section -->
	<section class="section">
	    <div class="wrap">
	    	<div class="rsv_wrap">
	    		<c:if test="${chk == '1' }">
		    		<div id="rsvImg"><img src="<c:url value='/images/flight.png'/>"></div>
				    <span class="rsv_text">항공 예약이 완료 되었습니다</span>
	    		</c:if>
	    		<c:if test="${chk == '2' }">
		    		<div id="rsvImg"><img src="<c:url value='/images/stay.png'/>"></div>
				    <span class="rsv_text">숙박 예약이 완료 되었습니다</span>
	    		</c:if>
	    		<c:if test="${chk == '3' }">
		    		<div id="rsvImg"><img src="<c:url value='/images/rent.png'/>"></div>
				    <span class="rsv_text">렌트카 예약이 완료 되었습니다</span>
	    		</c:if>
			    
			    <button type="button" class="rsv_btn" id="rsvBtn" onclick="location.href='/mypage'">마이페이지로 이동</button>
		    </div>
	    </div>
    </section>
	
	<!-- bottom.jsp -->
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>