package kr.or.ddit.mapper;

import kr.or.ddit.vo.QuickAttachVO;
import kr.or.ddit.vo.QuickVO;

public interface QuickMapper {

	public int createPost(QuickVO quickVO);

	public int insertQuickAttach(QuickAttachVO quickAttachVO);
	// Quick 상세
	public QuickVO detail(String emailAdres);
	
}
