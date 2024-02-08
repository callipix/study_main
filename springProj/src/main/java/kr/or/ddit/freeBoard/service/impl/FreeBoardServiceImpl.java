package kr.or.ddit.freeBoard.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.freeBoard.mapper.FreeBoardMapper;
import kr.or.ddit.freeBoard.service.FreeBoardService;
import kr.or.ddit.freeBoard.vo.FreeBoardVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	//DI
	@Autowired
	FreeBoardMapper freeBoardMapper;
	
	/* 자유게시판 목록  */
	
	@Override	
	public List<FreeBoardVO> list(Map<String , Object> map){
		
		log.info("freeBoardVO");
		return this.freeBoardMapper.list(map);
	}

}
