package kr.or.ddit.mapper;

import kr.or.ddit.vo.CardVO;
import kr.or.ddit.vo.LikesVO;
import kr.or.ddit.vo.QuickAttachVO;
import kr.or.ddit.vo.QuickVO;

public interface QuickMapper {

	public int createPost(QuickVO quickVO);

	public int insertQuickAttach(QuickAttachVO quickAttachVO);
	
	// Quick 상세
	public QuickVO detail(String emailAdres);
	
	// CARD테이블에 insert
	public int insertCard(CardVO cardVO);
	
	// LIKES테이블에 insert
	public int insertLikes(LikesVO likesVO);
	
}
