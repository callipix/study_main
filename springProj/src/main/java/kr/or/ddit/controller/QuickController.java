package kr.or.ddit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.QuickService;
import kr.or.ddit.vo.QuickVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@RequestMapping("/quick")
@Controller
public class QuickController {

	@Autowired
	QuickService quickService;
	/**
	Quick 폼화면
	 * @return
	 */
	@GetMapping("/create")
	public String create() {
		// forwarding : jsp
		
		return "quick/create";	// quick/create폴더
	}
	/**
		요청 URI : /quick/createPost
		요청파라미터 : {emailAdres=test@test.com,password=java,uploadFile=파일객체}
		요청방식 : post
		부모테이블(QUICK) : 자식테이블(QUICK_ATTACH) = 1 : N
		registerId : admin
	 */
	@ResponseBody
	@PostMapping("/createAjaxPost")
	public int createAjaxPost(QuickVO quickVO) {
		
		log.info("quickVO1 : " + quickVO);
		quickVO.setUpdaterId("admin");
		int result = this.quickService.createPost(quickVO);
		log.info("result : " + result);
		return result;
	}
	
	@PostMapping("/createPost")
	public String createPost(QuickVO quickVO) {
		
		log.info("quickVO : " + quickVO);
		quickVO.setUpdaterId("admin");
		int result = this.quickService.createPost(quickVO);
		log.info("createPost -> result : " + result);
		
		log.info("createPost -> quickVO : " + quickVO);
		
		return "redirect:/quick/detail?emailAdres="+quickVO.getEmailAdres();
	}
/*
  * 요청URI : /quick/detail
	요청파라미터 : {emailAdres=test@test.com}
	요청방식 : get
*/
	@GetMapping("/detail")
	public String detail(@RequestParam("emailAdres") String emailAdres , Model model) {
		log.info("detail -> " + emailAdres);
		QuickVO quickVO = this.quickService.detail(emailAdres);
		
		model.addAttribute("quickVO" , quickVO);
		
		return "quick/detail";
	}
	
}
