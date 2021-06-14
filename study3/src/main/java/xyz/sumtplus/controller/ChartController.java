package xyz.sumtplus.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import xyz.sumtplus.service.ChartService;

/**
 * 이용현황 컨트롤러
 *
 * @author 여름
 * @date   2021. 5. 28.
 */

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class ChartController {
	
	@Autowired
	private ChartService service;

	/* 이용 현황 */
	@GetMapping("memberChart")
	public void getMemberChart(Model model, @RequestParam(defaultValue = "2021") String year) {
		log.info("이용 현황");
		List<Map<String, Object>> chart = new ArrayList<Map<String, Object>>();

	}
	
	/**
	 * 
	 * @param year 입력값 4자리 숫자, null 입력시 전체 이용현황 출력
	 * @return responseEntity map
	 */
	@GetMapping("memberChartData")
	public @ResponseBody List<Map<String, Object>> getMemberChart(@RequestParam(name="year", required=false) String year) {
		log.warn("memberChartData :: " + year);
		return service.getCount(year);
	}
	
	@GetMapping("memberChartDataYearCount")
	public @ResponseBody List<Map<String, Object>> getMemberChart() {
		log.info("memberChartData");
		return service.getCountYearCount();
	}
	
	/* 결제 현황 */

	@GetMapping("payChart") // 월매출, 일매출
	public void getPayChart(Model model, @RequestParam(defaultValue = "2021") String year, @RequestParam(defaultValue = "05") String month) {
		log.info("결제 현황");
		List<Map<String, Object>> chart = new ArrayList<Map<String, Object>>();
		
	}

	@GetMapping("payMonthData")
	public @ResponseBody List<Map<String, Object>> getPayChart(@RequestParam(name="year", required = false) String year) {
		log.warn("payMonthData :: " + year);
		return service.getMonthPay(year);
	}
	
	@GetMapping("payDayData")
	public @ResponseBody List<Map<String, Object>> getPayChartYearMonth(@RequestParam(name="yearMonth", required = false) String yearMonth) {
		log.warn("payDayData :: " + yearMonth);
		return service.getDayPay(yearMonth);
	}
	
	@GetMapping("payChartDataYearCount")
	public @ResponseBody List<Map<String, Object>> getPayChart() {
		log.info("payChartData");
		return service.getCountYearCount();
	}
	
	
	
	
}