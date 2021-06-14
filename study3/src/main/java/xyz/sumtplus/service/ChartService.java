package xyz.sumtplus.service;

import java.util.List;
import java.util.Map;

/**
 * 이용현황 차트
 *
 * @author 여름
 * @date   2021. 5. 26.
 */

public interface ChartService {
	
	// TBL_PAYMENT 조회
	List<Map<String, Object>> getChart();
	
	// 월별 이용건수 조회
	List<Map<String, Object>> getCount(String year);

	// 월별 매출 조회
	List<Map<String, Object>> getMonthPay(String year);
	
	// 주간 매출 조회
	List<Map<String, Object>> getWeekPay(String year);

	// 일간 매출 조회
	List<Map<String, Object>> getDayPay(String month);

	List<Map<String, Object>> getCountYearCount();

}
