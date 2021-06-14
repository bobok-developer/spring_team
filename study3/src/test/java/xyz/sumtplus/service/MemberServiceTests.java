package xyz.sumtplus.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.MemberVO;

/**
 * 멤버서비스 테스트
 *
 * @author 민지현
 * @date   2021. 5. 30.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberServiceTests {
	@Autowired
	private MemberService service;
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testNaverJoin() {
		MemberVO vo = new MemberVO();
		vo.setUserId("mjh9@naver.com");
		vo.setUserName("민지현");
		vo.setEmail("mjh9@naver.com");
		vo.setTel("010-1111-1111");
		vo.setSnsId("abcde");
		vo.setUserPw("abcde");
		service.naverJoin(vo);
	}
	
	@Test
	public void testNaverLogin() {
		service.naverLogin("abcd");
	}
	
	@Test
	public void testFindUserNoBy2() {
		String snsId = "abcde";
		log.info(service.findUserNoBy2(snsId));
	}

	@Test
	public void testFindAuthBy() {
		Long userno = 246L;
		log.info(service.findAuthBy(userno));
	}
	
	@Test
	public void testFindByUserNo() {
		log.info(service.findByUserNo(289L));
	}
	
	@Test
	public void testWithdraw() {
		log.info(service.withdraw(298L));
	}
	
	@Test
	public void testDeactivate() {
		log.info(service.deactivate(214L));
	}
	
}
