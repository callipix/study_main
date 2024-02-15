package kr.or.ddit.shop.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EcommerceAttachVO {
	
	private String ecId;	// 부모키 ecId
	private String ecImg;	// 이미지경로
	private String ecUrl;// 서브이미지경로1
	private Long ecSize;	// 서브이미지경로2
	private String ecType;	// 서브이미지경로3
	
	private MultipartFile[] uploadFile;

}
