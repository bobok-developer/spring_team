package xyz.sumtplus.service;

import java.util.List;

import xyz.sumtplus.domain.SeatVO;

/**
 * 좌석 서비스 인터페이스
 *
 * @author 김보경
 * @date   2021. 5. 17.
 */
public interface SeatService {
	// 모든 좌석 조회
	List<SeatVO> getAllList();
	
	// 이용 가능한 빈 좌석 목록 조회
	List<SeatVO> getEmptySeatList();
	
	// 좌석 상태 변경
	void changeStatus(SeatVO seatVO);
}
