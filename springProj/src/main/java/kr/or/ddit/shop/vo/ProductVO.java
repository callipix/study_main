package kr.or.ddit.shop.vo;

import lombok.Data;

@Data
public class ProductVO {
	
	private String pdtId;      // 상품아이디   
	private String pdtName;    // 상품명     
	private String pdtColor;   // 상품색깔    
	private String pdtDetail;  // 상품 세부설명 
	private int pdtPrice;      // 상품가격    
	private int pdtSize;       // 상품사이즈   
	private String pdtMainImg; // 상품 메인이미지
	private String pdtSubImg1; // 상품 이미지1 
	private String pdtSubImg2; // 상품 이미지2 
	private String pdtSubImg3; // 상품 이미지3 
	private String pdtSubImg4; // 상품 이미지4 
	private String pdtSubImg5; // 상품 이미지5 

}   