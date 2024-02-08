package kr.or.ddit.freeBoard.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.freeBoard.vo.FreeBoardVO;

public interface FreeBoardMapper {
	
	/**
	 * 자유게시판 목록
	 * <select id="list" parameterType="hashMap" resultType="freeBoardVO">
	 * @param map 
	 */
	public List<FreeBoardVO> list(Map<String, Object> map);

}
