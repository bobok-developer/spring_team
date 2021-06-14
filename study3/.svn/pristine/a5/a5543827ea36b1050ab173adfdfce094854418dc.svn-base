package xyz.sumtplus.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;


/**
 * 좌석/사물함 컨트롤러 테스트 클래스
 *
 * @author 김보경
 * @date   2021. 5. 21.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
@WebAppConfiguration
public class ItemControllerTests {
	@Autowired
	private WebApplicationContext ctx;
	public MockMvc mvc;
	
	
	@Before
	public void setup(){
		mvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void getSeatTest() throws Exception {
		log.info(
				mvc.perform(MockMvcRequestBuilders.get("/item/seat") 
				).andReturn().getModelAndView().getModelMap());
		
	}
	@Test
	public void getLockerTest() throws Exception {
		log.info(
				mvc.perform(MockMvcRequestBuilders.get("/item/locker") 
						).andReturn().getModelAndView().getModelMap());
		
	}
	
	@Test
	public void RegisterRegInfoTest1() throws Exception { // 사물함 포함 테스트
		log.info(
				mvc.perform(MockMvcRequestBuilders.post("/item/seat")
						.param("seatNo", "1")
						.param("lockerNo", "1")
						.param("fno", "2")
						.param("period", "7")
						.param("feeName", "7일 요금제")
						.param("userNo", "43")
						.param("userName", "류")
						).andReturn().getModelAndView().getViewName()
				);
	}

	@Test
	public void RegisterRegInfoTest2() throws Exception { // 사물함 미포함 테스트
		log.info(
				mvc.perform(MockMvcRequestBuilders.post("/item/seat")
						.param("seatNo", "4")
						.param("fno", "1")
						.param("period", "1")
						.param("feeName", "1일 요금제")
						.param("userNo", "53")
						.param("userName", "류")
						).andReturn().getModelAndView().getViewName()
				);
	}
	
	@Test
	public void extendUsingPeriodTest() throws Exception {
		log.info(
				mvc.perform(MockMvcRequestBuilders.post("/item/seat")
						.param("userNo", "156")
						.param("period", "7")
						).andReturn().getModelAndView().getViewName()
				);
		
	}
	
	@Test
	public void changeSeatPTest() throws Exception {
		log.info(
				mvc.perform(MockMvcRequestBuilders.post("/item/changeSeat")
						.param("seatNo", "2") 	// 변경할 좌석
						.param("sno", "6") 		// 기존 이용 좌석
						.param("userNo", "156") // 해당 이용자
						)
				);
	}
}
