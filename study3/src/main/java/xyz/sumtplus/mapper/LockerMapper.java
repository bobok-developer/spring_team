package xyz.sumtplus.mapper;

import java.util.List;

import xyz.sumtplus.domain.LockerVO;

/**
 * 사물함 맵퍼 인터페이스
 *
 * @author 김보경
 * @date   2021. 5. 17.
 */
public interface LockerMapper {
	// 모든 사물함 조회
	List<LockerVO> getAllList();
	
	// 이용 가능한 빈 사물함 목록 조회
	List<LockerVO> getEmptyLockerList();
	
	// 사물함 상태 변경
	void updateStatus(LockerVO lockerVO);
	
	// 이용 등록 정보 삭제 시 빈 사물함으로 변경
	void delInfoupdateLocker(Long userNo);
}
