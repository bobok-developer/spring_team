package xyz.sumtplus.domain;

import lombok.Data;


@Data
public class AttachFileDTO {
	private String uuid;
	private String fileName;
	private boolean image;
	private String uploadPath;
	
	public String getDownPath(){
		return uploadPath + "/" + uuid + "_" + fileName;
	}
	
	public String getThumbPath(){
		return uploadPath + "/s_" + uuid + "_" + fileName;
	}
}
