package xyz.sumtplus.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper=true)
public class BoardAttachVO extends AttachFileDTO{
	private Long bno;
	
}
