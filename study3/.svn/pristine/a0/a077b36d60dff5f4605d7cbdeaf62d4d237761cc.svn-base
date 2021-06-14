package xyz.sumtplus.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.PaymentVO;
import xyz.sumtplus.domain.RegInfoVO;


/**
 * 결제매퍼 테스트 복구
 *
 * @author 민지현
 * @date   2021. 5. 24.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class PaymentMapperTests {
	@Autowired
	private PaymentMapper mapper;
	
	@Test
	public void testInsert() {
		PaymentVO paymentVO = new PaymentVO();
		paymentVO.setUserNo(43L);
		paymentVO.setUserName("류");
		paymentVO.setRegNo(68L);
		paymentVO.setPayment(8000L);
		paymentVO.setItemName("1일 요금제");
		log.info(mapper.insert(paymentVO));
	}
	
	@Test
	public void testSelectFee() {
		log.info(mapper.selectFee(1));
	}

}
