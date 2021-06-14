<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>작살 독서실</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Course Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicons -->
<link href="${pageContext.request.contextPath}/resources/images/favicon.png" rel="icon">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/bootstrap4/bootstrap441.min.css">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
<link href="${pageContext.request.contextPath}/resources/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/news_styles.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/news_responsive.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/my.css">
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js" integrity="sha512-3kMAxw/DoCOkS6yQGfQsRY1FWknTEzdiz8DOwWoqf+eGRN45AmjS2Lggql50nCe9Q6m5su5dDZylflBY2YjABQ==" crossorigin="anonymous"></script>
</head>
<body>


	<!-- Header -->

	<header class="header d-flex flex-row">
		<div class="header_content d-flex flex-row align-items-center">
			<!-- Logo -->
			<div class="logo_container px-4">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/index">
					<img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="로고">
					</a>
				</div>
			</div>

			<!-- Main Navigation -->
			<nav class="main_nav_container">
				<div class="main_nav">
					<sec:authorize access="!hasRole('ADMIN')">
						<ul class="main_nav_list mr-5">
							<li class="main_nav_item"><a href="${pageContext.request.contextPath}/zaksal">ZAKSAL 소개</a></li>
							<li class="main_nav_item"><a href="${pageContext.request.contextPath}/gallery">시설 안내</a></li>
							<li class="main_nav_item"><a href="${pageContext.request.contextPath}/aboutUs">이용 안내</a></li>
							<li class="main_nav_item"><a href="${pageContext.request.contextPath}/item/seat">좌석등록/이용</a></li>
							<li class="main_nav_item drop-down dropdown-toggle" data-toggle="dropdown"><a href="#">커뮤니티</a> <!-- 드롭다운으로 사물함/ 좌석 -->
							<li class="dropdown-menu">
								<a class="dropdown-item" href="${pageContext.request.contextPath}/board/list?category=1">공지사항</a>
								<a class="dropdown-item" href="${pageContext.request.contextPath}/board/list?category=2">Q&A</a>
							</li>
						</ul>
					</sec:authorize>
	
					<sec:authorize access="hasRole('ADMIN')">
						<ul class="main_nav_list">
							<li class="main_nav_item"><a href="${pageContext.request.contextPath}/zaksal">ZAKSAL 소개</a></li>
							<li class="main_nav_item"><a href="${pageContext.request.contextPath}/gallery">시설 안내</a></li>
							<li class="main_nav_item"><a href="${pageContext.request.contextPath}/aboutUs">이용 안내</a></li>
							<li class="main_nav_item"><a href="${pageContext.request.contextPath}/item/seat">좌석등록/이용</a></li>
							<li class="main_nav_item drop-down dropdown-toggle" data-toggle="dropdown"><a href="#">커뮤니티</a> <!-- 드롭다운으로 사물함/ 좌석 -->
							<li class="dropdown-menu">
								<a class="dropdown-item" href="${pageContext.request.contextPath}/board/list?category=1">공지사항</a>
								<a class="dropdown-item" href="${pageContext.request.contextPath}/board/list?category=2">Q&A</a>
							</li>
							<li class="main_nav_item"><a href="${pageContext.request.contextPath}/admin/admin">관리자페이지</a></li>
						</ul>
					</sec:authorize>
				</div>
			</nav>
		</div>
		<div class="header_side d-flex flex-row justify-content-center align-items-center">
			<sec:authorize access="isAnonymous()">
				<a class="text-white" href="${pageContext.request.contextPath}/member/login">로그인</a>
				<a class="text-white ml-4" href="${pageContext.request.contextPath}/member/terms">회원가입</a>
			</sec:authorize>
			
			<sec:authorize access = "isAuthenticated()">
			 <sec:authentication property="principal" var="member"/>
				
				<!-- Nav Item - User Information -->
				<h4 class="nav-link dropdown-toggle mt-3 pt-1" href="#" id="userDropdown" role="button" 
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">    
					<a class="text-white">${member.vo.userName}님 환영합니다.</a></h4>
				<!-- Dropdown - User Information -->
				<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
					<form method="post" action="${pageContext.request.contextPath}/member/logout" >
						<button class="dropdown-item">
                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>로그아웃
                        </button>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/member/pwCheck"> 
						<i class="fas fa-user-alt-slash fa-sm fa-fw mr-2 text-gray-400"></i>탈퇴
					</a>
				</div>
			</sec:authorize>
		</div>

		<!-- Hamburger -->
		<div class="hamburger_container">
			<i class="fas fa-bars trans_200"></i>
		</div>

	</header>
	
	<!-- Menu -->
	<div class="menu_container menu_mm">

		<!-- Menu Close Button -->
		<div class="menu_close_container">
			<div class="menu_close"></div>
		</div>

		<!-- Menu Items -->
		<div class="menu_inner menu_mm">
			<div class="menu menu_mm">
				<ul class="menu_list menu_mm">
					<li class="menu_item menu_mm"><a href="#">ZAKSAL 소개</a></li>
					<li class="menu_item menu_mm"><a href="${pageContext.request.contextPath}/gallery">시설 안내</a></li>
					<li class="menu_item menu_mm"><a href="${pageContext.request.contextPath}/aboutUs">이용 안내</a></li>
					<li class="menu_item menu_mm"><a href="${pageContext.request.contextPath}/item/seat">좌석등록/이용</a></li>
					<li class="menu_item menu_mm"><a href="${pageContext.request.contextPath}/board/list?category=1">공지사항</a></li>
					<li class="menu_item menu_mm"><a href="${pageContext.request.contextPath}/board/list?category=2">Q&A</a></li>
					<sec:authorize access="hasRole('ADMIN')">
					<li class="menu_item menu_mm"><a href="${pageContext.request.contextPath}/admin/admin">관리자페이지</a></li>
					</sec:authorize>
				</ul>

				<!-- Menu Social -->
				
<!-- 				<div class="menu_social_container menu_mm">
					<ul class="menu_social menu_mm">
						<li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-pinterest"></i></a></li>
						<li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
						<li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-instagram"></i></a></li>
						<li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-facebook-f"></i></a></li>
						<li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-twitter"></i></a></li>
					</ul>
				</div> -->

				<div class="menu_copyright menu_mm">(주) 스토리아이엔지 All rights reserved</div>
			</div>

		</div>

	</div>
<%-- 	<!-- Home -->

	<div class="home">
		<div class="home_background_container prlx_parent">
			<div class="home_background prlx" style="background-image:url(${pageContext.request.contextPath}/resources/images/news_background.jpg)"></div>
		</div> --%>