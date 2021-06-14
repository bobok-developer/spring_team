package xyz.sumtplus.service;

import java.util.List;

import xyz.sumtplus.domain.LockerVO;

/**
 * 사물함 서비스 인터페이스
 *
 * @author 김보경
 * @date   2021. 5. 18.
 */
public interface LockerService {
	// 모든 사물함 조회
	List<LockerVO> getAllList();
	
	// 이용 가능한 빈 사물함 목록 조회
	List<LockerVO> getEmptyLockerList();
	
	// 사물함 상태 변경
	void changeStatus(LockerVO lockerVO);
}
