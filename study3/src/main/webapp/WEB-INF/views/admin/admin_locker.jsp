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
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">사물함 등록취소</h4>
                        <div class="d-flex align-items-center">
                            <nav class="breadcrumb pl-0 mb-0">
	                            <a class="breadcrumb-item" href="${pageContext.request.contextPath}/admin/admin">관리자 홈</a>
	                            <span class="breadcrumb-item">좌석/사물함 관리</span>
	                            <span class="breadcrumb-item active">사물함 등록취소</span>
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
						<!-- 사물함배치도 -->
						<form method="post" action="revoke2">
                        <div class="card">
                        	<div class="d-flex justify-content-center my-2"><h2>사물함</h2></div>
                        	<div id="room1" class="border px-5 py-5">
								<div class="card-deck">
									<c:forEach items="${lPlanInfo}" var="info" begin="0" end="7">
                        			<fmt:formatDate var="formatEndDate" value="${info.ENDDATE}" pattern="yyyy.MM.dd"/>
                        				<c:if test="${info.STATUS == 1}"> <!-- 이용중 -->
											<div class="card bg-warning">
												<div class="card-body text-center text-dark">
												    <p class="card-text">사물함 0${info.LNO}</p>
												    <p class="card-text">이용자: ${info.USERNAME}</p>
												    <p class="card-text">만료일: ${formatEndDate}</p>
												    <button type="button" class="revokeBtn btn waves-effect waves-light btn-rounded btn-outline-danger btn-sm" data-uno="${info.USERNO}">등록 취소</button>
										  		</div>
										  	</div>
										 </c:if>
                        				<c:if test="${info.STATUS == 0}"> <!-- 빈좌석 -->
											<div class="card bg-muted border">
												<div class="card-body text-center">
												    <p class="card-text">사물함 0${info.LNO}</p>
										  		</div>
										  	</div>
										 </c:if>
									</c:forEach> 
								</div>
								<div class="card-deck">
									<c:forEach items="${lPlanInfo}" var="info" begin="8" end="15">
                        			<fmt:formatDate var="formatEndDate" value="${info.ENDDATE}" pattern="yyyy.MM.dd"/>
                        				<c:if test="${info.STATUS == 1}"> <!-- 이용중 -->
											<div class="card bg-warning">
												<div class="card-body text-center text-dark">
												    <p class="card-text">사물함 0${info.LNO}</p>
												    <p class="card-text">이용자: ${info.USERNAME}</p>
												    <p class="card-text">만료일: ${formatEndDate}</p>
												    <button type="button" class="revokeBtn btn waves-effect waves-light btn-rounded btn-outline-danger btn-sm" data-uno="${info.USERNO}">등록 취소</button>
										  		</div>
										  	</div>
										 </c:if>
                        				<c:if test="${info.STATUS == 0}"> <!-- 빈좌석 -->
											<div class="card bg-muted border my-2">
												<div class="card-body text-center">
												    <p class="card-text">사물함 0${info.LNO}</p>
										  		</div>
										  	</div>
										 </c:if>
									</c:forEach> 
								</div>
							</div> <!-- room1 끝 고정석-->		
                        </div> <!-- 사물함 배치도 끝 -->
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    </form> 
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
    <script type="text/javascript">
		var searchForm = $(".searchForm");
		var actionForm = $(".actionForm");
		$(".searchForm button").on("click",function(e){
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			searchForm.find("input[name='keyword']").val();
			e.preventDefault();
			searchForm.submit();
		});
		$(".amountNumber").change(function(){
			console.log(location);
			location.href = "admin_seat${pageMaker.cri.listLink}&amount=" + $(this).val();
		
		}).val('${pageMaker.cri.amount}');
		
    </script>
    <!-- 사물함 등록 취소 기능 -->
	<script>
	$(function() {		
		/* 등록 취소 버튼 클릭 시 폼 전송 */
  		$(".revokeBtn").click(function() {
  			var result = confirm("등록된 사물함을 취소 하시겠습니까?");
  			uno = $(this).data("uno");
  			str = '<input type="hidden" name="userNo" value="'+ uno +'">';
  			console.log("회원번호:: "+uno);
   			if(result) {
  				$(this).closest("form").append(str).submit();
  				alert("완료되었습니다.");
  			}
		});
	}); // ready 끝



    </script>
<jsp:include page="../includes/adminFooter.jsp" />