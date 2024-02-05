package kr.or.ddit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.ContactService;
import kr.or.ddit.vo.ContactInfoVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/contactInfo")
@Controller
@Slf4j
public class ContactInfoController {
	@Autowired
	ContactService contactService;
	@Autowired
	String uploadFolder;	
	
	@GetMapping("/create")
	public String index() {
		
		log.info("");
		return "contactInfo/create";
	}
	
	/*
	   요청URI : /contactInfo/createPost
	   요청파라미터 : {ciName=개똥이,ciMail=test@test.com,ciSubj=채용상담,ciImgUrl=파일객체,
	             ciMesg=채용절차에 대한 상담,ciRegDt=2024/02/17}
	   요청방식 : post
	 */	
	@PostMapping("/createPost")
	public String createPost(@Validated ContactInfoVO contactInfoVO , BindingResult brResult) {
		
		log.info("createPost->contactInfoVO : " + contactInfoVO);
		
		contactInfoVO.setRegisterId("admin");
		
		int result = this.contactService.insert(contactInfoVO);
		// brResult : true(오류발생) , false(오류없음)
	
		// 파일업로드 및 insert처리(Impl에서..)		
		return "redirect:/contactInfo/detail?ciCd="+contactInfoVO.getCiCd();
	}
}
