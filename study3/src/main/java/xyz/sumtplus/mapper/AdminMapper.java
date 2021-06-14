package xyz.sumtplus.mapper;

import java.util.List;
import java.util.Map;

import xyz.sumtplus.domain.AddressVO;
import xyz.sumtplus.domain.BoardVO;
import xyz.sumtplus.domain.Criteria;
import xyz.sumtplus.domain.LockerVO;
import xyz.sumtplus.domain.MemberVO;
import xyz.sumtplus.domain.PaymentVO;
import xyz.sumtplus.domain.RegInfoVO;
import xyz.sumtplus.domain.SeatVO;

/**
 * 관리자가 할 것 매핑, 결제정보 수정 필요?
 *
 * @author 박재우
 * @Date   2021. 5. 18.
 */
public interface AdminMapper {
	
	List<RegInfoVO> itemStatus(); // 상품 현황 조회 
	
	List<MemberVO> memberList(Criteria cri); // 회원 목록 조회
	
	List<MemberVO> memberContactList(Criteria cri); // 회원 목록 조회
	
	List<PaymentVO> paymentList(Criteria cri); // 결제 내역 조회
	
	List<RegInfoVO> regProperties(Criteria cri); // 등록 정보 조회
	
	RegInfoVO regDetail(int regNo); // 등록 상세정보 조회
	
	MemberVO memberDetail(int userNo); // 번호로 회원 조회
	
	AddressVO memberAddr(int userNo); // 번호로 회원 주소 조회
	
	void updateMember(MemberVO memberVO); // 회원 정보 수정
	void deleteAddr(MemberVO memberVO);
	void updateAddr(AddressVO addressVO);
	
	void updateRegPP(RegInfoVO regInfoVO); // 등록 정보 수정
	
	int getMemberTotalCount(Criteria cri); // 회원 총 개수
	
	int getMemberContactTotalCount(Criteria cri); // 연락할 회원 총 수
	
	int getRegTotalCount(Criteria cri); // 총 등록 수
	
	int getPaymentTotalCount(Criteria cri); // 총 결제내역 수 
	
	MemberVO sendMessage(); // 5일 남은 회원 불러오기

	int deleteSeat(RegInfoVO regInfoVO);
	int updateSeat(RegInfoVO regInfoVO); // 좌석 변경 (이용 등록 정보 수정)
	
	int deleteLocker(RegInfoVO regInfoVO); // 사물함 변경
	int updateLocker(RegInfoVO regInfoVO);
	
	List<BoardVO> getNotiList(); // 공지사항 20개 불러옴
	
	List<BoardVO> getQAList(); // Q&A 20개 불러옴
	int getTotalImcome(); // 현재까지의 매출액
	
	// 이용 가능한 빈 사물함 목록 조회
	List<LockerVO> getEmptyLockerList();
	
	// 이용 가능한 빈 좌석 목록 조회
	List<SeatVO> getEmptySeatList();
	
	/**
	 * 회원 중 좌석/사물함 미등록 회원 목록
	 * @author 김보경
	 * @Date 2021. 5. 28.
	 */
	List<MemberVO> getUnregList(Criteria cri);
	
	/**
	 * 이용 중인 상태와 회원 이름과 만료일 목록
	 * (관리자-좌석관리 좌석배치도에서 이용)
	 * @author 김보경
	 * @Date 2021. 5. 29.
	 */
	List<Map<String, Object>> getSeatPlanList();
	
	/**
	 * 이용 중인 회원 등록 정보 삭제
	 * (관리자-좌석관리 좌석배치도에서 이용)
	 * @author 김보경
	 * @Date 2021. 5. 31.
	 */
	int deleteRegInfo(Long userNo);
	
	/**
	 * 이용 중인 상태와 회원 이름과 만료일 목록
	 * (관리자-사물함관리 사물함배치도에서 이용)
	 * @author 김보경
	 * @Date 2021. 6. 1.
	 */
	List<Map<String, Object>> getLockerPlanList();
	
	/**
	 * 이용 중인 사물함 등록 삭제
	 * (관리자-사물함관리에서 이용)
	 * @author 김보경
	 * @Date 2021. 6. 1.
	 */
	int deleteLocInfo(Long userNo);
}
