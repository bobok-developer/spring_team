package xyz.sumtplus.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * 클래스/인터페이스 설명
 * 결제테스트를 위해 생성한 임시 DTO 
 *
 * @author 민지현
 * @date 2021. 5. 19.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentDTO {
	private String buyerName; // 구매자이름
	private String fname; // 등록번호
	private Long amount; // 납입액
}
