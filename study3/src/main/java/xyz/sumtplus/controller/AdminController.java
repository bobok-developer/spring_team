package xyz.sumtplus.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.Criteria;
import xyz.sumtplus.domain.FeeVO;
import xyz.sumtplus.domain.MemberVO;
import xyz.sumtplus.domain.PageDTO;
import xyz.sumtplus.domain.RegInfoVO;
import xyz.sumtplus.service.AdminService;
import xyz.sumtplus.service.BoardService;
import xyz.sumtplus.service.ChartService;
import xyz.sumtplus.service.LockerService;
import xyz.sumtplus.service.PaymentService;
import xyz.sumtplus.service.RegInfoService;
import xyz.sumtplus.service.SeatService;

/**
 * 관리자 페이지 매핑, 회원 수정과 등록정보 수정
 *
 * @author 박재우
 * @Date   2021. 5. 18.
 */

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {
	private AdminService service;
	private SeatService seatService;
	private BoardService boardService;
	private ChartService chartService;
	private LockerService lockerService;
	private RegInfoService regInfoService;
	private PaymentService paymentService;
	
	/**
	 * 관리자 메인 페이지
	 * @author 박재우
	 * @Date 2021. 5. 28.
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("admin")
	public void getAdmin(Criteria cri, Model model, @RequestParam(defaultValue = "2021") String year){
		log.warn("관리자 페이지");
		List<Map<String, Object>> memberChart = new ArrayList<Map<String, Object>>();
		memberChart = chartService.getCount(year);
		List<Map<String, Object>> payChart = new ArrayList<Map<String, Object>>();
		payChart = chartService.getMonthPay(year);
		
		model.addAttribute("memberChart", memberChart);
		model.addAttribute("payChart", payChart);
		
		model.addAttribute("memberCount", service.getMemberTotal(cri));
		model.addAttribute("usingCount", service.getMemberContactTotalCount(cri));
		model.addAttribute("totalIncome", service.getTotalImcome());
		
		model.addAttribute("pageMaker", new PageDTO(boardService.getTotalCount(cri), cri));
		model.addAttribute("notiList", service.getNotiList());
		model.addAttribute("QAList", service.getQAList());
		
	}
	/**
	 * 좌석 관리 페이지
	 * @author 김보경
	 * @Date 2021. 5. 28.
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("admin_seat")
	public void getSeat(Criteria cri, Model model) {
		log.warn("관리자 좌석 관리 페이지..");
		model.addAttribute("UnregList", service.getUnregListTest(cri)); // 미등록 회원 목록
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", new PageDTO(service.getMemberTotal(cri), cri));
		model.addAttribute("etSeat", seatService.getEmptySeatList()); // 빈 좌석 목록
		model.addAttribute("etLocker", lockerService.getEmptyLockerList()); // 빈 사물함 목록
		model.addAttribute("planInfo",service.showSeatPlanInfo()); // 배치도 정보
	}
	
	/**
	 * 
	 * @author 김보경
	 * @Date 2021. 5. 31.
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("admin_seat")
	public String postSeat(RegInfoVO infoVO, Model model) {
		log.warn("전송된 infoVO:: " + infoVO);
		FeeVO feeVO = paymentService.findBy(infoVO.getFno());
		model.addAttribute("feeVO", feeVO);
		log.info("feeVO : " + feeVO);
		regInfoService.RegisterRegInfo(infoVO);
		return "redirect:/admin/admin_seat";
	}
	
	/**
	 * 좌석관리에서 등록 취소
	 * @author 김보경
	 * @Date 2021. 5. 31.
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("revoke")
	public String revokeReg(Long userNo) {
		log.warn("회원 번호:: " + userNo);
		service.revokeTheRegistration(userNo);
		return "redirect:/admin/admin_seat";
	}
	
	/**
	 * 사물함 관리 페이지
	 * @author 김보경
	 * @Date 2021. 6. 1.
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("admin_locker")
	public void getAdminLocker(Model model) {
		model.addAttribute("lPlanInfo", service.showLockerPlanInfo()); // 사물함 배치도에서 이용 정보 목록
	}
	
	/**
	 * 사물함 관리에서 등록 취소
	 * @author 김보경
	 * @Date 2021. 6. 1.
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("revoke2")
	public String revokeLocker(Long userNo) {
		log.warn("회원 번호:: " + userNo);
		service.revokeLocker(userNo);
		return "redirect:/admin/admin_locker";
	}
	
	/**
	 * 회원목록 페이지
	 * @author 박재우
	 * @Date 2021. 5. 28.
	 */
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("memberList")
	public void getMemberList(Criteria cri, Model model){
		log.warn("회원목록" + cri + "페이지");		
		model.addAttribute("list",service.memberList(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", new PageDTO(service.getMemberTotal(cri), cri));
	}
	
	/**
	 * 회원정보 수정 페이지
	 * @author 박재우
	 * @Date 2021. 5. 28.
	 */
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("memberDetail")
	public void getMemberDetail(@RequestParam int userNo, @ModelAttribute("cri") Criteria cri, Model model){
		log.warn("회원상세정보 페이지");
		model.addAttribute("member", service.memberDetail(userNo));
		model.addAttribute("address", service.memberAddr(userNo));
		model.addAttribute("cri", cri);
	}
	
	/**
	 * 등록된 회원 페이지
	 * @author 박재우
	 * @Date 2021. 5. 28.
	 */
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("memberContact")
	public void getMemberContact(Criteria cri, Model model){
		log.warn("회원연락" + cri + "페이지");		
		model.addAttribute("list",service.memberContactList(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", new PageDTO(service.getMemberContactTotalCount(cri), cri));
	}
	
	/**
	 * 결제내역 페이지
	 * @author 박재우
	 * @Date 2021. 5. 28.
	 */
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("paymentList")
	public void getPaymentList(Criteria cri, Model model){
		log.warn("결제내역 페이지");	
		log.warn(cri.getStartDate());
		log.warn(cri.getEndDate());
		log.warn(service.paymentList(cri));
		model.addAttribute("list",service.paymentList(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", new PageDTO(service.getPaymentTotalCount(cri), cri));
	}
	
	/**
	 * 등록정보 페이지
	 * @author 박재우
	 * @Date 2021. 5. 28.
	 */
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("regProperties")
	public void getRegProperties(Criteria cri, Model model){
		log.warn("등록정보 페이지");					
		log.warn(cri.getStartDate());
		log.warn(cri.getEndDate());
		log.warn(service.regProperties(cri));
		model.addAttribute("list",service.regProperties(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", new PageDTO(service.getRegTotalCount(cri), cri));
	}
	
	/**
	 * 등록정보 수정 페이지
	 * @author 박재우
	 * @Date 2021. 5. 28.
	 */
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("regDetail")
	public void getRegDetail(@RequestParam int regNo, @ModelAttribute("cri") Criteria cri, Model model){
		log.warn("등록 상세정보 페이지");
		model.addAttribute("regPP", service.regDetail(regNo));
		model.addAttribute("emptySeatList", service.getEmptySeatList());
		model.addAttribute("emptyLockerList", service.getEmptyLockerList());
		model.addAttribute("cri", cri);
	}
	
	/**
	 * 회원정보 수정하는 메소드
	 * @author 박재우
	 * @Date 2021. 5. 28.
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("updateMember")
	public String updateMember(MemberVO memberVO, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.warn("회원 정보를 수정합니다...");
		log.warn(memberVO);
		service.updateMember(memberVO);
		return "redirect:/admin/memberList" + cri.getListLink();
	}
	
	/**
	 * 등록정보 수정하는 메소드
	 * @author 박재우
	 * @Date 2021. 5. 28.
	 * 
	 */
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("updateRegPP")
	public String updateRegPP(RegInfoVO regInfoVO, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri){
		log.warn("등록 상태를 수정합니다...");
		log.warn(regInfoVO);
		service.updateRegPP(regInfoVO);
		return "redirect:/admin/regProperties" + cri.getListLink();
	}

	
}
