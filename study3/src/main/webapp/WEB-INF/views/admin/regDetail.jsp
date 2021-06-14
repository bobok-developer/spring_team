<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<jsp:include page="../includes/adminHeader.jsp" />
	<!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">등록정보 수정</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/admin" class="text-muted">관리자 홈</a></li>
                                    <li class="breadcrumb-item text-muted active" aria-current="page">등록 정보 관리</li>
                                    <li class="breadcrumb-item text-muted active" aria-current="page"><a href="${pageContext.request.contextPath}/admin/regProperties" class="text-muted">등록 정보</a></li>
                                    <li class="breadcrumb-item text-muted active" aria-current="page">등록 정보 수정</li>
                                </ol>
                             </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">등록정보 수정</h4>
                                <h6 class="card-title mt-5">
                                <i class="mr-1 font-18 mdi mdi-numeric-1-box-multiple-outline"></i> 
                                </h6>
                                <div class="table-responsive">
                                <form method="post"  class="needs-validated" novalidate="novalidate">
                                    <table class="table">
                                        <thead>
                                       		<tr>
                                                <th scope="col">등록 번호</th>
                                                <th scope="col">회원 번호</th>
                                                <th scope="col">회원 이름</th>
                                                <th scope="col">시작일</th>
                                                <th scope="col">종료일</th>
                                                <th scope="col">좌석번호</th>
                                                <th scope="col">사물함번호</th>
                                                <th scope="col">요금제 번호</th>
                                                <th scope="col">요금제 이름</th>
                                            </tr>
                                            <tr>
                                                <th><c:out value="${regPP.regNo}"/></th>
                                     			<th><c:out value="${regPP.userNo}"/></th>
                                     			<th><c:out value="${regPP.userName}"/></th>
                                     			<th><fmt:formatDate value="${regPP.startDate}" /></th>
                                     			<th><fmt:formatDate value="${regPP.endDate}" /></th>
                                     			<th><c:out value="${regPP.seatNo}"/></th>
                                     			<th><c:out value="${regPP.lockerNo}"/></th>
                                     			<th><c:out value="${regPP.fno}"/></th>
                                     			<th><c:out value="${regPP.feeName}"/></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
	                                        	<td></td>
                                        		<td></td>
                                        		<td></td>
                                        		<td></td>
	                                   			<td></td>
	                                   			<td>
													<select id="searchMenu" name= "seatNo" class="custom-select custom-select-sm form-control form-control-sm">
														<option value="${regPP.seatNo}">좌석 번호</option>
														<c:forEach items="${emptySeatList}" var="seat">
															<option value="${seat.sno}">${seat.sno}</option>
														</c:forEach>
													</select>
												</td>
	                                   			<td>
													<select id="searchMenu" name= "lockerNo" class="custom-select custom-select-sm form-control form-control-sm">
														<option value="${regPP.lockerNo}">사물함 번호</option>
														<c:forEach items="${emptyLockerList}" var="locker">
															<option value="${locker.lno}">${locker.lno}</option>
														</c:forEach>
													</select>
												</td>
                                        	</tr>
                                        </tbody>
                                    </table>
                           			<button data-oper="updateRegPP" class="btn btn-sm btn-outline-warning float-right mx-1" formaction="updateRegPP">수정 완료</button>
                           			<input type="hidden" name="regNo" value="${regPP.regNo}">
                           			<input type="hidden" name="userNo" value="${regPP.userNo}">
                           			<input type="hidden" name="userNo" value="${seat.userNo}">
                           			<input type="hidden" name="userNo" value="${locker.userNo}">
                           			<input type="hidden" name="seatNo" value="${seat.sno}">
                           			<input type="hidden" name="lockerNo" value="${locker.lno}">
                           			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
<jsp:include page="../includes/adminFooter.jsp" />            
