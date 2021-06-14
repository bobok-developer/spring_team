<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
	
	<jsp:include page="../includes/header_.jsp" />

	<!-- Home -->
	<div class="home">
		<div class="home_background_container prlx_parent">
			<div class="home_background prlx" style="background-image:url(${pageContext.request.contextPath}/resources/images/news_background.jpg)"></div>
		</div>
		<div class="home_content">
			<c:if test="${board.category == 1}">
				<h1>공지사항</h1>
				<p>${pinfo}</p>
			</c:if>
			<c:if test="${board.category == 2}">
				<h1>Q&A</h1>
			</c:if>
		</div>
	</div>
	
	<!-- News -->

	<div class="news">
		<div class="container">
			<!-- 게시판  -->
           <div class="row">
	           	<div style="width: 800px; margin:0 auto">
	           		<div class="panel panel-default">
	          			<div class="panel-body col-12 p-0">
	          				<div class="row mb-2">
	          					<div>
		          					<c:if test="${board.category == 1}">
		          						<i class="fas fa-bell text-warning display-4 pl-4"></i>
		          					</c:if>
		          					<c:if test="${board.category == 2}">
		          						<c:if test="${board.parentNo == 0}">
		          						<div class="text-warning display-4 pl-4"> Q </div>
		          					</c:if>
		          					<c:if test="${board.parentNo != 0}">
		          						<div class="text-warning display-4 pl-4"> A </div>
		          					</c:if>
		          					</c:if>
	          					</div>
	       						<div><h2 class="text-break m-3 pt-1"><c:out value="${board.title}"/></h2></div>
	       					</div>
	       					<div class="card shadow mb-4">
			                    <div class="uploadResult">
									<ul class="list-group list-group-horizontal"></ul>
								</div>
								<div class="modal fade" id="imageModal">
							        <div class="modal-dialog modal-xl">
							            <div class="modal-content">
							            	<div class="modal-body text-center">
												<img class="mw-100">
											</div>
								        </div>
									</div>
								</div>
		                  	</div>
	       					<div style="min-height: 200px;">
	       						<h3 class="text-break mb-3"><c:out value="${board.content}"/></h3>
	       					</div>
	       				</div>
       					<div class="row mb-3 mt-2">
	       					<div class="row col-8">
	       						<i class="fas fa-user ml-4 mr-1 mt-1"></i><c:out value="${board.writer}"/>
	       						<div class="ml-2"><fmt:formatDate value="${board.regDate}" /></div> 
	       						<div class="ml-2">조회수 : <c:out value="${board.hitCount}"/></div>
	       					</div>
       					 	<div class="col-4 p-0">
       					 		<sec:authentication property="principal" var="pinfo"/>
       					 		<sec:authorize access="hasRole('ROLE_ADMIN')">
									<c:set var="adm" value="1" />
								</sec:authorize>
								<h6 class="float-right ml-2"><a href="list?">목록</a></h6>
	       					 	<c:if test="${(board.category != 1) && (adm == 1) && (board.parentNo == 0)}">
		       					 	<h6 class="float-right"><a href="register?category=2&parentNo=${board.bno}">답변하기</a></h6>
	       					 	</c:if>
	       					 	<sec:authorize access="isAuthenticated()"> 
       					 		<c:if test="${(pinfo.vo.userId == board.writer) || (adm == 1)}">
		                    		<h6 class="float-right ml-2"><a href="modify${cri.listLink}&bno=${board.bno}">수정<i class="far fa-edit mr-2 ml-1"></i></a></h6>
		                    	</c:if>
		                    	</sec:authorize>
								<h6 class="float-right"><i class="far fa-comments ml-2 mr-2"></i><c:out value="${board.replyCnt}"/></h6>
							</div>
           				</div>
           				<div class="card"> 
						<div class="card-header">
							<div class="font-weight-bold float-left mt-2">
							<h6><i class="fa fa-comments fa-fw mr-1"></i>댓글</h6>
						</div>
						<sec:authorize access="isAuthenticated()">
							<button id="addReplyBtn" class="btn btn-sm float-right">댓글 쓰기</button>
						</sec:authorize>
						</div>
						<div class="card-body">
							<ul class="list-group chat"></ul>
						</div>
						<div class="reply-footer">
							 <button id="addBtn" class="btn btn-sm float-right"><span>더보기</span></button>
						</div>
					</div>
				</div>
				<!-- Result Modal-->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button class="close" type="button" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<p>${reply.replyer}</p>
								<form action="" method="post" class="needs-validation" novalidate>
									<div class="form-group">
										<input type="text" class="form-control" id="replyer"
											name="replyer" required placeholder="Replyer" readonly>
										<div class="valid-feedback">Valid.</div>
										<div class="invalid-feedback">Please fill out this field.</div>
									</div>
									<div class="form-group">
			                    		<textarea type="text" class="form-control" id="reply" name="reply" rows="10" required placeholder="댓글 내용을 입력하세요."></textarea>
										<div class="valid-feedback">Valid.</div>
										<div class="invalid-feedback">Please fill out this field.</div>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button id="modalModBtn" class="btn btn-outline-warning btn-sm ac"
									type="button" data-dismiss="modal">수정완료</button>
								<button id="modalRemoveBtn" class="btn btn-outline-danger btn-sm ac"
									type="button" data-dismiss="modal">삭제</button>
								<button id="modalRegBtn" class="btn btn-outline-primary btn-sm ac"
									type="button" data-dismiss="modal">등록</button>
								<button id="modalCloseBtn" class="btn btn-outline-secondary btn-sm"
									type="button" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
<script>
					var cp = '${pageContext.request.contextPath}';
                	var bno = <c:out value ="${board.bno}" />;
                	var replyUL = $(".chat");
                	var rno;
                	var replyCnt = '${board.replyCnt}';
                	var replyer = '';
            		var auth= '';
                	<sec:authorize access="isAuthenticated()">
					replyer = '<sec:authentication property="principal.username"/>';
					</sec:authorize>
					<sec:authentication property="authorities" var="auth"/>
					auth = '${auth}' 
					var csrf = '${_csrf.headerName}';
	        		var csrfToken = "${_csrf.token}";
                	console.log(auth);
	        		
//                	var pageNum = 1;
                	showList(); 
                	
                	
                	function showList(rno){
                		replyService.getList({bno:bno, rno:rno, cp:cp}, function(list) {
                			//댓글 목록 출력
                			console.log(list);
                			
                			if(list.length < 10){
                				$("#addBtn").hide();
                			}
                			
							var str = "";
                			for(var i in list){
                				str += replyService.getReplyDOM(list[i]);	
                				this.rno = list[i].rno;
	                			replyUL.find("li").each(function() {
	                				if(list[i].rno == $(this).data("rno"))
	                					$(this).remove();
	                			})
                			}
                			replyUL.html(replyUL.html() + str);
                		})
                	}
                	
                	 //addBtn이벤트
            		$("#addBtn").click(function(){
            			// 마지막 rno를 가져오기
            			//var rno = $(".chat li:last").data("rno");
         			
            			showList(rno);
            		}); 
                	
	        		
                	$(function(){
                		$(document).ajaxSend(function(e, xhr){
                    		xhr.setRequestHeader(csrf,csrfToken);
                    	})
                		//등록폼 버튼 이벤트
                		$("#addReplyBtn").click(function(){
                			$("#myModal").find("input").val("").end().find("textarea").val("").prop("readonly", false);
                			$("#replyer").val(replyer).prop("readonly",true);
                			$("#replyDate").closest("div").hide();
                			$(".ac").hide().eq(2).show();
                			$("#myModal").modal("show");
                		})
    	
                		//댓글 목록 모달 팝업 이벤트
                		$(".chat").on("click","li",function(){
                			var rno = $(this).data("rno");
                			console.log(rno);
                			replyService.get({rno:rno, cp:cp}, function(result){
                        		$("#reply").val(result.reply).prop("readonly",true);
                        		if(replyer == result.replyer){
                        			$("#reply").prop("readonly",false);	
                        		}
                        		$("#replyer").val(result.replyer);
                        		$("#replyDate").val(result.replyDate).prop("readonly",true).closest("div").show();
                        		$("#myModal").data("rno",rno)
                        		
                        		if(replyer != $("#replyer").val()){
	                       			$(".ac").hide();
                        		}
                        		if(replyer == result.replyer || auth == "[ROLE_ADMIN]" || auth == "[ROLE_ADMIN, ROLE_MEMBER]"){
	                        		$(".ac").show().eq(2).hide();
                        		}
                        		if(replyer != result.replyer && (auth == "[ROLE_ADMIN]" || auth == "[ROLE_ADMIN, ROLE_MEMBER]")){
                        			$(".ac").eq(0).hide();
                        		}
                        		$("#myModal").modal("show");
                        	});
                		})
                		
                		
                		//등록적용버튼 이벤트
                		$("#modalRegBtn").click(function() {
                			var reply = {bno:bno, reply:$("#reply").val(), replyer:replyer, cp:cp};
                			console.log(reply);
                			replyService.add(reply, function(result) {
                        		/* alert(result ? "success" : "failed"); //success */
                        		$("#myModal").modal("hide");
                        		
                        		replyService.get({rno:result, cp:cp}, function(result){
                        			$(".chat").append(replyService.getReplyDOM(result));
                        		})	
                			}, function() {
                				$("#reply").val("");
                				
                			});
                		});
                		
                		//수정적용버튼 이벤트
                		$("#modalModBtn").click(function() {
                			var reply = {rno: $("#myModal").data("rno"), reply:$("#reply").val(),replyer:replyer, cp:cp};
                			//alert($("#myModal").data("rno"));
                			console.log(reply);
                			replyService.update(reply, function(result) {
                        		/* alert(result); */
                        		$("#myModal").modal("hide");
                        		$(".chat li").each(function(){
                        			if($(this).data("rno") == $("#myModal").data("rno")){
                        				var $li = $(this);
                        				replyService.get({rno:$li.data("rno"), cp:cp},function(result){
                        					$li.find("p").html(result.reply);
                        					
                        				})
                        			}
                        		})
                        		//기존 댓글 내용을 수정된 내용으로 반영하기
                			});
                		});
                		
                		//삭제적용버튼 이벤트
                		$("#modalRemoveBtn").click(function() {
                			replyService.remove({rno : $("#myModal").data("rno"), replyer:replyer, cp:cp}, function(result){
                        		alert("삭제가 완료되었습니다.");
                        		$("#myModal").modal("hide");
                        		
                        		$(".chat li").each(function(){
                        			if($(this).data("rno")== $("#myModal").data("rno")){
                        				$(this).remove();
                        			}
                        		})
                			});
                		});
                		
                		/* //댓글 페이지 버튼 이벤트
                		$(".reply-footer").on("click","a", function(){
                			event.preventDefault();
                			
                			pageNum = $(this).attr("href");
                			showList(pageNum);
                		});*/
                		
                		/*  //스크롤 바닥 감지
                    	window.onscroll = function(e) {
                    	    //추가되는 임시 콘텐츠
                    	    //window height + window scrollY 값이 document height보다 클 경우,
                    	    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight - 800) {
                    	    	// 마지막 rno를 가져오기
                    			var rno = $(".chat li:last").data("rno");
                    			// showList() 호출
                    			showList(rno);
                    	        //article에 추가되는 콘텐츠를 append
                    	    }
                    	};
                	  */
                		
                		
                	
                		
                		
                		
                		
                		
                		
                	// 첨부파일 불러오기
					$.getJSON("${pageContext.request.contextPath}/board/getAttachList",{bno:bno}, function(uploadResultArr){						
						var str = "";
						for(var i in uploadResultArr){
							var obj = uploadResultArr[i];
							console.log(obj);
							str += "<li class='list-group-item' "
							str += " data-filename='" + obj.fileName
							str += "' data-image='" + obj.image
							str += "' data-uuid='" + obj.uuid
							str += "' data-uploadpath='" + obj.uploadPath
							str += "' >"
							if(!obj.image){			
								str += "<a href='${pageContext.request.contextPath}/download?fileName=" + obj.downPath + "'><i class='fas fa-paperclip text-muted'></i>" + obj.fileName + "</a>";
							}
							else{
								str += "<a href='javascript:showImage(\"" + obj.downPath + "\")'>";
								str += "<img src='${pageContext.request.contextPath}/display?fileName=" + obj.thumbPath + "'></a>";
							}
							str += "</li>";
						}
						$(".uploadResult ul").append(str);
						
					});				
				})
				function showImage(path){
					$("#imageModal img").attr("src", "${pageContext.request.contextPath}/display?fileName=" + path);
					$("#imageModal").modal("show");
				}		
				
               
                </script>
<jsp:include page="../includes/footer.jsp" />