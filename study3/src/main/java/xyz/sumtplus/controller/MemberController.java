package xyz.sumtplus.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.MemberVO;
import xyz.sumtplus.naver.NaverLoginBO;
import xyz.sumtplus.security.domain.CustomUser;
import xyz.sumtplus.service.MemberService;

/**
 * 멤버컨트롤러
 *
 * @author 류슬희
 * @date   2021. 5. 19.
 */

@Controller
@Log4j
@RequestMapping("/member/*")
//@AllArgsConstructor
public class MemberController {
	//private SimpleUserDAO sud = new SimpleUserDAO();
	@Autowired
	private NaverLoginBO naverLoginBO;
	@Autowired
	private MemberService service;
	
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	@GetMapping("accessError")
	public void accessDenied(Authentication auth, Model model){
		log.info("accessDenied............");
		model.addAttribute("msg","Access Denied (접근거부)");
	}
	
	/*@PostMapping("loginTest")
	public String testPost(String _csrf, Http)*/
	
	@GetMapping("terms")
	public void getTerms(){
		log.info("약관동의 페이지");
	}
	/*
	 * 2021. 5. 30.
	 * 민지현
	 * 네이버로그인 추가
	 */
	@GetMapping("login")
	public void loginInput(String error, String logout, Model model, HttpSession session){
		log.info("error :: " + error);
		log.info("logout :: " + logout);
		/*
		 * 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
		 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		log.warn("네이버:" + naverAuthUrl);
		model.addAttribute("url", naverAuthUrl);
		if(error != null){
			model.addAttribute("error","Login Error Check Your Account");
		}
		if(error != null){
			model.addAttribute("logout","logout!!!!!!!!!!!");
		}
	}
	
	@GetMapping("loginTest")
	public void loginTest(MemberVO memberVO) {
		log.warn(memberVO);
	}
	
	
	
	@GetMapping("/logout")
	public void logoutGet(HttpServletRequest req){
		log.info("custom logout");
		log.warn(req.getHeader("referer"));
	}
	
	@PostMapping("/logout")
	public void logoutPost(HttpServletRequest req){
		log.info("post custom logout");
		log.info(req.getHeader("referer"));
	}
	
	@GetMapping("join")
	public void join() {
		
	}

	@PostMapping("join")
	public String join(MemberVO memberVO, RedirectAttributes rttr) {
		log.info("================================");
		log.info("register: " + memberVO);
		service.join(memberVO);
		rttr.addFlashAttribute("result", memberVO.getUserId());
		return "redirect:/member/login";
	}
	
	@RequestMapping("/idcheck")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody MemberVO memberVO) {
		log.info(memberVO); 
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		 
		count = service.idChk(memberVO);
		map.put("cnt", count);
		 
		return map;
	}
	
	// 네이버 로그인 성공시 callback호출 메소드
	/**
	 * 2021. 5. 30.
	 * 민지현
	 * 네이버 로그인 콜백url, 개인정보를 받아와서 로그인 또는 회원가입
	 */
	@GetMapping("/naverResult")
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		log.warn("naverLogin......");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		// 1. 로그인 사용자 정보를 읽어온다.
		String apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		log.warn("제이슨" + obj);
		String snsId = (String) response_obj.get("id");
		String tels = (String) response_obj.get("mobile_e164");
		String tel = "0" + tels.substring(3);
		String email = (String) response_obj.get("email");
		String userName = (String) response_obj.get("name");
		String userPw = snsId.substring(0, 9);
		log.warn("네이버키" + snsId);
		log.warn("전화번호" + tel);
		log.warn("이메일" + email);
		log.warn("이름" + userName);
		log.warn("비밀번호" + userPw);
		
		// 4. 분기
		MemberVO memberVO = new MemberVO();
		// 4.1 일치하는 snsId가 없을시 회원가입
		System.out.println(service.naverLogin(snsId));
		if(service.naverLogin(snsId) == null) {
			log.warn("회원가입");
			memberVO.setUserId(email);
			memberVO.setEmail(email);
			memberVO.setUserName(userName);
			memberVO.setTel(tel);
			memberVO.setSnsId(snsId);
			memberVO.setUserPw(userPw);
			service.naverJoin(memberVO);
		}
		// 4.2 일치하는 snsId가 있으면 디비에서 불러와서 멤버객체에 담음
			log.warn("로그인");
			Long userNo = service.findUserNoBy2(snsId);
		    MemberVO vo = service.findByUserNo(userNo);
		    log.warn("member : " + vo);
		    CustomUser user = new CustomUser(vo);
		    log.warn("user : " + user);
		    List<GrantedAuthority> roles = CustomUser.getList(vo);
		    Authentication auth = new UsernamePasswordAuthenticationToken(user, null, roles);
		    log.warn("auth : " + auth);
		    SecurityContextHolder.getContext().setAuthentication(auth);
		
		
		//session.setAttribute("sessionId", userName); // 세션 생성
		//session.setAttribute("userInfo", memberVO); // 세션 생성
		//model.addAttribute("result", apiResult);
		//model.addAttribute("memberVO", memberVO);
		
		/*Long userNo = memberVO.getUserNo();
	    String roleStr = sud.getRolesByUserno(userNo).toUpperCase();
	    log.warn(roleStr);
	    List<GrantedAuthority> roles = new ArrayList<>(1);
	    //String roleStr = username.equals("admin") ? "ROLE_ADMIN" : "ROLE_GUEST";
	    roles.add(new SimpleGrantedAuthority(roleStr));
	    String username = sud.getUserName(userNo);
	    log.warn(username);
	    User user = new User(username, "", roles);
	    log.warn(user);
	    Authentication auth = new UsernamePasswordAuthenticationToken(user, null, roles);
	    log.warn(auth);
	    SecurityContextHolder.getContext().setAuthentication(auth);*/
	    
		return "redirect:/index";
	}
	
	/**
	 * 2021.06.04 
	 * 민지현
	 * 회원탈퇴관련 비밀번호확인, 탈퇴 추가
	 * 
	*/
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("pwCheck") 
	public void getPwCheck() {
		log.info("비밀번호확인......");
	}
	
	/*//@PreAuthorize("isAuthenticated()")
	@PostMapping("pwCheck")
	public void postPwCheck(Authentication auth, String userPw) {
		log.info("비밀번호..." + userPw);
		CustomUser user = (CustomUser)auth.getPrincipal();
		log.info("user : " + user);
		
		if(!encoder.matches(userPw, user.getVo().getUserPw())) {
			log.info("비밀번호 불일치");
			//return "redirect:/index";
		}
		//return "redirect:/index";
	}*/
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("withdraw")
	public String withdraw(Authentication auth, String userPw, HttpSession session) {
		log.warn("비밀번호..." + userPw);
		CustomUser user = (CustomUser)auth.getPrincipal();
		log.warn("user : " + user);
		Long userNo = user.getVo().getUserNo();
		if(!encoder.matches(userPw, user.getVo().getUserPw())) {
			log.warn("비밀번호 불일치");
			return "redirect:/index";
		}
		log.warn("비밀번호 일치 : " + userNo);
		log.warn("회원탈퇴");
		service.deactivate(userNo);
		session.invalidate();
		return "redirect:/index";
	}
	
/*	@GetMapping("/loginWithoutForm")
	  public void loginWithoutForm(String snsId) {
	    Long userNo = service.findUserNoBy2(snsId);
	    MemberVO vo = service.findByUserNo(userNo);
	    CustomUser user = new CustomUser(vo);
	    log.warn(user);
	    List<GrantedAuthority> roles = CustomUser.getList(vo);
	    Authentication auth = new UsernamePasswordAuthenticationToken(user, null, roles);
	    log.warn(auth);
	    SecurityContextHolder.getContext().setAuthentication(auth);
	    //String roleStr = service.findAuthBy(userNo);
	    //List<GrantedAuthority> roles = new ArrayList<>();
	    //String roleStr = username.equals("admin") ? "ROLE_ADMIN" : "ROLE_GUEST";
	    //roles.add(new SimpleGrantedAuthority(roleStr));
	    //String username = sud.getUserName(userNo);
	    //log.warn(username);
	    //MemberVO vo = service.naverLogin(snsId);
	    //User user = new User(vo.getUserId(), "", roles);
	    //return "redirect:/index";
	  }*/
}
