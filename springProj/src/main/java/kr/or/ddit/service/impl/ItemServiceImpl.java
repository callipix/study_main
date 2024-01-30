package kr.or.ddit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ItemMapper;
import kr.or.ddit.service.ItemService;
import kr.or.ddit.vo.Item2VO;
import kr.or.ddit.vo.ItemVO;

@Service
public class ItemServiceImpl implements ItemService {
	@Autowired
	ItemMapper itemMapper;

	@Override
	public int registerPost(ItemVO itemVO) {
		return this.itemMapper.registerPost(itemVO);
	}

	@Override
	public int registerPost2(Item2VO item2VO) {
		return this.itemMapper.registerPost2(item2VO);	}
	
}
