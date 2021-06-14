<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
	
	<jsp:include page="../includes/header_.jsp" />

	<!-- Home -->
	<div class="home">
		<div class="home_background_container prlx_parent">
			<div class="home_background prlx" style="background-image:url(${pageContext.request.contextPath}/resources/images/news_background.jpg)"></div>
		</div>
		<div class="home_content">
			<c:if test="${pageMaker.cri.category != 2}">
				<h1>공지사항</h1>
			</c:if>
			<c:if test="${pageMaker.cri.category == 2}">
				<h1>Q&A</h1>
			</c:if>
		</div>
	</div>
	
	<!-- News -->

	<div class="news">
		<div class="container">
		
			<!-- 게시판  -->
			<div class="container-fluid">
				<div class="row">
					<div style="width: 800px; margin:0 auto">
						<div class="">
							<div id="dataTable_filter" class="dataTables_filter dataTables_length mb-4" >
								<form id="searchForm" class="form-inline">
									<div class="col-9">
										<div class="row mt-2">
											<select id="searchMenu" name="type" class="custom-select custom-select-sm mr-1" >		
												<option value="TWC"></option>
												<option value="W">작성자</option>
												<option value="T">제목</option>
												<option value="C">내용</option>											
											</select>		
											<div class="input-group mb-1">
											    <input type="search" name="keyword" class="form-control col-10 form-control-sm mr-1" placeholder="" aria-controls="dataTable">
											    <div class="input-group-append">
											      	<button class="btn btn-sm btn-outline-warning"><i class="fas fa-search"></i></button> 
											    </div>
											</div>	
										</div>		
										<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
										<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
									</div>
									<div class="col-3 text-right">
										<sec:authorize access="!hasRole('ROLE_ADMIN')">
											<c:set var="adm" value="0" />
										</sec:authorize>
										<sec:authorize access="hasRole('ROLE_ADMIN')">
											<c:set var="adm" value="1" />
										</sec:authorize>
										<c:if test="${ (adm == 1 && pageMaker.cri.category == 1 ) || (pageMaker.cri.category != 1)}">
											<a href="${pageContext.request.contextPath}/board/register?category=${pageMaker.cri.category}"id='regBtn' class="write btn btn-sm btn-outline-warning">글쓰기</a>
										</c:if>
									</div>
								</form>
							</div>
							<hr>
							<c:if test="${pageMaker.cri.category != 2}">
								<c:forEach items="${list}" var="board">							
								<div class="mt-3">
								<h4><a class="text-dark" href='${pageContext.request.contextPath}/board/get${pageMaker.cri.listLink}&bno=${board.bno}'>
									<c:out value="${board.title}"/> <span class="badge badge-pill badge-warning ml-2 text-white"><i class="fa fa-comments fa-fw mr-1"></i><c:out value="${board.replyCnt}"/></span></a></h4>
									<div class="mr-4 text-secondary text-truncate"><c:out value="${board.content}"/></div>
									<div class="row pl-3">
										<div class="mr-3"><c:out value="${board.writer}"/></div>
										<div class="mr-3"><fmt:formatDate value="${board.regDate}" /></div> 
										<div>조회수 ${board.hitCount}</div>
									</div>
								</div>
								<hr>
								</c:forEach>
							</c:if>
							<c:if test="${pageMaker.cri.category == 2}">
								<c:forEach items="${list}" var="board">
								<div class="mt-3 ${board.parentNo == 0 ? '' : 'pl-5'}" >
									<div class="row">
										<c:if test="${board.parentNo != 0}">	
											<i class="fas fa-share fa-flip-vertical fa-md mb-3 mr-2"></i>
										</c:if>
										<c:if test="${board.parentNo == 0}"><div class="ml-3 pl-1"></div></c:if>
										<h4><a class="text-dark" href='${pageContext.request.contextPath}/board/get${pageMaker.cri.listLink}&bno=${board.bno}'>
										<c:out value="${board.title}"/> <span class="badge badge-pill badge-warning ml-2 text-white"><i class="fa fa-comments fa-fw mr-1"></i><c:out value="${board.replyCnt}"/></span></a></h4>
									</div>
									<div class="ml-1 mr-3 mb-2 text-secondary text-truncate" ><c:out value="${board.content}"/></div>
									<div class="row pl-3">
										<div class="ml-1 mr-3"><c:out value="${board.writer}"/></div>
										<div class="mr-3"><fmt:formatDate value="${board.regDate}" /></div> 
										<div>조회수 ${board.hitCount}</div>
									</div>
								</div>
								<hr>
								</c:forEach>
							</c:if>
						</div>
						
						<!-- modal -->
					    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		        			<div class="modal-dialog" role="document">
		            			<div class="modal-content">
		                			<div class="modal-header">
		             			       <h5 class="modal-title" id="myModalLabel">작성 확인</h5>
					                </div>
					                <div class="modal-body">처리가 완료되었습니다.</div>
					                <div class="modal-footer">
					                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
					                        <span aria-hidden="true">×</span>
					                    </button>
					       			</div>
		        			    </div>
		        			</div>
						</div>
						
						<!-- 하단 페이징 -->
						<nav class="d-flex justify-content-center mt-5" >
							<ul class="pagination" style="display: inline-flex;">
								<c:if test="${pageMaker.cri.category == 1}">
									<c:if test="${pageMaker1.prev}">
										<li class="paginate_button previous">
											<a class="page-link" href="list${pageMaker1.cri.listLink2}&pageNum=${pageMaker1.startPage -1}">Previous</a>
										</li>
									</c:if>
									<c:forEach begin="${pageMaker1.startPage}" end="${pageMaker1.endPage}" var="num">
										<li class="page-item ${num == pageMaker1.cri.pageNum ? 'active' : ''}">
											<a class="page-link" href="list${pageMaker1.cri.listLink2}&pageNum=${num}">${num}</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker1.next}">
										<li class="paginate_button next">
											<a class="page-link" href="list${pageMaker1.cri.listLink2}&pageNum=${pageMaker1.endPage + 1}">Next</a>
										</li>
									</c:if>
								</c:if>
								<c:if test="${pageMaker.cri.category == 2}">
									<c:if test="${pageMaker2.prev}">
										<li class="paginate_button previous">
											<a class="page-link" href="list${pageMaker2.cri.listLink2}&pageNum=${pageMaker2.startPage -1}">Previous</a>
										</li>
									</c:if>
									<c:forEach begin="${pageMaker2.startPage}" end="${pageMaker2.endPage}" var="num">
										<li class="page-item ${num == pageMaker2.cri.pageNum ? 'active' : ''}">
											<a class="page-link" href="list${pageMaker2.cri.listLink2}&pageNum=${num}">${num}</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker2.next}">
										<li class="paginate_button next">
											<a class="page-link" href="list${pageMaker2.cri.listLink2}&pageNum=${pageMaker2.endPage + 1}">Next</a>
										</li>
									</c:if>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
			</div>
			<!-- end -->
		</div>
	</div>
	
<jsp:include page="../includes/footer.jsp" />

		<!-- 스크립트 -->
		  <script>
           	$(function(){         		
           		var result = '${result}';
           		checkModal(result);
				/* 뒤로가기 처리 */
           		history.replaceState({},null,null); 
           		function checkModal(result){
            		if(result === '' || history.state){
            			return;
            		}
            		if(parseInt(result)>0){
   						$(".modal-body").html("게시글 " + result + "번이 등록 되었습니다");      			
            		}
		           		$("#myModal").modal("show");
           		}
           		
           	});
           	
           </script>