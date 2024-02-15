package kr.or.ddit.shop.mapper;

import kr.or.ddit.shop.vo.EcommerceAttachVO;
import kr.or.ddit.shop.vo.EcommerceColorVO;
import kr.or.ddit.shop.vo.EcommerceSizeVO;
import kr.or.ddit.shop.vo.EcommerceVO;

public interface ShopMapper {

	// Ecommerce테이블에 insert
	public int createProduct(EcommerceVO ecommerceVO);

	// Ecommerce 상세
	public EcommerceVO detail(String pdtId);

	// EcommerceAttach테이블에 insert
	public int insertEcommerceAttach(EcommerceAttachVO ecommerceAttachVO);
	
	// Color테이블에 insert
	public int insertColor(EcommerceColorVO ecommerceColorVO);
	
	// Size테이블에 insert
	public int insertSize(EcommerceSizeVO ecommerceSizeVO);

}
