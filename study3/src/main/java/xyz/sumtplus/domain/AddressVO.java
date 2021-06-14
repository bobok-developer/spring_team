package xyz.sumtplus.domain;

import lombok.Data;

@Data
public class AddressVO {
	private Long addrNo;
	private Long userNo;
	private String post;
	private String addr;
	private String detail;
	private String extra;
}
