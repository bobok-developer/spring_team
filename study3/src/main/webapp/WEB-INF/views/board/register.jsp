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
			<h1>게시판</h1>
		</div>
	</div>
	
	<!-- News -->

	<div class="news">
		<div class="container">
		
			<!-- 게시판  -->
           <div class="row">
           	<div style="width: 800px; margin:0 auto">
           		<div class="panel panel-default">
           			<h1 class="text-warning display-4"> 글쓰기 </h1>
           			<div class="panel-body">
           				<form role="form" action="/board/register" method="post">
           					<div class="form-group">
           						<input class="form-control" name='writer' required readonly value='<sec:authentication property="principal.username"/>'>
           					</div>
           					<div class="form-group">
           						<input class="form-control" id="title" name='title' placeholder="제목을 입력해주세요." value="${empty board ? '' : ''.concat(board.title).concat('의 답변입니다.')}">
           					</div>
           					<div class="form-group">
           						<textarea class="form-control" id="content" rows="10" name='content' placeholder="내용을 입력해주세요."></textarea>
           					</div>
           					<input type="hidden" name="parentNo" value="${board.bno}">
           					<input type="hidden" name="category" value="${category}">  
           					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
           					<button type="submit" class="btn btn-sm btn-outline-warning float-right mt-1" id="register">등록</button>
           					<button type="reset" class="btn btn-sm btn-outline-danger float-right mr-1 mt-1">초기화</button>
           				</form>
           			</div>
           				<c:if test="${category == 1}">
                        <div class="row">
	                   		<div class="uploadDiv">
								<label for="files" ><img src="${pageContext.request.contextPath}/resources/images/file.png" style="height: 30px;" ></label>	
								<input id="files" type="file" name="files" multiple style="display: none;">
							</div>
							<div class="uploadResult">
								<ul class="list-group list-group-horizontal ml-1"></ul>
							</div>
						</div>

                        <!-- Result Modal-->
					    <div class="modal fade" id="imageModal">
					        <div class="modal-dialog modal-xl">
					            <div class="modal-content">
					            	<div class="modal-body text-center">
										<img class="mw-100">
									</div>
						        </div>
							</div>
						</div>
           				</c:if>
           		</div>
           	</div>
           </div>
			<!-- end -->
		</div>
	</div>
	<script>	
		var regex = /(.*?)\.(exe|sh|jsp|php|jar)/gi;
		var maxSize = 1024 * 1024 * 5;
		var cloneObj = $(".uploadDiv").clone();
		var uploadResult = $(".uploadResult ul");
		var csrf = '${_csrf.headerName}';
		var csrfToken = "${_csrf.token}";
		$(document).ajaxSend(function(e, xhr) {
			xhr.setRequestHeader(csrf, csrfToken);
		})
		
		console.log(cloneObj);
		$(".uploadDiv").on("change","#files", function(){
			var formData = new FormData();
			var files = $("#files")[0].files;
			var csrf = '${_csrf.headerName}';
			var csrfToken = "${_csrf.token}";
			$(document).ajaxSend(function(e, xhr) {
				xhr.setRequestHeader(csrf, csrfToken);
			})
			console.log(files);
			
			for(var i in files){
				if(!checkExtension(files[i].name, files[i].size)){
					$(".uploadDiv").html(cloneObj.html());
					return false;
				}
				formData.append("files", files[i]);
			}
			console.log(formData);
			$.ajax({
				url : '${pageContext.request.contextPath}/uploadAction',
				type : 'post',
				data : formData,
				dataType : 'json',
				processData : false,
				contentType : false,
				success : function(result){
					console.log(result);
					showUploadedFile(result);
					$(".uploadDiv").html(cloneObj.html());
				}
			});
		})
		function checkExtension(name, size) {
			if(size >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(name)){
				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
				return false;
			}
			return true;
		}
		function showUploadedFile(uploadResultArr){
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
					str += "<a href='${pageContext.request.contextPath}/download?fileName=" + obj.downPath + "'><i class='fas fa-paperclip text-muted mr-1'></i>" + obj.fileName + "</a>";
				}
				else{
					str += "<a href='javascript:showImage(\"" + obj.downPath + "\")'>";
					str += "<img src='${pageContext.request.contextPath}/display?fileName=" + obj.thumbPath + "'></a>";
				}
				str += "<i class='fas fa-times text-danger removeFileBtn ml-2'></i>";
				str += "</li>";
			}
			uploadResult.append(str);
		}
		function showImage(path){
			$("#imageModal img").attr("src", "${pageContext.request.contextPath}/display?fileName=" + path);
			$("#imageModal").modal("show");
		}		
		
		$(".uploadResult").on("click", ".removeFileBtn", function() {
			var $li = $(this).closest("li");
			var data = {
				fileName : $li.data("filename"), 
				image : $li.data("image"),
				uuid : $li.data("uuid"),
				uploadPath : $li.data("uploadpath")
			}
			console.log(data);
			console.log(JSON.stringify(data));
			
			$.ajax({
				url : "${pageContext.request.contextPath}/deleteFile",
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				success : function(result){
					/* alert(result); */
					$li.remove();
				}
			}); 
		});
		$("button[type='submit']").click(function(){
			event.preventDefault();
			var str = "";
			var attrs = ["fileName", "uuid", "uploadPath", "image"];
			$(".uploadResult li").each(function(i, it){
				for(var j in attrs){
					str += '<input type="hidden" name="attachList[' + i + '].';
					str += attrs[j] + '" value="' + $(it).data(attrs[j].toLowerCase()) + '">';
				} 
			});
			console.log(str);
			// $(this).closest("form").append(str); 
			// console.log($(this).closest("form").serialize());
			if($("#title").val() == ""){
				alert("제목을 입력해주세요");
				return;
			}
			else if($("#content").val() == ""){
				alert("내용을 입력해주세요");
				return;
			}
			$(this).closest("form").append(str).submit();
		})
	</script>
	
<jsp:include page="../includes/footer.jsp" />