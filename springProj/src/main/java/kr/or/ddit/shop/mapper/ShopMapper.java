package kr.or.ddit.shop.mapper;

import kr.or.ddit.shop.vo.EcommerceVO;

public interface ShopMapper {

	public EcommerceVO detail(String pdtId);
	
	public int createProduct(EcommerceVO ecommerceVO);

}
