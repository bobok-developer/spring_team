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
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">결제정보</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb pl-0 mb-0" >
	                            <a href="${pageContext.request.contextPath}/admin/admin" class="breadcrumb-item">관리자 홈</a>
	                            <span class="breadcrumb-item active">결제관리</span>
	                            <span class="breadcrumb-item active">결제정보</span>
                            </nav>
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                        <div class="customize-input container-fluid">
                        	<div class="text-right">
                        	<h6>기간별 조회</h6>
		                    <input class="col-5" type="text" name="daterange" id="daterange" value="01/01/2018 - 01/15/2018" />
		                    </div>
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
                                <h4 class="card-title">결제 내역</h4>
                                <select id="amountNumber" name="dataTable_length" class="col-md-1 custom-select custom-select-sm form-control form-control-sm">
           							<option value="10">10개씩</option>
           							<option value="25">25개씩</option>
           							<option value="50">50개씩</option>
           							<option value="100">100개씩</option>
           						</select>
                                 <!-- Search -->
                                <ul class="navbar-nav float-right mb-3">
			                        <!-- ============================================================== -->
			                        <li class="nav-item d-none d-md-block">
		                                <form id="searchForm" class="form-inline" action="${pageContext.request.contextPath}/admin/paymentList" method="get" >
		                                    <label>검색유형:  
                        						<select id="searchMenu" name= "type" class="custom-select custom-select-sm form-control form-control-sm mx-2">
                        							<option value="">-----</option>
                        							<option value="U">사용자이름</option>
                        							<option value="I">상품명</option>
                        							<option value="UI">사용자 및 상품명</option>
                        						</select>
                        						</label>
                        					<label>입력:
	                        					<input type="search" class="form-control form-control-sm mx-2" name="keyword" placeholder="검색어를 입력해주세요" id="search">
	                                   			<button class="btn btn-sm btn-primary" id="search_button">검색</button>
                        					</label>
		                                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                              				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                              				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		                                </form>
			                        </li>
		                        </ul>
                                <i class="mr-1 font-18 mdi mdi-numeric-1-box-multiple-outline"></i>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="text-center">결제 번호</th>
                                                <th scope="col" class="text-center">회원 번호</th>
                                                <th scope="col" class="text-center">등록 번호</th>
                                                <th scope="col" class="text-center">결제 날짜</th>
                                                <th scope="col" class="text-center">납입액</th>
                                                <th scope="col" class="text-center">회원 이름</th>
                                                <th scope="col" class="text-center">요금제 이름</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${list}" var="payment">
                                     		<tr>
                                     			<td class="text-center"><c:out value="${payment.payNo}"/></td>
                                     			<td class="text-center"><c:out value="${payment.userNo}"/></td>
                                     			<td class="text-center"><c:out value="${payment.regNo}"/></td>
                                     			<td class="text-center"><fmt:formatDate value="${payment.payDate}"/></td>
                                     			<td class="text-center"><c:out value="${payment.payment}"/></td>
                                     			<td class="text-center"><c:out value="${payment.userName}"/></td>
                                     			<td class="text-center"><c:out value="${payment.itemName}"/></td>
                                     		</tr>
                                     	</c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="pull-right">
	                               		<form id="actionForm" class="d-flex justify-content-center" action="paymentList${pageMaker.cri.listLink3}&pageNum=${num}" method='get'>
	                               			<ul class="pagination">
	                               				<c:if test="${pageMaker.prev}">
	                               					<li class="paginate_button previous"><a  class="page-link" href="${pageMaker.startPage - 1}">Prev</a></li>
	                               				</c:if>
	                               				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                               					<li class="page-item ${num == pageMaker.cri.pageNum ? 'active' : ''}"><a  class="page-link" href="paymentList${pageMaker.cri.listLink4}&pageNum=${num}">${num}</a></li>                              				
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
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
   	<!-- 페이징 처리 스크립트 -->
    <script type="text/javascript">
    $("#search_button").click(function(){
    	event.preventDefault();
    	if($(searchMenu).val() == ''){    		
	    	alert("검색유형을 선택해주세요");
    	}else if($(search).val() == ''){
    		alert("검색어를 입력해주세요");
    	}else{
 			$("#searchForm").submit();   	
    	}
    });
    
	function get_query(){
	    var url = document.location.href;
	    var qs = url.substring(url.indexOf('?') + 1).split('&');
	    for(var i = 0, result = {}; i < qs.length; i++){
	        qs[i] = qs[i].split('=');
	        result[qs[i][0]] = decodeURIComponent(qs[i][1]);
	    }
	    return result;
	}

	var result = get_query();
	
	function to_date_format(date_str, gubun){
	    var yyyyMMdd = String(date_str);
	    var sYear = yyyyMMdd.substring(0,2);
	    var sMonth = yyyyMMdd.substring(2,4);
	    var sDate = yyyyMMdd.substring(4,6);

	    return sYear + gubun + sMonth + gubun + sDate;
	}
		
    
    var from = $("div.drp-calendar.right > div.daterangepicker_input > input").val();
	var to = $("div.drp-calendar.left > div.daterangepicker_input > input").val();
	var std;
	var edd;
	if(result["startDate"] == null) {
		std = new Date();
	}else{
		std = to_date_format(result["startDate"],'-');
	}
	if(result["endDate"] == null) {
		edd = new Date();
	}else{
		edd = to_date_format(result["endDate"],'-');
	}
	
	                               				
	

		moment.locale('ko'); //언어를 한국어로 설정함!
		/* $('#daterange').daterangepicker(
		{
  		 timePicker: false,
 		 timePicker24Hour: true,
  		 timePickerSeconds: true,
  		 singleDatePicker: false,
  		 locale :{ 
    		format: 'YYYY-MM-DD',
   			separator: ' ~ ',
    		applyLabel: "적용",
   			cancelLabel: "닫기"
    	 },
	}); */
		
		function FunGetFormatDate(date) {
			var year = date.getFullYear(); //yyyy
			var month = (1 + date.getMonth()); //M
			month = month >= 10 ? month : '0' + month; // month 두자리로 저장
			var day = date.getDate(); //d
			day = day >= 10 ? day : '0' + day; //day 두자리로 저장
			return month + '/' + day + '/' + year;
		}
		

		
		$("#daterange").daterangepicker({
			'applyClass': 'btn-sm btn-success',
			'cancelClass': 'btn-sm btn-default',
			startDate: std,
			minDate: '2021-05-05',
			maxDate: '2022-12-31',  			
			locale: {
				format: 'YYYY-MM-DD',
				separator: ' ~ ',
				applyLabel: "적용",
   			cancelLabel: "닫기"
			},
			endDate: edd
		});
		
		
		$('#daterange').on('apply.daterangepicker', function(ev, picker) {
		  console.log(picker.startDate.format('YYYY-MM-DD'));
		  console.log(picker.endDate.format('YYYY-MM-DD'));
		  var startDate = picker.startDate.format('YYMMDD');
		  var endDate = picker.endDate.format('YYMMDD');
		  var url = '${pageContext.request.contextPath}/admin/paymentList?startDate=' + startDate + '&endDate=' + endDate;
		  $.ajax({
			 url:'${pageContext.request.contextPath}/admin/paymentList?startDate=' + startDate + '&endDate=' + endDate, 
			 type:'get',
			 data: {startDate, endDate},
			 success: function(data){
				 location.href = url;
			 }
		  });
		});

		$("#amountNumber").change(function(){
			console.log(location);
			location.href = "paymentList${pageMaker.cri.listLink}&amount=" + $(this).val();
		
		}).val('${pageMaker.cri.amount}');

  		
	</script>
<jsp:include page="../includes/adminFooter.jsp" />