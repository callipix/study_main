package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LprodVO;

public interface LprodService {

	public List<LprodVO> list(Map<String, Object> map);

	//상품 분류 상세
	public LprodVO listOne(LprodVO lprodVO);

	//상품 분류 수정
	public int updateOne(LprodVO lprodVO);
	
	//상품 분류 삭제
	public int deleteOne(LprodVO lprodVO);
	
	//상품 분류 추가
	public int insertOne(LprodVO lprodVO);
	// 전체 글 수
	public int getTotal();
	
}
