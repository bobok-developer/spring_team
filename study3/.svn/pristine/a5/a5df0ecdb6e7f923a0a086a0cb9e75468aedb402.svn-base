package xyz.sumtplus.controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.FeeVO;
import xyz.sumtplus.domain.PaymentVO;
import xyz.sumtplus.domain.RegInfoVO;
import xyz.sumtplus.security.domain.CustomUser;
import xyz.sumtplus.service.PaymentService;
import xyz.sumtplus.service.RegInfoService;

/**
 * 결제 컨트롤러
 *
 * @author 민지현
 * @date   2021. 5. 19.
 */
@Controller
@Log4j
@RequestMapping("/payment/*")
@AllArgsConstructor
public class PaymentController {
	@Autowired
	private PaymentService paymentservice;
	@Autowired
	private RegInfoService reginfoservice;
	
	@GetMapping("payment")
	public void getPayment() {
		log.info("payment..");
	}
	
	@PostMapping("payment")
	@PreAuthorize("principal.vo.userNo == #regInfoVO.userNo")
	public void postPayment(RegInfoVO regInfoVO, Integer fno2, Model model) {
//	public void postPayment(RegInfoVO regInfoVO, Model model) {
		log.info("payment..." + regInfoVO);
		FeeVO feeVO = paymentservice.findBy(regInfoVO.getFno());
		model.addAttribute("feeVO", feeVO);
		log.info("feeVO : " + feeVO);
		if(fno2 != null) {
			FeeVO feeVO2 = paymentservice.findBy(fno2);
			model.addAttribute("feeVO2", feeVO2);
			log.info("feeVO2 : " + feeVO2);
			}
		reginfoservice.RegisterTmpReg(regInfoVO);
	}
	
	@PostMapping("payComplete")
	@PreAuthorize("principal.vo.userNo == #regInfoVO.userNo")
	public void payComplete(PaymentVO paymentVO, RegInfoVO regInfoVO, Model model) {
		log.info("payment......");
		log.info("reginfoVO" + regInfoVO);
		log.info("paymentVO" + paymentVO);
		Long regNo = paymentservice.pay(paymentVO, regInfoVO);
		model.addAttribute("regNo", regNo);
		log.info("regNo..." + regNo);
	}
	
	@GetMapping("payComplete")
	public void getPayComplete() {
		
	}
	
	@GetMapping("expayComplete")
	public void getExpayComplete() {
		
	}
	
	@PostMapping("expayComplete")
	@PreAuthorize("principal.vo.userNo == #regInfoVO.userNo")
	public void payExComplete(PaymentVO paymentVO, RegInfoVO regInfoVO, Model model) {
		log.info("payment......");
		log.info("reginfoVO" + regInfoVO);
		log.info("paymentVO" + paymentVO);
		paymentservice.extendPayment(paymentVO, regInfoVO);
//		model.addAttribute("regNo", regNo);
//		log.info("regNo..." + regNo);
	}
	
	@GetMapping("payTest")
	public void payTest() {
		log.info("payTest..");
	}
	
	/**
	 * 기간 연장 페이지로 이동하는 메서드.
	 * @author 김보경
	 * 
	 * @param model
	 * 
	 * @param auth
	 * 			시큐리티를 이용한 로그인 된 이용자의 정보를 담고 있음.
	 */
	@GetMapping("exPayment")
	public void getExPayment(Model model, Authentication auth) {
		log.info("기간 연장 결제 페이지..");
		/* 만료일의 날짜 포맷을 변경하는 작업*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		/* 이용자의 만료일을 처리하는 작업 */
		CustomUser user = (CustomUser) auth.getPrincipal(); // 로그인 된 이용자의 정보를 가져 온다.
		
		RegInfoVO regInfoVO = reginfoservice.read(user.getVo().getUserNo()); // 해당 이용자의 이용정보를 불러온다.
		String endDate = sdf.format(regInfoVO.getEndDate());
		FeeVO feeVO = paymentservice.findBy(regInfoVO.getFno());
		
		model.addAttribute("regInfoVO", regInfoVO);
		model.addAttribute("endDate",endDate);
		model.addAttribute("feeVO", feeVO);
	}
	/*
	 * 연장결제완료페이지이동컨트롤러
	 */
	@PreAuthorize("principal.vo.userNo == #regInfoVO.userNo")
	@PostMapping("exPayComplete")
	public void postExPayComplete(RegInfoVO regInfoVO, PaymentVO paymentVO, Model model) {
		log.info("exPayment......");
		log.info("regInfoVO" + regInfoVO);
		log.info("paymentVO" + paymentVO);
		model.addAttribute("PaymentVO", paymentVO);
		model.addAttribute("RegInfoVO", regInfoVO);
		/*연장실행 - 결제 및 기간연장*/
		paymentservice.extendPayment(paymentVO, regInfoVO);
	}
	/*
	 * fno로 요금제테이블의 정보를 가져오기 위한 페이지
	 */
	@ResponseBody
	@GetMapping("getFee")
	public FeeVO getFee(Integer fno) {
		log.info("getFee......" + fno);
		return paymentservice.findBy(fno);
	}
}
