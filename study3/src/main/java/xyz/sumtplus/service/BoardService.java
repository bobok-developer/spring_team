package xyz.sumtplus.service;

import java.util.List;

import xyz.sumtplus.domain.BoardAttachVO;
import xyz.sumtplus.domain.BoardVO;
import xyz.sumtplus.domain.Criteria;

/**
 * 게시판 서비스
 *
 * @author 이여름
 * @date   2021. 5. 20.
 */
public interface BoardService {
	
	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	public List<BoardVO> getList(Criteria cri);
	
	//Criteria
	public int getTotalCount(Criteria cri);
	
	public int getNoticeTotalCount(Criteria cri);

	public int getQATotalCount(Criteria cri);
	
	List<BoardAttachVO> getAttachList(Long bno);
	
	/**
	 * 게시글의 조회수를 늘리는 메소드
	 * @author 김보경
	 * @Date 21. 6. 3.
	 */
	int increaseHitCount(Long bno);
}
