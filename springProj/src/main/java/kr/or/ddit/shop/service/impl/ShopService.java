package kr.or.ddit.shop.service.impl;

import kr.or.ddit.shop.vo.ProductVO;

public interface ShopService {
	
	//특정상품조회
	public ProductVO detail(String pdtId);
	
}
