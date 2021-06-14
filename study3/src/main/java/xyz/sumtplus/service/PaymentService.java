package xyz.sumtplus.service;

import xyz.sumtplus.domain.FeeVO;
import xyz.sumtplus.domain.PaymentVO;
import xyz.sumtplus.domain.RegInfoVO;

/**
 * 클래스/인터페이스 설명
 * 결제서비스
 *
 * @author 민지현
 * @date 2021. 5. 18.
 */
public interface PaymentService {
	// 결제
	long pay(PaymentVO paymentVO, RegInfoVO regInfoVO);
	
	FeeVO findBy(Integer fno); 
	
	// 기간 연장 결제
	void extendPayment(PaymentVO paymentVO, RegInfoVO regInfoVO);
}
