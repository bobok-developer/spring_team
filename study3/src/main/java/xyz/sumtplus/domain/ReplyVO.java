package xyz.sumtplus.domain;

import java.util.Date;

import lombok.Data;

/**
 * 댓글vo 
 *
 * @author 류슬희
 * @date   2021. 5. 27.
 */
@Data
public class ReplyVO {
	
	private Long rno; //댓글번호
	private Long bno; //글번호
	
	private String reply; //댓글 내용
	private String replyer; //댓글쓴이
	
	private Date regDate; //댓글 입력날짜
	
}
