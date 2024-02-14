package kr.or.ddit.freeBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.freeBoard.service.FreeBoardService;
import kr.or.ddit.freeBoard.vo.FreeBoardVO;
import kr.or.ddit.util.ArticlePage;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {
	
	@Autowired
	FreeBoardService freeBoardService;
	
	/*
	요청URI : /freeboard/list?currentPage=2
	요청파라미터 : currentPage=2
	요청방식 : get
	
	파라미터 값은 문자. 숫자형문자의 경우 int 타입으로 자동 형변환 가능
	*/
	@GetMapping("/list")
	//required : 값이 없을 수도 있기때문에 false
	public String list(Model model , @RequestParam(value="currentPage" , required=false , defaultValue = "1") int currentPage,
			@RequestParam(value="keyword",required=false) String keyword) {
		
		 Map<String,Object> map = new HashMap<String, Object>();
	      map.put("currentPage",currentPage);//페이비번호
	      
	      
	      //전체 행의 수 (total)
	      int total = this.freeBoardService.getTotal();
	      //한 화명에 보여지는 행의 수(기본10행)
	      int size = 10;
	      
	      
	      List<FreeBoardVO> freeBoardVOList =  this.freeBoardService.list(map);
	      log.info("list->freeBoardVO:"+freeBoardVOList);
	      
	      model.addAttribute("data",new ArticlePage<FreeBoardVO>(total,
	            currentPage, size, freeBoardVOList,keyword));
	      
	      //forwarding: jsp
	      return "freeBoard/list";
	   }
	}
