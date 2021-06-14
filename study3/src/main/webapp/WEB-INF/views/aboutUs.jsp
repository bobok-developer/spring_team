<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./includes/header_.jsp" />
	<!-- Home -->

	<div class="home">
		<div class="home_background_container prlx_parent">
			<div class="home_background prlx" style="background-image:url(${pageContext.request.contextPath}/resources/images/news_background.jpg)"></div>
		</div>
		<div class="home_content">
			<h1>등록/이용안내</h1>
		</div>
	</div>

	<!-- News -->

	<div class="news">
		<div class="container">
			<div class="row"> <!-- 본문 시작 -->
				<span class="text-danger">* 사이트 내 모든 조회는 비회원도 가능하지만, 등록은 회원만 가능합니다.</span>
				
				<div class="mt-3">
					<h2>좌석/사물함 등록하기</h2>
					<h3>1. 로그인 후 좌석 등록/이용 페이지에서 빈 좌석 중 희망하는 좌석을 선택해 주세요.</h3>
					<img class="my-2" src='${pageContext.request.contextPath}/resources/images/info00.png' alt="좌석등록 설명1">
				</div>
				<div class="mt-5">
					<h3>2. 희망하는 이용 기간을 선택 후, 사물함도 같이 이용하려면 체크해 주세요.</h3>
					<h4 class="text-danger">* 사물함 이용 기간은 좌석 이용기간과 동일합니다. 추후 관리자를 통해 사물함 이용을 취소하실 수 있습니다.</h4>
					<img class="my-2" src='${pageContext.request.contextPath}/resources/images/info01.png' alt="좌석등록 설명2">
				</div>
				<hr>
				<div class="mt-5">
					<h2>좌석/사물함 연장하기</h2>
					<h3>1. 로그인 후 좌석 등록/이용 페이지에서 연장하기 버튼을 눌러 주세요.</h3>
					<img class="my-2" src='${pageContext.request.contextPath}/resources/images/info02.png' alt="좌석등록 설명3">
				</div>
				<div class="mt-5">
					<h3>2. 연장을 희망하는 만큼 일 수를 선택하신 후 결제하기 버튼을 눌러주세요.</h3>
					<img class="my-2" src='${pageContext.request.contextPath}/resources/images/info03.png' alt="좌석등록 설명4">
				</div>
				<div class="mt-5">
					<h2>좌석 변경하기</h2>
					<h3>1. 로그인 후 좌석 등록/이용 페이지에서 좌석 변경하기 버튼을 눌러 주세요.</h3>
					<img class="my-2" src='${pageContext.request.contextPath}/resources/images/info04.png' alt="좌석등록 설명5">
				</div>
				<div class="mt-5">
					<h3>2. 빈 좌석 중 변경하려는 좌석의 변경 버튼을 눌러 주세요.</h3>
					<img class="my-2" src='${pageContext.request.contextPath}/resources/images/info05.png' alt="좌석등록 설명6">
				</div>
				<div class="mt-5">
					<h2>요금 안내</h2>
					<h3>1. 좌석</h3>
					<span>1일: 8,000원, 7일: 50,000원, 14일: 90,000원, 30일: 200,000원</span>
					<h3 class="mt-3">2. 사물함 (7일부터 이용 가능)</h3>
					<span>7일: 6,000원, 14일: 10,000원, 30일: 20,000원</span>
				</div>
			</div> <!-- 본문 끝 -->
		</div>
	</div>
<jsp:include page="./includes/footer.jsp" />