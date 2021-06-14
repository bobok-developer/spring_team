package xyz.sumtplus.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * 페이징처리
 *
 * @author 여름
 * @date   2021. 5. 18.
 */


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Criteria {
	private int pageNum = 1;
	private int amount = 10; // 12 -> 10으로 수정 (김보경)
	private int category = 1;
	
	private String type;
	private String keyword;
	private String startDate = "210505";
	private String endDate = "221231";
	
	
	public Criteria(Integer pageNum, Integer amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public Criteria(Integer pageNum, Integer amount, Integer category) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.category = category;
	}
	
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
		.queryParam("category", category)
		.queryParam("pageNum",pageNum)
		.queryParam("type",type)
		.queryParam("keyword", keyword);
		return builder.toUriString();
	}
	
	public String getListLink2(){
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("category", category)
				.queryParam("amount", amount)
				.queryParam("type", type)
				.queryParam("keyword", keyword);
		return builder.toUriString();
			
	}
	
	// 관리자 페이지에서 사용하는 페이징
	public String getListLink3(){
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum",pageNum)
				.queryParam("type",type)
				.queryParam("keyword", keyword)
				.queryParam("startDate", startDate)
				.queryParam("endDate", endDate);
		return builder.toUriString();
			
	}
	
	public String getListLink4(){
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("amount", amount)
				.queryParam("type", type)
				.queryParam("keyword", keyword)
				.queryParam("startDate", startDate)
				.queryParam("endDate", endDate);
		return builder.toUriString();
		
	}

}
