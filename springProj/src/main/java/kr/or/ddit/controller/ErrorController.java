package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
// 자바빈 선언
@Slf4j
@Controller
@RequestMapping("/error")
public class ErrorController {
	// error/error400
	@GetMapping("/error400")
	public String error400() {
		//forwarding : jsp
		return "error/error400";
	}
	@GetMapping("/error404")
	public String error404() {
		//forwarding : jsp
		return "error/error404";
	}
	@GetMapping("/error500")
	public String error500() {
		//forwarding : jsp
		return "error/error500";
	}

	@GetMapping("/errorException")
	public String errorException() {
		//forwarding : jsp
		return "error/errorException";
	}
	
}


// 학사관리 병원관리 물류관리대행 그룹웨어 EMR
