<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<header class="header">
	  	<!-- 헤더 wrap -->
	  	<div class="wrap">
		    <div>
		    	<img class="lg_title" src="<c:url value='/images/lg_title.png' />" alt="로고">
		    	<!-- 로그인/회원가입 > 마이페이지 -->
		    	<div class="div_account">
		    		<c:if test="${empty sessionScope.sid }">
		     			<a class="btn_account" href="<c:url value='/login' />">로그인</a>
		     			<a class="btn_account txt_blue mr_0 pr_0" href="<c:url value='/join' />">회원가입</a>
	     			</c:if>
	     			<c:if test="${not empty sessionScope.sid }">
	     				<a class="btn_account btn_mypage" href="<c:url value='/mypage' />">마이페이지</a>
	     			</c:if>
		    	</div>
	    	</div>
	    	<nav>
		    	<!-- 항공/숙박/렌터카 -->
		    	<ul>
		    		<li class="nav_active"><a href="<c:url value='/flight_main' />"><img class="ic_nav" src="<c:url value='/images/ic_plane.png' />" alt="항공"><span>항공</span></a></li>
		      		<li><a href="<c:url value='/stay_main' />"><img class="ic_nav" src="<c:url value='/images/ic_lodgment.png' />" alt="숙박"><span>숙박</span></a></li>
		      		<li><a href="<c:url value='/rent_main' />"><img class="ic_nav" src="<c:url value='/images/ic_rent.png' />" alt="렌터카"><span>렌터카</span></a></li>
		    	</ul>
			</nav>
		</div>
	</header>