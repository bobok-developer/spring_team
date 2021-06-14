package xyz.sumtplus.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 게시판 VO
 *
 * @author 여름
 * @date   2021. 5. 18.
 */

@Data
public class BoardVO {
	// 글번호, 제목, 작성자, 내용
	private Long bno;
	private String title;
	private String writer;
	private String content;

	// 카테고리, 댓글 수, 비밀글 여부
	private int category;
	private int replyCnt;
	private boolean secret;

	// 부모글 번호 : 원글은 0, 답글은 부모글 번호
	private Long parentNo;  

	// 글 그룹번호
	private Long groupNo;

	// 조회수, 작성일
	private int hitCount;
	private Date regDate;
	
	// 첨부파일 목록
	private List<BoardAttachVO> attachList = new ArrayList<BoardAttachVO>();
	
}
