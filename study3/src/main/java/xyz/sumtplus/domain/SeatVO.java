package xyz.sumtplus.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 좌석 클래스
 *
 * @author 김보경
 * @date   2021. 5. 14.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SeatVO {
	private int sno; 		// 좌석 번호
	private String name;	// 좌석 이름(고정석,자유석)
	private boolean status; // 좌석 이용 상태
	private Long userNo; 	// 회원 번호
}
