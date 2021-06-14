<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../includes/header_.jsp" />
	<!-- Home -->
	<div class="home">
		<div class="home_background_container prlx_parent">
			<div class="home_background prlx" style="background-image:url(${pageContext.request.contextPath}/resources/images/news_background.jpg)"></div>
		</div>
		<div class="home_content">
			<h1>좌석 등록/이용</h1>
		</div>
	</div>

	<!-- News -->

	<div class="news">
		<div class="container">
			<div class="d-flex justify-content-center mb-3"><h1>고정석</h1></div>
            <sec:authorize access="isAuthenticated()">
            <sec:authentication property="principal" var="member"/>
            <div class="mb-3">
            	<c:forEach items="${regList}" var="reg">
            		<c:if test="${reg.userNo == member.vo.userNo}">
            			<fmt:formatDate var="formatEndDate" value="${reg.endDate}" pattern="yyyy.MM.dd"/>
						<span>나의 만료일: ${formatEndDate}</span>
						<a href="${pageContext.request.contextPath}/payment/exPayment" class="btn btn-sm btn-outline-warning mx-2">연장하기</a>
						<a href="${pageContext.request.contextPath}/item/changeSeat" class="btn btn-sm btn-outline-danger chgSeatBtn">좌석 변경하기</a>
            		</c:if>
            	</c:forEach>
			</div>
	        </sec:authorize>

			<div class="row">
				<div id="room1" class="border px-5 py-5">
					<div class="card-deck">
						<c:forEach items="${seatList}" var="seat" begin="0" end="3">
							<c:if test="${seat.status == true}">
								<div class="card bg-warning container" style="width: 90px">
								  <div class="card-body text-center px-0">
								    <p class="card-text text-white">좌석 0${seat.sno}</p>
								    <p class="card-text text-white">${seat.name}</p>
								    <p class="card-text text-white">이용중</p>
								  </div>
								</div>
							</c:if>
							<c:if test="${seat.status == false}">
								<div class="card bg-muted container" style="width: 90px">
								  <div class="card-body text-center px-0">
								    <p class="card-text">좌석 0${seat.sno}</p>
								    <p class="card-text">${seat.name}</p>
								    <button type="button" class="sRegBtn btn btn-sm btn-light container px-0" data-sno="${seat.sno}" value="${seat.sno}">등록</button>
								  </div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					
					<div class="card-deck mt-4">
						<c:forEach items="${seatList}" var="seat" begin="4" end="7">
							<c:if test="${seat.status == true}">
								<div class="card bg-warning container" style="width: 90px">
								  <div class="card-body text-center px-0">
								    <p class="card-text text-white">좌석 0${seat.sno}</p>
								    <p class="card-text text-white">${seat.name}</p>
								    <p class="card-text text-white">이용중</p>
								  </div>
								</div>
							</c:if>
							<c:if test="${seat.status == false}">
								<div class="card bg-muted container" style="width: 90px">
								  <div class="card-body text-center px-0">
								    <p class="card-text">좌석 0${seat.sno}</p>
								    <p class="card-text">${seat.name}</p>
								    <button type="button" class="sRegBtn btn btn-sm btn-light container px-0" data-sno="${seat.sno}" value="${seat.sno}">등록</button>
								  </div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					
					<div class="card-deck mt-4">
						<c:forEach items="${seatList}" var="seat" begin="8" end="11">
							<c:if test="${seat.status == true}">
								<div class="card bg-warning container" style="width: 90px">
								  <div class="card-body text-center px-0">
								    <p class="card-text text-white">좌석 ${seat.sno}</p>
								    <p class="card-text text-white">${seat.name}</p>
								    <p class="card-text text-white">이용중</p>
								  </div>
								</div>
							</c:if>
							<c:if test="${seat.status == false}">
								<div class="card bg-muted container" style="width: 90px">
								  <div class="card-body text-center px-0">
								    <p class="card-text">좌석 ${seat.sno}</p>
								    <p class="card-text">${seat.name}</p>
								    <button type="button" class="sRegBtn btn btn-sm btn-light container px-0" data-sno="${seat.sno}" value="${seat.sno}">등록</button>
								  </div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>				
				<div id="room2" class="border px-5 py-5 ml-3">
					<div class="card-deck">
						<c:forEach items="${seatList}" var="seat" begin="12" end="15">
							<c:if test="${seat.status == true}">
								<div class="card bg-warning container" style="width: 90px">
								  <div class="card-body text-center px-0">
								    <p class="card-text text-white">좌석 ${seat.sno}</p>
								    <p class="card-text text-white">${seat.name}</p>
								    <p class="card-text text-white">이용중</p>
								  </div>
								</div>
							</c:if>
							<c:if test="${seat.status == false}">
								<div class="card bg-muted container" style="width: 90px">
								  <div class="card-body text-center px-0">
								    <p class="card-text">좌석 ${seat.sno}</p>
								    <p class="card-text">${seat.name}</p>
								    <button type="button" class="sRegBtn btn btn-sm btn-light container px-0" data-sno="${seat.sno}" value="${seat.sno}">등록</button>
								  </div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="card-deck mt-4">
						<c:forEach items="${seatList}" var="seat" begin="16" end="19">
							<c:if test="${seat.status == true}">
								<div class="card bg-warning container" style="width: 90px">
								  <div class="card-body text-center px-0">
								    <p class="card-text text-white">좌석 ${seat.sno}</p>
								    <p class="card-text text-white">${seat.name}</p>
								    <p class="card-text text-white">이용중</p>
								  </div>
								</div>
							</c:if>
							<c:if test="${seat.status == false}">
								<div class="card bg-muted container" style="width: 90px">
								  <div class="card-body text-center px-0">
								    <p class="card-text">좌석 ${seat.sno}</p>
								    <p class="card-text">${seat.name}</p>
								    <button type="button" class="sRegBtn btn btn-sm btn-light container px-0" data-sno="${seat.sno}" value="${seat.sno}">등록</button>
								  </div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div> <!-- end room2 -->
			</div> <!-- end row -->

			<!-- 자유석 -->
			<div class="d-flex justify-content-center mt-5"><h1>자유석</h1></div>
			<div id="room3" class="border px-5 py-5 mr-3 mt-3">
				<div class="card-deck">
					<c:forEach items="${seatList}" var="seat" begin="20" end="27">
						<c:if test="${seat.status == true}">
							<div class="card bg-warning container" style="width: 90px">
								  <div class="card-body text-center px-0">
								    <p class="card-text text-white">좌석 ${seat.sno}</p>
								    <p class="card-text text-white">${seat.name}</p>
								    <p class="card-text text-white">이용중</p>
								  </div>
								</div>
						</c:if>
						<c:if test="${seat.status == false}">
							<div class="card bg-muted container" style="width: 90px">
							  <div class="card-body text-center px-0">
							    <p class="card-text">좌석 ${seat.sno}</p>
							    <p class="card-text">${seat.name}</p>
							    <button type="button" class="sRegBtn btn btn-sm btn-light container px-0" data-sno="${seat.sno}" value="${seat.sno}">등록</button>
							  </div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<!--  --> 
				<div class="card-deck mt-4">
					<c:forEach items="${seatList}" var="seat" begin="28" end="35">
						<c:if test="${seat.status == true}">
							<div class="card bg-warning container" style="width: 90px">
								  <div class="card-body text-center px-0">
								    <p class="card-text text-white">좌석 ${seat.sno}</p>
								    <p class="card-text text-white">${seat.name}</p>
								    <p class="card-text text-white">이용중</p>
								  </div>
								</div>
						</c:if>
						<c:if test="${seat.status == false}">
							<div class="card bg-muted container" style="width: 90px">
							  <div class="card-body text-center px-0">
							    <p class="card-text">좌석 ${seat.sno}</p>
							    <p class="card-text">${seat.name}</p>
							    <button type="button" class="sRegBtn btn btn-sm btn-light container px-0" data-sno="${seat.sno}" value="${seat.sno}">등록</button>
							  </div>
							</div>
						</c:if>
					</c:forEach>
				</div> 
			</div> <!-- end room3 -->
					<!-- 사물함 -->
			<div class="d-flex justify-content-center mt-5">
				<h1>사물함</h1>
			</div>
			<span class="text-danger">* 사물함 등록은 따로 불가능합니다. 좌석 등록 시에 신청해 주세요.</span>
			<div id="locker" class="border px-5 py-5 mr-3 mt-3">
				<div class="card-deck">
					<c:forEach items="${lockerList}" var="locker" begin="0" end="7">
						<c:if test="${locker.status == true}">
							<div class="card bg-warning">
							  <div class="card-body text-center">
							    <p class="card-text">사물함 0${locker.lno}</p>
							    <p class="card-text">이용중</p>
							  </div>
							</div>
						</c:if>
					</c:forEach>
					<c:forEach items="${lockerList}" var="locker" begin="0" end="7">
						<c:if test="${locker.status == false}">
							<div class="card bg-muted">
							  <div class="card-body text-center px-0">
							    <p class="card-text">사물함 0${locker.lno}</p>
							    <p class="card-text"></p>
							  </div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="card-deck mt-4">
					<c:forEach items="${lockerList}" var="locker" begin="8" end="15">
						<c:if test="${locker.status == true}">
							<div class="card bg-warning">
							  <div class="card-body text-center">
							    <p class="card-text">사물함 0${locker.lno}</p>
							    <p class="card-text">이용중</p>
							  </div>
							</div>
						</c:if>
					</c:forEach>
					<c:forEach items="${lockerList}" var="locker" begin="8" end="15">
						<c:if test="${locker.status == false}">
							<div class="card bg-muted">
							  <div class="card-body text-center px-0">
							    <p class="card-text">사물함 0${locker.lno}</p>
							    <p class="card-text"></p>
							  </div>
							</div>
						</c:if>
					</c:forEach>
				</div> 
			</div> <!-- end locker -->
			<!-- 좌석 선택 후 모달 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h3 class="modal-title" id="myModalLabel">이용 등록 정보</h3>
			                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">×</span>
			                </button>
			            </div>
			            <form class="regForm" method="post" action="${pageContext.request.contextPath}/payment/payment">
			            <div class="modal-body">
			            	<div class="form-group">
			            		<h3>좌석번호: <span id="curSno"></span></h3>
							    <label class="font-wieght-bold text-info">좌석 이용 기간 선택</label>
							    <!-- 드롭다운으로 기간 선택 -->
								<select id="period" name="fno" class="form-control">
									<option value="1">1일 (8,000)</option>
									<option value="2">7일 (50,000)</option>
									<option value="3">14일 (90,000)</option>
									<option value="4">30일 (200,000)</option>
								</select>
			   				</div>
			            	<div class="form-check addLocker"> <!-- 7일 이상 사용시 -->
			            		<label class="form-check-label mb-2">
			    					<input type="checkbox" class="form-check-input chkLoc" value="usingLoc" onclick="showHideLocker(this)">사물함도 함께 이용하기. 
			    				</label>
								<div id="showEmpLoc" class="form-check mt-3">
									<span>7일 (6,000), 14일 (10,000), 30일 (20,000)</span>
									<div class="mt-2"><h4 class="text-info">이용 가능한 사물함 번호</h4>
										<c:forEach items="${empLocList}" var="locker">
										    <%-- <label class="form-check-label"><input type="radio" class="form-check-input mx-2 chkLno" name="lockerNo" value="${locker.lno}"></label> --%>
										    <label><input type="radio" class="form-check mx-2" name="lockerNo" value="${locker.lno}" required> ${locker.lno}번 </label>
										</c:forEach>
									</div>
								</div>
							</div>
			            </div>
			            <div class="modal-footer">
			                <button type="button" id="modalNextBtn" class="btn btn-warning btn-sm text-light" data-dismiss="modal">결제하기</button>
			            </div>
			            <sec:authorize access="isAuthenticated()">
			            <sec:authentication property="principal" var="member"/>
			            <input type="hidden" name="userNo" value="${member.vo.userNo}">
			            <input type="hidden" name="userName" value="${member.vo.userName}">
			            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			            </sec:authorize>
			            </form>
			        </div>
			    </div>
			</div>
		</div>
	</div> <!-- news 끝 -->

	
	<script>
	$(function() { //ready
		
		/* 각 좌석의 등록버튼을 눌렀을 때 modal 띄우는 이벤트 */
		$(".sRegBtn").click(function() {
			var result = confirm($(this).attr('value') + "번 좌석을 등록하시겠습니까?");
			sno = $(this).data("sno"); /* 등록 버튼에 해당하는 좌석 번호 */
			var user = '${member.vo.userNo}';
			console.log("선택한 좌석번호1:: " + sno);
			if(user =='') {
				alert("로그인 후 이용하실 수 있습니다.");
				return false;
			} else { // 로그인 한 상태
				<c:forEach items="${seatList}" var="seat">
					if(${seat.userNo} == user) { // 등록된 좌석목록에 유저 번호가 있으면 alert
						alert("1인 1좌석만 이용가능 합니다.");
						return false;
					}
				</c:forEach>
				if(result) {
					$("#curSno").text(sno);
					$("#myModal").modal("show");
				}
			}
		});
			
		$(".chgSeatBtn").click(function() {
			var result = confirm("좌석 변경 페이지로 가시겠습니까?");
			if(!result) return false;
		})

		$(".addLocker").hide();
		
		$("#period").change(function() {
			var selOpt = $("#period option:selected").val();
			
			/* 일일 이용자는 사물함 이용 불가 (셀렉트 옵션 밸류가 1일 때) */
			selOpt == 1 ? $(".addLocker").hide() : $(".addLocker").show();
			
		})
	
		/* 이용 정보 모달창에서 다음으로 버튼 눌렀을 때 */
	 	$("#modalNextBtn").click(function() {

	 		//var curSno = $(".sRegBtn").data("sno"); 								// 현재 좌석 번호
	 		var str = '<input type="hidden" name="seatNo" value="'+ sno +'">'; 	// 현재 좌석 번호 값 전송할 hidden form
	 		var usingLoc = $(".chkLoc").prop("checked"); 							// "사물함 함께 이용하기" 체크박스 상태.
	 		var selOpt = $("#period option:selected").val(); 						// "좌석 이용 기간" 옵션 선택 값.
	 		
	 		
	 		 if(usingLoc) {
	 			if (selOpt == 2) {
					var str2 = '<input type="hidden" name="fno2" value="5">';
					$(this).closest("form").append(str).append(str2).submit();
				} else if(selOpt == 3) {
					var str3 = '<input type="hidden" name="fno2" value="6">';
					$(this).closest("form").append(str).append(str3).submit();
				} else if(selOpt == 4) {
					var str4 = '<input type="hidden" name="fno2" value="7">';
					$(this).closest("form").append(str).append(str4).submit();
				}

	 		} else {
	 			$(this).closest("form").append(str).submit();
	 		} 
		}); // #modalNextBtn 끝
		
		$("#showEmpLoc").hide();
		
		
	}); // ready 함수 끝

	function showHideLocker(obj) {
		var locker = document.getElementById('showEmpLoc');
		
		if(obj.checked) {
			locker.style.display = "block";
			$(".chkLno").prop("checked", true);
		} else {
			locker.style.display = "none";
		}
	}
	</script>
	
<jsp:include page="../includes/footer.jsp" />