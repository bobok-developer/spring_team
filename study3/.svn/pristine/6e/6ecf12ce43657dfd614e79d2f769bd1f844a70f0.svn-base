package xyz.sumtplus.task;

import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.LockerVO;
import xyz.sumtplus.domain.RegInfoVO;
import xyz.sumtplus.domain.SeatVO;
import xyz.sumtplus.mapper.LockerMapper;
import xyz.sumtplus.mapper.RegInfoMapper;
import xyz.sumtplus.mapper.SeatMapper;


/**
 * 만료일 지난 이용 등록 정보 자동 삭제하는 메소드
 *
 * @author 김보경
 * @date   2021. 5. 24.
 */
@Log4j
@Component
@AllArgsConstructor
public class PeriodCheckTask {
	
	private RegInfoMapper regInfoMapper;
	private SeatMapper seatMapper;
	private LockerMapper lockerMapper;
	
	@Transactional
	@Scheduled(cron="0 30 23 * * *")
	public void checkPeriod() throws Exception {
		
		log.warn("테스크 실행...");
		log.warn("========================================");
		List<RegInfoVO> regList = regInfoMapper.getExpireInfo();
		if(regList.size() == 0) return;
		
		regList.forEach(log::info);
		for(RegInfoVO vo: regList) {
			SeatVO seatVO = new SeatVO();
			seatVO.setSno(vo.getSeatNo());
			seatVO.setStatus(false);
			seatVO.setUserNo(0L);
			
			if(vo.getLockerNo() != null) {	
				LockerVO lockerVO = new LockerVO();
				lockerVO.setLno(vo.getLockerNo());
				lockerVO.setStatus(false);
				lockerVO.setUserNo(0L);
				lockerMapper.updateStatus(lockerVO);
				log.warn(lockerVO);
			}
			seatMapper.updateStatus(seatVO);
			log.warn(seatVO);
		}
		log.warn("========================================");
		log.warn(regInfoMapper.deleteRegInfo());
	}
}
