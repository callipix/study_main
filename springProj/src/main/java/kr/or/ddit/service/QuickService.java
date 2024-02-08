package kr.or.ddit.service;

import kr.or.ddit.vo.QuickVO;

public interface QuickService {
	
	public int createPost(QuickVO quickVO);

	public QuickVO detail(String emailAdres);

	public int insertAllTest();
	
	
}
