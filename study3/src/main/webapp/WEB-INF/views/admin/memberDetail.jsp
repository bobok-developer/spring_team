<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">회원정보 상세</h4>
                        <div class="d-flex align-items-center">
                            <nav class="breadcrumb pl-0 mb-0">
	                            <a href="${pageContext.request.contextPath}/admin/admin" class="breadcrumb-item">관리자 홈</a>
	                            <span class="breadcrumb-item active">회원정보 수정</span>
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
            <div class="container">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row d-flex justify-content-center">
                        <div class="card col-12">
                            <div class="card-body flex-container">
                                <h4 class="card-title">회원정보</h4>
                                <h6 class="card-title mt-5"><i
                                        class="mr-1 font-18 mdi mdi-numeric-1-box-multiple-outline"></i> 
                                </h6>
                                <div class="table-responsive">
                                    <table class="table memberTBL">
                                        <thead>
                                        	<tr>
                                                <th class="text-left">회원 번호</th>
                                     			<th class="text-left">회원 아이디</th>
                                     			<th class="text-left">회원 이름</th>
                                     			<th class="text-left">회원 이메일</th>
                                     			<th class="text-left">휴대전화</th>
                                     			<th class="text-left">주소</th>
                                        	</tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="text-left"><c:out value="${member.userNo}"/></td>
                                     			<td class="text-left"><c:out value="${member.userId}"/></td>
                                     			<td class="text-left"><c:out value="${member.userName}"/></td>
                                     			<td class="text-left"><c:out value="${member.email}"/></td>
                                     			<td class="text-left"><c:out value="${member.tel}"/></td>
                                     			<td class="text-left"><c:out value="${member.address.addr}"/></td>
                                            </tr>
                                        	<tr class="modify_names">
	                                        	<%-- <td class="text-left">이메일 수정</td>
	                                   			<td class="text-left"><input type="email" class="form-control" id="email" placeholder="작성자 입력하세요" name="email" required value="${member.email}">
	                                   			<span id="email-no" class="my-2" style="display: none; color: #d92742; font-weight: bold;">잘못된 이메일 주소입니다.</span></td>
	                                   			<td class="text-left">전화번호 수정</td>
	                                   			<td class="text-left"><input type="text" class="form-control" id="tel" placeholder="작성자 입력하세요" name="tel" required value="${member.tel}">
	                                   			<span id="tel-no" class="my-2" style="display: none; color: #d92742; font-weight: bold;">정확한 전화번호를 입력해주세요.</span></td>
	                                        	<td class="text-left">
									                이름 수정
												</td>											
												<td class="text-left"><input type="text" class="form-control" id="userName" placeholder="작성자 입력하세요" name="userName" required value="${member.userName}">
												<span id="name-no" class="my-2" style="display: none; color: #d92742; font-weight: bold;">정확한 이름을 입력해주세요.</span></td> --%>
												<%-- <td class="mt-1">
													주소 수정
												</td>
												<td>
													<input type="button" onclick="postfind()" class="btn btn-secondary btn-sm my-2" value="우편번호 찾기" ><br>
													<input type="text" class="addr form-control my-2" id="post" placeholder="우편번호" readonly value="${address.post}">
													<input type="text" class="addr form-control my-2"  id="addr" placeholder="주소" readonly  value="${address.addr}">
													<input type="text" class="addr form-control my-2" id="detail" placeholder="상세주소" value="${address.detail}">
													<input type="text" class="addr form-control my-2" id="extra" placeholder="참고항목" readonly value="${address.extra}">
												</td> --%>
                                        	</tr>
                                        	<tr>
                                        	</tr>
                                        </tbody>
                                    </table>
                                    <button class="btn btn-outline-warning float-right mx-1 see_more" >정보 수정</button>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="card regCard col-6 px-0">
                        	<div class="card-header">
                        		<h4>회원정보 수정</h4>
                        	</div>
                        	<form id="revise_form" method="post" class="card-body needs-validated" novalidate="novalidate" action="${pageContext.request.contextPath}/admin/updateMember">
	                                	<label>이메일 수정</label>
	                                	<input type="email" class="form-control memberIN" id="email" placeholder="작성자 입력하세요" name="email" required value="${member.email}">
	                                   	<span id="email-no" class="my-2" style="display: none; color: #d92742; font-weight: bold;">잘못된 이메일 주소입니다.</span>	
                                		<label class="mt-3">전화번호 수정</label>
										<input type="text" class="form-control memberIN" id="tel" placeholder="작성자 입력하세요" name="tel" required value="${member.tel}">
	                                   	<span id="tel-no" class="my-2" style="display: none; color: #d92742; font-weight: bold;">정확한 전화번호를 입력해주세요.</span>
                                		<label class="mt-3">이름 수정</label>
                                		<input type="text" class="form-control memberIN" id="userName" placeholder="작성자 입력하세요" name="userName" required value="${member.userName}">
										<span id="name-no" class="my-2" style="display: none; color: #d92742; font-weight: bold;">정확한 이름을 입력해주세요.</span>
                                  	<label class="mt-3">주소 수정   </label>
                                <input type="button" onclick="postfind()" class="btn btn-secondary btn-sm my-2 float-right" value="우편번호 찾기" >
								<input type="text" class="memberIN addr form-control my-2" id="post" placeholder="우편번호" readonly value="${address.post}">
								<input type="text" class="addr form-control my-2 memberIN"  id="addr" placeholder="주소" readonly  value="${address.addr}">
								<input type="text" class="addr form-control my-2 memberIN" id="detail" placeholder="상세주소" value="${address.detail}">
								<input type="text" class="addr form-control my-2 memberIN" id="extra" placeholder="참고항목" readonly value="${address.extra}">
                        		<input type="hidden" name="userNo" value="${member.userNo}">
                        		<input type="hidden" name="userId" value="${member.userId}">
                        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        	               		<button data-oper="updateMember" id="modify" class="btn btn-sm btn-outline-warning float-right" formaction="updateMember">회원 정보 수정</button>
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
    <script>
   	$(function(){
   		$(".regCard").hide();
   		$(".see_more").click(function(){
   			event.preventDefault();
   			$(".regCard").show();
   			$(".see_more").hide();
   		})
   	});
    
	  //이메일 유효성
	   var fnEmail = function() {
		    var email = $("#email").val();
	        var emailch = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		   
		    if(emailch.test($('#email').val())){
		    	$("#email-no").css('display', 'none'); 	
		        return true;
		    } 
		    $("#email-no").css('display', 'inline-block');
		}
	   
	   //전화번호 유효성
	   var fnTel = function () {
	 	  var tel = $("#tel").val();
	 	  var num = tel.search(/[0-9]/g);
	 	  
			    if(tel.length < 10 || tel.length > 12){
			    	$("#tel-no").css('display', 'inline-block');
			        return false;
			    }else if(num < 0){
			    	$("#tel-no").css('display', 'inline-block');
			    	return false;
			    }
			    $("#tel-no").css('display', 'none');
			    return true;
	   	}
	   	
		// 이름 유효성 포커스
	    var fnName = function() {
		    var name = $("#userName").val();
		    var namech = RegExp(/^[가-힣]{2,5}$/);
		   
		    if(namech.test($('#userName').val())){
		    	$("#name-no").css('display', 'none'); 	
		        return true;
		    } 
		    $("#name-no").css('display', 'inline-block');
		    return false;
		}
	
	 	//전화번호 유효성
		$('#tel').focusout(fnTel);
		//이메일 유효성
		$('#email').focusout(fnEmail);
		//이름 
		$('#userName').focusout(fnName);
		
		//주소 api
	    function postfind() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extra").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extra").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('post').value = data.zonecode;
	                document.getElementById("addr").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detail").focus();
	                
	                
	            }
	        }).open();
	    }
		
		$("#modify").click(function() {
			event.preventDefault();
			if(fnName() && fnTel() && fnEmail() && $("#post").val() != '' && $("#addr").val() != '') {
				 $("<input>").attr({type:"hidden", name:"userNo", value:${member.userNo}}).appendTo("form");
				 $("<input>").attr({type:"hidden", name:"address.addr", value:$("#addr").val()}).appendTo("form");
		         $("<input>").attr({type:"hidden", name:"address.extra", value:$("#extra").val()}).appendTo("form");
		         $("<input>").attr({type:"hidden", name:"address.post", value:$("#post").val()}).appendTo("form");
		         $("<input>").attr({type:"hidden", name:"address.detail", value:$("#detail").val()}).appendTo("form");
				 $("#revise_form").submit();
			}
			else{
				alert("올바른 값으로 꽉 채워주세요.");
			}
		});
    </script>
<jsp:include page="../includes/adminFooter.jsp" />