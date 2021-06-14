package xyz.sumtplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.LockerVO;
import xyz.sumtplus.mapper.LockerMapper;

/**
 * 사물함 서비스 구현 클래스
 *
 * @author 김보경
 * @date   2021. 5. 18.
 */
@Service
@Log4j
@AllArgsConstructor
public class LockerServiceImpl implements LockerService {
	@Autowired
	private LockerMapper lockerMapper;
	
	@Override
	public List<LockerVO> getAllList() {
		log.info("Service:: getAllList");
		return lockerMapper.getAllList();
	}

	@Override
	public List<LockerVO> getEmptyLockerList() {
		log.info("Service:: getEmptyLockerList");
		return lockerMapper.getEmptyLockerList();
	}

	@Override
	public void changeStatus(LockerVO lockerVO) {
		log.info("Service:: changeStatus");
		lockerMapper.updateStatus(lockerVO);
	}


}
