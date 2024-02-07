package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.ContactInfoService;
import kr.or.ddit.vo.ContactInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/contactInfo")
public class ContactInfoController {
	@Autowired
	ContactInfoService contactInfoService;
	@Autowired
	String uploadFolder;	
	// <form:form modelAttribute="contactInfoVO"
	@GetMapping("/create")
	public String index(ContactInfoVO contactInfoVO) {
		//forwarding : jsp
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
		
		//brResult.hasErrors() : true(오류 발생) , false(오류 없음)
		if(brResult.hasErrors()) {
			
			//검사 결과 오류 확인
			List<ObjectError> allErrors = brResult.getAllErrors();
			//객체와 관련된 오류
			List<ObjectError> globalErrors = brResult.getGlobalErrors();
			//멤버변수와 관련된 오류
			List<FieldError> fieldErrors = brResult.getFieldErrors();
        
	        for(ObjectError objectError : allErrors) {
	           log.info("allError : " + objectError);
	        }
	        
	        for(ObjectError objectError : globalErrors) {
	           log.info("globalError : " + objectError);
	        }
	        
	        for(FieldError fieldError: fieldErrors) {
	           log.info("fieldError : " + fieldError.getDefaultMessage());
	        }
	        return "contactInfo/create";
		}
		// brResult : true(오류발생) , false(오류없음)
		
		// 파일업로드 및 insert처리(Impl에서..)
		int result = this.contactInfoService.insert(contactInfoVO);
		
		return "redirect:/contactInfo/detail?ciCd="+contactInfoVO.getCiCd();
	}
	
	@ResponseBody
	@PostMapping("/createAjaxPost")
	public int createAjaxPost(@Validated ContactInfoVO contactInfoVO , BindingResult brResult) {
		
		int result = this.contactInfoService.insert(contactInfoVO);
		
		return result;
	}
	
	/*
	   요청URI : /contactInfo/detail
	   요청파라미터 : ciCd=CI20240206001
	   요청방식 : get
	*/
	
	// <form:form modelAttribute="contactInfoVO"
	@GetMapping("/detail")
	public String detail(@RequestParam("ciCd") String ciCd , Model model) {
		log.info("detail -> contactInfoVO : " + ciCd);
		
		ContactInfoVO contactInfoVO = this.contactInfoService.detail(ciCd);
		
		model.addAttribute("contactInfoVO" , contactInfoVO);
		
		//forwarding : jsp
		return "contactInfo/detail";
		
	}
}
