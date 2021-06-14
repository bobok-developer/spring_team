<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../includes/header_.jsp" />
	<!-- Home -->

	<div class="home">
		<div class="home_background_container prlx_parent">
			<div class="home_background prlx" style="background-image:url(${pageContext.request.contextPath}/resources/images/news_background.jpg)"></div>
		</div>
		<div class="home_content">
			<h1>로그인</h1>
		</div>
	</div>
	<div class="container">
		<div class="row d-flex justify-content-center" >
			<div class="col-4 pt-4">
	<!-- 		<div class="col-lg-4 d-none d-lg-block"> -->
					<img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/logo_transparent.png" alt="logo" width="600px">
			</div>
	        <div class="col-5 pt-5 mt-5">
	<!--         <div class="col-lg-4 mt-5"> -->
				<form action="${pageContext.request.contextPath}/member/withdraw" method="post">
			        <table class="table table-boardered mt-5">
			            <tr>
			                <th>패스워드</th>
			                <td><input class="form-control" name="userPw" type="password"></td>      
			            </tr>
			            <tr>
			                <td colspan="2">
			                <div class="text-center"><button class="btn btn-sm btn-warning py-2 px-5" >회원 탈퇴</button></div>
			                </td>
			            </tr>
			        </table>
			        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			    </form>
			    <p class="mediuen">ZAKSAL을 탈퇴하기 위해서는 비밀번호를 한번 더 입력해야합니다</p>
		    </div>
		</div>
	</div>
<jsp:include page="../includes/footer.jsp" />
