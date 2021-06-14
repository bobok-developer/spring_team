package xyz.sumtplus.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.RegInfoVO;
import xyz.sumtplus.domain.SeatVO;

/**
 * 이용 등록 정보 서비스 테스트 클래스
 *
 * @author 김보경
 * @date   2021. 5. 17.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class RegInfoServiceTests {
	
	@Autowired
	private RegInfoService service;
	
	@Test
	public void RegisterRegInfoTest() {
		RegInfoVO infoVO = new RegInfoVO();
		infoVO.setUserNo(156L);
		infoVO.setUserName("김보경");
		infoVO.setSeatNo(13);
		//infoVO.setLockerNo(9);
		infoVO.setFno(3);
		infoVO.setFeeName("14일 요금제");
		infoVO.setPeriod(14);
		service.RegisterRegInfo(infoVO);
		log.info(infoVO);
	}
	
	@Test
	public void RegisterTmpRegTest() {
		RegInfoVO infoVO = new RegInfoVO();
		infoVO.setUserNo(156L);
		infoVO.setUserName("김보경");
		infoVO.setSeatNo(13);
		//infoVO.setLockerNo(9);
		infoVO.setFno(3);
		infoVO.setFeeName("14일 요금제");
		infoVO.setPeriod(14);
		service.RegisterTmpReg(infoVO);
	}
	
	@Test
	public void extendUsingPeriodTest() {
		RegInfoVO infoVO = new RegInfoVO();
		infoVO.setPeriod(30);
		infoVO.setUserNo(156L);
		service.extendUsingPeriod(infoVO);
	}
	
	@Test
	public void readTest() {
		service.read(156L);
	}
	
	@Test
	public void changeSeatTest() {
		RegInfoVO infoVO = new RegInfoVO();
		infoVO.setSeatNo(6);
		infoVO.setUserNo(156L);
		SeatVO seatVO = new SeatVO();
		seatVO.setUserNo(infoVO.getUserNo());
		seatVO.setSno(2);
		service.changeSeat(infoVO, seatVO);
	}
}