package xyz.sumtplus.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.AuthVO;
import xyz.sumtplus.domain.MemberVO;


/**
 * 멤버매퍼 테스트
 *
 * @author 류슬희
 * @date   2021. 5. 19.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})


@Log4j
public class MemberMapperTests {
	@Autowired
	private MemberMapper mapper;
	
	@Autowired @Qualifier("BCryptPasswordEncoder")
	private PasswordEncoder encoder;
	
	@Test
	public void test(){
		log.info(mapper);
		
	}
	@Test
	public void testRead(){
		Long userno = 26L;
		log.info(mapper.read(userno));
	}
	
	@Test
	public void testInsert() {
		MemberVO memberVO = new MemberVO();
		memberVO.setUserId("ryuryu1");
		memberVO.setUserPw(encoder.encode("1234"));
		memberVO.setUserName("류수리");
		memberVO.setEmail("a@b.c");
		memberVO.setTel("000-0000-0000");
		
		mapper.insert(memberVO);
		log.info(memberVO);
	}
	
	@Test
	public void testInsertAuth() {
		AuthVO authVO = new AuthVO();
		authVO.setUserNo(26L);
		authVO.setAuth("ROLE_MEMBER");

		
		mapper.insertAuth(authVO);
		log.info(authVO);
	}
	
	@Test
	public void testNaverInsert() {
		MemberVO memberVO = new MemberVO();
		memberVO.setUserId("mjh7@naver.com");
		memberVO.setUserPw("abcde");
		memberVO.setUserName("민지현");
		memberVO.setEmail("mjh7@naver.com");
		memberVO.setTel("000-0000-0000");
		memberVO.setSnsId("abcde");
		log.info(memberVO);
		mapper.naverInsert(memberVO);
	}
	
	
}
