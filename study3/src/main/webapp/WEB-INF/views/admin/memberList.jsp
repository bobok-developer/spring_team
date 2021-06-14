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
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">회원목록</h4>
                        <div class="d-flex align-items-center">
                            <nav class="breadcrumb pl-0 mb-0">
	                          	<a href="${pageContext.request.contextPath}/admin/admin" class="breadcrumb-item">관리자 홈</a>
	                           	<span class="breadcrumb-item active">회원목록</span>
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
                                <h4 class="card-title">회원 목록</h4>
           						<select id="amountNumber" name="dataTable_length" class="col-md-1 custom-select custom-select-sm form-control form-control-sm">
           							<option value="10">10개씩</option>
           							<option value="25">25개씩</option>
           							<option value="50">50개씩</option>
           							<option value="100">100개씩</option>
           						</select>
                                 <!-- Search -->
		                        <!-- ============================================================== -->
                               	<form class="form-inline float-right mb-2" id="searchForm" action="${pageContext.request.contextPath}/admin/memberList" method="get">
                                   <label for="search" class="mr-sm-2">회원 이름: </label>
                                   <input type="search" class="form-control mb-2 mr-sm-2" name="keyword" placeholder="회원 이름으로 검색하기" id="search">
                                   <button class="btn btn-sm btn-primary mb-2" i>검색</button>
                                   
                                   <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                   				   <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                   				   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                </form>
                               	<i class="mr-1 font-18 mdi mdi-numeric-1-box-multiple-outline"></i>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">회원 번호</th>
                                                <th scope="col">회원 아이디</th>
                                                <th scope="col">회원 이름</th>
                                                <th scope="col">이메일</th>
                                                <th scope="col">전화번호</th>
                                                <th scope="col">주소</th>												
                                            </tr>
                                        </thead>
                                        <tbody>
                                     	<c:forEach items="${list}" var="member">
                                     		<tr>
                                     			<td><c:out value="${member.userNo}"/></td>
                                     			<td><c:out value="${member.userId}"/></td>
                                     			<td><a href="memberDetail${pageMaker.cri.listLink}&userNo=${member.userNo}"><c:out value="${member.userName}"/></a></td>
                                     			<td><c:out value="${member.email}"/></td>
                                     			<td><c:out value="${member.tel}"/></td>
                                     			<td><c:out value="${member.address.addr}"/></td>
                                     		</tr>
                                     	</c:forEach>
                                        </tbody>
                                    </table>
                               		<div class="pull-right">
	                               		<form id="actionForm" class="d-flex justify-content-center" action="memberList${pageMaker.cri.listLink3}&pageNum=${num}" method='get'>
	                               			<ul class="pagination">
	                               				<c:if test="${pageMaker.prev}">
	                               					<li class="paginate_button previous"><a  class="page-link" href="${pageMaker.startPage - 1}">Prev</a></li>
	                               				</c:if>
	                               				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                               					<li class="page-item ${num == pageMaker.cri.pageNum ? 'active' : ''}"><a  class="page-link" href="memberList${pageMaker.cri.listLink4}&pageNum=${num}">${num}</a></li>                              				
	                               				</c:forEach>
	                               				<c:if test="${pageMaker.next}">
	                               					<li class="paginate_button next"><a  class="page-link" href="${pageMaker.endPage + 1}">Next</a></li>
	                               				</c:if>
	                               			</ul>
	                               			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	                              			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	                              			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	                               		</form>
                               		</div>
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
                <!-- 페이징 처리 스크립트 -->
    <script>
    $(function(){
    	var searchForm = $("#searchForm");
		var actionForm = $("#actionForm");
		$("#searchForm button").on("click",function(e){
			if(!searchForm.find("input[name='keyword']").val()){
				alert("회원이름을 입력하세요");
				return false;
			}
			searchForm.find("input[name='keyword']").val();
			e.preventDefault();
			searchForm.submit();
		});
		$("#amountNumber").change(function(){
			console.log(location);
			location.href = "memberList${pageMaker.cri.listLink}&amount=" + $(this).val();
		
		}).val('${pageMaker.cri.amount}');
    });
		
    </script>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
<jsp:include page="../includes/adminFooter.jsp" />