package xyz.sumtplus.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.SeatVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class SeatServiceTests {
	
	@Autowired
	private SeatService service;
	
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
		service.getEmptySeatList().forEach(log::info);
	}
	
	@Test
	public void changeStatusTest() {
		SeatVO seatVO = new SeatVO();
		seatVO.setSno(2);
		seatVO.setStatus(true);
		seatVO.setUserNo(2L);
		service.changeStatus(seatVO);
	}
}