package xyz.sumtplus.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * 사물함 클래스
 *
 * @author 김보경
 * @date   2021. 5. 14.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LockerVO {
	private int lno; 		// 사물함 번호
	private boolean status; // 사물함 이용 상태
	private Long userNo; 	// 회원 번호
}
