package xyz.sumtplus.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import xyz.sumtplus.domain.AddressVO;
import xyz.sumtplus.domain.AuthVO;
import xyz.sumtplus.domain.MemberVO;

/**
 * 맴버맵퍼 인터페이스
 *
 * @author 류슬희
 * @date   2021. 5. 19.
 */
public interface MemberMapper {
	MemberVO read(Long userNo);
	
	//회원정보 등록
	@Insert("INSERT INTO TBL_MEMBER (USERNO, USERID, USERPW, USERNAME, TEL, EMAIL) VALUES (SEQ_MEMBER.NEXTVAL, #{userId}, #{userPw}, #{userName}, #{tel}, #{email})")
	void insert(MemberVO memberVO);
	
	//주소
	@Insert("INSERT INTO TBL_ADDRESS (ADDRNO, USERNO, POST, ADDR, DETAIL, EXTRA) VALUES(SEQ_MEMBER.NEXTVAL, #{userNo} , #{post}, #{addr}, #{detail}, #{extra})")
	void insertAddr (AddressVO addressVO);
	
	//권한
	@Insert("INSERT INTO TBL_MEMBER_AUTH (USERNO, AUTH) VALUES (#{userNo}, 'ROLE_MEMBER')")
	void insertAuth(AuthVO authVo);
	
	//시큐리티 username -> userid
	@Select("SELECT USERNO FROM TBL_MEMBER WHERE USERID = #{userId}")
	Long findUserNoBy(@Param("userId") String userId);
	
	//아이디 중복 체크
	public int idChk(MemberVO memberVO);
	
	//탈퇴
	@Delete("DELETE TBL_MEMBER WHERE USERNO = #{userNo}")
	int delete(Long userNo);
	
	//계정 비활성화
	@Update("UPDATE TBL_MEMBER SET ENABLED = 0 WHERE USERNO = #{userNo}")
	int update(Long userNo);
	
	
	/*
	 * 네이버로그인 관련 기능추가
	 * 2021. 5. 30. 민지현
	 */
	//네이버 회원가입
	void naverInsert(MemberVO memberVO);
	
	//snsId로 회원정보얻기
	@Select("SELECT USERNO, USERID, USERNAME, EMAIL, TEL FROM TBL_MEMBER WHERE SNSID = #{snsId}")
	MemberVO naverSelect(String snsId);
	
	//snsId로 회원번호찾기
	@Select("SELECT USERNO FROM TBL_MEMBER WHERE SNSID = #{snsId}")
	Long findUserNoBy2(String snsId);
	
	//회원번호로 권한찾기
	@Select("SELECT AUTH FROM TBL_MEMBER_AUTH WHERE USERNO = #{userNo}")
	String findAuthBy(Long userno);
}
