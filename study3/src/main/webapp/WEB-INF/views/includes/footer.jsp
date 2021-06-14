<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Footer -->

	<footer class="footer">
		<div class="container">
			
			<!-- Newsletter -->

			<div class="newsletter">

			</div>
<!-- Footer Content -->

			<div class="footer_content">
				<div class="row">

					<!-- Footer Column - About -->
					<div class="col-lg-4 footer_col">

						<!-- Logo -->
						<div class="logo_container">
							<div class="logo">
								<%-- <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt=""> --%>
								<span>ZAKSAL</span>
							</div>
						</div>

						<!-- <p class="footer_about_text">In aliquam, augue a gravida rutrum, ante nisl fermentum nulla, vitae tempor nisl ligula vel nunc. Proin quis mi malesuada, finibus tortor fermentum, tempor lacus.</p> -->

					</div>

					<!-- Footer Column - Menu -->

					<div class="col-lg-4 footer_col">
						<div class="footer_column_title">메뉴</div>
						<div class="footer_column_content">
							<ul>
								<li class="footer_list_item"><a href="#">ZAKSAL 소개</a></li>
								<li class="footer_list_item"><a href="${pageContext.request.contextPath}/gallery">시설 안내</a></li>
								<li class="footer_list_item"><a href="${pageContext.request.contextPath}/aboutUs">이용 안내</a></li>
								<li class="footer_list_item"><a href="${pageContext.request.contextPath}/item/seat">좌석등록/이용</a></li>
								<li class="footer_list_item"><a href="${pageContext.request.contextPath}/board/list">커뮤니티</a></li>
							</ul>
						</div>
					</div>

					<!-- Footer Column - Usefull Links -->

<!-- 					<div class="col-lg-3 footer_col">
						<div class="footer_column_title">Usefull Links</div>
						<div class="footer_column_content">
							<ul>
								<li class="footer_list_item"><a href="#">Testimonials</a></li>
								<li class="footer_list_item"><a href="#">FAQ</a></li>
								<li class="footer_list_item"><a href="#">Community</a></li>
								<li class="footer_list_item"><a href="#">Campus Pictures</a></li>
								<li class="footer_list_item"><a href="#">Tuitions</a></li>
							</ul>
						</div>
					</div> -->

					<!-- Footer Column - Contact -->

					<div class="col-lg-4 footer_col">
						<div class="footer_column_title">연락처</div>
						<div class="footer_column_content">
							<ul>
								<li class="footer_contact_item">
									<div class="footer_contact_icon">
										<img src="${pageContext.request.contextPath}/resources/images/placeholder.svg" alt="https://www.flaticon.com/authors/lucy-g">
									</div>
									천안시 서북구 성정공원5로 35
								</li>
								<li class="footer_contact_item">
									<div class="footer_contact_icon">
										<img src="${pageContext.request.contextPath}/resources/images/smartphone.svg" alt="https://www.flaticon.com/authors/lucy-g">
									</div>
									(041) 555 - 1234
								</li>
								<li class="footer_contact_item">
									<div class="footer_contact_icon">
										<img src="${pageContext.request.contextPath}/resources/images/envelope.svg" alt="https://www.flaticon.com/authors/lucy-g">
									</div>zaksal@example.com
								</li>
							</ul>
						</div>
					</div>

				</div>
			</div>
<!-- Footer Copyright -->

			<div class="footer_bar d-flex flex-column flex-sm-row align-items-center">
				<div class="footer_copyright">
					<span>
						Copyright &copy;<script>document.write(new Date().getFullYear());</script>(주)스토리아이엔지 All rights reserved
					</span>
				</div>
			</div>

		</div>
	</footer>
</div>
<script src="${pageContext.request.contextPath}/resources/styles/bootstrap4/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/greensock/TweenMax.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/greensock/TimelineMax.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/greensock/animation.gsap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/scrollTo/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/easing/easing.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>


</body>
</html>