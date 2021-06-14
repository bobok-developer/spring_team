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
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1"><span class="yearCount"></span> 회원이용현황</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html" class="text-muted">Home</a></li>
                                    <li class="breadcrumb-item text-muted active" aria-current="page">Member Chart</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            
			<div>
            <select class="col-1 custom-select custom-select-sm form-control form-control-sm ml-5" id="year" name="year"></select>
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
                        
                            
                         
						
						

						<body> 
						
							<!-- <button type="button" id="btnData"> data 가져오기 </button> -->
						
							<div class="container"> 
			                    <!-- 
			                    연도 선택 밑 데이터 전송
			                    <div class="col-5 align-self-center">
			                        <div class="customize-input float-left">
				                        <h5 class="text-muted "> 연도 선택 </h3>
			                            <form name="year" action="/admin/memberChart" method="get">
			                            <select class="custom-select custom-select-set form-control bg-white border-0 custom-shadow custom-radius">
			                                <option selected>2021</option>
			                                <option value="2021">2022</option>
			                                <option value="2022">2023</option>
			                            </select>
			                            </form>
			                        </div>
			                    </div> -->
							<canvas id="myChart"></canvas>
							</div> 
							
							<script>
							var ctx = document.getElementById('myChart');
						    $(document).ready(function(){
						    	init();
						        $("#year").change(function(){
									console.log(location);
									var pickYear = $("#year option:selected").val();
									showChart(pickYear);
								})
						    });    
						 
						    // select box 연도 , 월 표시
						    function setDateBox(){
						        $.getJSON("memberChartDataYearCount").done(function(result) {
						        	console.log(result);
						        	$("#year").append("<option value=''>전체</option>");
						        	for(var i in result) {
						        		$("#year").append("<option value='"+ result[i].YEAR +"'>"+ result[i].YEAR + " 년" +"</option>");
						        	}
						        })
						        // 월 뿌려주기(1월부터 12월)
						        
						    }
						 
						</script>


							
						<!-- 차트 -->
							<script>
							myChart = new Chart(ctx, {});
							function init() {
								showChart();
								setDateBox();
							}
							
							function showChart(year) {
								
								var yearData = {year:year || null}
								
								$.ajax("memberChartData", {
									data : yearData,
									dataType : 'json',
									success: function(result) {
										console.log(result);
										//var month = ${chart[0].MONTH};
										var labels = [];
										var data = [];
										var backgroundColor = [ 
											'rgba(255, 99, 132, 0.2)', 
											'rgba(54, 162, 235, 0.2)', 
											'rgba(255, 206, 86, 0.2)', 
											'rgba(75, 192, 192, 0.2)', 
											'rgba(153, 102, 255, 0.2)', 
											'rgba(255, 159, 64, 0.2)',
											'rgba(255, 99, 132, 0.2)',
											'rgba(54, 162, 235, 0.2)',
											'rgba(255, 206, 86, 0.2)',
											'rgba(75, 192, 192, 0.2)',
											'rgba(153, 102, 255, 0.2)',
											'rgba(255, 159, 64, 0.2)'
										];
										var borderColor = [ 
											'rgba(255, 99, 132, 1)', 
											'rgba(54, 162, 235, 1)', 
											'rgba(255, 206, 86, 1)', 
											'rgba(75, 192, 192, 1)', 
											'rgba(153, 102, 255, 1)', 
											'rgba(255, 159, 64, 1)',
											'rgba(255, 99, 132, 1)', 
											'rgba(54, 162, 235, 1)', 
											'rgba(255, 206, 86, 1)', 
											'rgba(75, 192, 192, 1)', 
											'rgba(153, 102, 255, 1)', 
											'rgba(255, 159, 64, 1)'
										]
										for(var i in result) {
											labels.push(result[i].MONTH);
											data.push(result[i].CNT);
										}
										var config = { 
											type: 'bar', 
											data: { 
												labels: labels, 
												datasets:[{ 
													label: '# 이용 고객', 
													data: data, 
													backgroundColor: backgroundColor , 
													borderColor: borderColor, 
													borderWidth: 1 
												}] 
											}, 
											options: { 
												scales: { yAxes: [{ ticks: { beginAtZero: true } }] },
											} 
										}
										if (myChart) {
											myChart.config = config;
											myChart.update();
								        } else {
								        	myChart = new Chart(ctx,config);
								        }
										
										
										$(".yearCount").text(year ? year+"년" : '전체');
									}
								})
							}	
							 
							</script> 
							</body>
                            
                            
                            
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