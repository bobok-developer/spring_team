package xyz.sumtplus.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyPageDTO extends PageDTO{
	private List<ReplyVO> list;
	
	
	public ReplyPageDTO(Criteria cri, int total) {
		super(total, cri);
	}
	
	public ReplyPageDTO(Criteria cri, int total, List<ReplyVO> list) {
		super(total, cri);
		this.list = list;
	}
	
}
