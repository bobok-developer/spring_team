package xyz.sumtplus.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.LockerVO;
import xyz.sumtplus.domain.SeatVO;


/**
 * 사물함 서비스 테스트 클래스
 *
 * @author 김보경
 * @date   2021. 5. 21.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class LockerServiceTests {
	
	@Autowired
	private LockerService service;
	
	@Test
	public void testExist() {
		assertNotNull(service);
		log.info(service);
	}
	
	@Test
	public void getAllListTest() {
		service.getAllList().forEach(log::info);;
	}
	
	@Test
	public void getEmptySeatListTest() {
		service.getEmptyLockerList().forEach(log::info);
	}
	
	@Test
	public void changeStatusTest() {
		LockerVO lockerVO = new LockerVO();
		lockerVO.setLno(16);
		lockerVO.setUserNo(51L);
		lockerVO.setStatus(true);
	}
}