package kr.or.ddit.mapper;

import kr.or.ddit.vo.StudVO;

public interface StudMapper {
	//로그인을 위한 회원 검색
	//메소드 명 detail == 매퍼 xml의 <select id="detail
	public StudVO detail(String username);

}
