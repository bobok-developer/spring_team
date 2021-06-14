<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<jsp:include page="./includes/header.jsp" />
	
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
	
	<!-- Home -->

	<div class="home">

		<!-- Hero Slider -->
		<div class="hero_slider_container">
			<div class="hero_slider owl-carousel">
				
				<!-- Hero Slide -->
				<div class="hero_slide">
					<div class="hero_slide_background" style="background-image:url(${pageContext.request.contextPath}/resources/images/slider_background.jpg)"></div>
					<div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
						<div class="hero_slide_content text-center">
							<h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut"><span>마음먹음</span> 을 실천할 수 있는 공간</h1>
						</div>
					</div>
				</div>
				
				<!-- Hero Slide -->
				<div class="hero_slide">
					<div class="hero_slide_background" style="background-image:url(${pageContext.request.contextPath}/resources/images/slider_background.jpg)"></div>
					<div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
						<div class="hero_slide_content text-center">
							<h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">모든 이들의 <span>마음먹음</span> 을 지지합니다.</h1>
						</div>
					</div>
				</div>
			</div>

			<div class="hero_slider_left hero_slider_nav trans_200"><span class="trans_200">prev</span></div>
			<div class="hero_slider_right hero_slider_nav trans_200"><span class="trans_200">next</span></div>
		</div>

	</div>

	<div class="hero_boxes">
		<div class="hero_boxes_inner">
			<div class="container">
				<div class="row">

					<div class="col-lg-4 hero_box_col">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<img src="${pageContext.request.contextPath}/resources/images/earth-globe.svg" class="svg" alt="">
							<div class="hero_box_content">
								<h2 class="hero_box_title">독서실 소개</h2>
								<a href="/aboutUs" class="hero_box_link">더보기</a>
							</div>
						</div>
					</div>

					<div class="col-lg-4 hero_box_col">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<img src="${pageContext.request.contextPath}/resources/images/books.svg" class="svg" alt="">
							<div class="hero_box_content">
								<h2 class="hero_box_title">이용 등록/안내</h2>
								<a href="/item/seat" class="hero_box_link">더보기</a>
							</div>
						</div>
					</div>

					<div class="col-lg-4 hero_box_col">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<img src="${pageContext.request.contextPath}/resources/images/professor.svg" class="svg" alt="">
							<div class="hero_box_content">
								<h2 class="hero_box_title">게시판</h2>
								<a href="/board/list" class="hero_box_link">더보기</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	
	<!-- 사이트맵? -->

	<div class="events page_section">
		<div class="container">
			
			<div class="row">
				<div class="col">
					<div class="section_title text-center">
						<h1>홈페이지 안내</h1>
					</div>
				</div>
			</div>
			
			<div class="event_items">

				<!-- Event Item -->
				<div class="row event_item">
					<div class="col">
						<div class="row d-flex flex-row align-items-end">

							<div class="col-lg-2 order-lg-1 order-2">
								<div class="event_date d-flex flex-column align-items-center justify-content-center">
									<div class="event_day">01</div>
									<div class="event_month">MAIN</div>
								</div>
							</div>

							<div class="col-lg-6 order-lg-2 order-3">
								<div class="event_content">
									<div class="event_name" style="font-size: 130%; font-color: black;">메인 화면</div>
									<div class="event_location">홈페이지 안내 / 오시는 길</div>
									<p>사이트 소개와 독서실 위치, 오시는 길을 확인하실 수 있습니다.<br></p>
								</div>
							</div>

							<div class="col-lg-4 order-lg-7 order-1">
								<div class="event_image">
									<img src="${pageContext.request.contextPath}/resources/images/event_1.jpg" alt="https://unsplash.com/@theunsteady5">
								</div>
							</div>

						</div>	
					</div>
				</div>

				<!-- Event Item -->
				<div class="row event_item">
					<div class="col">
						<div class="row d-flex flex-row align-items-end">

							<div class="col-lg-2 order-lg-1 order-2">
								<div class="event_date d-flex flex-column align-items-center justify-content-center">
									<div class="event_day">02</div>
									<div class="event_month">ABOUT</div>
								</div>
							</div>

							<div class="col-lg-6 order-lg-2 order-3">
								<div class="event_content">
									<div class="event_name" style="font-size: 130%; font-color: black;">시설 및 서비스</div>
									<div class="event_location">시설 안내 / 이용 안내 / 좌석 등록 및 이용</div>
									<p>ZAKSAL 독서실의 시설 및 이용방법에 대해 안내되어 있습니다. <br>좌석 등록/이용 메뉴에서 홈페이지를 통해 좌석을 예약하실 수 있습니다.</p>
								</div>
							</div>

							<div class="col-lg-4 order-lg-3 order-1">
								<div class="event_image">
									<img src="${pageContext.request.contextPath}/resources/images/event_2.jpg" alt="https://unsplash.com/@claybanks1989">
								</div>
							</div>

						</div>	
					</div>
				</div>

				<!-- Event Item -->
				<div class="row event_item">
					<div class="col">
						<div class="row d-flex flex-row align-items-end">

							<div class="col-lg-2 order-lg-1 order-2">
								<div class="event_date d-flex flex-column align-items-center justify-content-center">
									<div class="event_day">03</div>
									<div class="event_month">COMMUNITY</div>
								</div>
							</div>

							<div class="col-lg-6 order-lg-2 order-3">
								<div class="event_content">
									<div class="event_name" style="font-size: 130%; font-color: black;">게시판</div>
									<div class="event_location">공지사항 / Q&A</div>
									<p>ZAKSAL 독서실의 공지사항 및 이용에 대한 질문과 답변 내용을 확인하실 수 있습니다.<br></p>
								</div>
							</div>

							<div class="col-lg-4 order-lg-3 order-1">
								<div class="event_image">
									<img src="${pageContext.request.contextPath}/resources/images/event_3.jpg" alt="https://unsplash.com/@juanmramosjr">
								</div>
							</div>

						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 메인 갤러리 -->

		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/Index_slide_1.jpg" alt="First slide">
		        <div class="carousel-caption d-none d-md-block">
				    <h1>작살 독서실은</h1>
				    <h2>회원제로 운영되는 독서실입니다.<br>고정 20석, 자유 20석 총 40개의 좌석과 16개의 사물함이 마련되어있습니다.</h2>
				</div>
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/Index_slide_2.jpg" alt="Second slide">
		        <div class="carousel-caption d-none d-md-block">
				    <h1>작살 독서실에서는</h1>
				    <h2>최대 인원을 엄격하게 제한한 공간, 세심한 회원 관리를 통해 365일 쾌적한 학습 환경을 제공합니다.</h2>
				</div>
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/Index_slide_3.jpg" alt="Third slide">
		        <div class="carousel-caption d-none d-md-block">
				    <h1>작살 독서실이</h1>
				    <h2>포기하지 않는 꾸준한 학습을 통해 소중한 꿈에 한 발 다가가는 회원님들을 응원합니다.</h2>
				</div>
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		
		</div>


<%-- 	<!-- Services -->

	<div class="services page_section">
		
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title text-center">
						<h1>Our Services</h1>
					</div>
				</div>
			</div>

			<div class="row services_row">

				<div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
					<div class="icon_container d-flex flex-column justify-content-end">
						<img src="${pageContext.request.contextPath}/resources/images/earth-globe.svg" alt="">
					</div>
					<h3>Online Courses</h3>
					<p>In aliquam, augue a gravida rutrum, ante nisl fermentum nulla, vitae tempor nisl ligula vel nunc. Proin quis mi malesuada, finibus tortor fermentum.</p>
				</div>

				<div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
					<div class="icon_container d-flex flex-column justify-content-end">
						<img src="${pageContext.request.contextPath}/resources/images/exam.svg" alt="">
					</div>
					<h3>Indoor Courses</h3>
					<p>In aliquam, augue a gravida rutrum, ante nisl fermentum nulla, vitae tempor nisl ligula vel nunc. Proin quis mi malesuada, finibus tortor fermentum.</p>
				</div>

				<div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
					<div class="icon_container d-flex flex-column justify-content-end">
						<img src="${pageContext.request.contextPath}/resources/images/books.svg" alt="">
					</div>
					<h3>Amazing Library</h3>
					<p>In aliquam, augue a gravida rutrum, ante nisl fermentum nulla, vitae tempor nisl ligula vel nunc. Proin quis mi malesuada, finibus tortor fermentum.</p>
				</div>

				<div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
					<div class="icon_container d-flex flex-column justify-content-end">
						<img src="${pageContext.request.contextPath}/resources/images/professor.svg" alt="">
					</div>
					<h3>Exceptional Professors</h3>
					<p>In aliquam, augue a gravida rutrum, ante nisl fermentum nulla, vitae tempor nisl ligula vel nunc. Proin quis mi malesuada, finibus tortor fermentum.</p>
				</div>

				<div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
					<div class="icon_container d-flex flex-column justify-content-end">
						<img src="${pageContext.request.contextPath}/resources/images/blackboard.svg" alt="">
					</div>
					<h3>Top Programs</h3>
					<p>In aliquam, augue a gravida rutrum, ante nisl fermentum nulla, vitae tempor nisl ligula vel nunc. Proin quis mi malesuada, finibus tortor fermentum.</p>
				</div>

				<div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
					<div class="icon_container d-flex flex-column justify-content-end">
						<img src="${pageContext.request.contextPath}/resources/images/mortarboard.svg" alt="">
					</div>
					<h3>Graduate Diploma</h3>
					<p>In aliquam, augue a gravida rutrum, ante nisl fermentum nulla, vitae tempor nisl ligula vel nunc. Proin quis mi malesuada, finibus tortor fermentum.</p>
				</div>

			</div>
		</div>
	</div>	 --%>

	<!-- Popular -->

	<div class="popular page_section">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title text-center">
						<h2 class="text-dark"> 오시는 길 </h2>
					</div>
				</div>
			</div>

		<div class="row course_boxes">
			
		<!-- 지도 -->
	        <div class="col-8">
				<div id="map" style="width:100%; height:400px; clear:both;"></div>
			
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=782f162a7272734e440b80b9cdb6c6c7"></script>
			
			    <style>
			    .overlay_info {border-radius: 6px; margin-bottom: 12px; float:left;position: relative; border: 1px solid #ccc; border-bottom: 2px solid #ddd;background-color:#fff;}
			    .overlay_info:nth-of-type(n) {border:0; box-shadow: 0px 1px 2px #888;}
			    .overlay_info a {display: block; background: #ffc107; background: #ffc107  no-repeat right 14px center; text-decoration: none; color: #fff; padding:12px 36px 12px 14px; font-size: 14px; border-radius: 6px 6px 0 0}
			    .overlay_info .desc {display: block; padding:14px;position: relative; min-width: 190px; height: 56px; margin-bottom: 4px;}
			    .overlay_info:after {content:'';position: absolute; margin-left: -11px; left: 50%; bottom: -12px; width: 22px; height: 12px; background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png) no-repeat 0 bottom;}
				</style>
			
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(36.827530244852944, 127.14105322504332), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
			
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			// 지도에 교통정보를 표시하도록 지도타입을 추가합니다
			map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC); 
			
			// 커스텀 오버레이에 표시할 내용입니다
			// HTML 문자열 또는 Dom Element 입니다
			var content = '<div class="overlay_info">';
			content += '    <a href="" target="_blank"><strong>작살 독서실</strong></a>';
			content += '    <div class="desc">';
			content += '        <span class="address"> 천안시 서북구 성정공원5로 35, 6층</span>';
			content += '    </div>';
			content += '</div>';
	
			// 커스텀 오버레이가 표시될 위치입니다 
			var position = new kakao.maps.LatLng(36.827530244852944, 127.14105322504332);
	
			// 커스텀 오버레이를 생성합니다
			var mapCustomOverlay = new kakao.maps.CustomOverlay({
			    position: position,
			    content: content,
			    xAnchor: 0.5, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
			    yAnchor: 1.1 // 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
			});
	
			// 커스텀 오버레이를 지도에 표시합니다
			mapCustomOverlay.setMap(map);
			
			</script>
			</div>
		
          <div class="col-4">
            <div class="card" style=" border: 1px solid #ccc; border-bottom: 2px solid #ddd;background-color:#fff; width:400px; height:400px; ">
              <div class="card-body text-dark">
                <h3 class="card-title">버스 이용안내</h3>
                <p class="card-text">
                  3, 30, 31, 11, 830, 840, 850, 860, 870, 910, 911, 920, 921, 92, 94, 97
                </p>
                <p>─</p>

                <h3 class="card-title">지하철 이용안내</h3>
                <p class="card-text" style="bold;">
                  1호선  두정역 1번출구이용 도보 12분
                </p>
                <p>─</p>
               </div>
            </div>
          </div>
		</div>
       </div>
	</div>		

<%-- 	<!-- Register -->

	<div class="register">

		<div class="container-fluid">
			
			<div class="row row-eq-height">
				<div class="col-lg-6 nopadding">
					
					<div class="register_section d-flex flex-column align-items-center justify-content-center">
						<div class="register_content text-center">
						
						
						</div>
					</div>

				</div>

				<div class="col-lg-6 nopadding">
					
					<!-- Search -->

					<div class="search_section d-flex flex-column align-items-center justify-content-center">
						<div class="search_background" style="background-image:url(${pageContext.request.contextPath}/resources/images/search_background.jpg);"></div>
						<div class="search_content text-center">
						</div> 
					</div>

				</div>
			</div>
		</div>
	</div>
 --%>






	

			
<jsp:include page="./includes/footer.jsp" />
			

