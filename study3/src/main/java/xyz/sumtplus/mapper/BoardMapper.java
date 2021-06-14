package xyz.sumtplus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import xyz.sumtplus.domain.BoardVO;
import xyz.sumtplus.domain.Criteria;



/**
 *
 * @author 여름
 * @date   2021. 5. 18.
 */

public interface BoardMapper {

	// 게시글 조회
	public List<BoardVO> getList();
	public List<BoardVO> getListWithPaging(Criteria cri);	
	public List<BoardVO> getList2(Criteria cri);
	
	// 작성
	public void insert(BoardVO boardVO);
	public Integer insertSelectKey(BoardVO boardVO);
	public Integer insertSelectKey2(BoardVO boardVO);
	
	// 삭제
	public int delete(Long bno);
	
	// 수정
	public int update(BoardVO boardVO);	

	// 상세
	public BoardVO read(Long bno);
	
	//Criteria
	public int getTotalCount(Criteria cri);
	
	public int getNoticeTotalCount(Criteria cri);

	public int getQATotalCount(Criteria cri);

	@Update("UPDATE TBL_BOARD SET REPLYCNT = REPLYCNT + #{amount} WHERE BNO = #{bno}")
	void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
	/**
	 * 게시글 조회수 업데이트 메소드
	 * @author 김보경
	 * @Date 21. 6. 3.
	 */
	public int updateHitCount(Long bno);

}