<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<jsp:include page="../includes/header.jsp" />
	<h1>관리자 메인페이지</h1>
	
	<div class="home">

		<!-- Hero Slider -->
		<div class="hero_slider_container">
			<div class="hero_slider owl-carousel">
				
				<!-- Hero Slide -->
				<div class="hero_slide">
					<div class="hero_slide_background" style="background-image:url(${pageContext.request.contextPath}/resources/images/slider_background.jpg)"></div>
					<div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
						<div class="hero_slide_content text-center">
							<h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Get your <span>Education</span> today!</h1>
						</div>
					</div>
				</div>
				
				<!-- Hero Slide -->
				<div class="hero_slide">
					<div class="hero_slide_background" style="background-image:url(${pageContext.request.contextPath}/resources/images/slider_background.jpg)"></div>
					<div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
						<div class="hero_slide_content text-center">
							<h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Get your <span>Education</span> today!</h1>
						</div>
					</div>
				</div>
				
				<!-- Hero Slide -->
				<div class="hero_slide">
					<div class="hero_slide_background" style="background-image:url(${pageContext.request.contextPath}/resources/images/slider_background.jpg)"></div>
					<div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
						<div class="hero_slide_content text-center">
							<h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Get your <span>Education</span> today!</h1>
						</div>
					</div>
				</div>

			</div>

			
		</div>

	</div>
	<div class="hero_boxes">
		<div class="hero_boxes_inner">
			<div class="container">
				<div class="row">

					<div class="col-lg-4 hero_box_col">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<div class="hero_box_content">
								<h2 class="hero_box_title">회원정보</h2>
								<a href="${pageContext.request.contextPath}/admin/memberList" class="hero_box_link">
									<img src="${pageContext.request.contextPath}/resources/images/earth-globe.svg" class="svg" alt="">
								</a>
							</div>
						</div>
					</div>

					<div class="col-lg-4 hero_box_col">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<div class="hero_box_content">
								<h2 class="hero_box_title">좌석 및 사물함 이용현황</h2>
								<a href="${pageContext.request.contextPath}/admin/itemStatus" class="hero_box_link">
									<img src="${pageContext.request.contextPath}/resources/images/books.svg" class="svg" alt="">
								</a>
							</div>
						</div>
					</div>

					<div class="col-lg-4 hero_box_col">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<div class="hero_box_content">
								<h2 class="hero_box_title">장부</h2>
								<a href="${pageContext.request.contextPath}/admin/paymentList" class="hero_box_link">
									<img src="${pageContext.request.contextPath}/resources/images/professor.svg" class="svg" alt="">
								</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	
	
<jsp:include page="../includes/footer.jsp" />