package kr.or.ddit.shop.service.impl;

import kr.or.ddit.shop.vo.EcommerceVO;

public interface ShopService {
	
	//특정상품조회
	public EcommerceVO detail(String ecId);

	public int createProduct(EcommerceVO ecommerceVO , String ecColor , String ecSize);
	
}
