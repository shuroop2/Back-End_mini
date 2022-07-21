<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 양식 다시 제출 방지 -->
<%    
response.setHeader("Cache-Control","no-store");    
response.setHeader("Pragma","no-cache");    
response.setDateHeader("Expires",0);    
if (request.getProtocol().equals("HTTP/1.1"))  
        response.setHeader("Cache-Control", "no-cache");  
%>
<!DOCTYPE html>
<html><c:import url="/WEB-INF/views/layout/head.jsp" />
	<!-- custom -->
    <script src="<c:url value='/js/rent_map.js' />"></script>
	<link rel="stylesheet" href="<c:url value='/css/rent_map.css' />"/>
</head>
<body>
	<header class="header">
	<div class="headerBox">
		<!-- 뒤로가기 -->
		<div class="btn_back">
			<a class="back" href="#"><span><i class="fa-solid fa-angle-left"></i></span><span>뒤로가기</span></a>
		</div>
		<h2 class="title">지도로 보기</h2>
	</div>
	</header>
	<!-- section -->
	<section>
		<input type="hidden" id="address" value="${address }">
		<div id="map"></div>
	</section>
</body>
</html>