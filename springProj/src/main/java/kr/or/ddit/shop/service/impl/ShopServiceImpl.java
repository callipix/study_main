package kr.or.ddit.shop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.shop.mapper.ShopMapper;
import kr.or.ddit.shop.vo.ProductVO;
@Service
public class ShopServiceImpl implements ShopService {
	@Autowired
	ShopMapper shopMapper;
	
	@Override
	public ProductVO detail(String pdtId) {
		return this.shopMapper.detail(pdtId);
	}

}
