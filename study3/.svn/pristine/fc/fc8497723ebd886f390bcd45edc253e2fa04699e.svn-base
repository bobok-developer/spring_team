package xyz.sumtplus.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.PaymentVO;
import xyz.sumtplus.domain.RegInfoVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class PaymentServiceTests {
	@Autowired
	private PaymentService paymentService;
	
	@Test
	public void testPay() {
		PaymentVO paymentVO = new PaymentVO();
		paymentVO.setUserNo(51L);
		paymentVO.setUserName("민지현");
		//paymentVO.setRegNo(9L);
		paymentVO.setPayment(56000L);
		paymentVO.setItemName("7일 요금제 7일 사물함");
		RegInfoVO reginfoVO = new RegInfoVO();
		reginfoVO.setUserNo(51L);
		reginfoVO.setUserName("민지현");
		reginfoVO.setSeatNo(18);
		reginfoVO.setLockerNo(10);
		reginfoVO.setFno(2);
		reginfoVO.setFeeName("7일 요금제");
		reginfoVO.setPeriod(7);
		log.info(paymentService.pay(paymentVO, reginfoVO));
	}
	
	@Test
	public void testFindBy() {
		log.info(paymentService.findBy(2));
	}
	
	@Test
	public void extendPaymentTest() {
		RegInfoVO regInfoVO = new RegInfoVO();
		regInfoVO.setUserNo(156L);
		regInfoVO.setUserName("김보경");
		regInfoVO.setSeatNo(2);
		regInfoVO.setLockerNo(1);
		regInfoVO.setFno(4);
		regInfoVO.setFeeName("30일 요금제");
		regInfoVO.setPeriod(30);
		PaymentVO paymentVO = new PaymentVO();
		paymentVO.setUserNo(156L);
		paymentVO.setUserName("김보경");
		paymentVO.setRegNo(177L);
		paymentVO.setPayment(220000L);
		paymentVO.setItemName("30일 요금제 30일 사물함");
		paymentService.extendPayment(paymentVO, regInfoVO);
	}
	
}
