package xyz.sumtplus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import xyz.sumtplus.mapper.ChartMapper;

/**
 * 이용현황 차트
 *
 * @author 여름
 * @date   2021. 5. 26.
 */

@Service
@Log4j
@AllArgsConstructor
public class ChartServiceImpl implements ChartService {
	
	@Autowired
	private ChartMapper chartMapper;
	
	
	@Override // TBL_PAYMENT 조회
	public List<Map<String, Object>> getChart() {
		log.info("Service :: getChart");
		return chartMapper.getChart();	
	}


	@Override // 월별 이용건수 조회
	public List<Map<String, Object>> getCount(String string) {
		log.info("Service :: getCount");
		return chartMapper.getCount(string);
	}


	@Override // 월별 매출액 조회
	public List<Map<String, Object>> getMonthPay(String string) {
		log.info("Service :: getMonthPay");
		return chartMapper.getMonthPay(string);
	}


	@Override
	public List<Map<String, Object>> getWeekPay(String string) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Map<String, Object>> getDayPay(String string) {
		log.info("Service :: getDayPay");
		return chartMapper.getDayPay(string);
	}


	@Override
	public List<Map<String, Object>> getCountYearCount() {
		// TODO Auto-generated method stub
		return chartMapper.getCountYearCount();
	}
	
	
	
	
}
