package xyz.sumtplus.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.SeatVO;

/**
 * 좌석 매퍼 테스트 클래스
 *
 * @author 김보경
 * @date   2021. 5. 17.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class SeatMapperTests {
	@Autowired
	private SeatMapper mapper;
	
	@Test
	public void getAllListTest() {
		mapper.getAllList().forEach(log::info);
	}
	@Test
	public void getEmptySeatListTest() {
		mapper.getEmptySeatList().forEach(log::info);
	}
	@Test
	public void updateStatusTest() {
		SeatVO seatVO = new SeatVO();
		seatVO.setStatus(true);
		seatVO.setUserNo(3L);
		seatVO.setSno(1);
		mapper.updateStatus(seatVO);
		log.info(seatVO);
	}
	
	@Test
	public void updateNewSeatTest() {
		SeatVO seatVO = new SeatVO();
		seatVO.setUserNo(156L);
		mapper.updateNewSeat(seatVO);
	}
	
	@Test
	public void updateOldSeatTest() {
		SeatVO seatVO = new SeatVO();
		seatVO.setSno(6);
		mapper.updateOldSeat(seatVO);
	}
	
	@Test
	public void delInfoupdateSeatTest() {
		mapper.delInfoupdateSeat(44L);
	}
	
}
