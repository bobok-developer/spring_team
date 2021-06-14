<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<jsp:include page="../includes/adminHeader.jsp" />
	<div class="home">
		<div class="home_background_container prlx_parent">
			<div class="home_background prlx" style="background-image:url(${pageContext.request.contextPath}/resources/images/news_background.jpg)"></div>
		</div>
		<div class="home_content">
			<h1>상품현황 페이지</h1>
		</div>
	</div>
	
	<!-- News -->

	<div class="news">
		<div class="container">
			
			<!-- 사물함 -->
			<div class="d-flex justify-content-center"><h1>사물함</h1></div>
			<div id="locker" class="border px-5 py-5 mr-3 mt-3">
				<div class="card-deck">
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">사물함01</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">사물함02</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">사물함03</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">사물함04</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">사물함05</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">사물함06</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">사물함07</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">사물함08</p>
					  </div>
					</div>
				</div>
				<div class="card-deck mt-4">
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">사물함09</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">사물함10</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">사물함11</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">사물함12</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">사물함13</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">사물함14</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">사물함15</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">사물함16</p>
					  </div>
					</div>
				</div> 
			</div> <!-- end locker -->
		</div>
	</div>
	<div class="news">
		<div class="container">
			<div class="d-flex justify-content-center mb-3"><h1>고정석</h1></div>
			<div class="row">
				<div id="room1" class="border px-5 py-5">
					<div class="card-deck">
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text mb-0">좌석01</p>
						    <p class="card-text mb-0">고정석</p>
						    <button class="btn btn-sm btn-light mx-0">등록</button>
						  </div>
						</div>
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text mb-0">좌석02</p>
						    <p class="card-text mb-0">고정석</p>
						    <button class="btn btn-sm btn-light mx-0">등록</button>
						  </div>
						</div>
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text mb-0">좌석03</p>
						    <p class="card-text mb-0">고정석</p>
						    <button class="btn btn-sm btn-light mx-0">등록</button>
						  </div>
						</div>
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text mb-0">좌석04</p>
						    <p class="card-text mb-0">고정석</p>
						    <button class="btn btn-sm btn-light mx-0">등록</button>
						  </div>
						</div>
					</div>
					<div class="card-deck mt-4">
						<div class="card bg-warning">
						  <div class="card-body text-center">
						    <p class="card-text">좌석05</p>
						    <p class="card-text">고정석</p>
						  </div>
						</div>
						<div class="card bg-muted border-0">
						  <div class="card-body text-center">
						  </div>
						</div>
						<div class="card bg-muted border-0">
						  <div class="card-body text-center">
						  </div>
						</div>
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text">좌석06</p>
						    <p class="card-text">고정석</p>
						  </div>
						</div>
					</div>
					<div class="card-deck mt-4">
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text">좌석07</p>
						    <p class="card-text">고정석</p>
						  </div>
						</div>
						<div class="card bg-muted border-0">
						  <div class="card-body text-center">
						  </div>
						</div>
						<div class="card bg-muted border-0">
						  <div class="card-body text-center">
						  </div>
						</div>
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text">좌석08</p>
						    <p class="card-text">고정석</p>
						  </div>
						</div>
					</div>
					<div class="card-deck mt-4">
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text">좌석09</p>
						    <p class="card-text">고정석</p>
						  </div>
						</div>
						<div class="card bg-warning">
						  <div class="card-body text-center">
						    <p class="card-text">좌석10</p>
						    <p class="card-text">고정석</p>
						  </div>
						</div>
						<div class="card bg-warning">
						  <div class="card-body text-center">
						    <p class="card-text">좌석11</p>
						    <p class="card-text">고정석</p>
						  </div>
						</div>
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text">좌석12</p>
						    <p class="card-text">고정석</p>
						  </div>
						</div>
					</div>
				</div> <!-- room1 -->
				<div id="room2" class="border px-5 py-5 ml-5">
					<div class="card-deck">
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text">좌석13</p>
						    <p class="card-text">고정석</p>
						  </div>
						</div>
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text">좌석14</p>
						    <p class="card-text">고정석</p>
						  </div>
						</div>
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text">좌석15</p>
						    <p class="card-text">고정석</p>
						  </div>
						</div>
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text">좌석16</p>
						    <p class="card-text">고정석</p>
						  </div>
						</div>
					</div>
					<div class="card-deck mt-4">
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text">좌석17</p>
						    <p class="card-text">고정석</p>
						  </div>
						</div>
						<div class="card bg-muted border-0">
						  <div class="card-body text-center">
						  </div>
						</div>
						<div class="card bg-muted border-0">
						  <div class="card-body text-center">
						  </div>
						</div>
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text">좌석18</p>
						    <p class="card-text">고정석</p>
						  </div>
						</div>
					</div>
					<!--  -->
					<div class="card-deck mt-4">
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text">좌석19</p>
						    <p class="card-text">고정석</p>
						  </div>
						</div>
						<div class="card bg-muted border-0">
						  <div class="card-body text-center">
						  </div>
						</div>
						<div class="card bg-muted border-0">
						  <div class="card-body text-center">
						  </div>
						</div>
						<div class="card bg-muted">
						  <div class="card-body text-center">
						    <p class="card-text">좌석20</p>
						    <p class="card-text">고정석</p>
						  </div>
						</div>
					</div>
				</div> <!-- end room2 -->
			</div> <!-- end row -->
			
			<!-- 자유석 -->
			<div class="d-flex justify-content-center mt-5"><h1>자유석</h1></div>
			<div id="room3" class="border px-5 py-5 mr-3 mt-3">
				<div class="card-deck">
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">좌석21</p>
					    <p class="card-text">자유석</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">좌석22</p>
					    <p class="card-text">자유석</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">좌석23</p>
					    <p class="card-text">자유석</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">좌석24</p>
					    <p class="card-text">자유석</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">좌석25</p>
					    <p class="card-text">자유석</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">좌석26</p>
					    <p class="card-text">자유석</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">좌석27</p>
					    <p class="card-text">자유석</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">좌석28</p>
					    <p class="card-text">자유석</p>
					  </div>
					</div>
				</div>
				<!--  --> 
				<div class="card-deck mt-4">
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">좌석29</p>
					    <p class="card-text">자유석</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">좌석30</p>
					    <p class="card-text">자유석</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">좌석31</p>
					    <p class="card-text">자유석</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">좌석32</p>
					    <p class="card-text">자유석</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">좌석33</p>
					    <p class="card-text">자유석</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">좌석34</p>
					    <p class="card-text">자유석</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">좌석35</p>
					    <p class="card-text">자유석</p>
					  </div>
					</div>
					<div class="card bg-muted">
					  <div class="card-body text-center">
					    <p class="card-text">좌석36</p>
					    <p class="card-text">자유석</p>
					  </div>
					</div>
				</div> 
				<!--  -->
			</div> <!-- end room3 -->
		</div>
	</div>
	
<jsp:include page="../includes/footer.jsp" />