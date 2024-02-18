package kr.or.ddit.shop.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EcommerceAttachVO {
	
	private String ecId;	// 부모키 ecId
	private String ecImg;	// 이미지명
	private String ecUrl;	// 이미지 URL
	private Long ecSize;	// 이미지크기
	private String ecType;	// 이미지타입 (MIME)
	
	private MultipartFile[] uploadFile;

}
