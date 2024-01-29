package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.StudService;
import kr.or.ddit.vo.StudVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/stud")
@Controller
public class StudController {
	
	//DI(의존성 주입)
	//IoC(제어의 역전)
	@Autowired
	StudService studService;
	
	/*
	요청URI : /stud/create?register
	요청파라미터 : 
	파람즈 : register
	요청방식 : get(HTTP method)
	*/
	@RequestMapping(value="/create",method=RequestMethod.GET,params="register")
	public String create() {
		log.info("create");
		
		//forwarding : jsp
		return "stud/create";
	}
	
	/*
	요청URI : /stud/create?register
	요청파라미터 : {studId=a001,studNm=개똥이,studPw=java}
	파람즈 : register
	요청방식 : post(HTTP method)
	*/
	@RequestMapping(value="/create",method=RequestMethod.POST,params="register")
	public String createRegister(String studId, String studNm, String studPw) {
		StudVO studVO = new StudVO();
		studVO.setStudId(studId);
		studVO.setStudNm(studNm);
		studVO.setStudPw(studPw);
		//StudVO{studId=a001,studNm=개똥이,studPw=java,enabled=null}
		log.info("studVO : " + studVO);
		
		//학생 등록
		int result = this.studService.createRegister(studVO);
		log.info("createRegister->result : " + result);
		
		//redirect : URL재요청
		return "redirect:/stud/detail?studId="+studId;
	}
	
	/*
	 요청URI : /stud/detail?studId=a001
	 요청파라미터 : studId=a001
	 요청방식 : get
	 */
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String detail(String studId, Model model) {
		log.info("detail->studId : " + studId);
		StudVO studVO = this.studService.detail(studId);
		//StudVO(studId=a001, studNm=개똥이, studPw=JAVA, enabled=1)
		log.info("detail->studVO : " + studVO);
		
		//mav.addObject("속성명", 데이터);
		//session.setAttribute("속성명", 데이터);
		model.addAttribute("studVO", studVO);
		
		//forwarding : jsp
		return "stud/detail";
	}
	
	@ResponseBody
	@PostMapping(value="/detailAjax")
	public StudVO detailAjax(@RequestBody StudVO studVO, Model model) {
		log.info("detail->studVO : " + studVO);
		
		String studId = studVO.getStudId();
		
		studVO = this.studService.detail(studId);
		//StudVO(studId=a001, studNm=개똥이, studPw=JAVA, enabled=1)
		log.info("detail->studVO : " + studVO);
		
		return studVO;
	}
	
	/* 
	요청URI : /stud/create?modify
	요청파라미터 : {studId=a001,studNm=개똥이2,studPw=java2}
	파람즈 : modify
	요청방식 : post
	*/
	@RequestMapping(value="/create",method=RequestMethod.POST,params="modify")
	public String createModify(String studId, String studNm, String studPw) {
		StudVO studVO = new StudVO(studId, studNm, studPw);
		log.info("createModify->studVO : " + studVO);
		
		//update
		int result = this.studService.createModify(studVO);
		log.info("createModify->result : " + result);
		
		//redirect : URL재요청
		return "redirect:/stud/detail?studId="+studId;
	}
	
	/* 
	요청URI : /stud/create?delete
	요청파라미터 : {studId=a001,studNm=개똥이2,studPw=java2}
	파람즈 : delete
	요청방식 : post
	*/
	@RequestMapping(value="/create",method=RequestMethod.POST,params="delete")
	public String createDelete(String studId, String studNm, String studPw) {
		StudVO studVO = new StudVO(studId, studNm, studPw);
		log.info("studId : " + studId);
		
		int result = this.studService.createDelete(studId);
		log.info("createDelete->result : " + result);
		
		//redirect : URI 재요청
		return "redirect:/stud/list";		
	}
	
	/*
	 요청URI : /stud/list
	 요청파라미터 : 
	 요청방식 : get
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(Model model, Map<String,Object> map) {
		
		List<StudVO> studVOList = this.studService.list(map);
		log.info("list->studVOList : " + studVOList);
		
		model.addAttribute("studVOList", studVOList);
		
		//forwarding : jsp
		return "stud/list";
	}
	/*
	 요청URI : /stud/listAjax
	 요청파라미터(json) : {"keyword":"신용"} 
	 요청방식 : get
	 
	 골뱅이ResponseBody : object -> string 으로 변환하는 방식을 serialize
	 required=false : 선택(map에 아무것도 들어오지 않아도 괜찮다)
	 */
	@ResponseBody
	@RequestMapping(value="/listAjax",method=RequestMethod.POST)
	public List<StudVO> listAjax(@RequestBody(required=false) Map<String,Object> map) {
		//map : null 또는 map : {"keyword":"신용"}
		log.info("map : " + map);
		
		List<StudVO> studVOList = this.studService.list(map);
		log.info("list->studVOList : " + studVOList);		
		
		return studVOList;
	}
	
	@ResponseBody
	@RequestMapping(value="/updateAjax",method=RequestMethod.POST)
	public int updateAjax(@RequestBody StudVO studVO) {
		log.info("updateAjax->studVO : " + studVO);
		
		int result = this.studService.createModify(studVO);
		log.info("updateAjax->result : " + result);		
		
		return result;
	}
	
	@ResponseBody
	@PostMapping(value="/deleteAjax")
	public int deleteAjax(@RequestBody StudVO studVO) {
		log.info("deleteAjax->studVO : " + studVO);
		
		String studId = studVO.getStudId();
		
		int result = this.studService.createDelete(studId);
		log.info("updateAjax->result : " + result);		
		
		return result;
	}
}




