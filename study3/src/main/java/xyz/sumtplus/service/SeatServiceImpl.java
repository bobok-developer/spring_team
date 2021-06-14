package xyz.sumtplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.SeatVO;
import xyz.sumtplus.mapper.SeatMapper;

/**
 * 좌석 서비스 구현 클래스
 *
 * @author bobo
 * @date   2021. 5. 17.
 */
@Service
@Log4j
@AllArgsConstructor
public class SeatServiceImpl implements SeatService{
	@Autowired
	private SeatMapper seatMapper;
	
	@Override
	public List<SeatVO> getAllList() {
		log.info("Service:: getAllList");
		return seatMapper.getAllList();
	}

	@Override
	public List<SeatVO> getEmptySeatList() {
		log.info("Service:: getEmptySeatList");
		return seatMapper.getEmptySeatList();
	}

	@Override
	public void changeStatus(SeatVO seatVO) {
		log.info("Service:: changeStatus");
		seatMapper.updateStatus(seatVO);
	}

}
