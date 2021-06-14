package xyz.sumtplus.domain;

import lombok.Data;

@Data
public class FeeVO {
	private int fno; 		// 요금제 번호
	private String name; 	// 요금제 이름
	private int price; 		// 요금제 가격
	private int period; 	// 요금제 기간
}
