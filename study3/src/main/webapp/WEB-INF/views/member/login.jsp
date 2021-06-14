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
				<form action="${pageContext.request.contextPath}/login" method="post">
			        <table class="table table-boardered mt-5">
			            <tr>
			                <th>아이디</th>
			                <td><input class="form-control" name="username" type="text" placeholder="id"></td>     
			            </tr>
			            <tr>
			                <th>패스워드</th>
			                <td><input class="form-control" name="password" type="password" placeholder="password"></td>      
			            </tr>
			            <tr>
			                <td colspan="2">
			                <div class="text-center"><button class="btn btn-sm btn-outline-warning py-2 px-5 col-12" type="submit">로그인</button></div>
			                </td>
			            </tr>
			        </table>
			        <div id="naver_id_login" style="text-align:center"><a href="${url}">
					<img src="${pageContext.request.contextPath}/resources/images/btnG_perfect.png"/></a></div>
					<br>
			        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			    </form>
			    <p class="mediuen">ZAKSAL에 가입하고 여러 혜택을 누리시겠습니까? <a href="${pageContext.request.contextPath}/member/join">회원가입 하기</a></p>
		    </div>
		</div>
	</div>
<jsp:include page="../includes/footer.jsp" />

<script>
		/*   function Google() {
			  const googleLoginBtn = useRef(null);
			  const [token, setToken] = useState("");
		
			  useEffect(() => {
			    googleSDK();
			  }, []);
		
		
			//SDK 초기 설정 및 내 API초기화
			 const googleSDK = () => {
			    window.googleSDKLoaded = () => {
			      console.log(window.gapi);
			      window.gapi.load("auth2", () => {
			        const auth2 = window.gapi.auth2.init({
			          client_id:
			            "1048191379151-njbjg3ktki5g564aitu2pnf52k4opuht.apps.googleusercontent.com",
			          scope: "profile email",
			        });
			        //버튼 클릭시 사용자 정보 불러오기
			         auth2.attachClickHandler(
			          googleLoginBtn.current,
			          {},
			          (googleUser) => {
			            const profile = googleUser.getBasicProfile();
			            console.log(profile);
			            console.log(`Token || ${googleUser.getAuthResponse().id_token}`);
			            setToken(googleUser.getAuthResponse().id_token);
			            console.log(`ID: ${profile.getId()}`);
			            console.log(`Name: ${profile.getName()}`);
			            console.log(`Image URL: ${profile.getImageUrl()}`);
			            console.log(`Email: ${profile.getEmail()}`);
			          },
			          (error) => {
			            alert(JSON.stringify(error, undefined, 2));
			          }
			        );
			      });
			    };
			   //구글 SDK 불러오기
			       (function (d, s, id) {
			      let js;
			      const fjs = d.getElementsByTagName(s)[0];
			      if (d.getElementById(id)) {
			        return;
			      }
			      js = d.createElement(s);
			      js.id = id;
			      js.src = "https://apis.google.com/js/platform.js?onload=googleSDKLoaded";
			      fjs.parentNode.insertBefore(js, fjs);
			    })(document, "script", "google-jssdk");
			  };
			  
			   return (
			    <GoogleBtn id="gSignInWrapper" >
			      <span class="label" />
			      <div ref={googleLoginBtn} id="customBtn" className="customGPlusSignIn">
			        <span className="icon"></span>
			        <span className="buttonText">Login with Google</span>
			      </div>
			    </GoogleBtn>
			  );
			}
			const GoogleApiPOST = (token) => {
			    axios
			      .get(`${socialLoginAPI}/user/google`, {
			        headers: {
			          Authorization: token,
			          "Content-Type": "application/json",
			        },
			      })
			      .then((res) => {
			        sessionStorage.setItem("token", res.data.token);
			        alert("로그인 되었습니다");
			        history.push("/home");
			      })
			      .catch((error) => alert("Error가 발생하였습니다", error));
			  }; 
		 function onSignIn(googleUser) {
			  var profile = googleUser.getBasicProfile();
			  var id_token = googleUser.getAuthResponse().id_token;
			  $("#googleBtn").click(function(){
				  $.ajax({
					  url: 'http://localhost:8080/auth/google/callback',
					  type: 'POST',
					  data: 'idtoken=' + id_token, 
					  dataType: 'JSON',
					  beforeSend : function(xhr){
						  xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
					  },
					  success: function(json) {
						  if (json.login_result == "success"){
						  location.href = "${pageContext.request.contextPath}/member/login";
					  }//end if
		          }//success
			  });//ajax
		  });   */
		  /* function onSignIn(googleUser) {
			  var profile = googleUser.getBasicProfile();
			  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			  console.log('Name: ' + profile.getName());
			  console.log('Image URL: ' + profile.getImageUrl());
			  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
			}
		  function signOut() {
			    var auth2 = gapi.auth2.getAuthInstance();
			    auth2.signOut().then(function () {
			      console.log('User signed out.');
			    });
		  }   */
		  
		  
</script>
