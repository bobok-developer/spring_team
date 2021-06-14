package xyz.sumtplus.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.Criteria;
import xyz.sumtplus.domain.MemberVO;
import xyz.sumtplus.domain.RegInfoVO;



/**
 * 관리자 매퍼의 테스트 코드입니다
 *
 * @author 박재우
 * @Date   2021. 5. 18.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class AdminMapperTests {
	@Autowired
	private AdminMapper mapper;
	
	
	@Test
	public void getMemberList(){
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		mapper.memberList(cri).forEach(log::info);
	}
	
	@Test
	public void getMemberContactList(){
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		cri.setKeyword("김보");
		mapper.memberContactList(cri).forEach(log::info);
	}
	
	@Test
	public void testMemberSearch(){
		Criteria cri = new Criteria();
		cri.setKeyword("민");
		List<MemberVO> list = mapper.memberList(cri);
		
		list.forEach(a -> log.info(a));
	}
	
	@Test
	public void testRegPPSearch(){
		Criteria cri = new Criteria();
		cri.setType("U");
		cri.setKeyword("민");
		List<RegInfoVO> list = mapper.regProperties(cri);
		
		list.forEach(a -> log.info(a));
	}
	
	@Test
	public void getRegProperties(){
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		mapper.regProperties(cri).forEach(log::info);
	}
	
	@Test
	public void getPaymentList(){
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		mapper.paymentList(cri).forEach(log::info);
	}
	
	@Test
	public void getMemberDetail(){
		System.out.println(mapper.memberDetail(3));
	}
	
	@Test
	public void updateMemberInfo(){
		MemberVO memberVO = new MemberVO();
		memberVO.setTel("123-456-0987");
		memberVO.setEmail("ganada@hangual.com");
		memberVO.setUserNo(16L);
		mapper.updateMember(memberVO);
		log.info(memberVO);
	}
	
	@Test
	public void updateRegPP(){
		RegInfoVO regInfoVO = new RegInfoVO();
		regInfoVO.setLockerNo(0);
		regInfoVO.setSeatNo(0);
		regInfoVO.setUserNo(10L);
		mapper.updateRegPP(regInfoVO);
		log.info(regInfoVO);
	}
	
	@Test
	public void getItemStatus(){
		mapper.itemStatus().forEach(log::info);
	}
	
	/**
	 * 회원 중 좌석/사물함 미등록 회원 페이징 처리 된 목록 불러오기 테스트
	 * @author 김보경
	 * @Date 2021. 5. 28.
	 */
	@Test
	public void getUnregListTest() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(20);
		mapper.getUnregList(cri).forEach(log::info);
	}
	
	/**
	 * 전체 좌석에서 이용 중인 상태와 회원 이름과 만료일 목록 불러오기 테스트
	 * @author 김보경
	 * @Date 2021. 5. 29.
	 */
	@Test
	public void getSeatPlanListTest() {
		mapper.getSeatPlanList().forEach(log::info);
	}
	
	/**
	 * 이용 중인 회원 등록 정보 삭제 테스트
	 * @author 김보경
	 * @Date 2021. 5. 31.
	 */
	@Test
	public void deleteRegInfoTest() {
		mapper.deleteRegInfo(44L);
	}
	
	/**
	 * 전체 사물함에서 이용 중인 상태와 회원 이름과 만료일 목록 불러오기 테스트
	 * @author 김보경
	 * @Date 2021. 6. 1.
	 */
	@Test
	public void getLockerPlanListTest() {
		mapper.getLockerPlanList().forEach(log::info);
	}
	
	@Test
	public void getNotiList(){
		mapper.getNotiList().forEach(log::info);
	}
}
