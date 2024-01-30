package kr.or.ddit.mapper;

import kr.or.ddit.vo.Item2VO;
import kr.or.ddit.vo.ItemVO;

public interface ItemMapper {
	
	public int registerPost(ItemVO itemVO);
	
	public int registerPost2(Item2VO item2VO);

}
