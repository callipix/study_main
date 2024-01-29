package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.LprodService;
import kr.or.ddit.vo.LprodVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/lprod")
@Slf4j
@Controller
public class LprodController {
	
	@Autowired
	LprodService lprodService;
	
	/*
	 요청URI : /lprod/list
	 요청파라미터 : 
	 요청방식 : get
	 
	 //forwarding
	 return "lprod/list";
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(Model model, 
			@RequestBody(required=false) Map<String,Object> map) {
		String keyword = "";
		
		if(map!=null) {
			keyword = (String)map.get("keyword");
		}
		//1. LprodVO를 만들기
		//2. mybatisAlias.xml에 alias 추가
		//3. select
		List<LprodVO> lprodVOList = this.lprodService.list(keyword);
		log.info("list->lprodVOList : " + lprodVOList);
		
		model.addAttribute("lprodVOList", lprodVOList);
		
		//forwarding : jsp
		return "lprod/list";
	}
	
	/*
	 요청URI : /lprod/listAjax
	 요청파라미터(json) : null 또는 {"keyword":""} 또는 {"keyword":"컴"}
	 요청방식 : post
	 
	 //forwarding
	 return "lprod/list";
	 */
	@ResponseBody
	@RequestMapping(value="/listAjax",method=RequestMethod.POST)
	public List<LprodVO> listAjax(@RequestBody(required=false) Map<String,Object> map) throws ParseException {
		log.info("map : " + map);
		
		String keyword = "";
		
		if(map!=null) {
			keyword = (String)map.get("keyword");
		}
		
		//Map<String,Object> map
		List<LprodVO> lprodVOList = this.lprodService.list(keyword);
		log.info("list->lprodVOList : " + lprodVOList);
		
		return lprodVOList;
	}
	
	//LPROD 테이블에서 1행 검색
	/*
	요청URI : /lprod/listOne
	요청파라미터(json) : {"lprodId":"2"}
	요청방식 : post
	
	ResponseBody->{"lprodId":"2","lprodGu":"P102","lprodNm":"전자제품"}
	*/
	@ResponseBody
	@RequestMapping(value="/listOne",method=RequestMethod.POST)
	public LprodVO listOne(@RequestBody LprodVO lprodVO) {
		//LprodVO[lprodId=2,lprodGu=null,lprodNm=null]
		log.info("listOne->lprodVO : " + lprodVO);
		
		lprodVO = this.lprodService.listOne(lprodVO);
		//LprodVO[lprodId=2,lprodGu=P102,lprodNm=전자제품]
		log.info("listOne->lprodVO(후) : " + lprodVO);
		
		return lprodVO;
	}
	
	/*
	요청URI : /lprod/updateOne
	요청파라미터(json) : {"lprodId":"36","lprodGu":"TT092","lprodNm":"트리거 테스트 2"}
	요청방식(비동기) : post
	
	리턴타입이 int, String일 경우 dataType:"text",
	*/
	@ResponseBody
	@PostMapping("/updateOne")
	public int updateOne(@RequestBody LprodVO lprodVO) {
		log.info("updateOne : " + lprodVO);
		
		int result = this.lprodService.updateOne(lprodVO);
		log.info("updateOne : " + result);
		
		return result;
	}
	
	/*
	요청URI : /lprod/deleteOne
	요청파라미터(json) : {"lprodId":75}
	요청방식 : post
	리턴타입 : int
	*/
	@ResponseBody
	@PostMapping("/deleteOne")
	public int deleteOne(@RequestBody LprodVO lprodVO) {
		//LprodVO[lprodId=2,lprodGu=null,lprodNm=null]
		log.info("lprodVO : " + lprodVO);
		
		int result = this.lprodService.deleteOne(lprodVO);
		log.info("deleteOne->result : " + result);//1행 삭제됨
		
		return result;
	}
	
	/*
	요청URI : /lprod/insertOne
	요청파라미터(json) : {"lprodId":"36","lprodGu":"TT092","lprodNm":"트리거 테스트 2"}
	요청방식(비동기) : post
	
	리턴타입이 int, String일 경우 dataType:"text",
	*/
	@ResponseBody
	@PostMapping("/insertOne")
	public int insertOne(@RequestBody LprodVO lprodVO) {
		log.info("insertOne : " + lprodVO);
		
		int result = this.lprodService.insertOne(lprodVO);
		log.info("insertOne : " + result);
		
		return result;
	}
}





