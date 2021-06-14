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
 * 결제 미완료 된 임시 이용 등록 정보 자동 삭제하는 메소드
 *
 * @author 김보경
 * @date   2021. 5. 28.
 */
@Log4j
@Component
@AllArgsConstructor
public class TmpRegCheckTask {
	
	private RegInfoMapper regInfoMapper;
	private SeatMapper seatMapper;
	private LockerMapper lockerMapper;

	@Transactional
	@Scheduled(cron="0 10 * * * *")
	public void checkPeriod() throws Exception {
		
		log.warn("임시 등록 task 실행...");
		log.warn("========================================");
		List<RegInfoVO> tmpToRegList = regInfoMapper.getTmpToRegList();
		if(tmpToRegList.size() == 0	) return;

		for(RegInfoVO tmp : tmpToRegList) {
			
			SeatVO seatVO = new SeatVO();
			seatVO.setSno(tmp.getSeatNo());
			seatVO.setStatus(false);
			seatVO.setUserNo(0L);
			seatMapper.updateStatus(seatVO);
			
			if(tmp.getLockerNo() != null) {
				LockerVO lockerVO = new LockerVO();
				lockerVO.setLno(tmp.getLockerNo());
				lockerVO.setStatus(false);
				lockerVO.setUserNo(0L);
				lockerMapper.updateStatus(lockerVO);
			}
		}
		regInfoMapper.deleteTmpReg();
	}
}
