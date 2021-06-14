package xyz.sumtplus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;



/**
 * 이용현황 mapper
 *
 * @author 여름
 * @date   2021. 5. 26.
 */

public interface ChartMapper {

	public List<Map<String, Object>> chart();
	
	
	 // TBL_PAYMENT 조회
	List<Map<String, Object>> getChart();
	
	// 월별 이용건수 조회
	List<Map<String, Object>> getCount(@Param("year") String year);
	
	// 월별 매출 조회
	List<Map<String, Object>> getMonthPay(@Param("year") String year);

	// 주간 매출 조회
	List<Map<String, Object>> getWeekPay(String string);

	// 일간 매출 조회
	List<Map<String, Object>> getDayPay(@Param("yearMonth") String yearMonth);


	public List<Map<String, Object>> getCountYearCount();

}